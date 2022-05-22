import 'package:machine_test/models/event.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/private_keys.dart';

class LocalPrefService {
  late SharedPreferences prefs;
  Future<void> initialPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveEvent(EventModel event) async {
    final List<EventModel> eventsCatch = fetchEvents();
    final List<String> stringEvents = [];
    for (final EventModel item in eventsCatch) {
      stringEvents.add(item.toString());
    }
    stringEvents.add(event.toString());
    await prefs.setStringList(
      LocalPrefKeys.saveEventKey,
      stringEvents,
    );
  }

  List<EventModel> fetchEvents() {
    List<EventModel> events = [];
    final List<String>? result = prefs.getStringList(
      LocalPrefKeys.saveEventKey,
    );
    if (result != null && result.isNotEmpty) {
      events = result.map((e) => EventModel().toModel(e)).toList();
    }
    return events;
  }
}
