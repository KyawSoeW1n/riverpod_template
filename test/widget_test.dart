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
import 'package:riverpod_testing/data_source/network/posts/post_remote_datasource_impl.dart';
import 'package:riverpod_testing/domain/fetch_posts/fetch_posts_usecase_impl.dart';
import 'package:riverpod_testing/mapper/posts_mapper.dart';

import 'widget_test.mocks.dart';

@GenerateMocks(
  [
    PostMapper,
    PostRemoteDataSourceImpl,
    FetchPostsUseCaseImpl,
  ],
)
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockPostMapper = MockPostMapper();
  final postsRemoteDataSourceImpl = MockPostRemoteDataSourceImpl();
  final mockFetchPostsUseCaseImpl = MockFetchPostsUseCaseImpl();

  final faker = Faker();

  final responseList = [
    {
      "userId": faker.lorem.random.integer(5),
      "id": faker.lorem.random.integer(5),
      "title": faker.lorem.sentence(),
      "body": faker.lorem.sentence(),
    }
  ];

  test('Get Post API', () async {
    final expectedResult = responseList
        .map((e) => CachePost(PostItemResponse.fromJson(e).id,
            PostItemResponse.fromJson(e).title, false))
        .toList();
    when(mockPostMapper.mapFromResponse(responseList)).thenAnswer(
      (_) => expectedResult,
    );

    final expected = mockPostMapper.mapFromResponse(responseList);

    when(postsRemoteDataSourceImpl.getPostList()).thenAnswer(
      (_) async => expected,
    );

    mockFetchPostsUseCaseImpl.fetchPostList();
    verify(mockFetchPostsUseCaseImpl.fetchPostList());

    final actualResult = await postsRemoteDataSourceImpl.getPostList();

    expect(actualResult, expected);
  });
}
