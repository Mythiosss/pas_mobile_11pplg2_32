import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  // final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback? onFavorite;
  final bool isFavorite;

  const CustomCard({
    super.key,
    // required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.onFavorite,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color.fromARGB(255, 78, 200, 248),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color.fromARGB(255, 43, 232, 229),
                width: 3,
              ),
            ),
            // child: ClipOval(
            //   child: Image.network(
            //     imageUrl,
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 13, color: Colors.black54)),
              ],
            ),
          ),

          IconButton(
            onPressed: onFavorite,
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: Colors.orange,
            ),
          )
        ],
      ),
    );
  }
}
