import 'package:flutter/material.dart';

class DetailGrid extends StatelessWidget {
  final Map<String, dynamic> movieDetails;

  const DetailGrid(this.movieDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(movieDetails["judul"]),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Judul: ${movieDetails["judul"]}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Harga: Rp. ${movieDetails["harga"]}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            // Tambahkan detail lainnya di sini sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}