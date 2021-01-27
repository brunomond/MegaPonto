import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/Utils/StdPrefixIcon.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';
import 'package:megaponto_oficial/Services/feed_service.dart';

class CriarNoticia extends StatefulWidget {
  @override
  _CriarNoticiaState createState() => _CriarNoticiaState();
}

class _CriarNoticiaState extends State<CriarNoticia> {
  String titulo, conteudo;
  var focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        text: 'Nova Noticia',
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.done,
                color: Colors.white,
              ),
              onPressed: () => salvar()),
          SizedBox(width: 8)
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ClipRect(
                    child: Align(
                      heightFactor: 0.3,
                      widthFactor: 5,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset('images/abott@adorable.png'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Alterar imagem da noticia",
                    style: Globals.textTheme.headline6.copyWith(
                        color: Globals.theme.primaryColor,
                        fontStyle: FontStyle.normal),
                  ),
                ),
                StdTextInput(
                  padding: EdgeInsets.fromLTRB(8.0, 16, 8, 8),
                  hintText: 'Título da notícia',
                  prefixIcon: Icons.title,
                  onChanged: setNoticia,
                  focusNode: focusNode,
                ),
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Globals.theme.primaryColor,
                  keyboardType: TextInputType.text,
                  onChanged: setConteudo,
                  maxLines: 5,
                  decoration: InputDecoration(
                    prefixIcon: StdPrefixIcon(
                      padding: EdgeInsets.all(0),
                      iconData: Icons.description,
                    ),
                    hintText: 'Descrição da notícia',
                  ).applyDefaults(Globals.inputTheme),
                ),
                StdButton(
                    padding: EdgeInsets.only(top: 24),
                    label: 'Confirmar',
                    onPressed: () => salvar())
              ],
            ),
          ),
        );
      }),
    );
  }

  setNoticia(String tituloNoticia) {
    titulo = tituloNoticia;
  }

  setConteudo(String conteudoNoticia) {
    conteudo = conteudoNoticia;
  }

  void salvar() async {
    {
      if (titulo.isNotEmpty) {
        bool confirmacao = await FeedService().enviarNoticia(titulo, conteudo);
        if (confirmacao) {
          await showAlertDialog1(context, confirmacao);
        }
      } else {
        focusNode.requestFocus();
      }
    }
  }

  showAlertDialog1(BuildContext context, bool confirm) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/home');
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: (confirm) ? Text("Sucesso") : Text("Erro"),
      content: (confirm)
          ? Text("Noticia salva com sucesso")
          : Text("Ocorreu um erro ao editar o usuário"),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
