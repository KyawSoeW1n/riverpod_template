// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_testing/data_model/cache/cache_post.dart';
import 'package:riverpod_testing/data_model/response/post_response.dart';
import 'package:riverpod_testing/data_source/network/posts/post_remote_datasource.dart';
import 'package:riverpod_testing/domain/fetch_posts/fetch_posts_usecase.dart';
import 'package:riverpod_testing/mapper/posts_mapper.dart';

import 'get_post_test.mocks.dart';

@GenerateMocks(
  [
    PostMapper,
    PostsRemoteDataSource,
    FetchPostsUseCase,
  ],
)
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockPostMapper = MockPostMapper();
  final postsRemoteDataSource = MockPostsRemoteDataSource();
  final mockFetchPostsUseCase = MockFetchPostsUseCase();

  final faker = Faker();

  final responseList = [
    {
      "userId": faker.lorem.random.integer(5),
      "id": faker.lorem.random.integer(5),
      "title": faker.lorem.sentence(),
      "completed": faker.lorem.random.boolean()
    }
  ];

  test('Get Post API', () async {
    final expectedResult = responseList
        .map(
          (e) => CachePost(
            PostItemResponse.fromJson(e).id,
            PostItemResponse.fromJson(e).title,
            false,
          ),
        )
        .toList();
    when(mockPostMapper.mapFromResponse(responseList)).thenAnswer(
      (_) => expectedResult,
    );

    final expectedResponse = mockPostMapper.mapFromResponse(responseList);

    when(postsRemoteDataSource.getPostList()).thenAnswer(
      (_) async => expectedResponse,
    );

    mockFetchPostsUseCase.fetchPostList();
    verify(mockFetchPostsUseCase.fetchPostList());
    verify(mockPostMapper.mapFromResponse(responseList));

    final actualResult = await postsRemoteDataSource.getPostList();

    expect(actualResult, expectedResponse);
  });
}
