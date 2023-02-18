import 'package:flutter/material.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

import '../shared/widgets/user_image_button.dart';
import 'widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Listinha'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                top: 70,
                left: 30,
                right: 30,
                bottom: 200,
              ),
              itemCount: 100,
              itemBuilder: (_, index) {
                final board = TaskBoard(
                  Uuid.v4(),
                  'Nova lista de tarefas 1 ',
                  tasks: [
                    Task(Uuid.v4(), '', completed: true),
                    Task(Uuid.v4(), '', completed: true),
                    Task(
                      Uuid.v4(),
                      '',
                      completed: true,
                    ),
                    Task(
                      Uuid.v4(),
                      '',
                      completed: true,
                    ),
                  ],
                );
                return TaskCard(
                  board: board,
                  height: 140,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
            const Align(
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment(
                    value: 0,
                    label: Text('Todos'),
                  ),
                  ButtonSegment(
                    value: 1,
                    label: Text('Pendentes'),
                  ),
                  ButtonSegment(
                    value: 2,
                    label: Text('Concluídas'),
                  ),
                  ButtonSegment(
                    value: 3,
                    label: Text('Desativadas'),
                  ),
                ],
                selected: const {1},
                onSelectionChanged: (values) {},
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit),
        label: const Text('Nova lista'),
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
      ),
    );
  }
}
