import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bunny Parfait Bakery 🎀'),
      ),
      drawer: _buildDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenida a nuestra pastelería',
              style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 36),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://i.pinimg.com/564x/6f/94/d8/6f94d8721349afa5a90e4c5a939f4a5a.jpg',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/productos');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC0CB),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Ver Productos',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Bunny Parfait Bakery 🎀', style: TextStyle(color: Color(0xFFFFC0CB))),
            accountEmail: Text('Calle Coquette 123\nTel: 555-BUNNY\nbunny@parfait.com', style: TextStyle(color: Colors.white70)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pinimg.com/564x/6f/94/d8/6f94d8721349afa5a90e4c5a939f4a5a.jpg'),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFE0E0E0),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.icecream, color: Color(0xFFFFC0CB)),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.cake, color: Color(0xFFFFC0CB)),
            title: const Text('Productos'),
            onTap: () {
              Navigator.pushNamed(context, '/productos');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people, color: Color(0xFFFFC0CB)),
            title: const Text('Empleados'),
            onTap: () {
              Navigator.pushNamed(context, '/empleados');
            },
          ),
        ],
      ),
    );
  }
}
