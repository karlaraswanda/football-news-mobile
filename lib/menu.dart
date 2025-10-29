import 'package:flutter/material.dart';

// Kelas utama MyHomePage
class MyHomePage extends StatelessWidget {
  final String nama = "Karla Ameera Raswanda"; // nama
  final String npm = "2406414542"; // npm
  final String kelas = "E"; // kelas

  // Daftar menu
  final List<ItemHomepage> items = [
    ItemHomepage("See Football News", Icons.newspaper),
    ItemHomepage("Add News", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Row InfoCard
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     InfoCard(title: 'NPM', content: npm),
          //     InfoCard(title: 'Name', content: nama),
          //     InfoCard(title: 'Class', content: kelas),
          //   ],
          // ),
          Row(
            children: [
              Expanded(child: InfoCard(title: 'NPM',  content: npm)),
              const SizedBox(width: 12),
              Expanded(child: InfoCard(title: 'Name', content: nama)),
              const SizedBox(width: 12),
              Expanded(child: InfoCard(title: 'Class', content: kelas)),
            ],
          ),
          const SizedBox(height: 24),
          // Grid Menu
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: items.map((item) {
                return ItemCard(item);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Model data item
class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}

// Widget InfoCard
// class InfoCard extends StatelessWidget {
//   final String title;
//   final String content;

//   const InfoCard({super.key, required this.title, required this.content});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Theme.of(context).colorScheme.surface,
//       elevation: 4,
//       child: Container(
//         width: 100,
//         height: 80,
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(title,
//                 style: const TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             Text(content),
//           ],
//         ),
//       ),
//     );
//   }
// }

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Text(
              content,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget ItemCard
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Kamu menekan tombol ${item.name}"),
            ),
          );
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.icon, size: 40.0),
              const SizedBox(height: 10),
              Text(item.name),
            ],
          ),
        ),
      ),
    );
  }
}