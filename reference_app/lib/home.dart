import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reference_app/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reference App',
          style: GoogleFonts.satisfy(
            color: Colors.yellow,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: const [
          ItemCard(
            imagePath: 'assets/nice_places.jpg',
            title: 'Tempat Menarik',
            description:
                'Terdapat berbagai tempat menarik di Puncak Alam seperti: hsjadhkasjdhjkas',
          ),
          ItemCard(
            imagePath: 'assets/groceries.jpg',
            title: 'Barang Runcit',
            description: 'Memudahkan urusan senarai semak barang runcit.',
          ),
          ItemCard(
            imagePath: 'assets/nice_places.jpg',
            title: 'Resipi Mudah',
            description:
                'Senarai resipi-resipi mudah untuk dimasak dan menjimatkan.',
          ),
          ItemCard(
            imagePath: 'assets/nice_places.jpg',
            title: 'Tempat Menarik',
            description:
                'Terdapat berbagai tempat menarik di Puncak Alam seperti: hsjadhkasjdhjkas',
          ),
        ],
      ),
    );
  }
}
