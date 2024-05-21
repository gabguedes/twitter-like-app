import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_app/cores.dart';
import 'package:social_media_app/model/usuario.dart';

class Post extends StatelessWidget {
  final Usuario usuario;
  final String textoPost;
  final String? imagemPost;

  const Post({
    super.key,
    required this.usuario,
    required this.textoPost,
    this.imagemPost,
  });

  bool temImagem(imagemPost){
    if(imagemPost != null){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: temImagem(imagemPost) ? 300 : 100,
          
          decoration: BoxDecoration(
            color: Colors.black38,
            border: Border.symmetric(horizontal: BorderSide(color: CoresTema().midPurple, width: 0.5))
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(usuario.pfp),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        usuario.nome,
                        style: GoogleFonts.notoSans(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        usuario.userName,
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                          color: Colors.white30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 296,
                    child: Text(
                      textoPost,
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  temImagem(imagemPost) ? SizedBox(
                    height: 180,
                    width: 296,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(imagemPost!, fit: BoxFit.cover,),
                    ),
                  ) : Container(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
