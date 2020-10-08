
import 'package:flutter/material.dart';

class Proposta extends StatelessWidget {
  final int idProposta;
  final String produtor;
  final String objetivo;

  Proposta(this.idProposta, this.produtor, this.objetivo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(produtor),
        subtitle: Text(objetivo),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }

  @override
  String toStringShort() {
    return 'Proposta{Id: $idProposta, Produtor: $produtor, Objetivo: $objetivo}';
  }

}
