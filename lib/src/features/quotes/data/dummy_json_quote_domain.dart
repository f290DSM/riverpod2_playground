import 'dart:convert';

class DummyJsonQuoteDomain {
  int id;
  String quote;
  String author;
  DummyJsonQuoteDomain({
    required this.id,
    required this.quote,
    required this.author,
  });

  DummyJsonQuoteDomain copyWith({
    int? id,
    String? quote,
    String? author,
  }) {
    return DummyJsonQuoteDomain(
      id: id ?? this.id,
      quote: quote ?? this.quote,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quote': quote,
      'author': author,
    };
  }

  factory DummyJsonQuoteDomain.fromMap(Map<String, dynamic> map) {
    return DummyJsonQuoteDomain(
      id: map['id']?.toInt() ?? 0,
      quote: map['quote'] ?? '',
      author: map['author'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DummyJsonQuoteDomain.fromJson(String source) => DummyJsonQuoteDomain.fromMap(json.decode(source));

  @override
  String toString() => 'DummyJsonQuoteDomain(id: $id, quote: $quote, author: $author)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DummyJsonQuoteDomain &&
      other.id == id &&
      other.quote == quote &&
      other.author == author;
  }

  @override
  int get hashCode => id.hashCode ^ quote.hashCode ^ author.hashCode;
}
