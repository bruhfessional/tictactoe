import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/game_models.dart';
import 'package:tictactoe/grid_cubit.dart';
import 'package:tictactoe/model_cubit.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicTacToe'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<GridCubit>().clearGrid();
                context.read<ModelCubit>().setModel(GameModelsEnum.empty);
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: BlocBuilder<ModelCubit, GameModelsEnum>(
              builder: (BuildContext context, GameModelsEnum state) {
                return ToggleButtons(
                  isSelected: _isSelected(state),
                  color: Colors.grey,
                  selectedColor: Colors.red,
                  fillColor: Colors.lightBlueAccent,
                  borderColor: Colors.lightBlueAccent,
                  selectedBorderColor: Colors.red,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  children: const [
                    Text('O'),
                    Text('X'),
                  ],
                  onPressed: (int index) {
                    context
                        .read<ModelCubit>()
                        .setModel(index == 0 ? GameModelsEnum.circle : GameModelsEnum.cross);
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: BlocBuilder<GridCubit, GameModels>(
                builder: (context, values) {
                  return GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    children: List.generate(
                      9,
                      (index) => TextButton(
                        onPressed: () {
                          context
                              .read<GridCubit>()
                              .setGrid(index, context.read<ModelCubit>().state);
                        },
                        child: Text(values.modelList[index].getSign()),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<bool> _isSelected(GameModelsEnum state) {
    List<bool> result = [false, false];
    switch (state) {
      case GameModelsEnum.empty:
        break;
      case GameModelsEnum.cross:
        result = [false, true];
        break;
      case GameModelsEnum.circle:
        result = [true, false];
        break;
    }
    return result;
  }
}
