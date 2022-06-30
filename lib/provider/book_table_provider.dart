import 'package:flutter/foundation.dart';
import 'package:flutter_restaurant/data/repository/book_table_repo.dart';

class BookTableProvider with ChangeNotifier {
  final BookTableRepo bookTableRepo;

  BookTableProvider({@required this.bookTableRepo});
}
