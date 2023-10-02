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
    emit(GameRoles(roleList: List.filled(9, GameRoleEnum.empty)));
    print('gridState: ${state.toSign()}  (${GameRoleEnum.empty.toSign()})');
  }
}
