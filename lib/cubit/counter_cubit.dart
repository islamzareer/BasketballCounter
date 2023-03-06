import 'package:basketball_counter_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterAIncrementState());

  int teamAPoints = 0;
  int teamBPoints = 0;

  void teamIncrement({required String team, required int buttonId}) {
    if (team == 'A') {
      teamAPoints += buttonId;
      emit(CounterAIncrementState());
    } else {
      teamBPoints += buttonId;
      emit(CounterBIncrementState());
    }
  }

  void reset() {
    teamAPoints = 0;
    teamBPoints = 0;
    emit(CounterAIncrementState());
  }
}
