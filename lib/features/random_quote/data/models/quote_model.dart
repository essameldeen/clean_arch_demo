import 'package:clean_arch_demo/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required String author,
      required int id,
      required String content,
      required String permaLink})
      : super(author: author, id: id, content: content, permaLink: permaLink);

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        author: json["author"],
        id: json["id"],
        content: json["quote"],
        permaLink: json["permalink"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "id": id,
        "quote": content,
        "permalink": permaLink,
      };
}
