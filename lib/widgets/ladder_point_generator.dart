import 'dart:math';

// Point 클래스
class Point {
  final int x; //점의 x좌표
  final int y; //점의 y좌표

  Point(this.x, this.y);

  @override
  String toString() => 'Point(x: $x, y: $y)';
}

// Line 클래스
class Line {
  final Point sx; //라인이 시작점
  final Point ex; //라인의 끝점

  Line(this.sx, this.ex);

  @override
  String toString() => 'Line(sx: $sx, ex: $ex)';
}

// LadderInfo 클래스(사다리 생성 정보)
class LadderInfo {
  final int width;
  final int height;
  final int availableWidth;
  final int availableHeight;
  final int verticalLineCount;
  final int vmargin;
  final int hmargin;
  final List<int> xCoords; //수직 라인의 x좌표들
  final List<List<Line>> ladderLines; //중복없이 생성된 사다리의 라인들

  LadderInfo(
      {required this.width, //전체 캔버스 길이
      required this.height, //전체 캔버스 높이
      required this.availableWidth, //상하 마진을 제외한 캔버스 길이
      required this.availableHeight, //좌우 마진을 제외한 캔버스 높이
      required this.verticalLineCount, //그릴 수직 라인의 수
      required this.vmargin, //상하 수직 마진
      required this.hmargin, //좌우 수평 마진
      required this.xCoords, //수직 라인의 시작 x좌표
      required this.ladderLines //그려진 사다리의 라인들
      });

  @override
  String toString() =>
      'LadderInfo(width: $width, height: $height, availableWidth: $availableWidth, availableHeight: $availableHeight, verticalLineCount: $verticalLineCount)';
}

// ladderPointGenerator 클래스 정의
class LadderPointGenerator {
  final int width;
  final int height;
  final int verticalLineCount;
  final int hmargin;
  final int vmargin;
  final int minPointCount;
  final int maxPointCount;
  final Random random = Random();

  LadderPointGenerator({
    required this.width, //캔버스 길이
    required this.height, //캔버스 높이
    required this.verticalLineCount, //생성하는 수직 선의 갯수
    required this.hmargin, //좌우 수평 마진
    required this.vmargin, //상하 수직 마진
    required this.minPointCount, //최소 생성 점의 수
    required this.maxPointCount, //최대 생성 점의 수
  });

  // y 좌표 목록을 피하면서 랜덤한 점 생성
  List<Point> generatePoints(
      int x, //수평 라인의 x 좌표
      int availableHeight, //마진을 제외한 가용한 수직라인의 높이
      int pointsCount, //수직 라인에 찍을 점의 수
      [List<int>? excludeYPoints] //겹치지 않도록 배제해야하는 점들(전 수직라인의 y좌표들)
      ) {
    List<Point> points = [];

    int minGap = availableHeight ~/ pointsCount; //균등하게 점을 찍기 위한 최소 수직갭

    for (int i = 0; i < pointsCount; i++) {
      int y;
      int minBound = vmargin + i * minGap; //최소 경계
      int maxBound = vmargin + (i + 1) * minGap - 1; //최대 경계

      maxBound =
          maxBound > height - vmargin ? height - vmargin : maxBound; //최대 경계 보정

      do {
        y = minBound + random.nextInt(maxBound - minBound + 1); //랜덤하게 y좌표 만들기
      } while (excludeYPoints?.contains(y) ??
          false ||
              points.any((point) =>
                  point.y == y)); //배제하는 점과 지금 만든점이 겹친다면 겹치지 않을때까지 y를 다시 생성

      points.add(Point(x, y));
    }

    points.sort((a, b) => a.y.compareTo(b.y));
    return points;
  }

  // 전체 사다리의 모든 수직선의 점을 생성
  LadderInfo generateLadderPoints() {
    List<List<Line>> ladderLines = [];
    List<Line> lines = [];
    int availableWidth = width - 2 * hmargin; //수평 마진을 제외한 가용한 width
    int gap = availableWidth ~/ (verticalLineCount - 1); //수직 선간 간격
    List<int> xCoords = [
      for (int i = 0; i < verticalLineCount; i++)
        hmargin + i * gap //수직 선의 갯수만큼 y좌표 생성
    ];

    int availableHeight = height - 2 * vmargin; //상하 마진을 제외한 가용한 높이
    for (int x = 0; x < xCoords.length - 1; x++) {
      int pointsCount = minPointCount +
          random.nextInt(maxPointCount -
              minPointCount +
              1); //수직선에 찍을 점의 개수를 min, max 범위안에서 랜덤 생성
      List<Point> startXCoords = generatePoints(
          xCoords[x],
          availableHeight,
          pointsCount,
          x == 0
              ? null
              : ladderLines[x - 1]
                  .map((l) => l.ex.y)
                  .toList()); //시작점들을 생성(첫라인이 아니면 전라인의 y좌표 리스트를 주어 중복 방지)
      List<Point> endXCoords =
          generatePoints(xCoords[x + 1], availableHeight, pointsCount); //끝점 생성
      for (int j = 0; j < startXCoords.length; j++) {
        //각각 만들어진 시작점과 끝점을 라인으로 변환
        lines.add(Line(startXCoords[j], endXCoords[j]));
      }
      ladderLines.add(lines);
      lines = [];
    }

    return LadderInfo(
        xCoords: xCoords,
        ladderLines: ladderLines,
        width: width,
        height: height,
        availableWidth: availableWidth,
        availableHeight: availableHeight,
        verticalLineCount: verticalLineCount,
        vmargin: vmargin,
        hmargin: hmargin);
  }
}

// void main() {
//   // LadderPointGenerator 인스턴스 생성
//   LadderPointGenerator generator = LadderPointGenerator(
//       width: 100,
//       height: 400,
//       verticalLineCount: 4,
//       vmargin: 15,
//       hmargin: 20,
//       minPointCount: 3,
//       maxPointCount: 10);

//   // 사다리의 각 수직선에 대한 점을 생성하고 출력
//   LadderInfo ladderPoints = generator.generateLadderPoints();

//   print(ladderPoints.toString());
//   for (int i = 0; i < ladderPoints.ladderLines.length; i++) {
//     print('Vertical Line ${i + 1}: ${ladderPoints.ladderLines[i]}');
//   }
// }
