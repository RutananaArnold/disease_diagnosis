import 'package:pagination_exp/Model/stories.dart';

/// Example Data Model
class UserModel {
  UserModel(this.stories, this.userName, this.imageUrl);

  final List<StoryModel> stories;
  final String userName;
  final String imageUrl;
}
