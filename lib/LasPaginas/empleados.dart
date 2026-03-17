import 'package:flutter/material.dart';

class EmpleadosPage extends StatelessWidget {
  const EmpleadosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuestro Equipo 🧑‍🍳'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildEmployeeCard(
            context,
            'Chef Pâtissier',
            'https://i.pinimg.com/564x/20/0c/a0/200ca0481c2cc4b5536413d2153835a2.jpg',
            'Especialista en postres franceses con un toque coquette.',
          ),
          _buildEmployeeCard(
            context,
            'Decoradora de Pasteles',
            'https://i.pinimg.com/564x/f7/5a/b9/f75ab9058b871c26f0f51d8b9f07a61c.jpg',
            'Transforma cada pastel en una obra de arte comestible.',
          ),
          _buildEmployeeCard(
            context,
            'Gerente de la Tienda',
            'https://i.pinimg.com/564x/c3/3b/b1/c33bb1757827618953158f334c11b1c3.jpg',
            'Asegura que tu experiencia sea tan dulce como nuestros postres.',
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeCard(
    BuildContext context,
    String name,
    String imageUrl,
    String description,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
