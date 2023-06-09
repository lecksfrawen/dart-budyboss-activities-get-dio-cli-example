// import 'package:cli/cli.dart' as cli;

// void main(List<String> arguments) {
//   print('Hello world: ${cli.calculate()}!');
// }
import 'package:cli/cli.dart' as cli;
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:developer' as developer;

/// More examples see https://github.com/cfug/dio/blob/main/example
void main() async {
  final dio = Dio();
  final response =
      await dio.get('https://civicum.net/wp-json/buddyboss/v1/activity');
  print(response.data);

  var something = jsonEncode(response.data);
  final activitiesList = activitiesFromJson(something);
  print(activitiesList);
  print(activitiesList.runtimeType.toString());
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

List<Activities> activitiesFromJson(String str) =>
    List<Activities>.from(json.decode(str).map((x) => Activities.fromJson(x)));

String activitiesToJson(List<Activities> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Activities {
  int userId;
  Name name;
  String component;
  Content content;
  DateTime date;
  int id;
  String link;
  int primaryItemId;
  int secondaryItemId;
  Status status;
  String title;
  String type;
  bool favorited;
  bool canFavorite;
  int favoriteCount;
  bool canComment;
  bool canEdit;
  bool canDelete;
  ContentStripped contentStripped;
  Privacy privacy;
  ActivityData activityData;
  String featureMedia;
  String previewData;
  int commentCount;
  UserAvatar userAvatar;
  bool canReport;
  bool reported;
  dynamic reportButtonText;
  dynamic reportType;
  dynamic bpMediaIds;
  dynamic mediaGif;
  bool commentUploadMedia;
  bool commentUploadGif;
  bool commentUploadEmoji;
  dynamic bpVideos;
  bool commentUploadVideo;
  dynamic bpDocuments;
  bool commentUploadDocument;
  Links links;

  Activities({
    required this.userId,
    required this.name,
    required this.component,
    required this.content,
    required this.date,
    required this.id,
    required this.link,
    required this.primaryItemId,
    required this.secondaryItemId,
    required this.status,
    required this.title,
    required this.type,
    required this.favorited,
    required this.canFavorite,
    required this.favoriteCount,
    required this.canComment,
    required this.canEdit,
    required this.canDelete,
    required this.contentStripped,
    required this.privacy,
    required this.activityData,
    required this.featureMedia,
    required this.previewData,
    required this.commentCount,
    required this.userAvatar,
    required this.canReport,
    required this.reported,
    required this.reportButtonText,
    required this.reportType,
    this.bpMediaIds,
    this.mediaGif,
    required this.commentUploadMedia,
    required this.commentUploadGif,
    required this.commentUploadEmoji,
    this.bpVideos,
    required this.commentUploadVideo,
    this.bpDocuments,
    required this.commentUploadDocument,
    required this.links,
  });

  factory Activities.fromJson(Map<String, dynamic> json) => Activities(
        userId: json["user_id"],
        name: nameValues.map[json["name"]]!,
        component: json["component"],
        content: Content.fromJson(json["content"]),
        date: DateTime.parse(json["date"]),
        id: json["id"],
        link: json["link"],
        primaryItemId: json["primary_item_id"],
        secondaryItemId: json["secondary_item_id"],
        status: statusValues.map[json["status"]]!,
        title: json["title"],
        type: json["type"],
        favorited: json["favorited"],
        canFavorite: json["can_favorite"],
        favoriteCount: json["favorite_count"],
        canComment: json["can_comment"],
        canEdit: json["can_edit"],
        canDelete: json["can_delete"],
        contentStripped: contentStrippedValues.map[json["content_stripped"]]!,
        privacy: privacyValues.map[json["privacy"]]!,
        activityData: ActivityData.fromJson(json["activity_data"]),
        featureMedia: json["feature_media"],
        previewData: json["preview_data"],
        commentCount: json["comment_count"],
        userAvatar: UserAvatar.fromJson(json["user_avatar"]),
        canReport: json["can_report"],
        reported: json["reported"],
        reportButtonText: json["report_button_text"],
        reportType: json["report_type"],
        bpMediaIds: json["bp_media_ids"],
        mediaGif: json["media_gif"],
        commentUploadMedia: json["comment_upload_media"],
        commentUploadGif: json["comment_upload_gif"],
        commentUploadEmoji: json["comment_upload_emoji"],
        bpVideos: json["bp_videos"],
        commentUploadVideo: json["comment_upload_video"],
        bpDocuments: json["bp_documents"],
        commentUploadDocument: json["comment_upload_document"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": nameValues.reverse[name],
        "component": component,
        "content": content.toJson(),
        "date": date.toIso8601String(),
        "id": id,
        "link": link,
        "primary_item_id": primaryItemId,
        "secondary_item_id": secondaryItemId,
        "status": statusValues.reverse[status],
        "title": title,
        "type": type,
        "favorited": favorited,
        "can_favorite": canFavorite,
        "favorite_count": favoriteCount,
        "can_comment": canComment,
        "can_edit": canEdit,
        "can_delete": canDelete,
        "content_stripped": contentStrippedValues.reverse[contentStripped],
        "privacy": privacyValues.reverse[privacy],
        "activity_data": activityData.toJson(),
        "feature_media": featureMedia,
        "preview_data": previewData,
        "comment_count": commentCount,
        "user_avatar": userAvatar.toJson(),
        "can_report": canReport,
        "reported": reported,
        "report_button_text": reportButtonText,
        "report_type": reportType,
        "bp_media_ids": bpMediaIds,
        "media_gif": mediaGif,
        "comment_upload_media": commentUploadMedia,
        "comment_upload_gif": commentUploadGif,
        "comment_upload_emoji": commentUploadEmoji,
        "bp_videos": bpVideos,
        "comment_upload_video": commentUploadVideo,
        "bp_documents": bpDocuments,
        "comment_upload_document": commentUploadDocument,
        "_links": links.toJson(),
      };
}

class ActivityData {
  bool canEditPrivacy;
  int albumId;
  int groupId;
  GroupName groupName;
  int folderId;
  String groupAvatar;
  String linkImageIndexSave;
  bool profileVideo;
  bool groupVideo;
  bool profileMedia;
  bool groupMedia;
  bool profileDocument;
  bool groupDocument;

  ActivityData({
    required this.canEditPrivacy,
    required this.albumId,
    required this.groupId,
    required this.groupName,
    required this.folderId,
    required this.groupAvatar,
    required this.linkImageIndexSave,
    required this.profileVideo,
    required this.groupVideo,
    required this.profileMedia,
    required this.groupMedia,
    required this.profileDocument,
    required this.groupDocument,
  });

  factory ActivityData.fromJson(Map<String, dynamic> json) => ActivityData(
        canEditPrivacy: json["can_edit_privacy"],
        albumId: json["album_id"],
        groupId: json["group_id"],
        groupName: groupNameValues.map[json["group_name"]]!,
        folderId: json["folder_id"],
        groupAvatar: json["group_avatar"],
        linkImageIndexSave: json["link_image_index_save"],
        profileVideo: json["profile_video"],
        groupVideo: json["group_video"],
        profileMedia: json["profile_media"],
        groupMedia: json["group_media"],
        profileDocument: json["profile_document"],
        groupDocument: json["group_document"],
      );

  Map<String, dynamic> toJson() => {
        "can_edit_privacy": canEditPrivacy,
        "album_id": albumId,
        "group_id": groupId,
        "group_name": groupNameValues.reverse[groupName],
        "folder_id": folderId,
        "group_avatar": groupAvatar,
        "link_image_index_save": linkImageIndexSave,
        "profile_video": profileVideo,
        "group_video": groupVideo,
        "profile_media": profileMedia,
        "group_media": groupMedia,
        "profile_document": profileDocument,
        "group_document": groupDocument,
      };
}

enum GroupName { EMPTY, GRUPO_DE_INTRODUCCIN_A_CIVICUM }

final groupNameValues = EnumValues({
  "": GroupName.EMPTY,
  "Grupo de Introducción a Civicum": GroupName.GRUPO_DE_INTRODUCCIN_A_CIVICUM
});

class Content {
  Rendered rendered;

  Content({
    required this.rendered,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: renderedValues.map[json["rendered"]]!,
      );

  Map<String, dynamic> toJson() => {
        "rendered": renderedValues.reverse[rendered],
      };
}

enum Rendered { EMPTY, P_TEST_P }

final renderedValues =
    EnumValues({"": Rendered.EMPTY, "<p>test</p>\n": Rendered.P_TEST_P});

enum ContentStripped { EMPTY, TEST }

final contentStrippedValues =
    EnumValues({"": ContentStripped.EMPTY, "test": ContentStripped.TEST});

class Links {
  List<Collection> self;
  List<Collection> collection;
  List<User> user;
  List<Collection> favorite;
  List<User>? group;

  Links({
    required this.self,
    required this.collection,
    required this.user,
    required this.favorite,
    this.group,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromJson(x))),
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
        favorite: List<Collection>.from(
            json["favorite"].map((x) => Collection.fromJson(x))),
        group: json["group"] == null
            ? []
            : List<User>.from(json["group"]!.map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
        "favorite": List<dynamic>.from(favorite.map((x) => x.toJson())),
        "group": group == null
            ? []
            : List<dynamic>.from(group!.map((x) => x.toJson())),
      };
}

class Collection {
  String href;

  Collection({
    required this.href,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class User {
  bool embeddable;
  String href;

  User({
    required this.embeddable,
    required this.href,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

enum Name { IKER, DEV_BOT, GEOVANNY }

final nameValues = EnumValues(
    {"Dev.Bot": Name.DEV_BOT, "Geovanny": Name.GEOVANNY, "Iker": Name.IKER});

enum Privacy { PUBLIC }

final privacyValues = EnumValues({"public": Privacy.PUBLIC});

enum Status { PUBLISHED }

final statusValues = EnumValues({"published": Status.PUBLISHED});

class UserAvatar {
  String full;
  String thumb;

  UserAvatar({
    required this.full,
    required this.thumb,
  });

  factory UserAvatar.fromJson(Map<String, dynamic> json) => UserAvatar(
        full: json["full"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "full": full,
        "thumb": thumb,
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
