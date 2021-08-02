import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/blocs/quote_bloc.dart';
import 'package:quotes_app/db/quote_repository.dart';
import 'package:quotes_app/di/app_init.dart';
import 'package:quotes_app/model/quote_model.dart';

part 'quote_cubit.dart';

class QuoteState extends Equatable {
  QuoteState({required this.quoteModel, required this.quoteList, this.quoteFetched, this.quoteTriggered, this.isListView});

  final QuoteModel quoteModel;
  final List<QuoteModel> quoteList;
  final QuoteFetched? quoteFetched;
  final QuoteTriggered? quoteTriggered;
  final bool? isListView;

  @override
  List<Object?> get props => [quoteModel, quoteList, quoteTriggered, quoteFetched, isListView];

  QuoteState copyWith({QuoteModel? quoteModel, List<QuoteModel>? quoteList, QuoteFetched? quoteFetched, QuoteTriggered? quoteTriggered, bool? isListView}) {
    return QuoteState(
        quoteModel: quoteModel ?? this.quoteModel,
        quoteList: quoteList ?? this.quoteList,
        quoteFetched: quoteFetched ?? this.quoteFetched,
        isListView: isListView ?? this.isListView);
  }
}
