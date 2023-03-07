import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'authController.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**post 조회 */
class getPostList {
  static Future getPost() async {
    const url = 'http://api-liferary.duckdns.org/api/main';

    String? token = await storage.read(key: 'accessToken');

    var response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer ${token}'},
    );
    if (response.statusCode == 200) {
      print(token);
      print(response.body);
    } else {
      print(response.body);
    }
  }
}

class writePostController {
  static TextEditingController titleController =
      TextEditingController(); //titleController
  static TextEditingController categoryController =
      TextEditingController(); //categoryController
  static TextEditingController contextController =
      TextEditingController(); //contextController
  static TextEditingController imagesController =
      TextEditingController(); //imagesController
  static TextEditingController videoController =
      TextEditingController(); //videoController
  static FilePickerResult selectedFile = new FilePickerResult([]);

  static Future postWrite() async {
    const url = 'http://api-liferary.duckdns.org/api/main/new';
    var prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "accept": "application/json",
      'Authorization': 'Bearer ${prefs.getString('accessToken')}',
      "Content-Type": "multipart/form-data",
    };
    Map<String, String> data = {
      "title": titleController.text,
      "category": "cooking",
      "context": contextController.text,
      "video": "videoController.text"
    };

    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.fields.addAll(data);

    for (var i = 0; i < selectedFile.count; i++) {
      var file = await http.MultipartFile.fromPath(
          'images', selectedFile.files[i].path!,
          contentType: MediaType('image', 'png'));
      request.files.add(file);
      print(file.contentType);
    }

    // Send the request
    // http.StreamedResponse response = await request.send();

    // Send the request
    http.StreamedResponse response = await request.send();

    // Handle the response
    if (response.statusCode == 200) {
      // Request successful
      print(await response.stream.bytesToString());
      print(request.fields);
    } else {
      // Request failed
      print(response.statusCode);
    }
  }
}

// /** */
// class writePostController1 {
//   static TextEditingController titleController =
//       TextEditingController(); //titleController
//   static TextEditingController authorController =
//       TextEditingController(); //authorController
//   static TextEditingController categoryController =
//       TextEditingController(); //categoryController
//   static TextEditingController contextController =
//       TextEditingController(); //contextController
//   static TextEditingController imagesController =
//       TextEditingController(); //imagesController
//   static TextEditingController videoController =
//       TextEditingController(); //videoController
//   Future<void> uploadFiles() async {
//     // file picker를 통해 파일 여러개 선택
//     FilePickerResult? result =
//         await FilePicker.platform.pickFiles(allowMultiple: true);

//     if (result != null) {
//       final filePaths = result.paths;

//       // 파일 경로를 통해 formData 생성
//       var dio = Dio();
//       var formData = FormData.fromMap({
//         "title": titleController.text,
//         "author": authorController.text,
//         "category": "categoryController.text",
//         "context": contextController.text,
//         'images': List.generate(filePaths as int,
//             (index) => MultipartFile.fromFileSync(filePaths[index]!)),
//         "video": "videoController.text",
//       });

//       // 업로드 요청
//       final response = await dio
//           .post('http://api-liferary.duckdns.org/api/main/new', data: formData);
//     } else {
//       // 아무런 파일도 선택되지 않음.
//     }
//   }
// }

/**게시글 상세 정보 */
// class PostController {
//   static Future<PostModel> getUserPost(id) async {
//     String? token = await storage.read(key: 'Token');

//     var url = 'http://api-liferary.duckdns.org/api/main/${id}';
//     PostModel postModel;

//     var response = await http.get(
//       Uri.parse(url),
//       headers: {
//         'Authorization': 'Bearer ${token}',
//         "Content-Type": "application/json",
//         'Charset': 'utf-8',
//       },
//     );

//     print('게시글 상세 : ${response.body}');
//     var data = json.decode(utf8.decode(response.bodyBytes));
//     postModel = PostModel(
//       title: data['title'],
//       nickname: data['nickname'],
//       category: data['category'],
//       context: data['context'],
//       images: data['images'],
//       video: data['video'],
//       modifiedDate: data['modifiedDate'],
//     );
//     return postModel;
//   }
// }

/**게시글 상세 정보 모델 클래스 */
class PostModel {
  String? title;
  String? author;
  String? category;
  String? context;
  List<String>? images;
  String? video;

  PostModel(
      {this.title,
      this.author,
      this.category,
      this.context,
      this.images,
      this.video});
}

/**게시글 리스트 */
Future<PostList> listPost(number) async {
  var url = 'http://api-liferary.duckdns.org/api/main/page/${number}';

  String? token = await storage.read(key: 'Token');

  var response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer ${token}'},
  );
  if (response.statusCode == 200) {
    print(token);
    print('게시글 목록${utf8.decode(response.bodyBytes)}');
  } else {
    print(response.body);
  }

  final jsonResponse = json.decode(utf8.decode(response.bodyBytes));

  return new PostList.fromJson(jsonResponse);
}

/**게시글 리스트 모델 클래스 */
class PostList {
  //게시물 리스트 모델 클래스
  List<Content>? content;
  bool? last;

  PostList({this.content, this.last});

  PostList.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['postList'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['last'] = this.last;
    return data;
  }
}

class Content {
  String? title;
  String? nickname;
  String? category;
  String? context;
  String? images;
  String? video;
  String? modifiedDate;

  late int id;

  Content({
    this.title,
    this.nickname,
    this.category,
    this.context,
    this.images,
    this.video,
    this.modifiedDate,
  });
  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    nickname = json['nickname'];
    category = json['category'];
    context = json['context'];
    images = json['images'];
    video = json['video'];
    modifiedDate = json['modifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['title'] = this.title;
    data['nickname'] = this.nickname;
    data['category'] = this.category;
    data['context'] = this.context;
    data['images'] = this.images;
    data['video'] = this.video;
    data['modifiedDate'] = this.modifiedDate;

    return data;
  }
}

////여기부터 다시하자!
/**댓글 조회, 등록 클래스 */
class PostComment {
  static TextEditingController commentController =
      TextEditingController(); //commentController
  static Future commentWrite(id) async {
    /**댓글 등록 */
    var url = 'http://moida-skhu.duckdns.org/post/${id}/comments/new';

    String? token = await storage.read(key: 'Token');
    String? userID = await storage.read(key: 'userID');

    var response = await http.post(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${token}',
          "Content-Type": "application/json",
          'Charset': 'utf-8',
        },
        body: jsonEncode({
          "postId": id,
          "writer": userID,
          "context": commentController.text
        }));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
    }
  }

  static Future<CommentList?> commentRead(id) async {
    /**댓글 조회 */
    var url = 'http://moida-skhu.duckdns.org/post/${id}/comments';

    String? token = await storage.read(key: 'Token');
    String? userID = await storage.read(key: 'userID');

    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${token}',
        "Content-Type": "application/json",
        'Charset': 'utf-8',
      },
    );
    print('댓글 목록 ${response.body}');
    CommentList? commentList;
    final jsonResponse =
        json.decode(utf8.decode(response.bodyBytes)); //받은 정보를 json형태로 decode
    if (response.statusCode == 200) {
      commentList = CommentList.fromJson(jsonResponse);
    } else {
      commentList = null;
    }

    return commentList;
  }
}

/**댓글 리스트 모델 */
class CommentList {
  List<userComment> comments;

  CommentList({
    required this.comments,
  });

  factory CommentList.fromJson(List<dynamic> json) {
    List<userComment> commentsList = <userComment>[];
    commentsList = json.map((i) => userComment.fromJson(i)).toList();

    return new CommentList(comments: commentsList);
  }
}
// class CommentList{
//   List<userComment> comments;
//   CommentList({
//     required this.comments,
//   });

//   factory CommentList.fromJson(Map<String, dynamic> json) {
//     this.comments = json['comments'].entries.map((e) => userComment.fromJson(e.value)).toList();
//   }
// }

/**댓글 구성 요소 모델 */
class userComment {
  String? writer;
  String? context;
  String? nickname;
  int? id;
  List<ChildComments>? childComments;
  String? createdDate;

  userComment(
      {this.writer, this.context, this.id, this.childComments, this.nickname});
  // factory userComment.fromJson(Map<String, dynamic> json) {
  //   return new userComment(
  //       writer: json['writer'], context: json['context'], id: json['id']);
  // }
  userComment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];

    writer = json['writer'];
    context = json['context'];
    createdDate = json['createdDate'];

    if (json['childComments'] != null) {
      childComments = <ChildComments>[];
      json['childComments'].forEach((v) {
        childComments!.add(new ChildComments.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['writer'] = this.writer;
    data['context'] = this.context;

    if (this.childComments != null) {
      data['childComments'] =
          this.childComments!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = this.createdDate;

    return data;
  }
}

class ChildComments {
  int? id;
  int? postId;
  String? writer;
  String? context;
  String? nickname;
  int? parentCommentId;

  String? createdDate;
  String? modifiedDate;

  ChildComments(
      {this.id,
      this.postId,
      this.writer,
      this.context,
      this.parentCommentId,
      this.createdDate,
      this.modifiedDate,
      this.nickname});

  ChildComments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['postId'];
    writer = json['writer'];
    context = json['context'];
    parentCommentId = json['parentCommentId'];
    nickname = json['nickname'];

    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['postId'] = this.postId;
    data['writer'] = this.writer;
    data['context'] = this.context;
    data['parentCommentId'] = this.parentCommentId;
    data['nickname'] = this.nickname;
    data['createdDate'] = this.createdDate;
    data['modifiedDate'] = this.modifiedDate;
    return data;
  }
}

class PostChildComment {
  static TextEditingController childCommentController =
      TextEditingController(); //commentController
  static Future childCommentWrite(postId, index) async {
    /**댓글 등록 */
    var url = 'http://moida-skhu.duckdns.org/post/${postId}/comments/new';

    String? token = await storage.read(key: 'Token');
    String? userID = await storage.read(key: 'userID');

    var response = await http.post(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${token}',
          "Content-Type": "application/json",
          'Charset': 'utf-8',
        },
        body: jsonEncode({
          "postId": postId,
          "writer": userID,
          "context": childCommentController.text,
          "parentCommentId": index
        }));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
    }
  }
}

/**게시글 타입 별 */
Future<PostList> listTypePost(ctg, postNum) async {
  var url = 'http://moida-skhu.duckdns.org/post/type/${ctg}/${postNum}';

  String? token = await storage.read(key: 'Token');

  var response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer ${token}'},
  );
  if (response.statusCode == 200) {
    print(token);
    print('타입별 게시글 목록${response.body}');
  } else {
    print(response.body);
  }

  final jsonResponse = json.decode(utf8.decode(response.bodyBytes));

  return new PostList.fromJson(jsonResponse);
}

/**게시글 삭제 */
Future<void> deletePost(id) async {
  var url = 'http://moida-skhu.duckdns.org/post/${id}';

  String? token = await storage.read(key: 'Token');

  var response = await http.delete(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer ${token}'},
  );
  print(response.body);
}

/**게시글 수정 */
Future<ModiPostModel> modifyPost(id) async {
  var url = 'http://moida-skhu.duckdns.org/post/edit/${id}';

  String? token = await storage.read(key: 'Token');
  ModiPostModel modiPostModel;

  var response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer ${token}'},
  );
  print('modify : ${response.body}');
  var data = json.decode(utf8.decode(response.bodyBytes));
  modiPostModel = ModiPostModel(
      author: data['author'],
      title: data['title'],
      type: data['type'],
      context: data['context'],
      modifiedDate: data['modifiedDate']);
  return modiPostModel;
}

class ModiPostModel {
  final String title; //게시글 제목
  final String type; //게시글 태그
  final String context; //게시글 내용
  final String author;
  final String modifiedDate; //게시글 작성자
  ModiPostModel(
      {required this.title,
      required this.type,
      required this.context,
      required this.author,
      required this.modifiedDate});
}

class modiPostController {
  static TextEditingController modyTitleController =
      TextEditingController(); //modyTitleController
  static TextEditingController modyTypeController =
      TextEditingController(); //modyTypeController
  static TextEditingController modyContextController =
      TextEditingController(); //modyContextController
  static Future modiPostPath(id, author) async {
    var url = 'http://moida-skhu.duckdns.org/post/edit/${id}';

    String? token = await storage.read(key: 'Token');

    var response = await http.patch(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${token}',
          "Content-Type": "application/json",
          'Charset': 'utf-8',
        },
        body: jsonEncode({
          "author": author,
          "title": modyTitleController.text,
          "type": modyTypeController.text,
          "context": modyContextController.text
        }));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
    }
  }
}

/**댓글 수정 */
class modifyCommentsClass {
  static TextEditingController modyCommentsController =
      TextEditingController(); //modyCommentsController
  static Future modifyComments(postId, commentId) async {
    var url =
        'http://moida-skhu.duckdns.org/post/${postId}/comments/${commentId}';

    String? token = await storage.read(key: 'Token');
    ModiPostModel modiPostModel;

    var response = await http.patch(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${token}',
          "Content-Type": "application/json",
          'Charset': 'utf-8',
        },
        body: jsonEncode({"context": modyCommentsController.text}));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
    }
  }
}

/**댓글 삭제 */
Future<void> deleteComments(postId, commentId) async {
  var url =
      'http://moida-skhu.duckdns.org/post/${postId}/comments/${commentId}';

  String? token = await storage.read(key: 'Token');

  var response = await http.delete(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer ${token}'},
  );
  print(response.body);
}
