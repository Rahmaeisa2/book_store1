import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_detail_state.dart';

class BookDetailCubit extends Cubit<BookDetailState> {
  BookDetailCubit() : super(BookDetailInitial());
}
