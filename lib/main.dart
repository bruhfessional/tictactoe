import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/grid_cubit.dart';
import 'package:tictactoe/grid_page.dart';
import 'package:tictactoe/model_cubit.dart';

void main() => runApp(const TicTacToe());

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => GridCubit()),
          BlocProvider(create: (_) => ModelCubit()),
        ],
        child: const GridPage(),
      ),
    );
  }
}
