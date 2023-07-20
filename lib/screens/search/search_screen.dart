import 'package:part_it/screens/event/event_screen.dart';
import 'package:part_it/utils/util_functions.dart';
import 'package:flutter/material.dart';
import '../event/event_list.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});
  String value = '';
  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  @override
  void initState() {
    widget.value = '';
  }

  @override
  Widget build(BuildContext context) {
    final iconSize = heightContext(context) * 0.22;
    var eventScreen = EventList(url: getApiURL(widget.value));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        title: const Text(
          "Search",
          textAlign: TextAlign.left,
        ),
        shadowColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                /* */
                padding: EdgeInsets.fromLTRB(widthContext(context) * 0.01, 0,
                    widthContext(context) * 0.01, 0),
                child: const Icon(
                  Icons.search,
                  color: Colors.blue,
                  size: 24,
                ),
              ),
              Container(
                padding: EdgeInsets.all(widthContext(context) * 0.01),
                width: widthContext(context) * 0.8,
                height: heightContext(context) * 0.1,
                child: TextField(
                  onChanged: (text) => {
                    setState(() {
                      widget.value = text;
                      eventScreen = EventList(url: getApiURL(widget.value));
                    })
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type Event Name',
                      hintStyle: const TextStyle(
                        fontFamily: "Inter",
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 206, 206, 206),
                        height: 18 / 20,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: heightContext(context) * 0.75,
            width: heightContext(context) * 0.75,
            child: Expanded(flex: 1, child: eventScreen),
          ),
        ],
      ),
    );
  }
}
