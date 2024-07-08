

import 'dart:convert';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

String quoteToJson(Quote data) => json.encode(data.toJson());

class Quote {
    final DateTime qotdDate;
    final QuoteClass quote;

    Quote({
        required this.qotdDate,
        required this.quote,
    });

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        qotdDate: DateTime.parse(json["qotd_date"]),
        quote: QuoteClass.fromJson(json["quote"]),
    );

    Map<String, dynamic> toJson() => {
        "qotd_date": qotdDate.toIso8601String(),
        "quote": quote.toJson(),
    };
}

class QuoteClass {
    final int id;
    final bool dialogue;
    final bool private;
    final List<String> tags;
    final String url;
    final int favoritesCount;
    final int upvotesCount;
    final int downvotesCount;
    final String author;
    final String authorPermalink;
    final String body;

    QuoteClass({
        required this.id,
        required this.dialogue,
        required this.private,
        required this.tags,
        required this.url,
        required this.favoritesCount,
        required this.upvotesCount,
        required this.downvotesCount,
        required this.author,
        required this.authorPermalink,
        required this.body,
    });

    factory QuoteClass.fromJson(Map<String, dynamic> json) => QuoteClass(
        id: json["id"],
        dialogue: json["dialogue"],
        private: json["private"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        url: json["url"],
        favoritesCount: json["favorites_count"],
        upvotesCount: json["upvotes_count"],
        downvotesCount: json["downvotes_count"],
        author: json["author"],
        authorPermalink: json["author_permalink"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dialogue": dialogue,
        "private": private,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "url": url,
        "favorites_count": favoritesCount,
        "upvotes_count": upvotesCount,
        "downvotes_count": downvotesCount,
        "author": author,
        "author_permalink": authorPermalink,
        "body": body,
    };
}
