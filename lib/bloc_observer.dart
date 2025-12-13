import 'package:bloc/bloc.dart';
import 'dart:developer' as dev;

/// **=> A simple, reusable Bloc observer for logging events, transitions, changes and errors <=**//

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    dev.log('Change ($change)', name: bloc.runtimeType.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    dev.log(
      'ERROR',
      name: bloc.runtimeType.toString(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    dev.log('Transition ($transition)', name: bloc.runtimeType.toString());
  }
}
