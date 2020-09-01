import 'package:equatable/equatable.dart';

abstract class PictureEvent extends Equatable {
  const PictureEvent();
}

class TogglePicture extends PictureEvent {
  final bool isVisible;

  TogglePicture({this.isVisible});

  @override
  List<Object> get props => [isVisible];
}
