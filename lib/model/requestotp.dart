// To parse this JSON data, do
//
//     final requestotp = requestotpFromJson(jsonString);

import 'dart:convert';

Requestotp requestotpFromJson(String str) => Requestotp.fromJson(json.decode(str));

String requestotpToJson(Requestotp data) => json.encode(data.toJson());

class Requestotp {
  Data data;

  Requestotp({
    required this.data,
  });

  factory Requestotp.fromJson(Map<String, dynamic> json) => Requestotp(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  String type;
  String id;
  String name;
  String username;
  String email;
  DateTime dateOfBirth;
  String phone;
  String gender;
  int countryId;
  String countryName;
  String address;
  bool isActive;
  int coinBalance;
  String customerCode;
  String referredUserName;
  bool isPremiumCustomer;
  bool isOnline;
  bool isProfilePreferencesCompleted;
  int profileCompletionPercentage;
  int isInstagramConnected;
  String preferredGender;
  int remainingSwipeLimit;
  DateTime resetSwipeLimitAt;
  int remainingSuperLikeLimit;
  DateTime resetSuperLikeLimitAt;
  int remainingFlashMessageLimit;
  DateTime resetFlashMessageLimitAt;
  int remainingBoostLimit;
  String currentLocation;
  String currentLatitude;
  String currentLongitude;
  int heightInCm;
  int relationshipStatusId;
  String relationshipStatusName;
  int religionId;
  String religionName;
  int drinkingHabitId;
  String drinkingHabitName;
  int smokingHabitId;
  String smokingHabitName;
  int sexualOrientationId;
  String sexualOrientationName;
  int educationalQualificationId;
  String educationalQualificationName;
  int nativeLanguageId;
  String nativeLanguageName;
  int occupationId;
  String occupationName;
  int emotionId;
  String emotionName;
  String emotionIcon;
  String emotionFallbackEmoji;
  String filterPassportModeLocation;
  String filterPassportModeLatitude;
  String filterPassportModeLongitude;
  bool isRealGiftsAccepted;
  bool isGenderRevealed;
  bool isHeightRevealed;
  bool isReligionRevealed;
  bool isDrinkingHabitRevealed;
  bool isSmokingHabitRevealed;
  bool isSexualOrientationRevealed;
  bool isEducationalQualificationRevealed;
  bool isPersonalityTraitsRevealed;
  bool isLifestyleActivitiesRevealed;
  bool isContactDiscoveryEnabled;
  bool isGhostModeEnabled;
  bool isDarkModeEnabled;
  bool isReceivingPushNotifications;
  bool isReceivingFlashMessages;
  bool isLastSeenEnabled;
  bool isOnlineStatusEnabled;
  bool isReadReceiptsEnabled;
  bool isProfileHiddenFromSearch;
  bool isProfileReported;
  bool isProfileStriked;
  bool isProfileBlacklisted;
  bool isAccountSuspended;
  int updatedBy;
  String updatedByName;
  DateTime createdAt;
  DateTime updatedAt;
  AuthStatus authStatus;
  String profilePhotoUrl;
  String square100ProfilePhotoUrl;
  String square300ProfilePhotoUrl;
  String square500ProfilePhotoUrl;
  int age;
  List<LifeStyleActivity> partnerExpectations;
  List<LifeStyleActivity> lifeStyleActivities;
  List<LifeStyleActivity> personalityTraits;
  List<Avatar> avatars;

  Data({
    required this.type,
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.dateOfBirth,
    required this.phone,
    required this.gender,
    required this.countryId,
    required this.countryName,
    required this.address,
    required this.isActive,
    required this.coinBalance,
    required this.customerCode,
    required this.referredUserName,
    required this.isPremiumCustomer,
    required this.isOnline,
    required this.isProfilePreferencesCompleted,
    required this.profileCompletionPercentage,
    required this.isInstagramConnected,
    required this.preferredGender,
    required this.remainingSwipeLimit,
    required this.resetSwipeLimitAt,
    required this.remainingSuperLikeLimit,
    required this.resetSuperLikeLimitAt,
    required this.remainingFlashMessageLimit,
    required this.resetFlashMessageLimitAt,
    required this.remainingBoostLimit,
    required this.currentLocation,
    required this.currentLatitude,
    required this.currentLongitude,
    required this.heightInCm,
    required this.relationshipStatusId,
    required this.relationshipStatusName,
    required this.religionId,
    required this.religionName,
    required this.drinkingHabitId,
    required this.drinkingHabitName,
    required this.smokingHabitId,
    required this.smokingHabitName,
    required this.sexualOrientationId,
    required this.sexualOrientationName,
    required this.educationalQualificationId,
    required this.educationalQualificationName,
    required this.nativeLanguageId,
    required this.nativeLanguageName,
    required this.occupationId,
    required this.occupationName,
    required this.emotionId,
    required this.emotionName,
    required this.emotionIcon,
    required this.emotionFallbackEmoji,
    required this.filterPassportModeLocation,
    required this.filterPassportModeLatitude,
    required this.filterPassportModeLongitude,
    required this.isRealGiftsAccepted,
    required this.isGenderRevealed,
    required this.isHeightRevealed,
    required this.isReligionRevealed,
    required this.isDrinkingHabitRevealed,
    required this.isSmokingHabitRevealed,
    required this.isSexualOrientationRevealed,
    required this.isEducationalQualificationRevealed,
    required this.isPersonalityTraitsRevealed,
    required this.isLifestyleActivitiesRevealed,
    required this.isContactDiscoveryEnabled,
    required this.isGhostModeEnabled,
    required this.isDarkModeEnabled,
    required this.isReceivingPushNotifications,
    required this.isReceivingFlashMessages,
    required this.isLastSeenEnabled,
    required this.isOnlineStatusEnabled,
    required this.isReadReceiptsEnabled,
    required this.isProfileHiddenFromSearch,
    required this.isProfileReported,
    required this.isProfileStriked,
    required this.isProfileBlacklisted,
    required this.isAccountSuspended,
    required this.updatedBy,
    required this.updatedByName,
    required this.createdAt,
    required this.updatedAt,
    required this.authStatus,
    required this.profilePhotoUrl,
    required this.square100ProfilePhotoUrl,
    required this.square300ProfilePhotoUrl,
    required this.square500ProfilePhotoUrl,
    required this.age,
    required this.partnerExpectations,
    required this.lifeStyleActivities,
    required this.personalityTraits,
    required this.avatars,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    type: json["type"],
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    phone: json["phone"],
    gender: json["gender"],
    countryId: json["country_id"],
    countryName: json["country_name"],
    address: json["address"],
    isActive: json["is_active"],
    coinBalance: json["coin_balance"],
    customerCode: json["customer_code"],
    referredUserName: json["referred_user_name"],
    isPremiumCustomer: json["is_premium_customer"],
    isOnline: json["is_online"],
    isProfilePreferencesCompleted: json["is_profile_preferences_completed"],
    profileCompletionPercentage: json["profile_completion_percentage"],
    isInstagramConnected: json["is_instagram_connected"],
    preferredGender: json["preferred_gender"],
    remainingSwipeLimit: json["remaining_swipe_limit"],
    resetSwipeLimitAt: DateTime.parse(json["reset_swipe_limit_at"]),
    remainingSuperLikeLimit: json["remaining_super_like_limit"],
    resetSuperLikeLimitAt: DateTime.parse(json["reset_super_like_limit_at"]),
    remainingFlashMessageLimit: json["remaining_flash_message_limit"],
    resetFlashMessageLimitAt: DateTime.parse(json["reset_flash_message_limit_at"]),
    remainingBoostLimit: json["remaining_boost_limit"],
    currentLocation: json["current_location"],
    currentLatitude: json["current_latitude"],
    currentLongitude: json["current_longitude"],
    heightInCm: json["height_in_cm"],
    relationshipStatusId: json["relationship_status_id"],
    relationshipStatusName: json["relationship_status_name"],
    religionId: json["religion_id"],
    religionName: json["religion_name"],
    drinkingHabitId: json["drinking_habit_id"],
    drinkingHabitName: json["drinking_habit_name"],
    smokingHabitId: json["smoking_habit_id"],
    smokingHabitName: json["smoking_habit_name"],
    sexualOrientationId: json["sexual_orientation_id"],
    sexualOrientationName: json["sexual_orientation_name"],
    educationalQualificationId: json["educational_qualification_id"],
    educationalQualificationName: json["educational_qualification_name"],
    nativeLanguageId: json["native_language_id"],
    nativeLanguageName: json["native_language_name"],
    occupationId: json["occupation_id"],
    occupationName: json["occupation_name"],
    emotionId: json["emotion_id"],
    emotionName: json["emotion_name"],
    emotionIcon: json["emotion_icon"],
    emotionFallbackEmoji: json["emotion_fallback_emoji"],
    filterPassportModeLocation: json["filter_passport_mode_location"],
    filterPassportModeLatitude: json["filter_passport_mode_latitude"],
    filterPassportModeLongitude: json["filter_passport_mode_longitude"],
    isRealGiftsAccepted: json["is_real_gifts_accepted"],
    isGenderRevealed: json["is_gender_revealed"],
    isHeightRevealed: json["is_height_revealed"],
    isReligionRevealed: json["is_religion_revealed"],
    isDrinkingHabitRevealed: json["is_drinking_habit_revealed"],
    isSmokingHabitRevealed: json["is_smoking_habit_revealed"],
    isSexualOrientationRevealed: json["is_sexual_orientation_revealed"],
    isEducationalQualificationRevealed: json["is_educational_qualification_revealed"],
    isPersonalityTraitsRevealed: json["is_personality_traits_revealed"],
    isLifestyleActivitiesRevealed: json["is_lifestyle_activities_revealed"],
    isContactDiscoveryEnabled: json["is_contact_discovery_enabled"],
    isGhostModeEnabled: json["is_ghost_mode_enabled"],
    isDarkModeEnabled: json["is_dark_mode_enabled"],
    isReceivingPushNotifications: json["is_receiving_push_notifications"],
    isReceivingFlashMessages: json["is_receiving_flash_messages"],
    isLastSeenEnabled: json["is_last_seen_enabled"],
    isOnlineStatusEnabled: json["is_online_status_enabled"],
    isReadReceiptsEnabled: json["is_read_receipts_enabled"],
    isProfileHiddenFromSearch: json["is_profile_hidden_from_search"],
    isProfileReported: json["is_profile_reported"],
    isProfileStriked: json["is_profile_striked"],
    isProfileBlacklisted: json["is_profile_blacklisted"],
    isAccountSuspended: json["is_account_suspended"],
    updatedBy: json["updated_by"],
    updatedByName: json["updated_by_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    authStatus: AuthStatus.fromJson(json["auth_status"]),
    profilePhotoUrl: json["profile_photo_url"],
    square100ProfilePhotoUrl: json["square100_profile_photo_url"],
    square300ProfilePhotoUrl: json["square300_profile_photo_url"],
    square500ProfilePhotoUrl: json["square500_profile_photo_url"],
    age: json["age"],
    partnerExpectations: List<LifeStyleActivity>.from(json["partnerExpectations"].map((x) => LifeStyleActivity.fromJson(x))),
    lifeStyleActivities: List<LifeStyleActivity>.from(json["lifeStyleActivities"].map((x) => LifeStyleActivity.fromJson(x))),
    personalityTraits: List<LifeStyleActivity>.from(json["personalityTraits"].map((x) => LifeStyleActivity.fromJson(x))),
    avatars: List<Avatar>.from(json["avatars"].map((x) => Avatar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "phone": phone,
    "gender": gender,
    "country_id": countryId,
    "country_name": countryName,
    "address": address,
    "is_active": isActive,
    "coin_balance": coinBalance,
    "customer_code": customerCode,
    "referred_user_name": referredUserName,
    "is_premium_customer": isPremiumCustomer,
    "is_online": isOnline,
    "is_profile_preferences_completed": isProfilePreferencesCompleted,
    "profile_completion_percentage": profileCompletionPercentage,
    "is_instagram_connected": isInstagramConnected,
    "preferred_gender": preferredGender,
    "remaining_swipe_limit": remainingSwipeLimit,
    "reset_swipe_limit_at": resetSwipeLimitAt.toIso8601String(),
    "remaining_super_like_limit": remainingSuperLikeLimit,
    "reset_super_like_limit_at": resetSuperLikeLimitAt.toIso8601String(),
    "remaining_flash_message_limit": remainingFlashMessageLimit,
    "reset_flash_message_limit_at": resetFlashMessageLimitAt.toIso8601String(),
    "remaining_boost_limit": remainingBoostLimit,
    "current_location": currentLocation,
    "current_latitude": currentLatitude,
    "current_longitude": currentLongitude,
    "height_in_cm": heightInCm,
    "relationship_status_id": relationshipStatusId,
    "relationship_status_name": relationshipStatusName,
    "religion_id": religionId,
    "religion_name": religionName,
    "drinking_habit_id": drinkingHabitId,
    "drinking_habit_name": drinkingHabitName,
    "smoking_habit_id": smokingHabitId,
    "smoking_habit_name": smokingHabitName,
    "sexual_orientation_id": sexualOrientationId,
    "sexual_orientation_name": sexualOrientationName,
    "educational_qualification_id": educationalQualificationId,
    "educational_qualification_name": educationalQualificationName,
    "native_language_id": nativeLanguageId,
    "native_language_name": nativeLanguageName,
    "occupation_id": occupationId,
    "occupation_name": occupationName,
    "emotion_id": emotionId,
    "emotion_name": emotionName,
    "emotion_icon": emotionIcon,
    "emotion_fallback_emoji": emotionFallbackEmoji,
    "filter_passport_mode_location": filterPassportModeLocation,
    "filter_passport_mode_latitude": filterPassportModeLatitude,
    "filter_passport_mode_longitude": filterPassportModeLongitude,
    "is_real_gifts_accepted": isRealGiftsAccepted,
    "is_gender_revealed": isGenderRevealed,
    "is_height_revealed": isHeightRevealed,
    "is_religion_revealed": isReligionRevealed,
    "is_drinking_habit_revealed": isDrinkingHabitRevealed,
    "is_smoking_habit_revealed": isSmokingHabitRevealed,
    "is_sexual_orientation_revealed": isSexualOrientationRevealed,
    "is_educational_qualification_revealed": isEducationalQualificationRevealed,
    "is_personality_traits_revealed": isPersonalityTraitsRevealed,
    "is_lifestyle_activities_revealed": isLifestyleActivitiesRevealed,
    "is_contact_discovery_enabled": isContactDiscoveryEnabled,
    "is_ghost_mode_enabled": isGhostModeEnabled,
    "is_dark_mode_enabled": isDarkModeEnabled,
    "is_receiving_push_notifications": isReceivingPushNotifications,
    "is_receiving_flash_messages": isReceivingFlashMessages,
    "is_last_seen_enabled": isLastSeenEnabled,
    "is_online_status_enabled": isOnlineStatusEnabled,
    "is_read_receipts_enabled": isReadReceiptsEnabled,
    "is_profile_hidden_from_search": isProfileHiddenFromSearch,
    "is_profile_reported": isProfileReported,
    "is_profile_striked": isProfileStriked,
    "is_profile_blacklisted": isProfileBlacklisted,
    "is_account_suspended": isAccountSuspended,
    "updated_by": updatedBy,
    "updated_by_name": updatedByName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "auth_status": authStatus.toJson(),
    "profile_photo_url": profilePhotoUrl,
    "square100_profile_photo_url": square100ProfilePhotoUrl,
    "square300_profile_photo_url": square300ProfilePhotoUrl,
    "square500_profile_photo_url": square500ProfilePhotoUrl,
    "age": age,
    "partnerExpectations": List<dynamic>.from(partnerExpectations.map((x) => x.toJson())),
    "lifeStyleActivities": List<dynamic>.from(lifeStyleActivities.map((x) => x.toJson())),
    "personalityTraits": List<dynamic>.from(personalityTraits.map((x) => x.toJson())),
    "avatars": List<dynamic>.from(avatars.map((x) => x.toJson())),
  };
}

class AuthStatus {
  String accessToken;
  String tokenType;
  bool is2FaConfiguredByUser;
  bool is2FaVerifiedByUser;
  bool isEmailVerificationRequired;

  AuthStatus({
    required this.accessToken,
    required this.tokenType,
    required this.is2FaConfiguredByUser,
    required this.is2FaVerifiedByUser,
    required this.isEmailVerificationRequired,
  });

  factory AuthStatus.fromJson(Map<String, dynamic> json) => AuthStatus(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    is2FaConfiguredByUser: json["is_2fa_configured_by_user"],
    is2FaVerifiedByUser: json["is_2fa_verified_by_user"],
    isEmailVerificationRequired: json["is_email_verification_required"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "is_2fa_configured_by_user": is2FaConfiguredByUser,
    "is_2fa_verified_by_user": is2FaVerifiedByUser,
    "is_email_verification_required": isEmailVerificationRequired,
  };
}

class Avatar {
  String type;
  String id;
  int userId;
  bool isActive;
  DateTime approvedAt;
  int approvedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String imageUrl;
  String square100ImageUrl;
  String square300ImageUrl;
  String square500ImageUrl;

  Avatar({
    required this.type,
    required this.id,
    required this.userId,
    required this.isActive,
    required this.approvedAt,
    required this.approvedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
    required this.square100ImageUrl,
    required this.square300ImageUrl,
    required this.square500ImageUrl,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
    type: json["type"],
    id: json["id"],
    userId: json["user_id"],
    isActive: json["is_active"],
    approvedAt: DateTime.parse(json["approved_at"]),
    approvedBy: json["approved_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    imageUrl: json["image_url"],
    square100ImageUrl: json["square100_image_url"],
    square300ImageUrl: json["square300_image_url"],
    square500ImageUrl: json["square500_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "user_id": userId,
    "is_active": isActive,
    "approved_at": approvedAt.toIso8601String(),
    "approved_by": approvedBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image_url": imageUrl,
    "square100_image_url": square100ImageUrl,
    "square300_image_url": square300ImageUrl,
    "square500_image_url": square500ImageUrl,
  };
}

class LifeStyleActivity {
  String type;
  String id;
  String name;
  String? icon;
  int traitTypeId;
  int createdBy;
  int updatedBy;
  int laravelThroughKey;
  String? iconUrl;

  LifeStyleActivity({
    required this.type,
    required this.id,
    required this.name,
    this.icon,
    required this.traitTypeId,
    required this.createdBy,
    required this.updatedBy,
    required this.laravelThroughKey,
    this.iconUrl,
  });

  factory LifeStyleActivity.fromJson(Map<String, dynamic> json) => LifeStyleActivity(
    type: json["type"],
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    traitTypeId: json["trait_type_id"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    laravelThroughKey: json["laravel_through_key"],
    iconUrl: json["icon_url"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "name": name,
    "icon": icon,
    "trait_type_id": traitTypeId,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "laravel_through_key": laravelThroughKey,
    "icon_url": iconUrl,
  };
}
