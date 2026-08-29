import 'package:flutter_test/flutter_test.dart';
import 'package:baby_mama/features/pregnancy/data/models/weekly_pregnancy_content_model.dart';
import 'package:baby_mama/features/pregnancy/data/mappers/weekly_pregnancy_content_mapper.dart';

void main() {
  group('WeeklyPregnancyContent', () {
    test(
      'should parse correctly payload week 11 from Laravel JSON Resource wrapper',
      () {
        // API 200 + payload réel Laravel week 11
        final payload = {
          "data": {
            "week": 11,
            "size_cm": 4.1,
            "weight_g": 7,
            "fruit_comparison": "une figue",
            "description":
                "Le bébé peut ouvrir et fermer les poings. Les organes génitaux se développent.",
            "development_highlights": [
              "Ouverture/fermeture des poings",
              "Développement des organes génitaux",
              "Réflexes primitifs",
            ],
            "mom_changes":
                "Fin du premier trimestre approche. Énergie revient.",
          },
        };

        final model = WeeklyPregnancyContentModel.fromJson(
          payload['data'] as Map<String, dynamic>,
        );

        expect(model.week, 11);
        expect(model.sizeCm, 4.1);
        expect(model.weightG, 7);
        expect(model.developmentHighlights?.length, 3);
        expect(
          model.developmentHighlights?.first,
          "Ouverture/fermeture des poings",
        );

        final entity = WeeklyPregnancyContentMapper.fromModel(model);
        expect(entity.week, 11);
        expect(entity.developmentHighlights.length, 3);
      },
    );
  });
}
