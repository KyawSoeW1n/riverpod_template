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
import 'package:riverpod_testing/data_model/response/photo_response.dart';
import 'package:riverpod_testing/data_source/network/photo/photo_remote_datasource.dart';
import 'package:riverpod_testing/domain/get_photo/get_photo_usecase.dart';
import 'package:riverpod_testing/mapper/photo_mapper.dart';

import 'get_photo_test.mocks.dart';

@GenerateMocks(
  [
    PhotoMapper,
    PhotoRemoteDataSource,
    GetPhotoUseCase,
  ],
)
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockPhotoMapper = MockPhotoMapper();
  final mockPhotoRemoteDataSource = MockPhotoRemoteDataSource();

  final faker = Faker();

  final responseList = [
    {
      "title": faker.lorem.sentence(),
      "thumbnailUrl": faker.lorem.sentence(),
      "url": faker.lorem.sentence(),
      "id": faker.lorem.random.integer(5),
      "albumId": faker.lorem.random.integer(5)
    }
  ];

  test('Get Photo API', () async {
    final expectedResult = responseList
        .map(
          (e) => PhotoResponse.fromJson(e).url,
        )
        .toList();
    when(mockPhotoMapper.mapFromResponse(responseList)).thenAnswer(
      (_) => expectedResult,
    );

    final expectedResponse = mockPhotoMapper.mapFromResponse(responseList);

    when(mockPhotoRemoteDataSource.getPhotoList(0)).thenAnswer(
      (_) async => expectedResponse,
    );
    final actualResult = await mockPhotoRemoteDataSource.getPhotoList(0);
    verify(mockPhotoMapper.mapFromResponse(responseList));
    expect(actualResult, expectedResponse);
  });
}
