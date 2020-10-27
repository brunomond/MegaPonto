import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/presets/custom_icons_icons.dart';
import 'package:megaponto_oficial/View/HomePage/tela_editar_perfil.dart';

class MembrosCrud extends StatelessWidget {
  final List lista;
  final int index;
  MembrosCrud({@required this.lista, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
        child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey[300], width: 1.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/abott@adorable.png'),
                      ),
                    ),
                  ),
                  Text(lista[index].nome),
                  Column(
                    children: [
                      gestureCRUD(context, 'editar'),
                      gestureCRUD(context, 'deletar'),
                    ],
                  ),
                ],
              ),
            )));
  }

  Widget gestureCRUD(BuildContext context, String crud) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Row(children: [
          crud == 'editar'
              ? Icon(Icons.edit)
              : Icon(Icons.delete, color: Colors.red),
          Text(crud)
        ]),
      ),
      onTap: () => Navigator.of(context).pushNamed('editar_perfil'),
    );
  }
}
