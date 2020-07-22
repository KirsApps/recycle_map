import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String date;
  final String title;
  final String description;
  final String body;

  const Article({this.date, this.title, this.body, this.description});

  @override
  List<Object> get props => [date, title, body, description];
}
