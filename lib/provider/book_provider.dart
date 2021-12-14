import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:search/model/book_model.dart';
import 'package:search/repo/book_repo.dart';

class BookProvider with ChangeNotifier{
  BookRepo bookRepo= BookRepo();
  List<BookModel> _bookModelList=[];
  List<BookModel> get bookModelList
     => _bookModelList;
  getBookList(){
    _bookModelList= bookRepo.allBookList;
    notifyListeners();
  }

  String search="";
  searchText(value){
    search=value;
    notifyListeners();
  }
  UnmodifiableListView<BookModel> get searchedList =>
      search.isEmpty?
          UnmodifiableListView(_bookModelList):
          UnmodifiableListView(_bookModelList.where
            ((sss) => sss.name.
          toLowerCase().contains(search.toLowerCase())
              || sss.author.toLowerCase().
              contains(search.toLowerCase())));
}