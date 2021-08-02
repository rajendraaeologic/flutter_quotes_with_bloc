class QuoteModel {
  String? _authorName;
  String? _quote;
  List<String>? _tags;
  bool? _isActive;

  String? get authorName => _authorName;
  String? get quote => _quote;
  List<String>? get tags => _tags;
  bool? get isActive => _isActive;

  QuoteModel({
      String? authorName, 
      String? quote, 
      List<String>? tags, 
      bool? isActive}){
    _authorName = authorName;
    _quote = quote;
    _tags = tags;
    _isActive = isActive;
}

  QuoteModel.fromJson(dynamic json) {
    _authorName = json["authorName"];
    _quote = json["quote"];
    _tags = json["tags"] != null ? json["tags"].cast<String>() : [];
    _isActive = json["isActive"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["authorName"] = _authorName;
    map["quote"] = _quote;
    map["tags"] = _tags;
    map["isActive"] = _isActive;
    return map;
  }

}