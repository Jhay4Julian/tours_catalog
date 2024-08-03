import 'package:flutter/material.dart';
import 'package:tours_catalog/components/tour_card.dart';

class ToursPage extends StatefulWidget {
  const ToursPage({super.key});

  @override
  State<ToursPage> createState() => _ToursPageState();
}

class _ToursPageState extends State<ToursPage> {
  //list of tour cards
  final List<Map<String, String>> _defaultTours = [
    {
      'tourTitle': 'Best of Paris in 7 Days Tour',
      'details':
          "Paris is synonymous with the finest things that culture can offer — in art, fashion, food, literature, and ideas. On this tour, your Paris-savvy Rick Steves guide will immerse you in the very best of the City of Light: the masterpiece-packed Louvre and Orsay museums, resilient Notre-Dame Cathedral, exquisite Sainte-Chapelle, and extravagant Palace of Versailles. You'll also enjoy guided neighborhood walks through the city's historic heart as well as quieter moments to slow down and savor the city's intimate cafés, colorful markets, and joie de vivre. Join us for the Best of Paris in 7 Days!",
      'image': 'assets/images/paris.jpeg',
      'price': '1,995',
    },
    {
      'tourTitle': 'Best of Ireland in 14 Days Tour',
      'details':
          "Rick Steves' Best of Ireland tour kicks off with the best of Dublin, followed by Ireland's must-see historical sites, charming towns, music-filled pubs, and seaside getaways — including Kinsale, the Dingle Peninsula, the Cliffs of Moher, the Aran Islands, Galway, Connemara, Giant's Causeway, and the compelling city of Belfast. All along the way, Rick's guides will share their stories to draw you in to the Emerald Isle, and the friendliness of the people will surely steal your heart. Join us for the Best of Ireland in 14 Days!",
      'image': 'assets/images/ireland.jpeg',
      'price': '3,895',
    },
    {
      'tourTitle': 'Best of Salzburg & Vienna in 8 Days Tour',
      'details':
          "Let's go where classical music, towering castles, and the-hills-are-alive scenery welcome you to the gemütlichkeit of Bavaria and opulence of Austria's Golden Age. Your Rick Steves guide will bring this region's rich history and culture to life in festive Munich, Baroque Salzburg, sparkling Lake Hallstatt, monastic Melk, the blue Danube, and royal Vienna — with cozy villages and alpine vistas all along the way. Join us for the Best of Munich, Salzburg & Vienna in 8 Days!",
      'image': 'assets/images/vienna.jpeg',
      'price': '2,695',
    },
    {
      'tourTitle': 'Best of Rome in 7 Days Tour',
      'details':
          "Our Rome tour serves up Europe's most intoxicating brew of dazzling art, earth-shaking history, and city life with style. On this Rome vacation, your tour guide will resurrect the grandeur of ancient Rome's Colosseum, Forum, Pantheon, and nearby Ostia Antica. From the Renaissance and Baroque eras, you'll marvel at St. Peter's Basilica, the Vatican Museums, Sistine Chapel, and Borghese Gallery. You'll also enjoy today's Rome, with neighborhood walking _tourList, memorable restaurants, and time to explore on your own. Join us for the Best of Rome in 7 Days!",
      'image': 'assets/images/rome.jpeg',
      'price': '2,095',
    },
    {
      'tourTitle': 'Best of Poland in 10 Days Tour',
      'details':
          "Starting in the colorful port city of Gdańsk, you'll escape the crowds and embrace the understated elegance of ready-for-prime-time Poland for 10 days. With an expert Rick Steves guide at your side, you'll experience mighty Malbork castle, the cobbly-cute village of Toruń, Poland's contemporary capital of Warsaw, the spiritual Jasna Góra Monastery, and charming Kraków — Poland's finest city. In this land of surprises — so trendy and hip, yet steeped in history — there's so much to discover. Join us for the Best of Poland in 10 Days!",
      'image': 'assets/images/poland.jpeg',
      'price': '2,595',
    },
  ];

  List<Map<String, String>> tours = [];

  @override
  void initState() {
    super.initState();
    tours = List.from(_defaultTours);
  }

  // refresh
  void _refreshDefaultTours() {
    setState(() {
      tours = List.from(_defaultTours);
    });
  }

  // remove tour card option
  void _removeCard(index) {
    setState(() {
      tours.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: tours.isEmpty
            ? Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'No Tours Left',
                      style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: _refreshDefaultTours,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF10b981),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 0.4,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                        child: const Text(
                          'Refresh',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Text(
                          'Our Tours',
                          style: TextStyle(
                              fontSize: 33, fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            height: 5,
                            width: 90,
                            color: const Color(0xFF10b981),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: tours.length,
                      itemBuilder: (BuildContext context, index) {
                        return TourCard(
                          image: tours[index]['image']!,
                          tourTitle: tours[index]['tourTitle']!,
                          details: tours[index]['details']!,
                          price: tours[index]['price']!,
                          removeCard: () => _removeCard(index),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
