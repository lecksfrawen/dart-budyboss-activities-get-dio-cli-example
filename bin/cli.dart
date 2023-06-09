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
  final response = await dio.get(
      'https://online-communities.demos.buddyboss.com/wp-json/buddyboss/v1/activity');
  print(response.data);

  var something = jsonEncode(response.data);
  final welcome = welcomeFromJson(something);
  print(welcome);
  print(welcome.runtimeType.toString());
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  int userId;
  String name;
  Component component;
  Content content;
  DateTime date;
  int id;
  String link;
  int primaryItemId;
  int secondaryItemId;
  Status status;
  String title;
  Type type;
  bool favorited;
  bool canFavorite;
  dynamic favoriteCount;
  bool canComment;
  bool canEdit;
  bool canDelete;
  String contentStripped;
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
  List<BpMediaId>? bpMediaIds;
  dynamic mediaGif;
  bool commentUploadMedia;
  bool commentUploadGif;
  bool commentUploadEmoji;
  List<BpVideo>? bpVideos;
  bool commentUploadVideo;
  List<BpDocument>? bpDocuments;
  bool commentUploadDocument;
  Links links;

  Welcome({
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

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        userId: json["user_id"],
        name: json["name"],
        component: componentValues.map[json["component"]]!,
        content: Content.fromJson(json["content"]),
        date: DateTime.parse(json["date"]),
        id: json["id"],
        link: json["link"],
        primaryItemId: json["primary_item_id"],
        secondaryItemId: json["secondary_item_id"],
        status: statusValues.map[json["status"]]!,
        title: json["title"],
        type: typeValues.map[json["type"]]!,
        favorited: json["favorited"],
        canFavorite: json["can_favorite"],
        favoriteCount: json["favorite_count"],
        canComment: json["can_comment"],
        canEdit: json["can_edit"],
        canDelete: json["can_delete"],
        contentStripped: json["content_stripped"],
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
        bpMediaIds: json["bp_media_ids"] == null
            ? []
            : List<BpMediaId>.from(
                json["bp_media_ids"]!.map((x) => BpMediaId.fromJson(x))),
        mediaGif: json["media_gif"],
        commentUploadMedia: json["comment_upload_media"],
        commentUploadGif: json["comment_upload_gif"],
        commentUploadEmoji: json["comment_upload_emoji"],
        bpVideos: json["bp_videos"] == null
            ? []
            : List<BpVideo>.from(
                json["bp_videos"]!.map((x) => BpVideo.fromJson(x))),
        commentUploadVideo: json["comment_upload_video"],
        bpDocuments: json["bp_documents"] == null
            ? []
            : List<BpDocument>.from(
                json["bp_documents"]!.map((x) => BpDocument.fromJson(x))),
        commentUploadDocument: json["comment_upload_document"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "component": componentValues.reverse[component],
        "content": content.toJson(),
        "date": date.toIso8601String(),
        "id": id,
        "link": link,
        "primary_item_id": primaryItemId,
        "secondary_item_id": secondaryItemId,
        "status": statusValues.reverse[status],
        "title": title,
        "type": typeValues.reverse[type],
        "favorited": favorited,
        "can_favorite": canFavorite,
        "favorite_count": favoriteCount,
        "can_comment": canComment,
        "can_edit": canEdit,
        "can_delete": canDelete,
        "content_stripped": contentStripped,
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
        "bp_media_ids": bpMediaIds == null
            ? []
            : List<dynamic>.from(bpMediaIds!.map((x) => x.toJson())),
        "media_gif": mediaGif,
        "comment_upload_media": commentUploadMedia,
        "comment_upload_gif": commentUploadGif,
        "comment_upload_emoji": commentUploadEmoji,
        "bp_videos": bpVideos == null
            ? []
            : List<dynamic>.from(bpVideos!.map((x) => x.toJson())),
        "comment_upload_video": commentUploadVideo,
        "bp_documents": bpDocuments == null
            ? []
            : List<dynamic>.from(bpDocuments!.map((x) => x.toJson())),
        "comment_upload_document": commentUploadDocument,
        "_links": links.toJson(),
      };
}

class ActivityData {
  bool canEditPrivacy;
  dynamic albumId;
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

enum GroupName { EMPTY, COFFEE_ADDICTS, GRAPHIC_DESIGN }

final groupNameValues = EnumValues({
  "Coffee Addicts": GroupName.COFFEE_ADDICTS,
  "": GroupName.EMPTY,
  "Graphic Design": GroupName.GRAPHIC_DESIGN
});

class BpDocument {
  int id;
  int blogId;
  int attachmentId;
  int userId;
  String title;
  String description;
  String type;
  int folderId;
  int groupId;
  int activityId;
  bool hideActivityActions;
  String privacy;
  int menuOrder;
  DateTime dateCreated;
  DateTime dateModified;
  GroupName groupName;
  String groupStatus;
  String visibility;
  int count;
  String downloadUrl;
  String extension;
  String extensionDescription;
  dynamic svgIcon;
  String filename;
  String size;
  String msgPreview;
  BpDocumentAttachmentData attachmentData;
  String userNicename;
  String userLogin;
  String displayName;
  BpDocumentUserPermissions userPermissions;
  bool canReport;
  String reportButtonText;
  String reportType;
  bool reported;
  Links links;

  BpDocument({
    required this.id,
    required this.blogId,
    required this.attachmentId,
    required this.userId,
    required this.title,
    required this.description,
    required this.type,
    required this.folderId,
    required this.groupId,
    required this.activityId,
    required this.hideActivityActions,
    required this.privacy,
    required this.menuOrder,
    required this.dateCreated,
    required this.dateModified,
    required this.groupName,
    required this.groupStatus,
    required this.visibility,
    required this.count,
    required this.downloadUrl,
    required this.extension,
    required this.extensionDescription,
    this.svgIcon,
    required this.filename,
    required this.size,
    required this.msgPreview,
    required this.attachmentData,
    required this.userNicename,
    required this.userLogin,
    required this.displayName,
    required this.userPermissions,
    required this.canReport,
    required this.reportButtonText,
    required this.reportType,
    required this.reported,
    required this.links,
  });

  factory BpDocument.fromJson(Map<String, dynamic> json) => BpDocument(
        id: json["id"],
        blogId: json["blog_id"],
        attachmentId: json["attachment_id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        type: json["type"],
        folderId: json["folder_id"],
        groupId: json["group_id"],
        activityId: json["activity_id"],
        hideActivityActions: json["hide_activity_actions"],
        privacy: json["privacy"],
        menuOrder: json["menu_order"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateModified: DateTime.parse(json["date_modified"]),
        groupName: groupNameValues.map[json["group_name"]]!,
        groupStatus: json["group_status"],
        visibility: json["visibility"],
        count: json["count"],
        downloadUrl: json["download_url"],
        extension: json["extension"],
        extensionDescription: json["extension_description"],
        svgIcon: json["svg_icon"],
        filename: json["filename"],
        size: json["size"],
        msgPreview: json["msg_preview"],
        attachmentData:
            BpDocumentAttachmentData.fromJson(json["attachment_data"]),
        userNicename: json["user_nicename"],
        userLogin: json["user_login"],
        displayName: json["display_name"],
        userPermissions:
            BpDocumentUserPermissions.fromJson(json["user_permissions"]),
        canReport: json["can_report"],
        reportButtonText: json["report_button_text"],
        reportType: json["report_type"],
        reported: json["reported"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "blog_id": blogId,
        "attachment_id": attachmentId,
        "user_id": userId,
        "title": title,
        "description": description,
        "type": type,
        "folder_id": folderId,
        "group_id": groupId,
        "activity_id": activityId,
        "hide_activity_actions": hideActivityActions,
        "privacy": privacy,
        "menu_order": menuOrder,
        "date_created": dateCreated.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "group_name": groupNameValues.reverse[groupName],
        "group_status": groupStatus,
        "visibility": visibility,
        "count": count,
        "download_url": downloadUrl,
        "extension": extension,
        "extension_description": extensionDescription,
        "svg_icon": svgIcon,
        "filename": filename,
        "size": size,
        "msg_preview": msgPreview,
        "attachment_data": attachmentData.toJson(),
        "user_nicename": userNicename,
        "user_login": userLogin,
        "display_name": displayName,
        "user_permissions": userPermissions.toJson(),
        "can_report": canReport,
        "report_button_text": reportButtonText,
        "report_type": reportType,
        "reported": reported,
        "_links": links.toJson(),
      };
}

class BpDocumentAttachmentData {
  String full;
  String thumb;
  String activityThumb;
  String activityThumbPdf;
  dynamic videoSymlink;
  dynamic meta;

  BpDocumentAttachmentData({
    required this.full,
    required this.thumb,
    required this.activityThumb,
    required this.activityThumbPdf,
    this.videoSymlink,
    required this.meta,
  });

  factory BpDocumentAttachmentData.fromJson(Map<String, dynamic> json) =>
      BpDocumentAttachmentData(
        full: json["full"],
        thumb: json["thumb"],
        activityThumb: json["activity_thumb"],
        activityThumbPdf: json["activity_thumb_pdf"],
        videoSymlink: json["video_symlink"],
        meta: json["meta"],
      );

  Map<String, dynamic> toJson() => {
        "full": full,
        "thumb": thumb,
        "activity_thumb": activityThumb,
        "activity_thumb_pdf": activityThumbPdf,
        "video_symlink": videoSymlink,
        "meta": meta,
      };
}

class MetaMeta {
  PurpleSizes sizes;

  MetaMeta({
    required this.sizes,
  });

  factory MetaMeta.fromJson(Map<String, dynamic> json) => MetaMeta(
        sizes: PurpleSizes.fromJson(json["sizes"]),
      );

  Map<String, dynamic> toJson() => {
        "sizes": sizes.toJson(),
      };
}

class PurpleSizes {
  BbMediaActivityImage full;
  BbMediaActivityImage medium;
  BbMediaActivityImage large;
  BbMediaActivityImage thumbnail;
  BbMediaActivityImage bbDocumentPdfPreviewActivityImage;
  BbMediaActivityImage bbDocumentPdfImagePopupImage;
  BbMediaActivityImage bbDocumentImagePreviewActivityImage;

  PurpleSizes({
    required this.full,
    required this.medium,
    required this.large,
    required this.thumbnail,
    required this.bbDocumentPdfPreviewActivityImage,
    required this.bbDocumentPdfImagePopupImage,
    required this.bbDocumentImagePreviewActivityImage,
  });

  factory PurpleSizes.fromJson(Map<String, dynamic> json) => PurpleSizes(
        full: BbMediaActivityImage.fromJson(json["full"]),
        medium: BbMediaActivityImage.fromJson(json["medium"]),
        large: BbMediaActivityImage.fromJson(json["large"]),
        thumbnail: BbMediaActivityImage.fromJson(json["thumbnail"]),
        bbDocumentPdfPreviewActivityImage: BbMediaActivityImage.fromJson(
            json["bb-document-pdf-preview-activity-image"]),
        bbDocumentPdfImagePopupImage: BbMediaActivityImage.fromJson(
            json["bb-document-pdf-image-popup-image"]),
        bbDocumentImagePreviewActivityImage: BbMediaActivityImage.fromJson(
            json["bb-document-image-preview-activity-image"]),
      );

  Map<String, dynamic> toJson() => {
        "full": full.toJson(),
        "medium": medium.toJson(),
        "large": large.toJson(),
        "thumbnail": thumbnail.toJson(),
        "bb-document-pdf-preview-activity-image":
            bbDocumentPdfPreviewActivityImage.toJson(),
        "bb-document-pdf-image-popup-image":
            bbDocumentPdfImagePopupImage.toJson(),
        "bb-document-image-preview-activity-image":
            bbDocumentImagePreviewActivityImage.toJson(),
      };
}

class BbMediaActivityImage {
  String file;
  int width;
  int height;
  MimeType mimeType;
  int? filesize;

  BbMediaActivityImage({
    required this.file,
    required this.width,
    required this.height,
    required this.mimeType,
    this.filesize,
  });

  factory BbMediaActivityImage.fromJson(Map<String, dynamic> json) =>
      BbMediaActivityImage(
        file: json["file"],
        width: json["width"],
        height: json["height"],
        mimeType: mimeTypeValues.map[json["mime-type"]]!,
        filesize: json["filesize"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
        "width": width,
        "height": height,
        "mime-type": mimeTypeValues.reverse[mimeType],
        "filesize": filesize,
      };
}

enum MimeType { IMAGE_JPEG, IMAGE_PNG }

final mimeTypeValues = EnumValues(
    {"image/jpeg": MimeType.IMAGE_JPEG, "image/png": MimeType.IMAGE_PNG});

class Links {
  List<Collection> self;
  List<Collection> collection;
  List<User> user;
  List<Collection>? favorite;
  List<User>? group;
  List<User>? activity;

  Links({
    required this.self,
    required this.collection,
    required this.user,
    this.favorite,
    this.group,
    this.activity,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromJson(x))),
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
        favorite: json["favorite"] == null
            ? []
            : List<Collection>.from(
                json["favorite"]!.map((x) => Collection.fromJson(x))),
        group: json["group"] == null
            ? []
            : List<User>.from(json["group"]!.map((x) => User.fromJson(x))),
        activity: json["activity"] == null
            ? []
            : List<User>.from(json["activity"]!.map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
        "favorite": favorite == null
            ? []
            : List<dynamic>.from(favorite!.map((x) => x.toJson())),
        "group": group == null
            ? []
            : List<dynamic>.from(group!.map((x) => x.toJson())),
        "activity": activity == null
            ? []
            : List<dynamic>.from(activity!.map((x) => x.toJson())),
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

class BpDocumentUserPermissions {
  int download;
  int copyDownloadLink;
  int editDescription;
  int move;
  int delete;

  BpDocumentUserPermissions({
    required this.download,
    required this.copyDownloadLink,
    required this.editDescription,
    required this.move,
    required this.delete,
  });

  factory BpDocumentUserPermissions.fromJson(Map<String, dynamic> json) =>
      BpDocumentUserPermissions(
        download: json["download"],
        copyDownloadLink: json["copy_download_link"],
        editDescription: json["edit_description"],
        move: json["move"],
        delete: json["delete"],
      );

  Map<String, dynamic> toJson() => {
        "download": download,
        "copy_download_link": copyDownloadLink,
        "edit_description": editDescription,
        "move": move,
        "delete": delete,
      };
}

class BpMediaId {
  int id;
  int blogId;
  int attachmentId;
  int userId;
  String title;
  String description;
  int albumId;
  int groupId;
  int activityId;
  bool hideActivityActions;
  String privacy;
  int menuOrder;
  DateTime dateCreated;
  BpMediaIdAttachmentData attachmentData;
  String groupName;
  String visibility;
  String userNicename;
  String userLogin;
  String displayName;
  String url;
  String downloadUrl;
  BpMediaIdUserPermissions userPermissions;
  String type;
  bool canReport;
  bool reported;
  String reportButtonText;
  String reportType;
  Links links;

  BpMediaId({
    required this.id,
    required this.blogId,
    required this.attachmentId,
    required this.userId,
    required this.title,
    required this.description,
    required this.albumId,
    required this.groupId,
    required this.activityId,
    required this.hideActivityActions,
    required this.privacy,
    required this.menuOrder,
    required this.dateCreated,
    required this.attachmentData,
    required this.groupName,
    required this.visibility,
    required this.userNicename,
    required this.userLogin,
    required this.displayName,
    required this.url,
    required this.downloadUrl,
    required this.userPermissions,
    required this.type,
    required this.canReport,
    required this.reported,
    required this.reportButtonText,
    required this.reportType,
    required this.links,
  });

  factory BpMediaId.fromJson(Map<String, dynamic> json) => BpMediaId(
        id: json["id"],
        blogId: json["blog_id"],
        attachmentId: json["attachment_id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        albumId: json["album_id"],
        groupId: json["group_id"],
        activityId: json["activity_id"],
        hideActivityActions: json["hide_activity_actions"],
        privacy: json["privacy"],
        menuOrder: json["menu_order"],
        dateCreated: DateTime.parse(json["date_created"]),
        attachmentData:
            BpMediaIdAttachmentData.fromJson(json["attachment_data"]),
        groupName: json["group_name"],
        visibility: json["visibility"],
        userNicename: json["user_nicename"],
        userLogin: json["user_login"],
        displayName: json["display_name"],
        url: json["url"],
        downloadUrl: json["download_url"],
        userPermissions:
            BpMediaIdUserPermissions.fromJson(json["user_permissions"]),
        type: json["type"],
        canReport: json["can_report"],
        reported: json["reported"],
        reportButtonText: json["report_button_text"],
        reportType: json["report_type"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "blog_id": blogId,
        "attachment_id": attachmentId,
        "user_id": userId,
        "title": title,
        "description": description,
        "album_id": albumId,
        "group_id": groupId,
        "activity_id": activityId,
        "hide_activity_actions": hideActivityActions,
        "privacy": privacy,
        "menu_order": menuOrder,
        "date_created": dateCreated.toIso8601String(),
        "attachment_data": attachmentData.toJson(),
        "group_name": groupName,
        "visibility": visibility,
        "user_nicename": userNicename,
        "user_login": userLogin,
        "display_name": displayName,
        "url": url,
        "download_url": downloadUrl,
        "user_permissions": userPermissions.toJson(),
        "type": type,
        "can_report": canReport,
        "reported": reported,
        "report_button_text": reportButtonText,
        "report_type": reportType,
        "_links": links.toJson(),
      };
}

class BpMediaIdAttachmentData {
  String full;
  String thumb;
  String mediaAlbumCover;
  String mediaPhotosDirectoryPage;
  String mediaTheatrePopup;
  String activityThumb;
  PurpleMeta meta;

  BpMediaIdAttachmentData({
    required this.full,
    required this.thumb,
    required this.mediaAlbumCover,
    required this.mediaPhotosDirectoryPage,
    required this.mediaTheatrePopup,
    required this.activityThumb,
    required this.meta,
  });

  factory BpMediaIdAttachmentData.fromJson(Map<String, dynamic> json) =>
      BpMediaIdAttachmentData(
        full: json["full"],
        thumb: json["thumb"],
        mediaAlbumCover: json["media_album_cover"],
        mediaPhotosDirectoryPage: json["media_photos_directory_page"],
        mediaTheatrePopup: json["media_theatre_popup"],
        activityThumb: json["activity_thumb"],
        meta: PurpleMeta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "full": full,
        "thumb": thumb,
        "media_album_cover": mediaAlbumCover,
        "media_photos_directory_page": mediaPhotosDirectoryPage,
        "media_theatre_popup": mediaTheatrePopup,
        "activity_thumb": activityThumb,
        "meta": meta.toJson(),
      };
}

class PurpleMeta {
  int width;
  int height;
  FluffySizes sizes;

  PurpleMeta({
    required this.width,
    required this.height,
    required this.sizes,
  });

  factory PurpleMeta.fromJson(Map<String, dynamic> json) => PurpleMeta(
        width: json["width"],
        height: json["height"],
        sizes: FluffySizes.fromJson(json["sizes"]),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "sizes": sizes.toJson(),
      };
}

class FluffySizes {
  BbMediaActivityImage bbMediaActivityImage;
  BbMediaActivityImage bbMediaPhotosAlbumDirectoryImage;
  BbMediaActivityImage bbMediaPhotosAlbumDirectoryImageMedium;

  FluffySizes({
    required this.bbMediaActivityImage,
    required this.bbMediaPhotosAlbumDirectoryImage,
    required this.bbMediaPhotosAlbumDirectoryImageMedium,
  });

  factory FluffySizes.fromJson(Map<String, dynamic> json) => FluffySizes(
        bbMediaActivityImage:
            BbMediaActivityImage.fromJson(json["bb-media-activity-image"]),
        bbMediaPhotosAlbumDirectoryImage: BbMediaActivityImage.fromJson(
            json["bb-media-photos-album-directory-image"]),
        bbMediaPhotosAlbumDirectoryImageMedium: BbMediaActivityImage.fromJson(
            json["bb-media-photos-album-directory-image-medium"]),
      );

  Map<String, dynamic> toJson() => {
        "bb-media-activity-image": bbMediaActivityImage.toJson(),
        "bb-media-photos-album-directory-image":
            bbMediaPhotosAlbumDirectoryImage.toJson(),
        "bb-media-photos-album-directory-image-medium":
            bbMediaPhotosAlbumDirectoryImageMedium.toJson(),
      };
}

class BpMediaIdUserPermissions {
  int download;
  int editPrivacy;
  int editPostPrivacy;
  int editAlbumPrivacy;
  int editDescription;
  int move;
  int delete;
  int? uploadPoster;

  BpMediaIdUserPermissions({
    required this.download,
    required this.editPrivacy,
    required this.editPostPrivacy,
    required this.editAlbumPrivacy,
    required this.editDescription,
    required this.move,
    required this.delete,
    this.uploadPoster,
  });

  factory BpMediaIdUserPermissions.fromJson(Map<String, dynamic> json) =>
      BpMediaIdUserPermissions(
        download: json["download"],
        editPrivacy: json["edit_privacy"],
        editPostPrivacy: json["edit_post_privacy"],
        editAlbumPrivacy: json["edit_album_privacy"],
        editDescription: json["edit_description"],
        move: json["move"],
        delete: json["delete"],
        uploadPoster: json["upload_poster"],
      );

  Map<String, dynamic> toJson() => {
        "download": download,
        "edit_privacy": editPrivacy,
        "edit_post_privacy": editPostPrivacy,
        "edit_album_privacy": editAlbumPrivacy,
        "edit_description": editDescription,
        "move": move,
        "delete": delete,
        "upload_poster": uploadPoster,
      };
}

class BpVideo {
  int id;
  int blogId;
  int attachmentId;
  int userId;
  String title;
  String description;
  int albumId;
  int groupId;
  int activityId;
  bool hideActivityActions;
  Privacy privacy;
  int menuOrder;
  DateTime dateCreated;
  BpVideoAttachmentData attachmentData;
  String groupName;
  String visibility;
  String userNicename;
  String userLogin;
  String displayName;
  String url;
  String downloadUrl;
  BpMediaIdUserPermissions userPermissions;
  String type;
  bool canReport;
  bool reported;
  String reportButtonText;
  String reportType;
  Links links;

  BpVideo({
    required this.id,
    required this.blogId,
    required this.attachmentId,
    required this.userId,
    required this.title,
    required this.description,
    required this.albumId,
    required this.groupId,
    required this.activityId,
    required this.hideActivityActions,
    required this.privacy,
    required this.menuOrder,
    required this.dateCreated,
    required this.attachmentData,
    required this.groupName,
    required this.visibility,
    required this.userNicename,
    required this.userLogin,
    required this.displayName,
    required this.url,
    required this.downloadUrl,
    required this.userPermissions,
    required this.type,
    required this.canReport,
    required this.reported,
    required this.reportButtonText,
    required this.reportType,
    required this.links,
  });

  factory BpVideo.fromJson(Map<String, dynamic> json) => BpVideo(
        id: json["id"],
        blogId: json["blog_id"],
        attachmentId: json["attachment_id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        albumId: json["album_id"],
        groupId: json["group_id"],
        activityId: json["activity_id"],
        hideActivityActions: json["hide_activity_actions"],
        privacy: privacyValues.map[json["privacy"]]!,
        menuOrder: json["menu_order"],
        dateCreated: DateTime.parse(json["date_created"]),
        attachmentData: BpVideoAttachmentData.fromJson(json["attachment_data"]),
        groupName: json["group_name"],
        visibility: json["visibility"],
        userNicename: json["user_nicename"],
        userLogin: json["user_login"],
        displayName: json["display_name"],
        url: json["url"],
        downloadUrl: json["download_url"],
        userPermissions:
            BpMediaIdUserPermissions.fromJson(json["user_permissions"]),
        type: json["type"],
        canReport: json["can_report"],
        reported: json["reported"],
        reportButtonText: json["report_button_text"],
        reportType: json["report_type"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "blog_id": blogId,
        "attachment_id": attachmentId,
        "user_id": userId,
        "title": title,
        "description": description,
        "album_id": albumId,
        "group_id": groupId,
        "activity_id": activityId,
        "hide_activity_actions": hideActivityActions,
        "privacy": privacyValues.reverse[privacy],
        "menu_order": menuOrder,
        "date_created": dateCreated.toIso8601String(),
        "attachment_data": attachmentData.toJson(),
        "group_name": groupName,
        "visibility": visibility,
        "user_nicename": userNicename,
        "user_login": userLogin,
        "display_name": displayName,
        "url": url,
        "download_url": downloadUrl,
        "user_permissions": userPermissions.toJson(),
        "type": type,
        "can_report": canReport,
        "reported": reported,
        "report_button_text": reportButtonText,
        "report_type": reportType,
        "_links": links.toJson(),
      };
}

class BpVideoAttachmentData {
  FluffyMeta meta;
  String full;
  String thumb;
  String activityThumb;
  ThumbMeta thumbMeta;
  String videoUserProfileThumb;
  String videoDirectoryPageThumb;
  String mediaAlbumCover;
  String videoAlbumCoverThumb;
  String videoAddThumbnailThumb;
  String videoPopupThumb;
  String videoActivityThumb;

  BpVideoAttachmentData({
    required this.meta,
    required this.full,
    required this.thumb,
    required this.activityThumb,
    required this.thumbMeta,
    required this.videoUserProfileThumb,
    required this.videoDirectoryPageThumb,
    required this.mediaAlbumCover,
    required this.videoAlbumCoverThumb,
    required this.videoAddThumbnailThumb,
    required this.videoPopupThumb,
    required this.videoActivityThumb,
  });

  factory BpVideoAttachmentData.fromJson(Map<String, dynamic> json) =>
      BpVideoAttachmentData(
        meta: FluffyMeta.fromJson(json["meta"]),
        full: json["full"],
        thumb: json["thumb"],
        activityThumb: json["activity_thumb"],
        thumbMeta: ThumbMeta.fromJson(json["thumb_meta"]),
        videoUserProfileThumb: json["video_user_profile_thumb"],
        videoDirectoryPageThumb: json["video_directory_page_thumb"],
        mediaAlbumCover: json["media_album_cover"],
        videoAlbumCoverThumb: json["video_album_cover_thumb"],
        videoAddThumbnailThumb: json["video_add_thumbnail_thumb"],
        videoPopupThumb: json["video_popup_thumb"],
        videoActivityThumb: json["video_activity_thumb"],
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "full": full,
        "thumb": thumb,
        "activity_thumb": activityThumb,
        "thumb_meta": thumbMeta.toJson(),
        "video_user_profile_thumb": videoUserProfileThumb,
        "video_directory_page_thumb": videoDirectoryPageThumb,
        "media_album_cover": mediaAlbumCover,
        "video_album_cover_thumb": videoAlbumCoverThumb,
        "video_add_thumbnail_thumb": videoAddThumbnailThumb,
        "video_popup_thumb": videoPopupThumb,
        "video_activity_thumb": videoActivityThumb,
      };
}

class FluffyMeta {
  String mimeType;
  String lengthFormatted;

  FluffyMeta({
    required this.mimeType,
    required this.lengthFormatted,
  });

  factory FluffyMeta.fromJson(Map<String, dynamic> json) => FluffyMeta(
        mimeType: json["mime_type"],
        lengthFormatted: json["length_formatted"],
      );

  Map<String, dynamic> toJson() => {
        "mime_type": mimeType,
        "length_formatted": lengthFormatted,
      };
}

class ThumbMeta {
  int width;
  int height;
  String file;
  ThumbMetaSizes sizes;
  ImageMeta imageMeta;
  int? filesize;

  ThumbMeta({
    required this.width,
    required this.height,
    required this.file,
    required this.sizes,
    required this.imageMeta,
    this.filesize,
  });

  factory ThumbMeta.fromJson(Map<String, dynamic> json) => ThumbMeta(
        width: json["width"],
        height: json["height"],
        file: json["file"],
        sizes: ThumbMetaSizes.fromJson(json["sizes"]),
        imageMeta: ImageMeta.fromJson(json["image_meta"]),
        filesize: json["filesize"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "sizes": sizes.toJson(),
        "image_meta": imageMeta.toJson(),
        "filesize": filesize,
      };
}

class ImageMeta {
  String aperture;
  String credit;
  String camera;
  String caption;
  String createdTimestamp;
  String copyright;
  String focalLength;
  String iso;
  String shutterSpeed;
  String title;
  String orientation;
  List<dynamic> keywords;

  ImageMeta({
    required this.aperture,
    required this.credit,
    required this.camera,
    required this.caption,
    required this.createdTimestamp,
    required this.copyright,
    required this.focalLength,
    required this.iso,
    required this.shutterSpeed,
    required this.title,
    required this.orientation,
    required this.keywords,
  });

  factory ImageMeta.fromJson(Map<String, dynamic> json) => ImageMeta(
        aperture: json["aperture"],
        credit: json["credit"],
        camera: json["camera"],
        caption: json["caption"],
        createdTimestamp: json["created_timestamp"],
        copyright: json["copyright"],
        focalLength: json["focal_length"],
        iso: json["iso"],
        shutterSpeed: json["shutter_speed"],
        title: json["title"],
        orientation: json["orientation"],
        keywords: List<dynamic>.from(json["keywords"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "aperture": aperture,
        "credit": credit,
        "camera": camera,
        "caption": caption,
        "created_timestamp": createdTimestamp,
        "copyright": copyright,
        "focal_length": focalLength,
        "iso": iso,
        "shutter_speed": shutterSpeed,
        "title": title,
        "orientation": orientation,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
      };
}

class ThumbMetaSizes {
  BbMediaActivityImage bbVideoProfileAlbumAddThumbnailDirectoryPosterImage;
  BbMediaActivityImage? bbVideoPosterPopupImage;
  BbMediaActivityImage bbVideoActivityImage;

  ThumbMetaSizes({
    required this.bbVideoProfileAlbumAddThumbnailDirectoryPosterImage,
    this.bbVideoPosterPopupImage,
    required this.bbVideoActivityImage,
  });

  factory ThumbMetaSizes.fromJson(Map<String, dynamic> json) => ThumbMetaSizes(
        bbVideoProfileAlbumAddThumbnailDirectoryPosterImage:
            BbMediaActivityImage.fromJson(json[
                "bb-video-profile-album-add-thumbnail-directory-poster-image"]),
        bbVideoPosterPopupImage: json["bb-video-poster-popup-image"] == null
            ? null
            : BbMediaActivityImage.fromJson(
                json["bb-video-poster-popup-image"]),
        bbVideoActivityImage:
            BbMediaActivityImage.fromJson(json["bb-video-activity-image"]),
      );

  Map<String, dynamic> toJson() => {
        "bb-video-profile-album-add-thumbnail-directory-poster-image":
            bbVideoProfileAlbumAddThumbnailDirectoryPosterImage.toJson(),
        "bb-video-poster-popup-image": bbVideoPosterPopupImage?.toJson(),
        "bb-video-activity-image": bbVideoActivityImage.toJson(),
      };
}

enum Privacy { PUBLIC, LOGGEDIN }

final privacyValues =
    EnumValues({"loggedin": Privacy.LOGGEDIN, "public": Privacy.PUBLIC});

enum Component { ACTIVITY, GROUPS, XPROFILE }

final componentValues = EnumValues({
  "activity": Component.ACTIVITY,
  "groups": Component.GROUPS,
  "xprofile": Component.XPROFILE
});

class Content {
  String rendered;

  Content({
    required this.rendered,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

enum Status { PUBLISHED }

final statusValues = EnumValues({"published": Status.PUBLISHED});

enum Type { ACTIVITY_UPDATE, UPDATED_PROFILE }

final typeValues = EnumValues({
  "activity_update": Type.ACTIVITY_UPDATE,
  "updated_profile": Type.UPDATED_PROFILE
});

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
