import 'package:equatable/equatable.dart';

abstract class PictureState extends Equatable {
  const PictureState();
}

class HiddenPictureState extends PictureState {
  HiddenPictureState();

  @override
  List<Object> get props => [];
}

class VisiblePictureState extends PictureState {
  VisiblePictureState();

  @override
  List<Object> get props => [];
}
