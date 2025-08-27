import 'package:bloc/bloc.dart';

class CategoryCubit extends Cubit<int> {
  CategoryCubit() : super(0);
  void selectCategory(int index) {
    emit(index);
  }
}
