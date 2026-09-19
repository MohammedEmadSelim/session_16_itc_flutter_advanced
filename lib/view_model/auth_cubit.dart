import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';
// as the same of change notifier 
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  
  
  void login()async{
    // notifiLestnier();
    emit(AuthLoginLoading());


    await Future.delayed(Duration(seconds: 2));


    
     emit(AuthLoginSuccess());
    
  }
}
