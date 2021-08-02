class CacheStorage {
  static final CacheStorage _obj = CacheStorage._internal();

  CacheStorage._internal();

  factory CacheStorage() {
    return _obj;
  }

  bool? isListView = true;

  void copyWith({bool? isListView}) {
    this.isListView = isListView ?? this.isListView;
  }
}
