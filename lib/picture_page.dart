import 'package:bloc_image/picture_bloc.dart';
import 'package:bloc_image/picture_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'picture_state.dart';

class PicturePage extends StatelessWidget {
  const PicturePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TEXT_STYLE = TextStyle(color: Colors.black);
    const TEXT_STYLE_WHITE = TextStyle(color: Colors.white);
    return BlocProvider(create: (context) {
      return PictureBloc(isVisible: false);
    }, child: BlocBuilder<PictureBloc, PictureState>(
      builder: (context, state) {
        final PictureBloc pictureBloc = BlocProvider.of<PictureBloc>(context);
        print(state);
        var picture;
        if (state is HiddenPictureState) {
          picture = Text('hidden', style: TEXT_STYLE_WHITE);
        }
        if (state is VisiblePictureState) {
          picture = Image.network(
              'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg');
        }

        return Center(
          child: Column(
            children: [
              RaisedButton(
                color: Colors.white,
                onPressed: () {
                  print(state);
                  if (state is HiddenPictureState) {
                    pictureBloc.add(TogglePicture(isVisible: true));
                  }
                  if (state is VisiblePictureState) {
                    pictureBloc.add(TogglePicture(isVisible: false));
                  }
                },
                child: Text(
                  'Press me',
                  style: TEXT_STYLE,
                ),
              ),
              picture
            ],
          ),
        );
      },
    ));
  }
}
