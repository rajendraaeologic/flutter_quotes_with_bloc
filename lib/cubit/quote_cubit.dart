part of 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  DataGenerator _quoteRepository = AppInitializer.getIt<DataGenerator>();

  QuoteCubit() : super(QuoteState(quoteModel: QuoteModel(), quoteList: []));

  Future getQuotes() async {
    try {
      emit(state.copyWith(quoteTriggered: QuoteTriggered()));
      final data = _quoteRepository.fetchQuotes();
      emit(state.copyWith(quoteFetched: QuoteFetched(), quoteList: data));
    } on Exception {
      rethrow;
    }
  }

  void changeScreen({required bool isListView}) {
    if(isListView) {
      emit(state.copyWith(isListView: true));
    } else {
      emit(state.copyWith(isListView: false));
    }
  }

  Future<List<QuoteModel>> filterList({required List<QuoteModel> dataList, required String validateString}) async {
    var sortedList = <QuoteModel>[];

    sortedList = dataList.where((element) => element.authorName == validateString).toList();

    return sortedList;
  }

  Future<List<QuoteModel>> sortedFilterList({required List<QuoteModel> dataList, required String validateString, int index = 0, int index2 = 0}) async {
    var sortedList = <QuoteModel>[];

    for (QuoteModel quoteModel in dataList) {
      if (quoteModel.tags != null) {
        for (String tags in quoteModel.tags!) {
          if (tags == validateString) {
            sortedList.add(quoteModel);
          }
        }
      }
    }

    return sortedList;
  }
}
