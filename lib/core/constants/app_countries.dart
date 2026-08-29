import '../../shared/models/country.dart';

class AppCountries {
  static const List<Country> supportedCountries = [
    Country(
      isoCode: 'CI',
      name: "Côte d'Ivoire",
      dialCode: '+225',
      flag: '🇨🇮',
      example: '07 00 00 00 00',
    ),
    Country(
      isoCode: 'SN',
      name: 'Sénégal',
      dialCode: '+221',
      flag: '🇸🇳',
      example: '77 000 00 00',
    ),
    Country(
      isoCode: 'CM',
      name: 'Cameroun',
      dialCode: '+237',
      flag: '🇨🇲',
      example: '6 00 00 00 00',
    ),
    Country(
      isoCode: 'ML',
      name: 'Mali',
      dialCode: '+223',
      flag: '🇲🇱',
      example: '70 00 00 00',
    ),
    Country(
      isoCode: 'BF',
      name: 'Burkina Faso',
      dialCode: '+226',
      flag: '🇧🇫',
      example: '70 00 00 00',
    ),
    Country(
      isoCode: 'TG',
      name: 'Togo',
      dialCode: '+228',
      flag: '🇹🇬',
      example: '90 00 00 00',
    ),
  ];

  static Country get defaultCountry => supportedCountries.first;

  static Country? fromIsoCode(String isoCode) {
    try {
      return supportedCountries.firstWhere((c) => c.isoCode == isoCode);
    } catch (_) {
      return null;
    }
  }

  static Country? fromDialCode(String dialCode) {
    try {
      return supportedCountries.firstWhere((c) => c.dialCode == dialCode);
    } catch (_) {
      return null;
    }
  }
}
