import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Station {
  int id;
  int score;
  String label;
  IconData icon;
  double sizeIcon;
  bool isOpen;
  //BuildContext context;

  Station(
      this.id, this.score, this.label, this.icon, this.sizeIcon, this.isOpen);
}

List<Station> stations_add = [
  Station(1, 7000, '1', Icons.star, 10, true),
  Station(2, 0, '2', Icons.star, 10, false),
  Station(3, 0, '3', Icons.star, 10, false),
  Station(4, 0, '4', Icons.star, 10, false),
  Station(5, 0, '5', Icons.star, 10, false),
  Station(6, 0, '6', Icons.star, 10, false),
  Station(7, 0, '7', Icons.star, 10, false),
  Station(8, 0, '8', Icons.star, 10, false),
  Station(9, 0, '9', Icons.star, 10, false),
  Station(10, 0, '10', Icons.star, 10, false),
  Station(11, 0, '11', Icons.star, 10, false),
  Station(12, 0, '12', Icons.star, 10, false),
  Station(13, 0, '13', Icons.star, 10, false),
  Station(14, 0, '14', Icons.star, 10, false),
  Station(15, 0, '15', Icons.star, 10, false),
  Station(15, 0, '16', Icons.star, 10, false),
];

List<Station> stations_sub = [
  Station(1, -7000, '1', Icons.star, 10, true),
  Station(2, 0, '2', Icons.star, 10, true),
  Station(3, 0, '3', Icons.star, 10, true),
  Station(4, 0, '4', Icons.star, 10, true),
  Station(5, 0, '5', Icons.star, 10, true),
  Station(6, 0, '6', Icons.star, 10, true),
  Station(7, 0, '7', Icons.star, 10, true),
  Station(8, 0, '8', Icons.star, 10, true),
  Station(9, 0, '9', Icons.star, 10, true),
  Station(10, 0, '10', Icons.star, 10, true),
  Station(11, 0, '11', Icons.star, 10, true),
  Station(12, 0, '12', Icons.star, 10, true),
  Station(13, 0, '13', Icons.star, 10, true),
  Station(14, 0, '14', Icons.star, 10, true),
  Station(15, 0, '15', Icons.star, 10, true),
  Station(15, 0, '16', Icons.star, 10, true),
];

List<Station> stations_addsub = [
  Station(1, 2000, '1', Icons.star, 10, true),
  Station(2, 0, '2', Icons.star, 10, false),
  Station(3, 0, '3', Icons.star, 10, false),
  Station(4, 0, '4', Icons.star, 10, false),
  Station(5, 0, '5', Icons.star, 10, false),
  Station(6, 0, '6', Icons.star, 10, false),
  Station(7, 0, '7', Icons.star, 10, false),
  Station(8, 0, '8', Icons.star, 10, false),
  Station(9, 0, '9', Icons.star, 10, false),
  Station(10, 0, '10', Icons.star, 10, false),
  Station(11, 0, '11', Icons.star, 10, false),
  Station(12, 0, '12', Icons.star, 10, false),
  Station(13, 0, '13', Icons.star, 10, false),
  Station(14, 0, '14', Icons.star, 10, false),
  Station(15, 0, '15', Icons.star, 10, false),
  Station(15, 0, '16', Icons.star, 10, false),
];

List<Station> multipt = [
  Station(1, 7000, '1', Icons.star, 10, true),
  Station(2, 0, '2', Icons.star, 10, false),
  Station(3, 0, '3', Icons.star, 10, false),
  Station(4, 0, '4', Icons.star, 10, false),
  Station(5, 0, '5', Icons.star, 10, false),
  Station(6, 0, '6', Icons.star, 10, false),
  Station(7, 0, '7', Icons.star, 10, false),
  Station(8, 0, '8', Icons.star, 10, false),
  Station(9, 0, '9', Icons.star, 10, false),
  Station(10, 0, '10', Icons.star, 10, false),
  Station(11, 0, '11', Icons.star, 10, false),
  Station(12, 0, '12', Icons.star, 10, false),
  Station(13, 0, '13', Icons.star, 10, false),
  Station(14, 0, '14', Icons.star, 10, false),
  Station(15, 0, '15', Icons.star, 10, false),
  Station(15, 0, '16', Icons.star, 10, false),
];

List<Station> division = [
  Station(1, 7000, '1', Icons.star, 10, true),
  Station(2, 0, '2', Icons.star, 10, false),
  Station(3, 0, '3', Icons.star, 10, false),
  Station(4, 0, '4', Icons.star, 10, false),
  Station(5, 0, '5', Icons.star, 10, false),
  Station(6, 0, '6', Icons.star, 10, false),
  Station(7, 0, '7', Icons.star, 10, false),
  Station(8, 0, '8', Icons.star, 10, false),
  Station(9, 0, '9', Icons.star, 10, false),
  Station(10, 0, '10', Icons.star, 10, false),
  Station(11, 0, '11', Icons.star, 10, false),
  Station(12, 0, '12', Icons.star, 10, false),
  Station(13, 0, '13', Icons.star, 10, false),
  Station(14, 0, '14', Icons.star, 10, false),
  Station(15, 0, '15', Icons.star, 10, false),
  Station(15, 0, '16', Icons.star, 10, false),
];

List<Station> YesNo = [
  Station(1, 7000, '1', Icons.star, 10, true),
  Station(2, 0, '2', Icons.star, 10, false),
  Station(3, 0, '3', Icons.star, 10, false),
  Station(4, 0, '4', Icons.star, 10, false),
  Station(5, 0, '5', Icons.star, 10, false),
  Station(6, 0, '6', Icons.star, 10, false),
  Station(7, 0, '7', Icons.star, 10, false),
  Station(8, 0, '8', Icons.star, 10, false),
  Station(9, 0, '9', Icons.star, 10, false),
  Station(10, 0, '10', Icons.star, 10, false),
  Station(11, 0, '11', Icons.star, 10, false),
  Station(12, 0, '12', Icons.star, 10, false),
  Station(13, 0, '13', Icons.star, 10, false),
  Station(14, 0, '14', Icons.star, 10, false),
  Station(15, 0, '15', Icons.star, 10, false),
  Station(15, 0, '16', Icons.star, 10, false),
];

class musicList {
  int id;
  String name;
  String url;
  musicList(this.id, this.name, this.url);
}

List<musicList> ListMusic = [
  musicList(1, 'ĐỒI THÔNG HAI MỘ', 'audio/ost1.mp3'),
  musicList(2, 'ĐỒI THÔNG HAI MỘ', 'audio/ost1.mp3'),
  musicList(3, 'ĐỒI THÔNG HAI MỘ', 'audio/ost1.mp3'),
  musicList(4, 'ĐỒI THÔNG HAI MỘ', 'audio/ost1.mp3'),
  musicList(5, 'ĐỒI THÔNG HAI MỘ', 'audio/ost1.mp3'),
  musicList(6, 'ĐỒI THÔNG HAI MỘ', 'audio/ost1.mp3'),
];

Color color = Color.fromARGB(255, 24, 31, 109);
