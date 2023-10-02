import 'package:bloc/bloc.dart';
import 'package:tictactoe/game_models.dart';

class GridCubit extends Cubit<GameModels> {
  GridCubit() : super(GameModels(modelList: List.filled(9, GameModelsEnum.empty)));

  void setGrid(int gridNumber, GameModelsEnum model) {
    List<GameModelsEnum> newList = List.of(state.modelList);
    newList[gridNumber] = model;
    emit(GameModels(modelList: newList));
    print('gridState: ${state.toSign()}');
  }

  void clearGrid() {
    emit(GameModels(modelList: List.filled(9, GameModelsEnum.empty)));
    print('gridState: ${state.toSign()}');
  }
}
