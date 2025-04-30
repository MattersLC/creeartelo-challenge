import 'dart:convert';

import 'package:creeartelo_challenge/core/database/database_helper.dart';
import 'package:creeartelo_challenge/models/event.dart';
import 'package:flutter/services.dart';

class Eventservice {
  Future<List<Event>> getFavoriteEvents() async {
    final result = DatabaseHelper.instance.getEvents();

    return result;
  }

  /*Future<List<Event>> getEvents() async {
    final jsonString = await rootBundle.loadString('assets/events.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList.map((e) => Event.fromMap(e)).toList();
  }*/
  Future<List<Event>> getEvents() async {
    final jsonString = await rootBundle.loadString('assets/events.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    final List<Event> events = jsonList.map((e) => Event.fromMap(e)).toList();

    // Get favorite event IDs from the local database
    final favoriteIds = await DatabaseHelper.instance.getFavoriteEventIds();

    // Mark favorites based on DB
    for (final event in events) {
      if (favoriteIds.contains(event.id)) {
        event.isFavorite = true;
      }
    }

    return events;
  }

  Future<bool> saveFavorite(Event event) async {
    final result = await DatabaseHelper.instance.saveFavorite(event);
    return result;
  }

  Future<bool> deleteFavorite(int id) async {
    final result = await DatabaseHelper.instance.deleteFavorite(id);
    return result;
  }
}
