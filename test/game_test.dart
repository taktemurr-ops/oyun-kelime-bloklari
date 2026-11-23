import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_bloklari/oyun_kelime_bloklari.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kelimeBloklariConfig.title.length, 33);
    expect(kelimeBloklariConfig.tagline.length, 33);
    for (final s in kelimeBloklariConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kelimeBloklariConfig.gameId, kelimeBloklariId);
    expect(kelimeBloklariRules.gameId, kelimeBloklariId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kelimeBloklariRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kelimeBloklariId, optionalMechanics: kelimeBloklariRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      kelimeBloklariRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(kelimeBloklariRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
