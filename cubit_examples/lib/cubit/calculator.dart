import 'package:cubit_examples/cubit/math_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<int> {
  CalculatorCubit() : super(0);
  var mRepo = MathRepository();
  void plus(String receivedNumOne, String receivedNumTwo) {
    emit(mRepo.plus(receivedNumOne, receivedNumTwo));
  }

  void multipy(String receivedNumOne, String receivedNumTwo) {
    emit(mRepo.multipy(receivedNumOne, receivedNumTwo));
  }
}
