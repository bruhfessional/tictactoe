import 'package:equatable/equatable.dart';

enum GameModelsEnum {
  empty,
  cross,
  circle;

  String getSign() {
    String result = '';
    switch (this) {
      case GameModelsEnum.empty:
        result = '_';
        break;
      case GameModelsEnum.cross:
        result = 'X';
        break;
      case GameModelsEnum.circle:
        result = 'O';
        break;
    }
    return result;
  }
}

class GameModels extends Equatable {
  final List<GameModelsEnum> modelList;

  const GameModels({required this.modelList});

  String toSign() {
    String result = '';
    for (GameModelsEnum enumModel in modelList) {
      switch (enumModel) {
        case GameModelsEnum.empty:
          result += '_';
          break;
        case GameModelsEnum.cross:
          result += 'X';
          break;
        case GameModelsEnum.circle:
          result += 'O';
          break;
      }
    }
    return result;
  }

  @override
  List<Object?> get props => modelList;
}
