import 'package:flutter/material.dart';
import 'package:live_project_flutter/DataSource.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget myNewsCard(int index) {
    return Card(
      child: Column(
        children: [
          Image.network(
            DataSources.myNews[index]['image'],
            height: 80,
          ),
          Text(
            DataSources.myNews[index]['headline'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Feeds')),
      body: OrientationBuilder(builder: (context, orientation) {
        return
          orientation == Orientation.landscape ? GridView.builder(
            itemCount: DataSources.myNews.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => myNewsCard(index),) : ListView.builder(
            itemCount: DataSources.myNews.length,
            itemBuilder: (context, index) => myNewsCard(index),);
      },),
    );
  }
}
