import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import './picture_event.dart';
import './picture_state.dart';

class PictureBloc extends Bloc<PictureEvent, PictureState> {
  final bool isVisible;
  PictureBloc({@required this.isVisible})
      : assert(isVisible != null),
        super(HiddenPictureState());
  @override
  PictureState get initialState => HiddenPictureState();
  @override
  Stream<PictureState> mapEventToState(
    PictureEvent event,
  ) async* {
    if (event is TogglePicture) {
      if (event.isVisible) {
        yield VisiblePictureState();
      } else {
        yield HiddenPictureState();
      }
    }
  }
}
