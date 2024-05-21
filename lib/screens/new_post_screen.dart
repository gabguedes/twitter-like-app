import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 50,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                'Cancel',
                style: GoogleFonts.notoSans(),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Post',
                style: GoogleFonts.notoSans(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
