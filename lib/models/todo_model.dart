import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TodoModel {
  @Id(assignable: false)
  int? id;
  late final String tittle;
  late final String body;
  late final String date;
  // late final String userId;

  TodoModel(
      {required this.tittle,
      required this.body,
      required this.date,
      required this.id

      // required this.userId
      });
  TodoModel.autoId({
    required this.body,
    required this.tittle,
    required this.date,
    // required this.userId
  });
}
// command
// flutter pub run build_runner build
// flutter pub run build_runner build --delete-conflicting-outputs