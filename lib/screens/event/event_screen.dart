import 'package:flutter/material.dart';
import './event_schema.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key, required this.data});
  final Event data;

  @override
  State<EventScreen> createState() => _EventScreen();
}

class _EventScreen extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    var value = "";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          title: const Text("Event Details"),
          shadowColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.data.bannerImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: SizedBox(
        width: 271,
        height: 58,
        child: FloatingActionButton(
          onPressed: () {},
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: Text(
                "BOOK NOW",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Inter",
                  height: 19 / 16,
                ),
              )),
              Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.data.title, style: const TextStyle(fontSize: 40)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: [
                    Image.network(
                      widget.data.organiserIcon,
                      width: 50,
                      height: 50,
                    ),
                    const VerticalDivider(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.data.organiserName,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black)),
                        const Text("Organizer",
                            style: TextStyle(fontSize: 11, color: Colors.grey))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  children: [
                    const VerticalDivider(width: 8),
                    const Icon(
                      Icons.calendar_month_sharp,
                      size: 30,
                      color: Color(0xFF5C6BC0),
                    ),
                    const VerticalDivider(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${widget.data.dateTime['date']} ${widget.data.dateTime['month']}, ${widget.data.dateTime['year']}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black)),
                        Text(
                            '${widget.data.dateTime['day']}, ${widget.data.dateTime['hour']}:${widget.data.dateTime['minute']} PM',
                            style: const TextStyle(
                                fontSize: 11, color: Colors.grey))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  children: [
                    const VerticalDivider(width: 8),
                    const Icon(
                      Icons.location_pin,
                      size: 30,
                      color: Color(0xFF5C6BC0),
                    ),
                    const VerticalDivider(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.data.venueName,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black)),
                        Text(
                            '${widget.data.venueCity}, ${widget.data.venueCountry}',
                            style: TextStyle(fontSize: 11, color: Colors.grey))
                      ],
                    )
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(12)),
              const Text("About Event",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      height: 34 / 18,
                      color: Colors.black)),
              const Padding(padding: EdgeInsets.all(10)),
              Text(
                widget.data.description,
                softWrap: true,
                style: const TextStyle(),
                maxLines: 6,
                overflow: TextOverflow.clip,
              )
            ],
          ),
        ),
      ),
    );
  }
}
