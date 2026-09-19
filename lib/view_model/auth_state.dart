part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


final class AuthLoginLoading extends AuthState{}
final class AuthLoginSuccess extends AuthState{}
