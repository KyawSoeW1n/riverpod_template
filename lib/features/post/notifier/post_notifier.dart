import 'package:riverpod/riverpod.dart';
import 'package:riverpod_testing/domain/add_favourite_post/add_favourite_post_usecase_impl.dart';

import '../../../core/state.dart';
import '../../../data_model/vo/post_vo.dart';
import '../../../domain/get_photo/get_photo_usecase_impl.dart';
import '../../../domain/get_photo_testing/get_photo_testing_usecase_impl.dart';
import '../../../domain/get_posts/get_posts_usecase_impl.dart';

class PostNotifier extends StateNotifier<State<List<PostVO>>> {
  final GetPostsUseCaseImpl _getPostsUseCaseImpl;
  final AddFavouritePostUseCaseImpl _addFavouritePostUseCaseImpl;

  PostNotifier(
    this._getPostsUseCaseImpl,
    this._addFavouritePostUseCaseImpl,
  ) : super(const State.init()) {
    getPostList();
  }

  void addFavouritePost(int id, String title) {
    _addFavouritePostUseCaseImpl.addFavouritePost(id, title);
  }

  void getPostList() async {
    state = const State.loading();
    final postList = await _getPostsUseCaseImpl.getPostList();
    state = State.success(postList);
  }
}

class PhotoNotifier extends StateNotifier<AsyncValue<List<String>>> {
  final GetPhotoUseCaseImpl _getPhotoUseCaseImpl;

  PhotoNotifier(
    this._getPhotoUseCaseImpl,
  ) : super(const AsyncValue.loading()) {
    getPhotoList();
  }

  void getPhotoList() async {
    state = const AsyncValue.loading();
    final photoList = await _getPhotoUseCaseImpl.getPhotoList();
    state = AsyncValue.data([
      "https://via.placeholder.com/600/509aba",
      "https://via.placeholder.com/600/12ae65"
    ]);
  }
}

class PhotoTestingNotifier extends StateNotifier<AsyncValue<List<String>>> {
  final GetPhotoTestUseCaseImpl _getPhotoTestUseCaseImpl;

  PhotoTestingNotifier(
    this._getPhotoTestUseCaseImpl,
  ) : super(const AsyncLoading());

  void getPhotoList() async {
    state = const AsyncLoading();
    state = await _getPhotoTestUseCaseImpl.getPhotoTestingList();
    // state.handleSpecificException(
    //   onNetworkException: (_) => showErrorDialog(_, context),
    //   // onNotFoundException: (_)=> debugPrint("Not Found For this API"),
    //   onCommonException: (_) => showErrorDialog(_, context),
    // );
  }
}
//
// showErrorDialog(String? msg, BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text("$msg"),
//       content: Text("${msg}"),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: Text('OK'),
//         ),
//       ],
//     ),
//   );
// }
