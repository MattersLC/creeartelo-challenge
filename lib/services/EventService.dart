import 'package:creeartelo_challenge/core/database/DatabaseHelper.dart';
import 'package:creeartelo_challenge/models/event.dart';

class Eventservice {
  Future<List<Event>> getEvents() async {
    final result = DatabaseHelper.instance.getEvents();

    return result;
  }
}
