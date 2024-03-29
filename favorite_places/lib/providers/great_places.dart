import 'dart:io';

import 'package:favorite_places/helpers/db_helper.dart';
import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      location: null,
      title: pickedTitle,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final datalist = await DBHelper.getData('user_places');

    _items = datalist
        .map(
          (item) => Place(
            id: item['id'] as String,
            image: File(item['image'] as String),
            title: item['title'] as String,
            location: null,
          ),
        )
        .toList();
    notifyListeners();
  }
}
