import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_app/cores.dart';
import 'package:social_media_app/data/post_inherited.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  bool formImagem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 326,
        height: 780,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Post',
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 316,
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              PostInherited.of(context).usuarios[0].pfp,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              minLines: 1,
                              maxLines: 3,
                              maxLength: 78,
                              style: GoogleFonts.notoSans(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                hintText: 'New Post',
                                hintStyle: GoogleFonts.notoSans(
                                  color: Colors.white38,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                                filled: false,
                              ),
                            ),
                          )
                        ],
                      ),
                      formImagem
                          ? Container(
                            height: 250,
                            width: 316,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      style: GoogleFonts.notoSans(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Image URL',
                                        hintStyle: GoogleFonts.notoSans(
                                          color: Colors.white38,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        filled: false,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 180,
                                    width: 296,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/hamster.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            formImagem = formImagem ? false : true;
                          });
                        },
                        icon: Icon(
                          Icons.add_photo_alternate,
                          color: CoresTema().accentedPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
