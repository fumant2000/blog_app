part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState {}

final class AppUserInitial extends AppUserState {}

final class AppUserLoggedIn extends AppUserState {
  final User user;
  AppUserLoggedIn(this.user);
}

//core ne depend d'aucune fonctionalités.
//ce sont  les autres fonctionalités qui dependent de core.
