import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/game_models.dart';

class ModelCubit extends Cubit<GameModelsEnum> {
  ModelCubit() : super(GameModelsEnum.empty);

  void setModel(GameModelsEnum model) {
    emit(model);
  }

  List<bool> selectedModel = [];
}
