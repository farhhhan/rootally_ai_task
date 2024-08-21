part of 'index_bloc.dart';

@immutable
sealed class IndexEvent {}


class ChangeIndexEvent extends IndexEvent{
  int idx;
 ChangeIndexEvent({required this.idx});
 
  }