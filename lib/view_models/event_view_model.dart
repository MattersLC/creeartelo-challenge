import 'package:creeartelo_challenge/models/event.dart';
import 'package:creeartelo_challenge/services/event_service.dart';
import 'package:flutter/material.dart';

class EventViewModel extends ChangeNotifier {
  final Eventservice _service = Eventservice();
  List<Event> _events = [];
  List<Event> get events => _events;

  Future<void> fetchEvents() async {
    _events = await _service.getEvents();
    notifyListeners();
  }

  Future<List<Event>> fetchFavoritesEvents() async {
    return await _service.getFavoriteEvents();
  }

  List<Event> filteredEvents(String query) {
    if (query.isEmpty) return _events;
    List<Event> filtered = _events
        .where(
            (event) => event.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filtered;
  }

  void toggleFavorite(Event event) async {
    event.isFavorite = !event.isFavorite;
    if (event.isFavorite) {
      await _service.saveFavorite(event);
    } else {
      await _service.deleteFavorite(event.id);
    }
    notifyListeners();
  }

  void searchEvents(String query) {
    if (query.isEmpty) {
      _events = _events;
    } else {
      _events = _events
          .where(
              (event) => event.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
