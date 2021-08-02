import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/constants/app_contstants.dart';
import 'package:quotes_app/cubit/quote_state.dart';
import 'package:quotes_app/db/cache_storage.dart';
import 'package:quotes_app/di/app_init.dart';
import 'package:quotes_app/ui/screens/grid_view_screen.dart';
import 'package:quotes_app/ui/screens/list_view_screen.dart';
import 'package:quotes_app/ui/widgets/swap_button.dart';
import 'package:quotes_app/utils/text_themes.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late QuoteCubit _quoteCubit;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _quoteCubit = AppInitializer.getIt<QuoteCubit>();
    _quoteCubit.getQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextThemes(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
          child: BlocProvider<QuoteCubit>(
             create: (context) => _quoteCubit,
            child: BlocConsumer<QuoteCubit, QuoteState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\“${AppConstants.appName}",
                            style:
                                TextThemes.h14?.copyWith(letterSpacing: 1,
                                    fontSize: ScreenUtil().setSp(38), fontWeight: FontWeight.w300, color: Colors.black),
                          ),
                          SwapButton(
                            onListSwapClick: () {
                              pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
                              _quoteCubit.changeScreen(isListView: true);
                            },
                            onGridSwapClick: () {
                              pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                              _quoteCubit.changeScreen(isListView: false);
                            },
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        controller: pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          FadedSlideAnimation(
                            child: ListViewScreen(quoteState: state),
                            beginOffset: Offset(0, 0.3),
                            endOffset: Offset(0, 0),
                            slideCurve: Curves.linearToEaseOut,
                          ),
                          FadedSlideAnimation(
                            child: GridViewScreen(quoteState: state),
                            beginOffset: Offset(0, 0.3),
                            endOffset: Offset(0, 0),
                            slideCurve: Curves.linearToEaseOut,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
              listener: (context, state) {
                CacheStorage().copyWith(isListView: state.isListView);
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
