import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

/// Page de diagnostic Lottie — accès via /dev/lottie-test (debug uniquement).
/// Permet de valider chaque animation individuellement avant intégration au Splash.
class DevLottieTestPage extends StatefulWidget {
  const DevLottieTestPage({super.key});

  @override
  State<DevLottieTestPage> createState() => _DevLottieTestPageState();
}

class _DevLottieTestPageState extends State<DevLottieTestPage> {
  static const _assets = [
    'assets/animations/splash/01_pregnancy_test.json',
    'assets/animations/splash/02_pregnant_woman.json',
    'assets/animations/splash/03_pregnancy_weeks.json',
    'assets/animations/splash/04_ultrasound.json',
    'assets/animations/splash/05_mother_baby.json',
  ];

  static const _labels = [
    '01 — Test de grossesse',
    '02 — Femme enceinte',
    '03 — Semaines de grossesse',
    '04 — Échographie',
    '05 — Maman + bébé',
  ];

  int _selectedIndex = 0;
  final Map<int, String> _bundleResults = {};
  bool _manifestChecked = false;
  final Map<String, bool> _manifestResults = {};

  // Metadata per asset: [width, height, fps, durationSeconds]
  final Map<int, _LottieMeta> _metaResults = {};

  @override
  void initState() {
    super.initState();
    _runDiagnostics();
  }

  Future<void> _runDiagnostics() async {
    // ── 1. AssetManifest ─────────────────────────────────────────────────────
    try {
      final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
      final all = manifest.listAssets();
      for (final asset in _assets) {
        final found = all.contains(asset);
        _manifestResults[asset] = found;
        debugPrint('[MANIFEST] ${found ? "FOUND ✓" : "MISSING ✗"} — $asset');
      }
    } catch (e) {
      debugPrint('[MANIFEST] Erreur : $e');
    }

    // ── 2. rootBundle.loadString ──────────────────────────────────────────────
    for (int i = 0; i < _assets.length; i++) {
      try {
        final data = await rootBundle.loadString(_assets[i]);
        _bundleResults[i] = 'SUCCESS — ${data.length} chars';
        debugPrint(
          '[rootBundle] SUCCESS — ${_assets[i]} (${data.length} chars)',
        );
      } catch (e) {
        _bundleResults[i] = 'ERROR — $e';
        debugPrint('[rootBundle] ERROR — ${_assets[i]}\n$e');
      }
    }

    if (mounted) setState(() => _manifestChecked = true);
  }

  void _onCompositionLoaded(int index, LottieComposition composition) {
    final meta = _LottieMeta(
      width: composition.bounds.width.toDouble(),
      height: composition.bounds.height.toDouble(),
      fps: composition.frameRate,
      durationSeconds: composition.duration.inMilliseconds / 1000.0,
    );
    debugPrint(
      '[Lottie onLoaded] 0${index + 1} — '
      '${meta.width.toInt()}×${meta.height.toInt()} @ ${meta.fps.toStringAsFixed(2)}fps '
      '— ${meta.durationSeconds.toStringAsFixed(2)}s',
    );
    if (mounted) setState(() => _metaResults[index] = meta);
  }

  @override
  Widget build(BuildContext context) {
    final asset = _assets[_selectedIndex];
    final label = _labels[_selectedIndex];
    final meta = _metaResults[_selectedIndex];

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'DEV — Lottie Test',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'monospace',
            fontSize: 14,
          ),
        ),
      ),
      body: Column(
        children: [
          // ── Sélecteur ─────────────────────────────────────────────────────
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: List.generate(_assets.length, (i) {
                  final isSelected = i == _selectedIndex;
                  final bundleOk = _bundleResults[i]?.startsWith('SUCCESS');
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? Colors.pinkAccent
                            : bundleOk == true
                            ? Colors.green[800]
                            : bundleOk == false
                            ? Colors.red[800]
                            : Colors.grey[800],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      onPressed: () => setState(() => _selectedIndex = i),
                      child: Text(
                        '0${i + 1}',
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // ── Label scène ────────────────────────────────────────────────────
          Container(
            color: Colors.grey[800],
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
                fontSize: 12,
              ),
            ),
          ),

          // ── Zone Lottie ────────────────────────────────────────────────────
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey[850],
              padding: const EdgeInsets.all(16),
              child: Lottie.asset(
                asset,
                key: ValueKey(asset),
                repeat: true,
                fit: BoxFit.contain,
                onLoaded: (composition) =>
                    _onCompositionLoaded(_selectedIndex, composition),
                errorBuilder: (context, error, stackTrace) => _DebugErrorBox(
                  asset: asset,
                  error: error,
                  stackTrace: stackTrace,
                ),
              ),
            ),
          ),

          // ── Panneau de diagnostic ──────────────────────────────────────────
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black87,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Metadata scène courante
                    if (meta != null) ...[
                      _MonoText(
                        '── COMPOSITION 0${_selectedIndex + 1} ──',
                        color: Colors.white,
                      ),
                      _MonoText(
                        '${meta.width.toInt()} × ${meta.height.toInt()} px',
                        color: Colors.cyanAccent,
                      ),
                      _MonoText(
                        '${meta.fps.toStringAsFixed(2)} fps',
                        color: Colors.cyanAccent,
                      ),
                      _MonoText(
                        '${meta.durationSeconds.toStringAsFixed(2)} s',
                        color: Colors.cyanAccent,
                      ),
                      const SizedBox(height: 8),
                    ] else ...[
                      _MonoText(
                        '── COMPOSITION 0${_selectedIndex + 1} ──',
                        color: Colors.white,
                      ),
                      const _MonoText('…chargement…', color: Colors.grey),
                      const SizedBox(height: 8),
                    ],

                    // Asset Manifest
                    const _MonoText('── ASSET MANIFEST ──'),
                    if (!_manifestChecked)
                      const _MonoText('…chargement…', color: Colors.grey)
                    else
                      ..._assets.asMap().entries.map((e) {
                        final ok = _manifestResults[e.value];
                        return _MonoText(
                          '0${e.key + 1} = ${ok == true
                              ? "FOUND ✓"
                              : ok == false
                              ? "MISSING ✗"
                              : "?"}',
                          color: ok == true
                              ? Colors.greenAccent
                              : Colors.redAccent,
                        );
                      }),

                    const SizedBox(height: 8),

                    // rootBundle
                    const _MonoText('── rootBundle ──'),
                    if (_bundleResults.isEmpty)
                      const _MonoText('…chargement…', color: Colors.grey)
                    else
                      ..._bundleResults.entries.map(
                        (e) => _MonoText(
                          '0${e.key + 1} = ${e.value}',
                          color: e.value.startsWith('SUCCESS')
                              ? Colors.greenAccent
                              : Colors.redAccent,
                        ),
                      ),

                    const SizedBox(height: 8),

                    // Durées toutes scènes
                    if (_metaResults.isNotEmpty) ...[
                      const _MonoText('── DURÉES NATURELLES ──'),
                      ..._metaResults.entries.map(
                        (e) => _MonoText(
                          '0${e.key + 1} = ${e.value.durationSeconds.toStringAsFixed(2)}s'
                          '  ${e.value.width.toInt()}×${e.value.height.toInt()}'
                          '  ${e.value.fps.toStringAsFixed(2)}fps',
                          color: Colors.amberAccent,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Métadonnées d'une composition Lottie chargée.
class _LottieMeta {
  const _LottieMeta({
    required this.width,
    required this.height,
    required this.fps,
    required this.durationSeconds,
  });
  final double width;
  final double height;
  final double fps;
  final double durationSeconds;
}

/// Affiche la vraie erreur Lottie en rouge — ne masque jamais l'erreur.
class _DebugErrorBox extends StatelessWidget {
  const _DebugErrorBox({
    required this.asset,
    required this.error,
    this.stackTrace,
  });

  final String asset;
  final Object error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    debugPrint('[LOTTIE ERROR]\nasset: $asset\nerror: $error');

    return Container(
      color: Colors.red[900],
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '⚠ LOTTIE LOAD ERROR',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'asset:',
              style: TextStyle(
                color: Colors.white60,
                fontFamily: 'monospace',
                fontSize: 11,
              ),
            ),
            Text(
              asset,
              style: const TextStyle(
                color: Colors.yellowAccent,
                fontFamily: 'monospace',
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'error:',
              style: TextStyle(
                color: Colors.white60,
                fontFamily: 'monospace',
                fontSize: 11,
              ),
            ),
            Text(
              error.toString(),
              style: const TextStyle(
                color: Colors.orangeAccent,
                fontFamily: 'monospace',
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MonoText extends StatelessWidget {
  const _MonoText(this.text, {this.color = Colors.white70});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: Text(
        text,
        style: TextStyle(fontFamily: 'monospace', fontSize: 11, color: color),
      ),
    );
  }
}
