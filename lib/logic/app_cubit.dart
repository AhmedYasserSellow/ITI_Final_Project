import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int bottomNavBarIndex = 2;

  void changeBottomNavIndex(int index) {
    bottomNavBarIndex = index;
    emit(AppChangeBottomNavBarState());
  }
}
