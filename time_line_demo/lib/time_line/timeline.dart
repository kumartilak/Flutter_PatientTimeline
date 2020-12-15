import 'package:flutter/material.dart';
import 'package:time_line_demo/detailed_page.dart';
import 'package:time_line_demo/service/models/patient_data.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import '../data.dart';

class TimelinePage extends StatefulWidget {
  TimelinePage({Key key, this.patient}) : super(key: key);
  final Patient patient;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final PageController pageController =
      PageController(initialPage: 1, keepPage: true);
  int pageIx = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      timelineModel(TimelinePosition.Left),
      timelineModel(TimelinePosition.Center),
      timelineModel(TimelinePosition.Right)
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.patient.name),
        ),
        body: PageView(
          onPageChanged: (i) => setState(() => pageIx = i),
          controller: pageController,
          children: pages,
        ));
  }

  timelineModel(TimelinePosition position) => Timeline.builder(
      itemBuilder: centerTimelineBuilder,
      itemCount: events.length,
      physics: position == TimelinePosition.Left
          ? ClampingScrollPhysics()
          : BouncingScrollPhysics(),
      position: position);

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final event = events[i];
    final textTheme = Theme.of(context).textTheme;
    return TimelineModel(
        Card(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailsPage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.network(event.urlToImage),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(event.time, style: textTheme.caption),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    event.name,
                    style: textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        position:
            i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
        isFirst: i == 0,
        isLast: i == events.length,
        iconBackground: event.iconBackground,
        icon: event.icon);
  }
}
