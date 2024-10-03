import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact us',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Iconsax.call, size: 20, color: Colors.white),
            SizedBox(width: 10),
            Text(
              '01627776162',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Iconsax.message, size: 20, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'gstoreproject@gmail.com',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
