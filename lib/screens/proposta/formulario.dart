import 'package:AgroMais/components/editor.dart';
import 'package:AgroMais/models/proposta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Criar Proposta";

class FormularioProposta extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioPropostaState();
  }
}

class FormularioPropostaState extends State<FormularioProposta> {

  final TextEditingController _controladorPropostaId = TextEditingController();
  final TextEditingController _controladorPropostaProdutor =
  TextEditingController();
  final TextEditingController _controladorPropostaObjetivo =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView (
        child: Column(
          children: [
            Editor(controller: _controladorPropostaId,
              rotulo: 'Id da Proposta',
              dica: '1',
              icon: Icon(Icons.format_list_numbered),),
            Editor(controller: _controladorPropostaProdutor,
              rotulo: 'Produtor',
              dica: 'Giuseppe Lopes',
              icon: Icon(Icons.people),),
            Editor(controller: _controladorPropostaObjetivo,
              rotulo: 'Objetivo', dica: 'Colheitadeira',
              icon: Icon(Icons.star),),
            RaisedButton(
              child: Text('Salvar'),
              onPressed: () => _criarProposta(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criarProposta(BuildContext context) {
    debugPrint('Clicou no Salvar! Abaixo valores Digitados');
    debugPrint('Campo id: ' + _controladorPropostaId.text);
    debugPrint(
        'Campo Produtor: ' + _controladorPropostaProdutor.text);
    debugPrint(
        'Campo Objetivo: ' + _controladorPropostaObjetivo.text);
    final int idProposta = int.tryParse(_controladorPropostaId.text);
    final String produtor = _controladorPropostaProdutor.text;
    final String objetivo = _controladorPropostaObjetivo.text;
    if (idProposta != null && produtor != null && objetivo != null) {
      final propostaCriada = Proposta(idProposta, produtor, objetivo);
      debugPrint('Proposta criada no formulario: $propostaCriada');
      Navigator.pop(context, propostaCriada);
    }
  }
}