import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rm. Sedap Rasa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 40, 40, 40), // Mengatur latar belakang
        textTheme: const TextTheme(
          displayMedium: TextStyle(color: Colors.white), // Untuk judul
        ),
      ),
      home: const MyHomePage(title: 'Rm. Sedap Rasa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, dynamic> restoData = {
    'gambar': 'assets/makan.webp', // Ganti dengan nama gambar Anda
    'deskripsi':
        'Restoran dengan menu masakan tradisional Indonesia yang lezat dan autentik. Kami menggunakan bahan-bahan segar dan berkualitas tinggi untuk menghasilkan hidangan yang memuaskan.',
    'menu': [
      'Nasi Goreng',
      'Mie Goreng',
      'Soto Ayam',
      'Bakso',
      'Nasi Uduk',
    ],
    'alamat': 'Jl. Imam Bonjol No.207, Pendrikan Kidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50131',
    'email': 'anggatp12345@gmail.com',
    'telp': '+6281283308005',
    'jamBuka': 'Senin - Minggu, 08:00 - 20:00',
    'latitude': -6.982983,
    'longitude': 110.4090584,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black, // Latar belakang hitam pada AppBar
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20), // Teks putih pada AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                restoData['gambar'] as String,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // Ikon dengan latar belakang berwarna
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow, // Warna latar belakang untuk ikon email
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse('mailto:${restoData['email'] as String}?subject=Tanya Seputar Resto'));
                    },
                    icon: const Icon(Icons.email, color: Colors.black), // Mengubah warna ikon menjadi hitam
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue, // Warna latar belakang untuk ikon telepon
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse('tel:${restoData['telp'] as String}'));
                    },
                    icon: const Icon(Icons.phone, color: Colors.white), // Warna ikon telepon menjadi putih
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green, // Warna latar belakang untuk ikon peta
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=${restoData['latitude']},${restoData['longitude']}'));
                    },
                    icon: const Icon(Icons.location_on, color: Colors.black), // Mengubah warna ikon menjadi hitam
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Teks deskripsi
            Text(
              restoData['deskripsi'] as String,
              style: const TextStyle(fontSize: 16, color: Colors.white), // Teks deskripsi berwarna putih
              textAlign: TextAlign.justify, // Rata kanan-kiri
            ),
            const SizedBox(height: 16),
            Text(
              'List Menu :',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 98, 0)),
            ),
            // Menu dengan padding ke kanan
            Column(
              children: restoData['menu']
                  .map<Widget>(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 25), // Menambahkan padding di sebelah kiri
                          // Tanda bulat berwarna hijau
                          Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green, // Mengubah warna tanda bulat menjadi hijau
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            item as String,
                            style: const TextStyle(fontSize: 18, color: Colors.white), // Teks menu berwarna putih
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            Text(
              'Alamat :',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 251, 255)),
            ),
            // Alamat tanpa kotak putih
            Text(
              restoData['alamat'] as String,
              style: const TextStyle(fontSize: 16, color: Colors.white), // Teks alamat berwarna putih
              textAlign: TextAlign.justify, // Rata kanan-kiri
            ),
            const SizedBox(height: 16),
            Text(
              'Jam Buka :',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 255, 183)),
            ),
            // Jam buka tanpa kotak putih
            Text(
              restoData['jamBuka'] as String,
              style: const TextStyle(fontSize: 16, color: Colors.white), // Teks jam buka berwarna putih
              textAlign: TextAlign.justify, // Rata kanan-kiri
            ),
          ],
        ),
      ),
    );
  }
}
