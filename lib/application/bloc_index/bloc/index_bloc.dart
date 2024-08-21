import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'index_event.dart';
part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  IndexBloc() : super(IndexState(idx: 0)) {
    on<ChangeIndexEvent>((event, emit) {
      emit(IndexState(idx: event.idx));
    });
  }
}
