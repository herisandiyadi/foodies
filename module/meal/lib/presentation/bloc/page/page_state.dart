part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  final int selectedPage;
  const PageState({required this.selectedPage});

  @override
  List<Object> get props => [selectedPage];
}
