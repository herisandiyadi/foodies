import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, int> {
  PageBloc() : super(0) {
    on<SelectPage>((event, emit) {
      emit(event.selected);
    });
  }
}
