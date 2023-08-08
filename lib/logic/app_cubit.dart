import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int bottomNavBarIndex = 2;
  bool loggedIn = false;
  bool openedBefore = false;
    String? name, email;
    
  Future  loadState() async {
    final prefs = await SharedPreferences.getInstance();
   
      loggedIn = (prefs.getBool('isLoggedIn') ?? false);
      openedBefore = (prefs.getBool('isOpenedBefore') ?? false);
   emit(AppGetState());
  }


  Future<Map<String, String>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('Name');
    email = prefs.getString('Email');
    return <String, String>{
      'name': name!,
      'email': email!,
    };
  }

  void changeBottomNavIndex(int index) {
    bottomNavBarIndex = index;
    emit(AppChangeBottomNavBarState());
  }
}
