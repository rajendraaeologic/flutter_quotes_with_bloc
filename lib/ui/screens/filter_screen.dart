import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/constants/app_contstants.dart';
import 'package:quotes_app/model/quote_model.dart';
import 'package:quotes_app/utils/text_themes.dart';
import 'package:quotes_app/utils/utils.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({Key? key, required this.title, required this.dataList, required this.selectedOption}) : super(key: key);

  final String title;
  final bool selectedOption;
  final List<QuoteModel> dataList;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text(
          widget.selectedOption ? widget.title : "#${widget.title}",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
        child: ListView.separated(
          itemCount: widget.dataList.length,
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
      ),
    );
  }

  Widget itemWidget(context, index) {
    QuoteModel quoteModel = widget.dataList[index];
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            quoteModel.quote ?? AppConstants.appName,
            textAlign: TextAlign.center,
            style: TextThemes.h11Extended(),
          ),
          !widget.selectedOption
              ? Container(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(2)),
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () async {
                      /* List<QuoteModel> sortedList = await quoteCubit.sortedList(dataList: widget.quoteState.quoteList, validateString: quoteModel.authorName ?? "");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterScreen(title: quoteModel.authorName ?? AppConstants.appName, dataList: sortedList, selectedOption: true)));*/
                    },
                    child: Text(
                      "- ${quoteModel.authorName ?? AppConstants.appName}",
                      textAlign: TextAlign.end,
                      style: TextThemes.h11
                          ?.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.w400, fontSize: ScreenUtil().setSp(12), color: Colors.black),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
