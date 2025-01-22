import 'package:bilytica_assignment/core/constants/constants.dart';
import 'package:bilytica_assignment/core/utils/random_item_from_list.dart';
import 'package:bilytica_assignment/features/users_list/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.name,
      required super.age,
      required super.location,
      required super.profileImageLink,
      required super.date,
      required super.dateIdea});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name']['first'] ?? '',
      age: map['dob']['age'].toString(),
      location: '${map['location']['city']}, ${map['location']['state']}',
      profileImageLink: map['picture']['thumbnail'] ?? '',
      date: getRandomItemFromList(Constants
          .dateTimes), //Gets a random date and time from the list in the Constants class
      dateIdea: getRandomItemFromList(Constants
          .dateIdeas), //Gets a random date idea from the list in the Constants class
    );
  }
}
