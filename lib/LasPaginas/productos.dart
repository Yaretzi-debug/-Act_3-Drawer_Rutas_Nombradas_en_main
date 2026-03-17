import 'package:flutter/material.dart';

class ProductosPage extends StatelessWidget {
  const ProductosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuestros Productos 🍰'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: <Widget>[
          _buildCard(
            context,
            'Pastel de Fresa',
            'https://i.pinimg.com/564x/f3/94/c3/f394c34af34a3657743999901768c683.jpg',
          ),
          _buildCard(
            context,
            'Macarons de Ensueño',
            'https://i.pinimg.com/564x/8e/3c/2d/8e3c2de41efb23d15197825d506eee16.jpg',
          ),
          _buildCard(
            context,
            'Cupcakes Coquette',
            'https://i.pinimg.com/564x/4e/b2/1e/4eb21e57c6b541743521e12720b08053.jpg',
          ),
          _buildCard(
            context,
            'Tarta de Arándanos',
            'https://i.pinimg.com/564x/d1/a8/19/d1a819b53112c3b1e3e7e0e7a2b9a795.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String name, String imageUrl) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC0CB),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text('Ordenar', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
