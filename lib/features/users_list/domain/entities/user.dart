import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String age;
  final String location;
  final String profileImageLink;
  final String date;
  final String dateIdea;
  const User({
    required this.name,
    required this.age,
    required this.location,
    required this.profileImageLink,
    required this.date,
    required this.dateIdea,
  });

  @override
  List<Object?> get props =>
      [name, age, location, profileImageLink, date, dateIdea];
}
