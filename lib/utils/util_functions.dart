import 'package:flutter/material.dart';

String getApiURL(String input) {
  String apiURL =
      'https://sde-007.api.assignment.theinternetfolks.works/v1/event';
  if (input == '') {
    return apiURL;
  }
  String answer =
      'https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=<$input>';
  return answer;
}

// All related to date/time

Map monthName = {
  1: 'January',
  2: 'Febuary',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December',
};

Map weekDays = {
  1: 'Sunday',
  2: 'Monday',
  3: 'Tuesday',
  4: 'Wednesday',
  5: 'Thursday',
  6: 'Friday',
  7: 'Saturday'
};

String customNumToString(int num) {
  String answer = '0' + num.toString();
  return num < 10 ? answer : num.toString();
}

Map customDateTimeFormat(String dateStr) {
  DateTime temp = DateTime.parse(dateStr);

  Map dateTimeTemp = {
    'year': temp.year.toString(),
    'day': weekDays[temp.weekday],
    'dayShort': weekDays[temp.weekday].substring(0, 3),
    'month': monthName[temp.month],
    'monthShort': monthName[temp.month].substring(0, 3),
    'date': customNumToString(temp.day),
    'hour': customNumToString(temp.hour),
    'minute': customNumToString(temp.minute),
  };

  return dateTimeTemp;
}

DateTime converDateFormat(String dateStr) {
  return DateTime.parse(dateStr);
}

// Functions for size Query

double heightContext(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double widthContext(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

// Functions for custom Text Scheme

Widget customText(
    {required String content,
    required FontWeight weight,
    required double size,
    required Color color}) {
  return Text(
    content,
    style: TextStyle(
      fontWeight: weight,
      fontSize: size,
      color: color,
    ),
  );
}

Widget customTextA({required String content, required double size}) {
  return customText(
    content: content,
    color: Colors.grey,
    weight: FontWeight.normal,
    size: size,
  );
}

Widget customTextB({required String content, required double size}) {
  return customText(
    content: content,
    color: Colors.black,
    weight: FontWeight.bold,
    size: size,
  );
}

Widget customTextC({required String content, required double size}) {
  return customText(
    content: content,
    color: Colors.black,
    weight: FontWeight.bold,
    size: size,
  );
}

Widget customTextD({required String content, required double size}) {
  return customText(
    content: content,
    color: const Color.fromARGB(255, 102, 122, 235),
    weight: FontWeight.normal,
    size: size,
  );
}

// Custom ListItem for ListView

Widget customListItem(
    {required BuildContext context,
    required List<Widget> children,
    required String url,
    required double factor}) {
  final double height = heightContext(context);
  final double width = widthContext(context);

  final double imageHeight = height * factor;
  final double imageWidth = height * factor;

  return Container(
    decoration: const BoxDecoration(color: Colors.white),
    child: Row(
      children: [
        SizedBox(
            width: imageHeight,
            height: imageWidth,
            child: Padding(
              padding: EdgeInsets.all(imageWidth * 0.1),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(imageWidth * 0.1),
                  image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
        Container(
          padding: EdgeInsets.all(imageWidth * 0.1),
          height: imageWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          ),
        )
      ],
    ),
  );
}
