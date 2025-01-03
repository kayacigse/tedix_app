import 'package:flutter/material.dart';

class TProductImage extends StatelessWidget {
  final String imageUrl;

  const TProductImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Stack(
        children: [

          SizedBox(
            height: 400,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: imageUrl.isNotEmpty
                    ? Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                )
                    : Center(child: Icon(Icons.error, color: Colors.red)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}