import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/constants/app_contstants.dart';
import 'package:quotes_app/cubit/quote_state.dart';
import 'package:quotes_app/di/app_init.dart';
import 'package:quotes_app/model/quote_model.dart';
import 'package:quotes_app/ui/screens/filter_screen.dart';
import 'package:quotes_app/utils/text_themes.dart';
import 'package:quotes_app/utils/utils.dart';

class ListViewScreen extends StatefulWidget {
  ListViewScreen({Key? key, required this.quoteState}) : super(key: key);

  final QuoteState quoteState;

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  QuoteCubit quoteCubit = AppInitializer.getIt<QuoteCubit>();

  @override
  Widget build(BuildContext context) {
    TextThemes(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(14)),
      child: ListView.separated(
        itemCount: widget.quoteState.quoteList.length,
        itemBuilder: (context, index) {
          return itemWidget(context, index);
        },
        separatorBuilder: (context, index) {
          return Container(
              child: Divider(
                color: Colors.grey[600],
                thickness: 0.8,
              ),
              margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40), vertical: ScreenUtil().setHeight(6)));
        },
      ),
    );
  }

  Widget itemWidget(context, index) {
    QuoteModel quoteModel = widget.quoteState.quoteList[index];
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.quoteState.quoteList[index].quote ?? AppConstants.appName,
            textAlign: TextAlign.center,
            style: TextThemes.h12?.copyWith(
              color: Utils.generateColors(),
              fontSize: ScreenUtil().setSp(16),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(2)),
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () async {
                List<QuoteModel> filterList = await quoteCubit.filterList(dataList: widget.quoteState.quoteList, validateString: quoteModel.authorName ?? "");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterScreen(title: quoteModel.authorName ?? AppConstants.appName, dataList: filterList, selectedOption: true)));
              },
              child: Text(
                "- ${widget.quoteState.quoteList[index].authorName ?? AppConstants.appName}",
                textAlign: TextAlign.end,
                style:
                    TextThemes.h11?.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(12), color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
