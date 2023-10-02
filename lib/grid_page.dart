import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe/app_theme.dart';
import 'package:tictactoe/game_role.dart';
import 'package:tictactoe/grid_cubit.dart';
import 'package:tictactoe/game_role_cubit.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(35.sp),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<GameRoleCubit, GameRoleEnum>(
                    builder: (BuildContext context, GameRoleEnum state) {
                      return ToggleButtons(
                        textStyle: const TextStyle(color: Colors.black),
                        isSelected: _isSelectedRole(state),
                        color: Colors.grey,
                        selectedColor: Colors.black,
                        fillColor: Colors.lightBlueAccent,
                        borderColor: Colors.lightBlueAccent,
                        selectedBorderColor: Colors.black,
                        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
                        children: const [
                          Text('O'),
                          Text('X'),
                        ],
                        onPressed: (int index) {
                          context
                              .read<GameRoleCubit>()
                              .setModel(index == 0 ? GameRoleEnum.circle : GameRoleEnum.cross);
                        },
                      );
                    },
                  ),
                  // BlocBuilder<GridCubit, GameRoles>(
                  //   builder: (BuildContext context, GameRoles state) {
                  //     return ToggleButtons(
                  //       isSelected: const [false, false],
                  //       color: Colors.grey,
                  //       selectedColor: Colors.black,
                  //       fillColor: Colors.lightBlueAccent,
                  //       borderColor: Colors.lightBlueAccent,
                  //       selectedBorderColor: Colors.black,
                  //       borderRadius: const BorderRadius.all(Radius.circular(10)),
                  //       children: const [
                  //         Text('-', style: TextStyle(color: Colors.black)),
                  //         Text('+', style: TextStyle(color: Colors.black)),
                  //       ],
                  //       onPressed: (int index) {
                  //         if (index == 0) {
                  //           context.read<GridCubit>().decrementGrid();
                  //         } else {
                  //           context.read<GridCubit>().incrementGrid();
                  //         }
                  //       },
                  //     );
                  //   },
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppTheme.borderRadius),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    width: 25.sp,
                    height: 25.sp,
                    child: IconButton(
                      onPressed: () {
                        context.read<GridCubit>().clearGrid();
                      },
                      icon: const Icon(Icons.refresh_outlined),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.sp),
            Expanded(
              flex: 8,
              child: BlocBuilder<GridCubit, GameRoles>(
                builder: (context, values) {
                  return GridView.count(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 35.sp),
                    crossAxisCount: 3,
                    children: List.generate(
                      context.read<GridCubit>().state.roleList.length,
                      (index) => GestureDetector(
                        onTapUp: (details) {
                          context
                              .read<GridCubit>()
                              .setGrid(index, context.read<GameRoleCubit>().state);
                          context.read<GameRoleCubit>().setOppositeModel();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppTheme.borderRadius),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.lightBlueAccent,
                              // strokeAlign: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              values.roleList[index].toSign(),
                              style: TextStyle(fontSize: 60.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<bool> _isSelectedRole(GameRoleEnum state) {
    List<bool> result = [false, false];
    switch (state) {
      case GameRoleEnum.empty:
        break;
      case GameRoleEnum.cross:
        result = [false, true];
        break;
      case GameRoleEnum.circle:
        result = [true, false];
        break;
    }
    return result;
  }
}
