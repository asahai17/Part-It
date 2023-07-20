import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'event_schema.dart';
import 'event_view.dart';
import '../../utils/util_functions.dart';

class EventList extends StatefulWidget {
  EventList({super.key, required this.url});
  String url;
  @override
  State<EventList> createState() => _EventList();
}

class _EventList extends State<EventList> {
  List<Event> eventData = [];
  List<Widget> allEvents = [];

  // API Fetch
  Future<List<Widget>> fetchEvents() async {
    final response = await http.get(Uri.parse(widget.url));
    List<Event> eventList = [];
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body)['content'];
      eventList = List<Event>.from(
          jsonData['data'].map((event) => Event.fromJson(event)));
    }
    setState(() {
      eventData = eventList;
      allEvents = getEventWidget();
    });
    return allEvents;
  }

  // Getting Event Widget List
  List<Widget> getEventWidget() {
    List<Widget> temp = [];
    for (var i = 0; i < eventData.length; i++) {
      temp.add(EventView(
        data: eventData[i],
      ));
    }
    return temp;
  }

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: allEvents,
    );
  }
}
