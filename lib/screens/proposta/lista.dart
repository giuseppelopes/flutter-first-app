import 'package:AgroMais/models/proposta.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _tituloAppBar = "Lista de Propostas";

class ListaPropostas extends StatefulWidget {
  final List<Proposta> _propostas = List();

  @override
  State<StatefulWidget> createState() {
    return ListaPropostasState();
  }
}

class ListaPropostasState extends State<ListaPropostas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._propostas.length,
        itemBuilder: (context, indice) {
          final proposta = widget._propostas[indice];

          return proposta;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioProposta();
          })).then((propostaRecebida) {
            debugPrint('Chegou no Then do Future');
            debugPrint('$propostaRecebida');
            _atualiza(propostaRecebida);
          });
        },
      ),
    );
  }

  void _atualiza(Proposta propostaRecebida) {
    if (propostaRecebida != null) {
      setState(() {
        widget._propostas.add(propostaRecebida);
      });
    }
  }
}
