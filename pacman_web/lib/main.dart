import 'dart:math';
import 'package:Adglobe/about.dart';
import 'package:Adglobe/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MaterialApp(
      home: Scaffold(
    body: Home(),
  )));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // title: '2048 Game',
//       // theme: ThemeData(
//       //   primarySwatch: Colors.blue,
//       // ),
//       home: Home(),
//     );
//   }
// }

// /// The route configuration.
// final GoRouter _router = GoRouter(
//   initialLocation: '/', // 初期ページ

//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const Home();
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: '/about',
//           pa
//         ),
//       ],
//     ),
//   ],
// );

// フェード遷移を適用（横スクロールを防ぐ）
CustomTransitionPage _fadeTransition(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

// class Game2048 extends StatefulWidget {
//   const Game2048({super.key});

//   @override
//   _Game2048State createState() => _Game2048State();
// }

// class _Game2048State extends State<Game2048> {
//   static const int gridSize = 4;
//   List<List<int>> grid = List.generate(gridSize, (_) => List.filled(gridSize, 0));
//   bool canMove = true; // 連続入力防止
//   int score = 0; // スコア追加

//   @override
//   void initState() {
//     super.initState();
//     resetGame();
//   }

//   void resetGame() {
//     setState(() {
//       score = 0; // スコアリセット
//       grid = List.generate(gridSize, (_) => List.filled(gridSize, 0));
//       addRandomTile();
//       addRandomTile();
//     });
//   }

//   void addRandomTile() {
//     List<int> emptyCells = [];
//     for (int y = 0; y < gridSize; y++) {
//       for (int x = 0; x < gridSize; x++) {
//         if (grid[y][x] == 0) {
//           emptyCells.add(y * gridSize + x);
//         }
//       }
//     }

//     if (emptyCells.isNotEmpty) {
//       int index = emptyCells[Random().nextInt(emptyCells.length)];
//       grid[index ~/ gridSize][index % gridSize] = Random().nextBool() ? 2 : 2;
//     }
//   }

//   void moveTiles(String direction) {
//     if (!canMove) return; // 連続入力を防止
//     setState(() {
//       canMove = false; // 操作を一時的にブロック
//       if (direction == "left") {
//         for (int y = 0; y < gridSize; y++) {
//           grid[y] = mergeTiles(grid[y]);
//         }
//       } else if (direction == "right") {
//         for (int y = 0; y < gridSize; y++) {
//           grid[y] = mergeTiles(grid[y].reversed.toList()).reversed.toList();
//         }
//       } else if (direction == "up") {
//         for (int x = 0; x < gridSize; x++) {
//           List<int> column = [grid[0][x], grid[1][x], grid[2][x], grid[3][x]];
//           column = mergeTiles(column);
//           for (int y = 0; y < gridSize; y++) {
//             grid[y][x] = column[y];
//           }
//         }
//       } else if (direction == "down") {
//         for (int x = 0; x < gridSize; x++) {
//           List<int> column = [grid[0][x], grid[1][x], grid[2][x], grid[3][x]].reversed.toList();
//           column = mergeTiles(column);
//           column = column.reversed.toList();
//           for (int y = 0; y < gridSize; y++) {
//             grid[y][x] = column[y];
//           }
//         }
//       }
//       addRandomTile();
//       Future.delayed(const Duration(milliseconds: 800), () {
//         setState(() {
//           canMove = true; // 一定時間後に再び入力を許可
//         });
//       });
//     });
//   }

//   List<int> mergeTiles(List<int> row) {
//     List<int> newRow = row.where((tile) => tile != 0).toList();
//     for (int i = 0; i < newRow.length - 1; i++) {
//       if (newRow[i] == newRow[i + 1]) {
//         newRow[i] *= 2;
//         score += newRow[i]; // スコア加算
//         newRow[i + 1] = 0;
//       }
//     }
//     newRow = newRow.where((tile) => tile != 0).toList();
//     while (newRow.length < gridSize) {
//       newRow.add(0);
//     }
//     return newRow;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey[900],
//         body: Center(
//           child: Container(
//             alignment: Alignment.center,
//             height: 800,
//             width: 500,
//             child: Column(
//               children: [
//                 ElevatedButton(
//                   onPressed: resetGame,
//                   child: const Text("Reset"),
//                 ),
//                 Text(
//                   "Score: $score",
//                   style: const TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onVerticalDragUpdate: (details) {
//                       if (details.primaryDelta! < 0) {
//                         moveTiles("up");
//                       } else {
//                         moveTiles("down");
//                       }
//                     },
//                     onHorizontalDragUpdate: (details) {
//                       if (details.primaryDelta! < 0) {
//                         moveTiles("left");
//                       } else {
//                         moveTiles("right");
//                       }
//                     },
//                     child: GridView.builder(
//                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: gridSize,
//                         crossAxisSpacing: 5,
//                         mainAxisSpacing: 5,
//                       ),
//                       itemCount: gridSize * gridSize,
//                       itemBuilder: (context, index) {
//                         int x = index % gridSize;
//                         int y = index ~/ gridSize;
//                         int value = grid[y][x];
//                         return Container(
//                           decoration: BoxDecoration(
//                             color: value == 0 ? Colors.grey[800] : Colors.orange[300],
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           alignment: Alignment.center,
//                           child: Text(
//                             value == 0 ? "" : "$value",
//                             style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
