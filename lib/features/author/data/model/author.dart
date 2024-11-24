class AuthorList {
  AuthorList({
    required this.count,
    required this.pageToken,
    required this.messages,
  });

  final int? count;
  final String? pageToken;
  final List<Message> messages;

  AuthorList copyWith({
    int? count,
    String? pageToken,
    List<Message>? messages,
  }) {
    return AuthorList(
      count: count ?? this.count,
      pageToken: pageToken ?? this.pageToken,
      messages: messages ?? this.messages,
    );
  }

  factory AuthorList.fromJson(Map<String, dynamic> json) {
    return AuthorList(
      count: json["count"],
      pageToken: json["pageToken"],
      messages: json["messages"] == null
          ? []
          : List<Message>.from(
              json["messages"]!.map((x) => Message.fromJson(x)),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
        "count": count,
        "pageToken": pageToken,
        "messages": messages.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$count, $pageToken, $messages, ";
  }
}

class Message {
  Message({
    required this.content,
    required this.updated,
    required this.id,
    required this.author,
    required this.isFavourite,
  });

  final String? content;
  final DateTime? updated;
  final int? id;
  final Author? author;
  bool? isFavourite;

  Message copyWith({
    String? content,
    DateTime? updated,
    int? id,
    Author? author,
    bool? isFavourite,
  }) {
    return Message(
      content: content ?? this.content,
      updated: updated ?? this.updated,
      id: id ?? this.id,
      author: author ?? this.author,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      content: json["content"],
      updated: DateTime.tryParse(json["updated"] ?? ""),
      id: json["id"],
      author: json["author"] == null ? null : Author.fromJson(json["author"]),
      isFavourite: json["isFavourite"],
    );
  }

  Map<String, dynamic> toJson() => {
        "content": content,
        "updated": updated?.toIso8601String(),
        "id": id,
        "author": author?.toJson(),
        "isFavourite": isFavourite,
      };

  @override
  String toString() {
    return "$content, $updated, $id, $author, $isFavourite";
  }
}

class Author {
  Author({
    required this.name,
    required this.photoUrl,
  });

  final String? name;
  final String? photoUrl;

  Author copyWith({
    String? name,
    String? photoUrl,
  }) {
    return Author(
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json["name"],
      photoUrl: json["photoUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "photoUrl": photoUrl,
      };

  @override
  String toString() {
    return "$name, $photoUrl, ";
  }
}
