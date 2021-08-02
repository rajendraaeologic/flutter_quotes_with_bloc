import 'package:quotes_app/model/quote_model.dart';

abstract class QuoteRepository {
  List<QuoteModel> fetchQuotes();
}

class DataGenerator implements QuoteRepository {
  @override
  List<QuoteModel> fetchQuotes() {
    var data = <QuoteModel>[];

    data.add(QuoteModel(
        authorName: "Steve Jobs",
        quote:
            "Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma – which is living with the results of other people’s thinking.",
        tags: ["motivation", "truth", "love", "believe", "asda", "adas", "asdd"],
        isActive: true));

    data.add(QuoteModel(
        authorName: "Steve Jobs",
        quote: "Design is not just what it looks like and feels like. Design is how it works.",
        tags: ["motivation", "truth", "love", "believe"],
        isActive: true));

    data.add(QuoteModel(
        authorName: "Steve Jobs",
        quote: "Innovation distinguishes between a leader and a follower.",
        tags: ["motivation", "truth", "love", "believe"],
        isActive: true));

    data.add(QuoteModel(
        authorName: "Zig Ziglar",
        quote: "People Often Say That Motivation Doesn't Lost. Well Neither Does Bathing – That's Why We Recommend it Daily",
        tags: ["motivation", "truth", "value"],
        isActive: true));

    data.add(QuoteModel(
        authorName: "Kevin Hart",
        quote:
            "Everybody wants to be famous, but nobody wants to do the work. I live by that. You grind hard so you can play hard. At the end of the day, you put all the work in, and eventually it’ll pay off. It could be in a year, it could be in 30 years. Eventually, your hard work will pay off.",
        tags: ["motivation", "truth", "value"],
        isActive: true));

    data.add(QuoteModel(
        authorName: "John F. Kennedy",
        quote: "Life is never easy. There is work to be done and obligations to be met – obligations to truth, to justice, and to liberty.",
        tags: ["motivation", "truth", "value"],
        isActive: true));

    data.add(QuoteModel(
        authorName: "Humans",
        quote: "Sing like no one’s listening, love like you’ve never been hurt, dance like nobody’s watching, and live like it’s heaven on earth.",
        tags: ["motivation", "truth", "value"],
        isActive: true));

    data.add(QuoteModel(
        authorName: "Thomas A. Edison",
        quote: "Many of life’s failures are people who did not realize how close they were to success when they gave up.",
        tags: ["motivation", "truth", "value"],
        isActive: true));

    data.add(QuoteModel(
        authorName: "Albert Einstein",
        quote: "If you want to live a happy life, tie it to a goal, not to people or things.",
        tags: ["motivation", "truth", "value"],
        isActive: true));

    data.add(QuoteModel(
        authorName: "John Lennon", quote: "Life is what happens when you’re busy making other plans.", tags: ["motivation", "truth", "value"], isActive: true));

    data.add(QuoteModel(authorName: "Stephen King", quote: "Get busy living or get busy dying.", tags: ["motivation", "truth", "value"], isActive: true));

    data.add(QuoteModel(
        authorName: "Mae West", quote: "You only live once, but if you do it right, once is enough.", tags: ["motivation", "truth", "value"], isActive: true));

    return data;
  }
}
