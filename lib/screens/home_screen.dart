import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_app/data/post_inherited.dart';
import '../cores.dart';
import '../model/usuario.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Usuario> usuarios = [
    const Usuario('Gabriel', 'gabguedes', 'assets/images/pfpJhamil.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CoresTema().midPurple,
        toolbarHeight: 70,
        title: Center(
          child: Text(
            'Y',
            style: GoogleFonts.trainOne(
              fontSize: 40,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: PostInherited.of(context).postList.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 0,
          color: CoresTema().midPurple,
        ),
        itemBuilder: (BuildContext context, int index) {
          return PostInherited.of(context).postList[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home_filled,
                size: 35,
              ),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 35,
              ),
              color: CoresTema().lightPurple,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_outline,
                size: 35,
              ),
              color: CoresTema().lightPurple,
            ),
          ],
        ),
      ),
    );
  }
}
