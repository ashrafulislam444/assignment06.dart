import 'package:flutter/material.dart';

void main() {
  runApp(MyPhotoGallery());
}

class MyPhotoGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Gallery"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Welcome to My Photo Gallery!", style: TextStyle(
                fontSize: 25.0,
                fontWeight:FontWeight.bold,
              ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for photos...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Image ${index + 1} clicked"),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3.0,
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          getImageUrl(index),
                          height: 80,
                          width: 80,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Photo ${index + 1}"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/premium-photo/cute-boy-pixar-style-cartoon-3d-illustration-generative-ai_808510-252.jpg"),
              ),
              title: Text("Photo 1"),
              subtitle: Text("Description for photo 1"),
            ),

            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/premium-photo/3d-cartoon-little-boy-red-hair-freckled-face-glasses-white-background_812426-4592.jpg"),
              ),
              title: Text("Photo 2"),
              subtitle: Text("Description for photo 2"),
            ),

            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/premium-photo/3d-cartoon-little-boy-red-hair-freckled-face-glasses-white-background_812426-4510.jpg?w=360"),
              ),
              title: Text("Photo 3"),
              subtitle: Text("Description for photo 3"),
            ),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Photos Uploaded Successfully!"),
                  ),
                );
              },
              child: Icon(Icons.upload,),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
              ),

            ),
          ],
        ),
      ),
    );

  }

  String getImageUrl(int index) {
    final imageUrls = [
      "https://img.freepik.com/premium-photo/cute-boy-pixar-style-cartoon-3d-illustration-generative-ai_808510-252.jpg",
      "https://img.freepik.com/premium-photo/3d-cartoon-little-boy-red-hair-freckled-face-glasses-white-background_812426-4592.jpg",
      "https://img.freepik.com/premium-photo/3d-cartoon-little-boy-red-hair-freckled-face-glasses-white-background_812426-4510.jpg?w=360",
      "https://img.freepik.com/premium-photo/3d-cartoon-little-boy-red-hair-freckled-face-glasses-white-background_812426-4987.jpg?w=2000",
      "https://img.freepik.com/premium-photo/3d-cartoon-little-boy-red-hair-freckled-face-glasses-white-background_812426-5121.jpg?w=2000",
      "https://img.freepik.com/premium-photo/3d-cartoon-little-boy-red-hair-freckled-face-glasses-white-background_812426-4492.jpg",
    ];

    if (index >= 0 && index < imageUrls.length) {
      return imageUrls[index];
    }
    return 'getImageUrl(index)';
  }
}
