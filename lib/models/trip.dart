class Trip {
  int destinationIndex;
  DateTime date;

  Trip({
    required this.destinationIndex,
    required this.date,
  });
  static final List<Trip> _trips = [];

  static void addTrip(int destinationIndex, DateTime date) {
    _trips.add(Trip(destinationIndex: destinationIndex, date: date));
  }

  static void removeTrip(int index) {
    _trips.removeAt(index);
  }

  static List<Trip> getTrips() {
    return _trips;
  }
}
