import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/constants/app_contstants.dart';
import 'package:quotes_app/cubit/quote_state.dart';
import 'package:quotes_app/di/app_init.dart';
import 'package:quotes_app/model/quote_model.dart';
import 'package:quotes_app/utils/text_themes.dart';
import 'package:quotes_app/utils/utils.dart';

import 'filter_screen.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key, required this.quoteState}) : super(key: key);

  final QuoteState quoteState;

  @override
  _GridViewScreenState createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  QuoteCubit quoteCubit = AppInitializer.getIt<QuoteCubit>();
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    TextThemes(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
        child: PageView.builder(
          controller: pageController,
          itemCount: widget.quoteState.quoteList.length,
          itemBuilder: (context, index) {
            return Center(child: itemView(context, index));
          },
        ));
  }

  Widget itemView(context, index) {
    QuoteModel quoteModel = widget.quoteState.quoteList[index];
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.quoteState.quoteList[index].quote ?? AppConstants.appName,
            textAlign: TextAlign.center,
            style: TextThemes.h11?.copyWith(
              color: Utils.generateColors(),
              fontSize: ScreenUtil().setSp(18),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(22), bottom: ScreenUtil().setHeight(22)),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () async {
                List<QuoteModel> sortedList = await quoteCubit.filterList(dataList: widget.quoteState.quoteList, validateString: quoteModel.authorName ?? "");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterScreen(title: quoteModel.authorName ?? AppConstants.appName, dataList: sortedList, selectedOption: true)));
              },
              child: Text(
                "- ${widget.quoteState.quoteList[index].authorName ?? AppConstants.appName}",
                textAlign: TextAlign.center,
                style:
                    TextThemes.h11?.copyWith(fontStyle: FontStyle.normal, fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(14), color: Colors.black),
              ),
            ),
          ),
          Wrap(
            children: List.generate(quoteModel.tags?.length ?? 0, (index2) {
              return Container(
                margin: EdgeInsets.all(ScreenUtil().setHeight(5)),
                child: FilterChip(
                  padding: EdgeInsets.zero,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: Colors.blue[200],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                  label: Text(
                    "#${quoteModel.tags?[index2] ?? AppConstants.appName}",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  showCheckmark: false,
                  onSelected: (selected) async {
                    List<QuoteModel> sortedList = await quoteCubit.sortedFilterList(
                        index2: index2, index: index, dataList: widget.quoteState.quoteList, validateString: quoteModel.tags?[index2] ?? "");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FilterScreen(title: quoteModel.tags?[index2] ?? AppConstants.appName, dataList: sortedList, selectedOption: false)));
                  },
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
