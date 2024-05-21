import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_app/cores.dart';
import 'package:social_media_app/data/post_inherited.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key, required this.postContext});

  final BuildContext postContext;

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController postController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  bool formImagem = false;

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              PostInherited.of(widget.postContext)
                                  .addPost(postController.text);
                              Navigator.pop(context);
                            }
                          },
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
                                PostInherited.of(widget.postContext)
                                    .usuarios[0]
                                    .pfp,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  return valueValidator(value)
                                      ? 'You must insert a post.'
                                      : null;
                                },
                                controller: postController,
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
                                        validator: (value) {
                                          return valueValidator(value)
                                              ? 'You must insert a image url.'
                                              : null;
                                        },
                                        keyboardType: TextInputType.url,
                                        controller: imageController,
                                        onChanged: (url) {
                                          setState(() {});
                                        },
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
                                        child: Image.network(
                                          imageController.text,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container();
                                          },
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
                            formImagem
                                ? Icons.arrow_drop_up_sharp
                                : Icons.add_photo_alternate,
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
      ),
    );
  }
}
