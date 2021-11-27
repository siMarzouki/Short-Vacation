import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../data/data.dart';

class DestinationsWidget extends StatefulWidget {
  final int selectedDestination;
  final Function updateSelectedDestination;
  const DestinationsWidget(
      this.selectedDestination, this.updateSelectedDestination,
      {Key? key})
      : super(key: key);

  @override
  _DestinationsWidgetState createState() => _DestinationsWidgetState();
}

class _DestinationsWidgetState extends State<DestinationsWidget> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: mq.width * 0.05, top: mq.height * 0.04),
          child: Text(
            'Top Destinations',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black87,
              fontSize: mq.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: mq.height * 0.44,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () {
                  widget.updateSelectedDestination(index);
                },
                child: Container(
                  margin: EdgeInsets.all(mq.width * 0.025),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: widget.selectedDestination == index
                              ? mq.width * 0.01
                              : 0,
                          color: Colors.blueAccent),
                    ),
                  ),
                  width: mq.width * 0.51,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: mq.height * 0.022,
                        child: Container(
                          height: mq.height * 0.18,
                          width: mq.width * 0.49,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(mq.width * 0.025),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${destination.activities.length} Days',
                                  style: TextStyle(
                                    fontSize: mq.width * 0.053,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  "${destination.city}  is ready and open to welcome all visitors. ",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(mq.width * 0.05),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(mq.width * 0.05),
                              child: Image(
                                height: mq.height * 0.26,
                                width: mq.width * 0.47,
                                image: AssetImage(destination.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: mq.width * 0.025,
                              bottom: mq.width * 0.025,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    destination.city,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mq.width * 0.06,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_city,
                                        size: mq.width * 0.025,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        destination.country,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
