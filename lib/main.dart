import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const BunnyApp(),
    ),
  );
}

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class BunnyApp extends StatelessWidget {
  const BunnyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primarySeedColor = Color(0xFFFFC0CB);

    final TextTheme appTextTheme = TextTheme(
      displayLarge: GoogleFonts.greatVibes(
        fontSize: 57,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.w500),
      bodyMedium: GoogleFonts.lato(fontSize: 14),
    );

    final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primarySeedColor,
        brightness: Brightness.light,
        primary: primarySeedColor,
        surface: const Color(0xFFF8F8F8),
      ),
      scaffoldBackgroundColor: const Color(0xFFF8F8F8),
      textTheme: appTextTheme.apply(displayColor: primarySeedColor),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: GoogleFonts.greatVibes(
            fontSize: 32, fontWeight: FontWeight.bold, color: primarySeedColor),
        iconTheme: const IconThemeData(color: primarySeedColor),
      ),
    );

    final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primarySeedColor,
        brightness: Brightness.dark,
        primary: primarySeedColor,
        surface: const Color(0xFF2D2D2D),
      ),
      scaffoldBackgroundColor: const Color(0xFF121212),
      textTheme: appTextTheme.apply(
        bodyColor: Colors.white,
        displayColor: primarySeedColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1A1A1A),
        foregroundColor: primarySeedColor,
        titleTextStyle: GoogleFonts.greatVibes(
            fontSize: 32, fontWeight: FontWeight.bold, color: primarySeedColor),
        iconTheme: const IconThemeData(color: primarySeedColor),
      ),
    );

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bunny Parfait Bakery',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeProvider.themeMode,
          initialRoute: '/',
          routes: {
            '/': (context) => const PaginaContenido(
                titulo: 'Inicio',
                img:
                    'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/panaderia.webp'),
            '/productos': (context) => const PaginaContenido(
                titulo: 'Productos',
                img:
                    'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/cupcake.jpg'),
            '/postres': (context) => const PaginaContenido(
                titulo: 'Postres',
                img:
                    'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/pastel.webp'),
            '/chefs': (context) => const PaginaContenido(
                titulo: 'Nuestros Chefs',
                img:
                    'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/pasteleria.png'),
          },
        );
      },
    );
  }
}

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/main/drawer_bg.webp"),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://raw.githubusercontent.com/Yaretzi-debug/imagenes-para-flutter-6to-I-fecha-11-feb-2026/refs/heads/main/chef.webp'),
              ),
              accountName: Text('Bunny Parfait Bakery 🎀',
                  style: GoogleFonts.greatVibes(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              accountEmail: const Text('Av. Dulzura 444 | 555-BUNNY',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            _item(context, Icons.home_repair_service, 'Inicio', '/'),
            _item(context, Icons.cake, 'Productos', '/productos'),
            _item(context, Icons.icecream, 'Postres', '/postres'),
            _item(context, Icons.person_search_outlined, 'Chefs', '/chefs'),
            const Divider(),
            SwitchListTile(
              title: Text('Tema Oscuro'),
              value: isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
              secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context, IconData icon, String texto, String ruta) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(texto),
      onTap: () => Navigator.pushNamed(context, ruta),
    );
  }
}

class PaginaContenido extends StatelessWidget {
  final String titulo;
  final String img;
  const PaginaContenido({super.key, required this.titulo, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      drawer: const MiDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('✨ $titulo ✨', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 30),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  )
                ],
                image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
