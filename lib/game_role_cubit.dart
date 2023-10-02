import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/game_role.dart';

class GameRoleCubit extends Cubit<GameRoleEnum> {
  GameRoleCubit() : super(GameRoleEnum.empty);

  void setModel(GameRoleEnum model) {
    emit(model);
  }

  void setOppositeModel() {
    GameRoleEnum result = GameRoleEnum.empty;
    switch (state) {
      case GameRoleEnum.empty:
        break;
      case GameRoleEnum.cross:
        result = GameRoleEnum.circle;
        break;
      case GameRoleEnum.circle:
        result = GameRoleEnum.cross;
        break;
    }
    emit(result);
  }

  List<bool> selectedModel = [];
}
