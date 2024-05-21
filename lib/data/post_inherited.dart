import 'package:flutter/material.dart';
import 'package:social_media_app/components/post.dart';

import '../model/usuario.dart';

class PostInherited extends InheritedWidget {
  PostInherited({
    super.key,
    required super.child,
  });

  final List<Usuario> usuarios = [
    const Usuario('Gabriel', '@gabguedes', 'assets/images/pfpGabriel.png'),
    const Usuario('William', '@williammendes', 'assets/images/pfpWilliam.png'),
    const Usuario('Vinicius', '@viniciusccs', 'assets/images/pfpVinicius.png'),
    const Usuario('Jhamil', '@jhamiljeff', 'assets/images/pfpJhamil.jpg'),
    const Usuario('Hugo', '@willywars', 'assets/images/pfpHugo.png'),
    const Usuario('Enzo', '@enzoyuta', 'assets/images/pfpEnzo.jpg'),
  ];

  late final List<Post> postList = [
    Post(
      usuario: usuarios[0],
      textoPost: 'aaaaaaaaaaaaaaaaaaa',
      imagemPost: 'assets/images/hamster.png',
    ),
    Post(
      usuario: usuarios[1],
      textoPost: 'bbbbbbbbbbbbbbbbbbb',
    ),
    Post(
      usuario: usuarios[2],
      textoPost: 'ccccccccccccccccccc',
      imagemPost: 'assets/images/gatoSorrindo.png',
    ),
    Post(
      usuario: usuarios[0],
      textoPost: 'ggggggggggggggggggg',
    ),
    Post(
      usuario: usuarios[3],
      textoPost: 'ddddddddddddddddddd',
    ),
    Post(
      usuario: usuarios[4],
      textoPost: 'eeeeeeeeeeeeeeeeeee',
      imagemPost: 'assets/images/gatoArma.png',
    ),
    Post(
      usuario: usuarios[1],
      textoPost: 'beyonce!',
    ),
    Post(
      usuario: usuarios[5],
      textoPost: 'fffffffffffffffffff',
    ),
  ];

  static PostInherited of(BuildContext context) {
    final PostInherited? result =
        context.dependOnInheritedWidgetOfExactType<PostInherited>();
    assert(result != null, 'No PostInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PostInherited oldWidget) {
    return oldWidget.postList.length != postList.length;
  }
}
