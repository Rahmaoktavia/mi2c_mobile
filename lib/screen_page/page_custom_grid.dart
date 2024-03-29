import 'package:flutter/material.dart';

import 'detail_grid.dart';

class CustomeGrid extends StatefulWidget {
  const CustomeGrid({super.key});
  @override
  State<CustomeGrid> createState() => _CustomeGridState();
}
class _CustomeGridState extends State<CustomeGrid> {
  List<Map<String, dynamic>> listMovie = [
    {
      "judul": "Ciao Alberto",
      "gambar": "film1.jpeg",
      "harga": 45000,
    },
    {
      "judul": "The Simpson",
      "gambar": "film2.jpeg",
      "harga": 35000,
    },
    {
      "judul": "Jungle Cruise",
      "gambar": "film3.jpeg",
      "harga": 50000,
    },
    {
      "judul": "Home Alone",
      "gambar": "film4.jpeg",
      "harga": 45000,
    },
    {
      "judul": "Korea Action",
      "gambar": "film5.jpeg",
      "harga": 35000,
    },
    {
      "judul": "A Monster Calls",
      "gambar": "film6.jpeg",
      "harga": 45000,
    },
    {
      "judul": "Ciao Alberto",
      "gambar": "film1.jpeg",
      "harga": 45000,
    },
    {
      "judul": "The Simpson",
      "gambar": "film2.jpeg",
      "harga": 35000,
    },
    {
      "judul": "Jungle Cruise",
      "gambar": "film3.jpeg",
      "harga": 50000,
    },
    {
      "judul": "Home Alone",
      "gambar": "film4.jpeg",
      "harga": 45000,
    },
    {
      "judul": "Korea Action",
      "gambar": "film5.jpeg",
      "harga": 35000,
    },
    {
      "judul": "A Monster Calls",
      "gambar": "film6.jpeg",
      "harga": 45000,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custome Grid"),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
          itemCount: listMovie.length,
          gridDelegate: const
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            DetailGrid(listMovie[index])));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridTile(
                    footer: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color:
                          Colors.black)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${listMovie[index]["judul"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text("Rp. ${listMovie[index]["harga"]}")
                        ],
                      ),
                    ),
                    child:
                    Image.asset("gambar/${listMovie[index]["gambar"]}")),
              ),
            );
          }),
    );
  }
}