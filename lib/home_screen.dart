import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_counter_app/cubit/counter_state.dart';
import 'package:basketball_counter_app/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  late String winnerTeam;

  void increment(String team, int value, BuildContext context) {
    BlocProvider.of<CounterCubit>(context)
        .teamIncrement(team: team, buttonId: value);
  }

  void reset(BuildContext context) {
    BlocProvider.of<CounterCubit>(context).reset();
  }

  @override
  Widget build(BuildContext context) {
    final double ScreenHeight = MediaQuery.of(context).size.height;
    final double ScreenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<CounterCubit, CounterState>(
      builder: (context, state) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black45,
            title: const Text('Points Counter'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: ScreenHeight * 0.6,
                    width: ScreenWidth * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team A',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '${BlocProvider.of<CounterCubit>(context).teamAPoints}',
                          style: const TextStyle(
                            fontSize: 150,
                          ),
                        ),
                        CustomButton(
                            text: 'Add 1 Point ',
                            toDo: () {
                              increment('A', 1, context);
                            }),
                        CustomButton(
                            text: 'Add 2 Points ',
                            toDo: () {
                              increment('A', 2, context);
                            }),
                        CustomButton(
                            text: 'Add 3 Points ',
                            toDo: () {
                              increment('A', 3, context);
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenHeight * 0.6,
                    child: const VerticalDivider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    height: ScreenHeight * 0.6,
                    width: ScreenWidth * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team B',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '${BlocProvider.of<CounterCubit>(context).teamBPoints}',
                          style: const TextStyle(
                            fontSize: 150,
                          ),
                        ),
                        CustomButton(
                            text: 'Add 1 Point ',
                            toDo: () {
                              increment('B', 1, context);
                            }),
                        CustomButton(
                            text: 'Add 2 Points ',
                            toDo: () {
                              increment('B', 2, context);
                            }),
                        CustomButton(
                            text: 'Add 3 Points ',
                            toDo: () {
                              increment('B', 3, context);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              CustomButton(
                  text: 'Reset ',
                  toDo: () {
                    reset(context);
                  }),
              CustomButton(
                text: 'Finish ',
                toDo: () {
                  if (BlocProvider.of<CounterCubit>(context).teamAPoints >
                      BlocProvider.of<CounterCubit>(context).teamBPoints) {
                    winnerTeam = "Team A won, Congratulations";
                  } else if (BlocProvider.of<CounterCubit>(context)
                          .teamAPoints <
                      BlocProvider.of<CounterCubit>(context).teamBPoints) {
                    winnerTeam = "Team B won, Congratulations";
                  } else {
                    winnerTeam = "Teams are tied :)";
                  }
                  winner(winnerTeam, context);
                },
              ),
            ],
          ),
        ),
      ),
      listener: (context, state) {},
    );
  }

  void winner(String winnerTeam, BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
              child: Text(
            winnerTeam,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          actions: [
            Center(
              child: CustomButton(
                  text: "Replay",
                  toDo: () {
                    reset(context);
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      );
}
