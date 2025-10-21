import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  static const double baseWidth = 412;
  static const double baseHeight = 917;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Scaffold(
        body: SafeArea(
          child: _AspectPhoneCanvas(
            baseWidth: baseWidth,
            baseHeight: baseHeight,
            child: ExamplesHomeMobile(),
          ),
        ),
      ),
    );
  }
}

/// 화면 크기에 맞춰 `baseWidth:baseHeight` 비율을 유지하며 스케일링
class _AspectPhoneCanvas extends StatelessWidget {
  const _AspectPhoneCanvas({
    super.key,
    required this.baseWidth,
    required this.baseHeight,
    required this.child,
  });

  final double baseWidth;
  final double baseHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 바깥 여백 조금 주고 가운데 배치
        final double maxW = constraints.maxWidth;
        final double maxH = constraints.maxHeight;

        return Center(
          child: FittedBox(
            fit: BoxFit.contain, // 가로세로 중 더 작은 쪽에 맞춰 전체 비율 유지
            child: SizedBox(
              width: baseWidth,
              height: baseHeight,
              child: child,
            ),
          ),
        );
      },
    );
  }
}

class ExamplesHomeMobile extends StatelessWidget {
  const ExamplesHomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 8,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFCAC4D0),
          ),
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Status bar
          Container(
            width: double.infinity,
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            alignment: Alignment.bottomLeft,
            child: const Text(
              '9:30',
              style: TextStyle(
                color: Color(0xFFFEF7FF),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 1.43,
                letterSpacing: 0.14,
              ),
            ),
          ),

          // Main Content (디자인 비율 유지용 내부 배치)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 180),
                  Container(
                    width: 190,
                    height: 190,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://www.figma.com/api/mcp/asset/6f3ff6d4-7c05-4c99-a9cf-1618421754cb",
                        ),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 34),
                  const SizedBox(
                    width: 329,
                    child: Text(
                      'Uni-cue activated AI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Opacity(
                    opacity: 0.50,
                    child: SizedBox(
                      width: 329,
                      child: Text(
                        'Connect to world with simple touch',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}