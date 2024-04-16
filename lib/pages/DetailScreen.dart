import 'package:flutter/material.dart';

import 'package:dal/pages/HomeScreen.dart'; // Importing the Place class

class DetailScreen extends StatelessWidget {
  final Place place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 200, // Adjust the height according to your UI design
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: place.photoReferences.length,
                itemBuilder: (context, index) {
                  final imageUrl =
                      'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${place.photoReferences[index]}&key=AIzaSyA7KUC5SrwoA9wqdOyhpkG0Kic5X96GjqM';
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    place.description ?? 'No description available',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Reviews',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: place.reviews?.length ?? 0,
                      itemBuilder: (context, index) {
                        final review = place.reviews?[index] ?? '';
                        return ListTile(
                          title: Text(review),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
     ),
);
}
}