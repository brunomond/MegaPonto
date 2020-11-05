import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megaponto_oficial/Controller/empresa_junior_controller.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';

class ChaveAcesso extends StatefulWidget {
  @override
  _ChaveAcessoState createState() => _ChaveAcessoState();
}

class _ChaveAcessoState extends State<ChaveAcesso> {
  EmpresaJuniorController controller = new EmpresaJuniorController();

  @override
  Widget build(BuildContext context) {
      return Observer(builder: (_) {
        return Form(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: Globals.windowSize.width * 0.5,
                height: Globals.windowSize.width * 0.5,
                child: Image.asset("images/pato_projeto.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                child: Text("Selecione sua EJ e insira sua chave de acesso",
                    textAlign: TextAlign.center,
                    style: Globals.textTheme.bodyText1),
              ),
              DropdownButton(
                style: Globals.textTheme.bodyText2.copyWith(
                  color: Colors.black
                ),
                isExpanded: true,
                  value: controller.selectedEj,
                  items: controller.ejs.isNotEmpty ?
                      controller.ejs.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList() 
                  : [DropdownMenuItem<String>(value: '', child: Text(''))],
                  onChanged: (String newValue) {
                    controller.setSelectedEj(newValue);
                  }),
              StdTextInput(
                padding: EdgeInsets.only(top: 8),
                keyboardType: TextInputType.number,
                hintText: 'Chave de Acesso',
                prefixIcon: Icons.check_circle,
                done: true,
              ),
              StdButton(
                label: 'Confirmar',
                onPressed: () =>
                    Navigator.of(context).popAndPushNamed('/criar_conta'),
                padding: EdgeInsets.only(top: 24, bottom: 8),
              ),
              Center(
                child: GestureDetector(
                  child: Text("Cancelar",
                      textAlign: TextAlign.center,
                      style: Globals.textTheme.overline),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
