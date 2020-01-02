import 'package:quotez/models/collections.dart';

class Users {
  String name;
  String profilePic;
  String bio;
  double followers;
  int following;
  int posts;
  List<Collections> collections;
  Users(
      {this.name,
      this.profilePic,
      this.bio,
      this.followers,
      this.following,
      this.posts,
      this.collections});
}
