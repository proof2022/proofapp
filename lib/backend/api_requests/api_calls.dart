import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start posts Group Code

class PostsGroup {
  static String baseUrl = 'https://api.proof.ma/';
  static Map<String, String> headers = {};
  static GetAllPostsCall getAllPostsCall = GetAllPostsCall();
  static FollowCall followCall = FollowCall();
  static LikeAPostlikeCall likeAPostlikeCall = LikeAPostlikeCall();
  static LoginCall loginCall = LoginCall();
  static CreatePostWithoutImageCall createPostWithoutImageCall =
      CreatePostWithoutImageCall();
  static CreatePostCopyCall createPostCopyCall = CreatePostCopyCall();
  static GetUsernameCall getUsernameCall = GetUsernameCall();
  static GetPostCall getPostCall = GetPostCall();
  static CommentOnPostCall commentOnPostCall = CommentOnPostCall();
  static DeletePostCall deletePostCall = DeletePostCall();
}

class GetAllPostsCall {
  Future<ApiCallResponse> call({
    String? profileId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllPosts',
      apiUrl: '${PostsGroup.baseUrl}getAllPosts/${profileId}',
      callType: ApiCallType.GET,
      headers: {
        ...PostsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic posts(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class FollowCall {
  Future<ApiCallResponse> call({
    String? posterId = '',
    String? followerId = '',
    String? action = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'follow',
      apiUrl:
          '${PostsGroup.baseUrl}followPoster/${posterId}/${followerId}/${action}',
      callType: ApiCallType.GET,
      headers: {
        ...PostsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LikeAPostlikeCall {
  Future<ApiCallResponse> call({
    String? postId = '',
    String? likedProfileId = '',
    String? action = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'likeAPostlike',
      apiUrl:
          '${PostsGroup.baseUrl}likeAPost/${postId}/${likedProfileId}/${action}',
      callType: ApiCallType.GET,
      headers: {
        ...PostsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? identifier = '',
    String? password = '',
  }) {
    final body = '''
{
  "identifier": "${identifier}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${PostsGroup.baseUrl}auth/local',
      callType: ApiCallType.POST,
      headers: {
        ...PostsGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic userProfileId(dynamic response) => getJsonField(
        response,
        r'''$.user.userprofileId.id''',
      );
}

class CreatePostWithoutImageCall {
  Future<ApiCallResponse> call({
    String? by = '',
    String? text = '',
  }) {
    final body = '''
{
  "by": "${by}",
  "text": "${text}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createPostWithoutImage',
      apiUrl: '${PostsGroup.baseUrl}posts',
      callType: ApiCallType.POST,
      headers: {
        ...PostsGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreatePostCopyCall {
  Future<ApiCallResponse> call({
    String? by = '',
    String? text = '',
    String? imageId = '',
  }) {
    final body = '''
{
  "by": "${by}",
  "text": "${text}",
  "images": {
    "id": "${imageId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createPost Copy',
      apiUrl: '${PostsGroup.baseUrl}posts',
      callType: ApiCallType.POST,
      headers: {
        ...PostsGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUsernameCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getUsername',
      apiUrl: '${PostsGroup.baseUrl}users/${userId}',
      callType: ApiCallType.GET,
      headers: {
        ...PostsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPostCall {
  Future<ApiCallResponse> call({
    String? profileId = '',
    String? postId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getPost',
      apiUrl: '${PostsGroup.baseUrl}getPost/${profileId}/${postId}',
      callType: ApiCallType.GET,
      headers: {
        ...PostsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CommentOnPostCall {
  Future<ApiCallResponse> call({
    String? postId = '',
    String? commenterId = '',
    String? text = '',
  }) {
    final body = '''
{
  "text": "${text}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'commentOnPost',
      apiUrl: '${PostsGroup.baseUrl}commentOnPost/${postId}/${commenterId}',
      callType: ApiCallType.POST,
      headers: {
        ...PostsGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeletePostCall {
  Future<ApiCallResponse> call({
    String? postId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deletePost',
      apiUrl: '${PostsGroup.baseUrl}posts/${postId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...PostsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End posts Group Code

/// Start blogPosts Group Code

class BlogPostsGroup {
  static String baseUrl = 'https://api.proof.ma/';
  static Map<String, String> headers = {};
  static BlogPostsByCategoriesCall blogPostsByCategoriesCall =
      BlogPostsByCategoriesCall();
  static BlogPostsbyOneCategoryCall blogPostsbyOneCategoryCall =
      BlogPostsbyOneCategoryCall();
  static BlogPostCall blogPostCall = BlogPostCall();
  static CommentOnBlogPostCall commentOnBlogPostCall = CommentOnBlogPostCall();
  static LikeABlogPostCall likeABlogPostCall = LikeABlogPostCall();
  static BlogPostLikedByUserCall blogPostLikedByUserCall =
      BlogPostLikedByUserCall();
}

class BlogPostsByCategoriesCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'blogPostsByCategories',
      apiUrl: '${BlogPostsGroup.baseUrl}blogPostsByCategories',
      callType: ApiCallType.GET,
      headers: {
        ...BlogPostsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BlogPostsbyOneCategoryCall {
  Future<ApiCallResponse> call({
    String? categoryName = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'blogPostsbyOneCategory',
      apiUrl: '${BlogPostsGroup.baseUrl}blogPostsbyOneCategory/${categoryName}',
      callType: ApiCallType.GET,
      headers: {
        ...BlogPostsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BlogPostCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'blogPost',
      apiUrl: '${BlogPostsGroup.baseUrl}blogPost/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...BlogPostsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CommentOnBlogPostCall {
  Future<ApiCallResponse> call({
    int? id,
    String? commenterId = '',
    String? text = '',
  }) {
    final body = '''
{
  "text": "${text}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'commentOnBlogPost',
      apiUrl: '${BlogPostsGroup.baseUrl}commentOnBlogPost/${id}/${commenterId}',
      callType: ApiCallType.POST,
      headers: {
        ...BlogPostsGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LikeABlogPostCall {
  Future<ApiCallResponse> call({
    int? id,
    String? likedProfileId = '',
    String? action = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'likeABlogPost',
      apiUrl:
          '${BlogPostsGroup.baseUrl}likeABlogPost/${id}/${likedProfileId}/${action}',
      callType: ApiCallType.GET,
      headers: {
        ...BlogPostsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BlogPostLikedByUserCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? userId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'blogPostLikedByUser',
      apiUrl: '${BlogPostsGroup.baseUrl}blogPostLikedByUser/${id}/${userId}',
      callType: ApiCallType.GET,
      headers: {
        ...BlogPostsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End blogPosts Group Code

/// Start users Group Code

class UsersGroup {
  static String baseUrl = 'https://api.proof.ma/';
  static Map<String, String> headers = {};
  static CreateUserCall createUserCall = CreateUserCall();
  static CreateUserProfileCall createUserProfileCall = CreateUserProfileCall();
  static UploadCall uploadCall = UploadCall();
  static UpdateUserImageCall updateUserImageCall = UpdateUserImageCall();
  static GetUserCall getUserCall = GetUserCall();
}

class CreateUserCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "username": "${username}",
  "email": "${email}",
  "password": "${password}",
  "provider": "local",
  "confirmed": false,
  "blocked": false,
  "role": {
    "id": 1
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUser',
      apiUrl: '${UsersGroup.baseUrl}users',
      callType: ApiCallType.POST,
      headers: {
        ...UsersGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateUserProfileCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? firstName = '',
    String? lastName = '',
  }) {
    final body = '''
{
  "userid": "${userid}",
  "firstName": "${firstName}",
  "lastName": "${lastName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUserProfile',
      apiUrl: '${UsersGroup.baseUrl}userProfiles',
      callType: ApiCallType.POST,
      headers: {
        ...UsersGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UploadCall {
  Future<ApiCallResponse> call({
    String? foo = '',
  }) {
    final body = '''
{
  "foo": "${foo}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'upload',
      apiUrl: '${UsersGroup.baseUrl}upload',
      callType: ApiCallType.POST,
      headers: {
        ...UsersGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateUserImageCall {
  Future<ApiCallResponse> call({
    String? imageId = '',
    String? userId = '',
  }) {
    final body = '''
{
  "photo": {
    "id": "${imageId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateUserImage',
      apiUrl: '${UsersGroup.baseUrl}userprofiles/${userId}',
      callType: ApiCallType.PUT,
      headers: {
        ...UsersGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUserCall {
  Future<ApiCallResponse> call({
    String? userProfileId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getUser',
      apiUrl: '${UsersGroup.baseUrl}userProfiles/${userProfileId}',
      callType: ApiCallType.GET,
      headers: {
        ...UsersGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End users Group Code

/// Start children Group Code

class ChildrenGroup {
  static String baseUrl = 'https://api.proof.ma/';
  static Map<String, String> headers = {};
  static GetMyChildrenCall getMyChildrenCall = GetMyChildrenCall();
  static AddChildCall addChildCall = AddChildCall();
  static UpdateMetricCall updateMetricCall = UpdateMetricCall();
  static NewMetricCall newMetricCall = NewMetricCall();
  static UpdateTopImageCall updateTopImageCall = UpdateTopImageCall();
  static EditChildImageCall editChildImageCall = EditChildImageCall();
  static EditChildCall editChildCall = EditChildCall();
  static ChildCall childCall = ChildCall();
}

class GetMyChildrenCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getMyChildren',
      apiUrl: '${ChildrenGroup.baseUrl}getMyChildren/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...ChildrenGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddChildCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? birthday = '',
    String? gender = '',
    String? parent = '',
    String? photo = '',
  }) {
    final body = '''
{
  "firstName": "${firstName}",
  "lastName": "${lastName}",
  "birthday": "${birthday}",
  "gender": "${gender}",
  "parent": "${parent}",
  "photo": "${photo}",
  "metrics": [
    {
      "metricName": "Poids",
      "notation": "Kg"
    },
    {
      "metricName": "Taille",
      "notation": "cm"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addChild',
      apiUrl: '${ChildrenGroup.baseUrl}children',
      callType: ApiCallType.POST,
      headers: {
        ...ChildrenGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateMetricCall {
  Future<ApiCallResponse> call({
    String? childId = '',
    String? metric = '',
    double? value,
  }) {
    final body = '''
{
  "value": "${value}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateMetric',
      apiUrl: '${ChildrenGroup.baseUrl}updateMetric/${childId}/${metric}',
      callType: ApiCallType.POST,
      headers: {
        ...ChildrenGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NewMetricCall {
  Future<ApiCallResponse> call({
    String? childId = '',
    String? metricName = '',
    String? value = '',
    String? notation = '',
  }) {
    final body = '''
{
  "metricName": "${metricName}",
  "value": "${value}",
  "notation": "${notation}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'newMetric',
      apiUrl: '${ChildrenGroup.baseUrl}newMetric/${childId}',
      callType: ApiCallType.POST,
      headers: {
        ...ChildrenGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateTopImageCall {
  Future<ApiCallResponse> call({
    String? bigImage = '',
    String? childId = '',
  }) {
    final body = '''
{
  "bigImage": "${bigImage}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateTopImage',
      apiUrl: '${ChildrenGroup.baseUrl}children/${childId}',
      callType: ApiCallType.PUT,
      headers: {
        ...ChildrenGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditChildImageCall {
  Future<ApiCallResponse> call({
    String? childId = '',
    String? photoId = '',
  }) {
    final body = '''
{
  "photo": {
    "id": "${photoId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editChildImage',
      apiUrl: '${ChildrenGroup.baseUrl}children/${childId}',
      callType: ApiCallType.PUT,
      headers: {
        ...ChildrenGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditChildCall {
  Future<ApiCallResponse> call({
    String? childId = '',
    String? firstName = '',
    String? lastName = '',
    String? birthday = '',
    String? gender = '',
  }) {
    final body = '''
{
  "firstName": "${firstName}",
  "lastName": "${lastName}",
  "gender": "${gender}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editChild',
      apiUrl: '${ChildrenGroup.baseUrl}children/${childId}',
      callType: ApiCallType.PUT,
      headers: {
        ...ChildrenGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChildCall {
  Future<ApiCallResponse> call({
    String? childId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'child',
      apiUrl: '${ChildrenGroup.baseUrl}children/${childId}',
      callType: ApiCallType.GET,
      headers: {
        ...ChildrenGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End children Group Code

/// Start imageUpload Group Code

class ImageUploadGroup {
  static String baseUrl = 'https://api.proof.ma/';
  static Map<String, String> headers = {};
  static UploadImageTestCall uploadImageTestCall = UploadImageTestCall();
}

class UploadImageTestCall {
  Future<ApiCallResponse> call({
    String? url = '',
  }) {
    final body = '''
{
  "url": "${url}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadImageTest',
      apiUrl: '${ImageUploadGroup.baseUrl}uploadImageTest',
      callType: ApiCallType.POST,
      headers: {
        ...ImageUploadGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End imageUpload Group Code

/// Start products Group Code

class ProductsGroup {
  static String baseUrl = 'https://api.proof.ma/';
  static Map<String, String> headers = {};
  static GetProductsForHomeCall getProductsForHomeCall =
      GetProductsForHomeCall();
  static ProductsCall productsCall = ProductsCall();
  static PedningOrdersForClientCall pedningOrdersForClientCall =
      PedningOrdersForClientCall();
  static OngoingOrdersForClientCall ongoingOrdersForClientCall =
      OngoingOrdersForClientCall();
  static AddItemToOrderCall addItemToOrderCall = AddItemToOrderCall();
  static ProductAlreadyInCartCall productAlreadyInCartCall =
      ProductAlreadyInCartCall();
  static GetProductForCategoryCall getProductForCategoryCall =
      GetProductForCategoryCall();
  static GetShippingTimeCall getShippingTimeCall = GetShippingTimeCall();
  static RemoveItemFromPendingOrderCall removeItemFromPendingOrderCall =
      RemoveItemFromPendingOrderCall();
  static AllOrdersForClientForMobileCall allOrdersForClientForMobileCall =
      AllOrdersForClientForMobileCall();
  static PutOrderCall putOrderCall = PutOrderCall();
  static GetOrderStatusCall getOrderStatusCall = GetOrderStatusCall();
  static GetOrderShippedTimeCall getOrderShippedTimeCall =
      GetOrderShippedTimeCall();
  static OrderCall orderCall = OrderCall();
  static GetOrderShippedTimeVCall getOrderShippedTimeVCall =
      GetOrderShippedTimeVCall();
}

class GetProductsForHomeCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getProductsForHome',
      apiUrl: '${ProductsGroup.baseUrl}getProductsForHome',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ProductsCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'products',
      apiUrl: '${ProductsGroup.baseUrl}products/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PedningOrdersForClientCall {
  Future<ApiCallResponse> call({
    String? clientId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'pedningOrdersForClient',
      apiUrl: '${ProductsGroup.baseUrl}pedningOrdersForClient/${clientId}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OngoingOrdersForClientCall {
  Future<ApiCallResponse> call({
    String? clientId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ongoingOrdersForClient',
      apiUrl: '${ProductsGroup.baseUrl}ongoingOrdersForClient/${clientId}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddItemToOrderCall {
  Future<ApiCallResponse> call({
    String? productId = '',
    String? clientId = '',
    String? quantity = '',
  }) {
    final body = '''
{
  "productId": "${productId}",
  "clientId": "${clientId}",
  "quantity": "${quantity}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addItemToOrder',
      apiUrl: '${ProductsGroup.baseUrl}addItemToOrder',
      callType: ApiCallType.POST,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ProductAlreadyInCartCall {
  Future<ApiCallResponse> call({
    String? productId = '',
    String? clientId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'productAlreadyInCart',
      apiUrl:
          '${ProductsGroup.baseUrl}productAlreadyInCart/${clientId}/${productId}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetProductForCategoryCall {
  Future<ApiCallResponse> call({
    String? category = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getProductForCategory',
      apiUrl: '${ProductsGroup.baseUrl}getProductForCategory/${category}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetShippingTimeCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getShippingTime',
      apiUrl: '${ProductsGroup.baseUrl}getShippingTime',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoveItemFromPendingOrderCall {
  Future<ApiCallResponse> call({
    String? clientId = '',
    String? productId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'removeItemFromPendingOrder',
      apiUrl:
          '${ProductsGroup.baseUrl}removeItemFromPendingOrder/${clientId}/${productId}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AllOrdersForClientForMobileCall {
  Future<ApiCallResponse> call({
    String? clientId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'allOrdersForClientForMobile',
      apiUrl: '${ProductsGroup.baseUrl}allOrdersForClientForMobile/${clientId}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PutOrderCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
    String? shippingTime = '',
    String? addressStreet = '',
    String? addressCity = '',
    String? newPhone = '',
    String? long = '',
    String? lat = '',
  }) {
    final body = '''
{
  "orderId": "${orderId}",
  "shippingTime": "${shippingTime}",
  "addressStreet": "${addressStreet}",
  "addressCity": "${addressCity}",
  "newPhone": "${newPhone}",
  "long": "${long}",
  "lat": "${lat}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'putOrder',
      apiUrl: '${ProductsGroup.baseUrl}putOrder',
      callType: ApiCallType.PUT,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetOrderStatusCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrderStatus',
      apiUrl: '${ProductsGroup.baseUrl}getOrderStatus/${orderId}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetOrderShippedTimeCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrderShippedTime',
      apiUrl: '${ProductsGroup.baseUrl}getOrderShippedTime/${orderId}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OrderCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'order',
      apiUrl: '${ProductsGroup.baseUrl}orders/${orderId}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetOrderShippedTimeVCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrderShippedTimeV',
      apiUrl: '${ProductsGroup.baseUrl}getOrderShippedTime/${orderId}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End products Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
