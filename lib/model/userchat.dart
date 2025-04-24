// To parse this JSON data, do
//
//     final userchat = userchatFromJson(jsonString);

import 'dart:convert';

Userchat userchatFromJson(String str) => Userchat.fromJson(json.decode(str));

String userchatToJson(Userchat data) => json.encode(data.toJson());

class Userchat {
  List<Datum> data;
  Meta meta;
  Links links;

  Userchat({
    required this.data,
    required this.meta,
    required this.links,
  });

  factory Userchat.fromJson(Map<String, dynamic> json) => Userchat(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
    "links": links.toJson(),
  };
}

class Datum {
  DatumType type;
  String id;
  int chatThreadId;
  int chatMessageTypeId;
  int senderId;
  int receiverId;
  bool isOneTimeView;
  bool isOnVanishMode;
  DateTime sentAt;
  DateTime deliveredAt;
  int? stickerId;
  DateTime createdAt;
  DateTime updatedAt;
  Sender sender;
  Sticker? sticker;
  int? senderCoinTransactionId;
  int? receiverCoinTransactionId;
  int? transferCoins;
  MediaMeta? mediaMeta;
  String? mediaUrl;
  String? message;

  Datum({
    required this.type,
    required this.id,
    required this.chatThreadId,
    required this.chatMessageTypeId,
    required this.senderId,
    required this.receiverId,
    required this.isOneTimeView,
    required this.isOnVanishMode,
    required this.sentAt,
    required this.deliveredAt,
    this.stickerId,
    required this.createdAt,
    required this.updatedAt,
    required this.sender,
    this.sticker,
    this.senderCoinTransactionId,
    this.receiverCoinTransactionId,
    this.transferCoins,
    this.mediaMeta,
    this.mediaUrl,
    this.message,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    type: datumTypeValues.map[json["type"]]!,
    id: json["id"],
    chatThreadId: json["chat_thread_id"],
    chatMessageTypeId: json["chat_message_type_id"],
    senderId: json["sender_id"],
    receiverId: json["receiver_id"],
    isOneTimeView: json["is_one_time_view"],
    isOnVanishMode: json["is_on_vanish_mode"],
    sentAt: DateTime.parse(json["sent_at"]),
    deliveredAt: DateTime.parse(json["delivered_at"]),
    stickerId: json["sticker_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    sender: Sender.fromJson(json["sender"]),
    sticker: json["sticker"] == null ? null : Sticker.fromJson(json["sticker"]),
    senderCoinTransactionId: json["sender_coin_transaction_id"],
    receiverCoinTransactionId: json["receiver_coin_transaction_id"],
    transferCoins: json["transfer_coins"],
    mediaMeta: json["media_meta"] == null ? null : MediaMeta.fromJson(json["media_meta"]),
    mediaUrl: json["media_url"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "type": datumTypeValues.reverse[type],
    "id": id,
    "chat_thread_id": chatThreadId,
    "chat_message_type_id": chatMessageTypeId,
    "sender_id": senderId,
    "receiver_id": receiverId,
    "is_one_time_view": isOneTimeView,
    "is_on_vanish_mode": isOnVanishMode,
    "sent_at": sentAt.toIso8601String(),
    "delivered_at": deliveredAt.toIso8601String(),
    "sticker_id": stickerId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "sender": sender.toJson(),
    "sticker": sticker?.toJson(),
    "sender_coin_transaction_id": senderCoinTransactionId,
    "receiver_coin_transaction_id": receiverCoinTransactionId,
    "transfer_coins": transferCoins,
    "media_meta": mediaMeta?.toJson(),
    "media_url": mediaUrl,
    "message": message,
  };
}

class MediaMeta {
  int? fileSize;
  String mimeType;
  dynamic imageData;
  dynamic message;

  MediaMeta({
    required this.fileSize,
    required this.mimeType,
    this.imageData,
    this.message,
  });

  factory MediaMeta.fromJson(Map<String, dynamic> json) => MediaMeta(
    fileSize: json["file_size"],
    mimeType: json["mime_type"],
    imageData: json["image_data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "file_size": fileSize,
    "mime_type": mimeType,
    "image_data": imageData,
    "message": message,
  };
}

class Sender {
  SenderType type;
  String id;
  Name name;
  Email username;
  Email email;
  String profilePhotoUrl;
  String square100ProfilePhotoUrl;
  String square300ProfilePhotoUrl;
  String square500ProfilePhotoUrl;

  Sender({
    required this.type,
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.profilePhotoUrl,
    required this.square100ProfilePhotoUrl,
    required this.square300ProfilePhotoUrl,
    required this.square500ProfilePhotoUrl,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
    type: senderTypeValues.map[json["type"]]!,
    id: json["id"],
    name: nameValues.map[json["name"]]!,
    username: emailValues.map[json["username"]]!,
    email: emailValues.map[json["email"]]!,
    profilePhotoUrl: json["profile_photo_url"],
    square100ProfilePhotoUrl: json["square100_profile_photo_url"],
    square300ProfilePhotoUrl: json["square300_profile_photo_url"],
    square500ProfilePhotoUrl: json["square500_profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "type": senderTypeValues.reverse[type],
    "id": id,
    "name": nameValues.reverse[name],
    "username": emailValues.reverse[username],
    "email": emailValues.reverse[email],
    "profile_photo_url": profilePhotoUrl,
    "square100_profile_photo_url": square100ProfilePhotoUrl,
    "square300_profile_photo_url": square300ProfilePhotoUrl,
    "square500_profile_photo_url": square500ProfilePhotoUrl,
  };
}

enum Email {
  AKHIL_LILAC_GMAIL_COM,
  AMRUTHA_GMAIL_COM
}

final emailValues = EnumValues({
  "akhil.lilac@gmail.com": Email.AKHIL_LILAC_GMAIL_COM,
  "amrutha@gmail.com": Email.AMRUTHA_GMAIL_COM
});

enum Name {
  AKHIL,
  AMRUTHA
}

final nameValues = EnumValues({
  "Akhil": Name.AKHIL,
  "amrutha": Name.AMRUTHA
});

enum SenderType {
  SENDER
}

final senderTypeValues = EnumValues({
  "sender": SenderType.SENDER
});

class Sticker {
  String type;
  String id;
  int categoryId;
  String stickerCode;
  String name;
  bool isSpecialSticker;
  int coins;
  bool isActive;
  int createdBy;
  int updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String imageUrl;

  Sticker({
    required this.type,
    required this.id,
    required this.categoryId,
    required this.stickerCode,
    required this.name,
    required this.isSpecialSticker,
    required this.coins,
    required this.isActive,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory Sticker.fromJson(Map<String, dynamic> json) => Sticker(
    type: json["type"],
    id: json["id"],
    categoryId: json["category_id"],
    stickerCode: json["sticker_code"],
    name: json["name"],
    isSpecialSticker: json["is_special_sticker"],
    coins: json["coins"],
    isActive: json["is_active"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "category_id": categoryId,
    "sticker_code": stickerCode,
    "name": name,
    "is_special_sticker": isSpecialSticker,
    "coins": coins,
    "is_active": isActive,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image_url": imageUrl,
  };
}

enum DatumType {
  CHAT_MESSAGES
}

final datumTypeValues = EnumValues({
  "chat_messages": DatumType.CHAT_MESSAGES
});

class Links {
  String self;
  String first;
  String next;
  String last;

  Links({
    required this.self,
    required this.first,
    required this.next,
    required this.last,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"],
    first: json["first"],
    next: json["next"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "first": first,
    "next": next,
    "last": last,
  };
}

class Meta {
  Pagination pagination;

  Meta({
    required this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;

  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
