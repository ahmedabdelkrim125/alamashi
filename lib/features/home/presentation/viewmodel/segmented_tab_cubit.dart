import 'package:bloc/bloc.dart';

class SegmentedTabCubit extends Cubit<int> {
  SegmentedTabCubit() : super(0);
  void selectTab(int index) {
    emit(index);
  }
}
