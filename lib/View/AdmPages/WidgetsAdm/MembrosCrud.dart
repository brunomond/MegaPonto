import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Services/admin_service.dart';
import 'package:megaponto_oficial/View/AdmPages/tela_adm_perfil.dart';

class MembrosCrud extends StatelessWidget {
  final List<Usuario> lista;
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
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: Row(
                            children: [
                              Icon(Icons.edit),
                              Text('editar')
                            ]
                          )
                        ),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AdmEditarPerfil(user: lista[index])))
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: Row(
                            children: [
                            Icon(Icons.delete, color: Colors.red),
                            Text('deletar')
                            ]
                          ),
                        ),
                      onTap: () => exclui(context)
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
  void exclui(BuildContext context) async {
    await AdminService()
        .deletarMembro(lista[index].usuarioId)
        .then((confirmacao) {
          if(confirmacao == true) {
            lista.remove(lista[index]);
            Navigator.of(context).pop();
          }
    });
  }
}
