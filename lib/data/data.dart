import '../models/activity.dart';
import '../models/destination.dart';

List<List<Activity>> activities = [
  [
    Activity(
        imageUrl: "assets/images/c1a1.jpg",
        name: "Stonehenge and Windsor Castle",
        duration: 11),
    Activity(
        imageUrl: "assets/images/c1a2.jpg",
        name: "Harry Potter Tour of Warner Bros. Studio",
        duration: 7),
    Activity(
        imageUrl: "assets/images/c1a3.jpg",
        name: "Private Highlights Tour of London",
        duration: 8),
    Activity(
        imageUrl: "assets/images/c1a4.jpg",
        name: "Private Day Tour to Oxford and The Cotswolds",
        duration: 10),
  ],
  [
    Activity(
        imageUrl: "assets/images/c2a1.jpg",
        name: "Half Day Dubai City Sightseeing Tour",
        duration: 5),
    Activity(
        imageUrl: "assets/images/c2a2.jpg",
        name: "Premium Red Dunes & Camel Safari",
        duration: 7),
    Activity(
        imageUrl: "assets/images/c2a3.jpg",
        name:
            "Jet Ski Tour of Dubai: Burj Al Arab, Dubai Marina, Atlantis, Palm & Burj Khalifa",
        duration: 2),
  ],
  [
    Activity(
        imageUrl: "assets/images/c3a1.jpg",
        name: "New York City Harbor Lights Cruise",
        duration: 2),
    Activity(
        imageUrl: "assets/images/c3a2.jpg",
        name: "Empire State Building General & Skip-the-Line Tickets",
        duration: 1),
  ],
  [
    Activity(
        imageUrl: "assets/images/c4a1.jpg",
        name:
            "Istanbul Lunch Cruise: Long Circle Bosphorus Cruise up to Black Sea",
        duration: 3),
    Activity(
        imageUrl: "assets/images/c4a2.jpg",
        name: "Bosphorus Cruise Boat Tour",
        duration: 4),
    Activity(
        imageUrl: "assets/images/c4a3.jpg",
        name: "Istanbul Full Day Old City Tour",
        duration: 7),
  ],
  [
    Activity(
        imageUrl: "assets/images/c5a1.jpg",
        name: "Tokyo by Night: Japanese Food Small Group",
        duration: 3),
    Activity(
        imageUrl: "assets/images/c5a2.jpg",
        name: "Exciting Nikko ",
        duration: 5),
  ],
  [
    Activity(
        imageUrl: "assets/images/c6a1.jpg",
        name: "Louvre Reserved Access Ticket & Cruise",
        duration: 7),
    Activity(
        imageUrl: "assets/images/c6a2.jpg",
        name: "Eiffel Tower Skip the Line and Small Group Tour",
        duration: 5),
    Activity(
        imageUrl: "assets/images/c6a3.jpg",
        name: "Versailles Palace Guided Tour",
        duration: 4),
    Activity(
        imageUrl: "assets/images/c6a4.jpg",
        name: "Loire Valley Three Top Castles ",
        duration: 6),
  ]
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/london.jpg',
    city: 'London',
    country: 'UK',
    activities: activities[0],
  ),
  Destination(
    imageUrl: 'assets/images/dubai.jpg',
    city: 'Dubai',
    country: 'UAE',
    activities: activities[1],
  ),
  Destination(
    imageUrl: 'assets/images/newyork.png',
    city: 'New York',
    country: 'United States',
    activities: activities[2],
  ),
  Destination(
    imageUrl: 'assets/images/istanbul.jpg',
    city: 'Istanbul',
    country: 'Turkey',
    activities: activities[3],
  ),
  Destination(
    imageUrl: 'assets/images/tokyo.jpg',
    city: 'Tokyo',
    country: 'Japan',
    activities: activities[4],
  ),
  Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: 'Paris',
    country: 'France',
    activities: activities[5],
  ),
];
