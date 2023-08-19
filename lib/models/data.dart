import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class User {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? v;

  User({
    this.address,
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phone,
    this.v,
  });

  User.fromJson(Map<String, dynamic> json) {
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    phone = json['phone'];
    v = json['__v'];
  }

  /*static List<User> userFromSnapshot(List userSnapshot) {
    return userSnapshot.map((data) {
      return User.fromJson(data);
    }).toList();
  }*/
}

class Address {
  Geolocation? geolocation;
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Address({
    this.geolocation,
    this.city,
    this.street,
    this.number,
    this.zipcode,
  });

  Address.fromJson(Map<String, dynamic> json) {
    geolocation = json['geolocation'] != null ? Geolocation.fromJson(json['geolocation']) : null;
    city = json['city'];
    street = json['street'];
    number = json['number'];
    zipcode = json['zipcode'];
  }
}

class Geolocation {
  String? lat;
  String? long;

  Geolocation({
    this.lat,
    this.long,
  });

  Geolocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }
}

class Name {
  String? firstname;
  String? lastname;

  Name({
    this.firstname,
    this.lastname,
  });

  Name.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
  }
}

class Images {
  int albumId = 1;
  int id = 1;
  String title = "accusamus beatae ad facilis cum similique qui sunt";
  String url = "https://via.placeholder.com/600/92c952";
  String thumbnailUrl = "https://via.placeholder.com/150/92c952";

  Images({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  Images.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
}

/*class APIHandler {
  static Future<List<User>> getUser() async {
    var response = await http.get(Uri.parse("http://fakestoreapi.com/users"));

    //print("response ${jsonDecode(response.body)}");
    var data = jsonDecode(response.body);
    List usersData = [];
    for (var element in data) {
      usersData.add(element);
    }
    return User.userFromSnapshot(usersData);
  }
}*/

class HttpClient{
  static Dio instance=Dio(BaseOptions(
    //baseUrl: 'http://'
  ));
}

Future<List<User>> getUser() async{
  final response= await HttpClient.instance.get('http://fakestoreapi.com/users');
  final List<User> users=[];
  if (response.data is List<dynamic>){
    for (var element in (response.data as List<dynamic>)) { 
      users.add(User.fromJson(element));
    }
  }
  return users;
}

Future<List<Images>> getPhoto() async{
  final response= await HttpClient.instance.get('http://jsonplaceholder.typicode.com/photos');
  final List<Images> images=[];
  if (response.data is List<dynamic>){
    for (var element in (response.data as List<dynamic>)) { 
      images.add(Images.fromJson(element));
    }
  }
  return images;
}
