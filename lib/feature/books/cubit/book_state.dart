part of 'book_cubit.dart';

@immutable
sealed class BookState {}

final class BookInitial extends BookState {}


final class GetBooksSuccess extends BookState {
  final List<Book> books;

  GetBooksSuccess(this.books);
}

final class GetBooksError extends BookState {
  final String errorMessage;

  GetBooksError(this.errorMessage);
}
final class GetBooksLoading extends BookState {}

final class ChangeSliderValue extends BookState {}


final class SearchLoading extends BookCubit{}
final class SearchSuccess extends BookCubit{
  final List<Book> books;

  SearchSuccess(this.books);
}
final class SearchError extends BookCubit{
  final String errorMessage ;

  SearchError(this.errorMessage);
}

