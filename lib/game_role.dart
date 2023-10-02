import 'package:equatable/equatable.dart';

enum GameRoleEnum {
  empty,
  cross,
  circle;

  String toSign() {
    String result = '';
    switch (this) {
      case GameRoleEnum.empty:
        result = '_';
        break;
      case GameRoleEnum.cross:
        result = 'X';
        break;
      case GameRoleEnum.circle:
        result = 'O';
        break;
    }
    return result;
  }
}

class GameRoles extends Equatable {
  final List<GameRoleEnum> roleList;

  const GameRoles({required this.roleList});

  String toSign() {
    String result = '';
    for (GameRoleEnum enumModel in roleList) {
      switch (enumModel) {
        case GameRoleEnum.empty:
          result += '_';
          break;
        case GameRoleEnum.cross:
          result += 'X';
          break;
        case GameRoleEnum.circle:
          result += 'O';
          break;
      }
    }
    return result;
  }

  @override
  List<Object?> get props => roleList;
}
