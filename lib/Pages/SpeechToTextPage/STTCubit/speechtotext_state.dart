part of 'speechtotext_cubit.dart';

@immutable
abstract class SpeechtotextState {}

class SpeechtotextLoading extends SpeechtotextState {}
class SpeechtotextStart extends SpeechtotextState {}
class SpeechtotextStop extends SpeechtotextState {}
class SpeechtotextFail extends SpeechtotextState {}