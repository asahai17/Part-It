import 'package:part_it/screens/search/search_screen.dart';
import 'package:part_it/utils/util_functions.dart';
import 'package:flutter/material.dart';
import '../event/event_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: customTextB(
            content: widget.title,
            size: heightContext(context) * 0.03,
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          titleTextStyle: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
              height: 29 / 24),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: InkWell(
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen())),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: InkWell(
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        body: EventList(
          url: getApiURL(''),
        ));
  }
}
