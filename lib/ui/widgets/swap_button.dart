import 'package:flutter/material.dart';
import 'package:quotes_app/db/cache_storage.dart';

class SwapButton extends StatelessWidget {
  const SwapButton({Key? key, required this.onListSwapClick, required this.onGridSwapClick}) : super(key: key);

  final VoidCallback onListSwapClick;
  final VoidCallback onGridSwapClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: onListSwapClick,
            child: Container(color: (CacheStorage().isListView ?? true) ? Colors.blue[100] : Colors.transparent, child: Icon(Icons.list)),
            overlayColor: MaterialStateProperty.all(Colors.grey[300]),
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
              onTap: onGridSwapClick,
              child: Container(color: !CacheStorage().isListView! ? Colors.blue[100] : Colors.transparent, child: Icon(Icons.grid_3x3)),
              overlayColor: MaterialStateProperty.all(Colors.grey[300])),
        ],
      ),
    );
  }
}
