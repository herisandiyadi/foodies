part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class SelectPage extends PageEvent {
  final int selected;

  const SelectPage({required this.selected});

  @override
  List<Object> get props => [selected];
}
