import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe/app_theme.dart';
import 'package:tictactoe/grid_cubit.dart';
import 'package:tictactoe/grid_page.dart';
import 'package:tictactoe/game_role_cubit.dart';

void main() => runApp(ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const TicTacToe(),
    ));

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => GridCubit()),
          BlocProvider(create: (_) => GameRoleCubit()),
        ],
        child: const GridPage(),
      ),
    );
  }
}
