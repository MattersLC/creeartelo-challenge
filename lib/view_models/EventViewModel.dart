import 'package:creeartelo_challenge/models/event.dart';
import 'package:creeartelo_challenge/services/EventService.dart';
import 'package:flutter/material.dart';

class Eventviewmodel extends ChangeNotifier {
  final Eventservice _service = Eventservice();
  List<Event> _events = [];
  List<Event> get events => _events;

  Future<void> fetchEvents() async {
    _events = await _service.getEvents();
    notifyListeners();
  }

  List<Event> filteredEvents(String query) {
    return _events;
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
