import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 2, 3, 71)),
          title: SizedBox(
            height: 40,
            child: Image.asset('images/logo.svg'),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  'Texto à Direita',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: MovieCarousel(),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Mais Filmes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: MovieList(),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCarousel extends StatelessWidget {
  final List<String> imgList = [
    'images/Eternal Sunshine of the Spotless Mind.jpg',
    'images/homem que dorme.jpg',
    'images/lahaine.jpg',
    'images/The Worst Person in the World (2021).jpg',
  ];

  final List<String> captions = [
    'Eternal Sunshine of the Spotless Mind',
    'Homem que Dorme',
    'La Haine',
    'The Worst Person in the World (2021)',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 400,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: imgList.asMap().entries.map((entry) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Image.asset(
                        entry.value,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      captions[entry.key],
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<String> otherMovies = [
    'The Shawshank Redemption',
    'The Godfather',
    'The Dark Knight',
    'Pulp Fiction',
    'Schindler\'s List',
    'Forrest Gump',
    'Inception',
    'Fight Club',
    // Add more movies here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: otherMovies.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(otherMovies[index]),
        );
      },
    );
  }
}

void main() {
  runApp(MyApp());
}
