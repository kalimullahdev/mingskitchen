import 'dart:convert';

import 'package:flutter/material.dart';

class BookTableModel {
  final String name;
  final String email;
  final String phone;
  final String no_of_person;
  final String date;
  final String time;
  final String message;
  BookTableModel({
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.no_of_person,
    @required this.date,
    @required this.time,
    @required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'no_of_person': no_of_person,
      'date': date,
      'time': time,
      'message': message,
    };
  }

  factory BookTableModel.fromMap(Map<String, dynamic> map) {
    return BookTableModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      no_of_person: map['no_of_person'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BookTableModel.fromJson(String source) =>
      BookTableModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookTableModel(name: $name, email: $email, phone: $phone, no_of_person: $no_of_person, date: $date, time: $time, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookTableModel &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.no_of_person == no_of_person &&
        other.date == date &&
        other.time == time &&
        other.message == message;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        no_of_person.hashCode ^
        date.hashCode ^
        time.hashCode ^
        message.hashCode;
  }
}
