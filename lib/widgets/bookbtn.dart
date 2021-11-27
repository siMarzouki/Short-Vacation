import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookBtn extends StatelessWidget {
  final String city;
  final int days;
  final Function bookTrip;
  final int index;
  const BookBtn(this.index, this.city, this.days, this.bookTrip, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    var mq = MediaQuery.of(context).size;
    return platform == TargetPlatform.iOS
        ? CupertinoButton(
            child: const Text(
              "Book Now",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            color: const Color.fromRGBO(253, 199, 53, 1),
            onPressed: () {
              openBookingForm(
                  context, mq, city, days, bookTrip, index, platform);
            })
        : Container(
            height: mq.height * 0.07,
            alignment: Alignment.centerRight,
            child: OutlinedButton(
              onPressed: () {
                openBookingForm(
                    context, mq, city, days, bookTrip, index, platform);
              },
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(253, 199, 53, 1),
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              child: const Text(
                "Book Now",
              ),
            ),
          );
  }
}

void openBookingForm(BuildContext context, Size mq, String city, int days,
    Function bookTrip, int index, TargetPlatform platform) {
  DateTime selectedDate = DateTime.now();
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black87,
      builder: (ctx) {
        return StatefulBuilder(builder: (ctx, setMBSState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(mq.width * 0.03)),
                padding: EdgeInsets.all(mq.width * 0.02),
                child: Text("$city |$days Days",
                    style: TextStyle(
                        fontSize: mq.width * 0.07,
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: mq.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}",
                    style: TextStyle(
                        fontSize: mq.width * 0.07,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  OutlinedButton(
                      onPressed: () async {
                        if (platform == TargetPlatform.iOS) {
                          showCupertinoModalPopup(
                              context: ctx,
                              builder: (_) => Container(
                                    height: mq.height * 0.35,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: mq.height * 0.25,
                                          child: CupertinoDatePicker(
                                              initialDateTime: DateTime.now(),
                                              maximumDate: DateTime.now().add(
                                                  const Duration(days: 90)),
                                              mode:
                                                  CupertinoDatePickerMode.date,
                                              onDateTimeChanged: (val) {
                                                setMBSState(() {
                                                  selectedDate = val;
                                                });
                                              }),
                                        ),

                                        // Close the modal
                                        CupertinoButton(
                                          child: const Text('OK'),
                                          onPressed: () =>
                                              Navigator.of(ctx).pop(),
                                        )
                                      ],
                                    ),
                                  ));
                        } else {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            currentDate: DateTime.now(),
                            initialDate: selectedDate,
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 90)),
                          );
                          if (pickedDate != null &&
                              pickedDate != selectedDate) {
                            setMBSState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        }
                      },
                      child: const Text(("select Date"))),
                ],
              ),
              SizedBox(
                height: mq.height * 0.1,
              ),
              TextButton(
                  onPressed: () {
                    bookTrip(index, selectedDate);
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: ThemeData().primaryColor),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          );
        });
      });
}
