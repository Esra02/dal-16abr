import 'dart:convert';

import 'package:dal/pages/DetailScreen.dart';
import 'package:dal/pages/historypage.dart';
import 'package:dal/pages/userprofilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final String uid; // Define uid parameter

  const HomeScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Place>> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = fetchPlaces();
  }

  Future<List<Place>> fetchPlaces() async {
    const apiKey = 'AIzaSyA7KUC5SrwoA9wqdOyhpkG0Kic5X96GjqM';
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=24.471153,39.6111216&radius=1000&type=restaurant&key=$apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> places = data['results'];
      return places.map((place) {
        final List<String> photoReferences = [];
        if (place.containsKey('photos')) {
          final List<dynamic> photos = place['photos'];
          photoReferences.addAll(
              photos.map((photo) => photo['photo_reference'].toString()));
        }
        return Place(
          name: place['name'].toString(),
          photoReferences: photoReferences,
          rating:
              place.containsKey('rating') ? place['rating'].toDouble() : 0.0,
          category: place.containsKey('types')
              ? place['types'][0].toString()
              : 'Unknown',
          description: place.containsKey('description')
              ? place['description']
                  .toString() // Assuming description exists in the API response
              : 'No description available', // Provide a default value if description is missing
          reviews: place.containsKey('reviews')
              ? List<String>.from(place[
                  'reviews']) // Assuming reviews exist in the API response
              : [], // Provide an empty list if reviews are missing
        );
      }).toList();
    } else {
      throw Exception('Failed to load places');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Places'),
      ),
      body: FutureBuilder<List<Place>>(
        future: _placesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Place> places = snapshot.data ?? [];
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: places.length,
              itemBuilder: (BuildContext context, int index) {
                final place = places[index];
                final imageUrl = place.photoReferences.isNotEmpty
                    ? 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${place.photoReferences[0]}&key=AIzaSyA7KUC5SrwoA9wqdOyhpkG0Kic5X96GjqM'
                    : 'assets/placeholder_image.jpg';
                return CustomItem(
                  imageUrl: imageUrl,
                  itemName: place.name,
                  rating: place.rating,
                  category: place.category,
                  place: place, // Provide the place argument here
                );
              },
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to favorites or perform desired action
              },
            ),
            IconButton(
              icon: const Icon(Icons.bookmark),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  final String imageUrl;
  final String itemName;
  final double rating;
  final String category;
  final Place place; // Define place here

  const CustomItem({
    Key? key,
    required this.imageUrl,
    required this.itemName,
    required this.rating,
    required this.category,
    required this.place, // Update the constructor to include place
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(place: place), // Pass place to DetailScreen
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 73, 72, 72).withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  itemName,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16.0),
                    const SizedBox(width: 4.0),
                    Text(
                      '$rating',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Category: $category',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Place {
  final String name;
  final List<String> photoReferences;
  final double rating;
  final String category;
  final String description; // Adding 'description' parameter
  final List<String> reviews; // Adding 'reviews' parameter

  Place({
    required this.name,
    required this.photoReferences,
    required this.rating,
    required this.category,
    required this.description,
    required this.reviews,
  });
}
