// To parse this JSON data, do
//
//     final messagelistm = messagelistmFromJson(jsonString);

import 'dart:convert';

Messagelistm messagelistmFromJson(String str) => Messagelistm.fromJson(json.decode(str));

String messagelistmToJson(Messagelistm data) => json.encode(data.toJson());

class Messagelistm {
  List<Datum> data;
  Meta meta;
  Links links;

  Messagelistm({
    required this.data,
    required this.meta,
    required this.links,
  });

  factory Messagelistm.fromJson(Map<String, dynamic> json) => Messagelistm(
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
  String type;
  String id;
  DateTime messageReceivedFromPartnerAt;
  int authUserId;
  String name;
  String username;
  String email;
  String phone;
  String gender;
  int? countryId;
  String? countryName;
  int? stateId;
  String? stateName;
  int? cityId;
  String? cityName;
  String? customCityName;
  bool isActive;
  String customerCode;
  bool isPremiumCustomer;
  bool isOnline;
  DateTime dateOfBirth;
  int nativeLanguageId;
  String nativeLanguageName;
  String profilePhotoUrl;
  String square100ProfilePhotoUrl;
  String square300ProfilePhotoUrl;
  String square500ProfilePhotoUrl;
  int age;
  String? bioIntroText;
  String? referralCode;

  Datum({
    required this.type,
    required this.id,
    required this.messageReceivedFromPartnerAt,
    required this.authUserId,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.gender,
    this.countryId,
    this.countryName,
    this.stateId,
    this.stateName,
    this.cityId,
    this.cityName,
    this.customCityName,
    required this.isActive,
    required this.customerCode,
    required this.isPremiumCustomer,
    required this.isOnline,
    required this.dateOfBirth,
    required this.nativeLanguageId,
    required this.nativeLanguageName,
    required this.profilePhotoUrl,
    required this.square100ProfilePhotoUrl,
    required this.square300ProfilePhotoUrl,
    required this.square500ProfilePhotoUrl,
    required this.age,
    this.bioIntroText,
    this.referralCode,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    type: json["type"],
    id: json["id"],
    messageReceivedFromPartnerAt: DateTime.parse(json["message_received_from_partner_at"]),
    authUserId: json["auth_user_id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    gender: json["gender"],
    countryId: json["country_id"],
    countryName: json["country_name"],
    stateId: json["state_id"],
    stateName: json["state_name"],
    cityId: json["city_id"],
    cityName: json["city_name"],
    customCityName: json["custom_city_name"],
    isActive: json["is_active"],
    customerCode: json["customer_code"],
    isPremiumCustomer: json["is_premium_customer"],
    isOnline: json["is_online"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    nativeLanguageId: json["native_language_id"],
    nativeLanguageName: json["native_language_name"],
    profilePhotoUrl: json["profile_photo_url"],
    square100ProfilePhotoUrl: json["square100_profile_photo_url"],
    square300ProfilePhotoUrl: json["square300_profile_photo_url"],
    square500ProfilePhotoUrl: json["square500_profile_photo_url"],
    age: json["age"],
    bioIntroText: json["bio_intro_text"],
    referralCode: json["referral_code"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "message_received_from_partner_at": messageReceivedFromPartnerAt.toIso8601String(),
    "auth_user_id": authUserId,
    "name": name,
    "username": username,
    "email": email,
    "phone": phone,
    "gender": gender,
    "country_id": countryId,
    "country_name": countryName,
    "state_id": stateId,
    "state_name": stateName,
    "city_id": cityId,
    "city_name": cityName,
    "custom_city_name": customCityName,
    "is_active": isActive,
    "customer_code": customerCode,
    "is_premium_customer": isPremiumCustomer,
    "is_online": isOnline,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "native_language_id": nativeLanguageId,
    "native_language_name": nativeLanguageName,
    "profile_photo_url": profilePhotoUrl,
    "square100_profile_photo_url": square100ProfilePhotoUrl,
    "square300_profile_photo_url": square300ProfilePhotoUrl,
    "square500_profile_photo_url": square500ProfilePhotoUrl,
    "age": age,
    "bio_intro_text": bioIntroText,
    "referral_code": referralCode,
  };
}

class Links {
  String self;
  String first;
  String last;

  Links({
    required this.self,
    required this.first,
    required this.last,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"],
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "first": first,
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
