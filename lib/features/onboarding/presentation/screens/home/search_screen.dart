import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //---------------------------App Bar-------------------------//

    appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,

        title: const Text(
          'ابحث عن درس',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
        ],
      ),

      //---------------------------Home body-------------------------//

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Image.asset(
                  'assets/images/search-normal 1.png',
                  height: 22,
                  width: 20,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
      ),
    );
  }
}
