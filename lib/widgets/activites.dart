import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/activity.dart';

class ActivitiesWidget extends StatefulWidget {
  final int selectedDestination;
  const ActivitiesWidget(this.selectedDestination, {Key? key})
      : super(key: key);

  @override
  _ActivitiesWidgetState createState() => _ActivitiesWidgetState();
}

class _ActivitiesWidgetState extends State<ActivitiesWidget> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SizedBox(
      height: mq.height * 0.3,
      child: ListView.builder(
        itemCount: destinations[widget.selectedDestination].activities.length,
        itemBuilder: (ctx, idx) {
          Activity act =
              destinations[widget.selectedDestination].activities[idx];
          return Container(
              margin: EdgeInsets.symmetric(
                  horizontal: mq.width * 0.03, vertical: mq.height * 0.005),
              padding: EdgeInsets.symmetric(
                  horizontal: mq.width * 0.03, vertical: mq.height * 0.005),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mq.width * 0.01),
                  color: Colors.white54,
                  border: Border.all(width: 1, color: Colors.blueGrey)),
              child: Row(
                children: [
                  Image.asset(
                    act.imageUrl,
                    width: mq.width * 0.3,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(
                    width: mq.width * 0.03,
                  ),
                  SizedBox(
                    width: mq.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Day ${idx + 1}",
                          style: TextStyle(
                              fontSize: mq.width * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(act.name,
                            style: TextStyle(
                                fontSize: mq.width * 0.04,
                                fontWeight: FontWeight.w400)),
                        Text(
                          "Duration : ${act.duration} h",
                          style: const TextStyle(color: Colors.blueAccent),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
