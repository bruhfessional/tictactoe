import 'package:bloc/bloc.dart';
import 'package:tictactoe/game_role.dart';

class GridCubit extends Cubit<GameRoles> {
  GridCubit() : super(GameRoles(roleList: List.filled(9, GameRoleEnum.empty)));

  void setGrid(int gridNumber, GameRoleEnum role) {
    List<GameRoleEnum> newList = List.of(state.roleList);
    newList[gridNumber] = role;
    emit(GameRoles(roleList: newList));
    print('gridState: ${state.toSign()}  (${role.toSign()})');
  }

  void clearGrid() {
    emit(GameRoles(roleList: List.filled(state.roleList.length, GameRoleEnum.empty)));
    print('gridState: ${state.toSign()}  (${GameRoleEnum.empty.toSign()})');
  }

  void incrementGrid() {
    // int number = state.roleList.length * 3;
    // emit(GameRoles(roleList: List.filled(number, GameRoleEnum.empty)));
  }

  void decrementGrid() {
    // int number = 0;
    // if (state.roleList.length % 9 != 0 && state.roleList.length > 8) {
    //   number = (state.roleList.length / 3) as int;
    // } else {
    //   number = state.roleList.length;
    // }
    // emit(
    //   GameRoles(
    //     roleList: List.filled(number, GameRoleEnum.empty),
    //   ),
    // );
  }
}
