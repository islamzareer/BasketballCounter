import 'package:basketball_counter/custom_button.dart';
import 'package:flutter/material.dart';

class PointsCounter extends StatefulWidget {
  const PointsCounter({super.key});

  @override
  State<PointsCounter> createState() => _PointsCounterState();
}

class _PointsCounterState extends State<PointsCounter> {
  int teamAPoints = 0;

  int teamBPoints = 0;
  late String winnerTeam;
  void addPointsA(int p) {
    setState(() {
      teamAPoints += p;
    });
  }

  void addPointsB(int p) {
    setState(() {
      teamBPoints += p;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double ScreenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: ScreenHeight * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Team A',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$teamAPoints',
                    style: const TextStyle(
                      fontSize: 120,
                    ),
                  ),
                  CustomButton(
                    text: 'Add 1 Point ',
                    toDo: () {
                      addPointsA(1);
                    },
                  ),
                  CustomButton(
                    text: 'Add 2 Points',
                    toDo: () {
                      addPointsA(2);
                    },
                  ),
                  CustomButton(
                    text: 'Add 3 Points',
                    toDo: () {
                      addPointsA(3);
                    },
                  ),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Team B',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$teamBPoints',
                    style: const TextStyle(
                      fontSize: 120,
                    ),
                  ),
                  CustomButton(
                    text: 'Add 1 Point',
                    toDo: () {
                      addPointsB(1);
                    },
                  ),
                  CustomButton(
                    text: 'Add 2 Points',
                    toDo: () {
                      addPointsB(2);
                    },
                  ),
                  CustomButton(
                    text: 'Add 3 Points',
                    toDo: () {
                      addPointsB(3);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        CustomButton(
          text: 'Reset ',
          toDo: () {
            setState(() {
              teamAPoints = 0;
              teamBPoints = 0;
            });
          },
        ),
        CustomButton(
          text: 'Finish ',
          toDo: () {
            setState(() {
              if (teamAPoints > teamBPoints) {
                winnerTeam = "Team A won, Congratulations";
              } else if (teamAPoints < teamBPoints) {
                winnerTeam = "Team B won, Congratulations";
              } else {
                winnerTeam = "Teams are tied :)";
              }
              Winner(winnerTeam);
            });
          },
        ),
      ],
    );
  }

  void Winner(String winnerTeam) => showDialog(
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
                  setState(() {
                    teamAPoints = 0;
                    teamBPoints = 0;
                  });

                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
}
