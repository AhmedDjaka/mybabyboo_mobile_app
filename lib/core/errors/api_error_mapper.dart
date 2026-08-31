import 'package:dio/dio.dart';
import 'api_exception.dart';

class ApiErrorMapper {
  static ApiException map(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          return ApiException(
            "Impossible de contacter le serveur.\nVérifiez votre connexion et réessayez.",
          );
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          final data = error.response?.data;

          String message = "Une erreur est survenue.";

          if (statusCode == 401) {
            message = "Votre session a expiré. Reconnectez-vous pour continuer.";
          } else if (statusCode == 422 && data is Map && data['errors'] != null) {
            final errors = data['errors'] as Map<String, dynamic>;
            if (errors.containsKey('phone')) {
              final phoneErrors = errors['phone'] as List;
              if (phoneErrors.any((e) => e.toString().contains('required'))) {
                message = "Veuillez saisir votre numéro de téléphone.";
              } else if (phoneErrors.any(
                (e) =>
                    e.toString().contains('taken') ||
                    e.toString().contains('unique'),
              )) {
                message = "Un compte existe déjà avec ce numéro.";
              } else {
                message = "Numéro de téléphone invalide.";
              }
            } else if (errors.containsKey('code')) {
              message = "Ce code n'est pas correct. Vérifiez-le et réessayez.";
            } else if (errors.containsKey('verification_id')) {
              message =
                  "Cette vérification n'est plus valide. Demandez un nouveau code.";
            } else if (errors.containsKey('verification_token')) {
              message = "La session a expiré. Veuillez recommencer.";
            } else {
              message =
                  "Certaines informations sont incorrectes. Vérifiez-les et réessayez.";
            }
          } else if (data is Map &&
              data['message'] != null &&
              statusCode != 422) {
            message = data['message'];
          } else if (statusCode == 403) {
            message = "Accès refusé.";
          } else if (statusCode == 404) {
            message = "Ressource introuvable.";
          } else if (statusCode != null && statusCode >= 500) {
            message = "Erreur interne du serveur.";
          }
          return ApiException(message, statusCode: statusCode);
        case DioExceptionType.cancel:
          return ApiException("La requête a été annulée.");
        default:
          return ApiException("Une erreur inattendue est survenue.");
      }
    }

    if (error is ApiException) return error;

    return ApiException(error.toString());
  }
}
