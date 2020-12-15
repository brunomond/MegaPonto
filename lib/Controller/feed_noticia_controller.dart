import 'package:mobx/mobx.dart';
part 'feed_noticia_controller.g.dart';

class FeedNoticiaController = _FeedNoticiaControllerBase
    with _$FeedNoticiaController;

abstract class _FeedNoticiaControllerBase with Store {
  @observable
  String noticia = "";

  @action
  void setNoticia(String value) => noticia = value;
}
