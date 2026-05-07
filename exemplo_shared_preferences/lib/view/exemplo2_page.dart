import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Exemplo2Page extends StatefulWidget{
  const Exemplo2Page ({super.key});

  @override
  State<Exemplo2Page> createState() => _Exemplo2PageState();
}

class _Exemplo2PageState extends State <Exemplo2Page>{
  late SharedPreferences _prefs; //escopo late, mesma coisa que SharedPreferences? _prefs, permite criar uam variavel/obj inicialmente nula e mudar o valor depois, pode ser mudada quantas vezes for necessário;
  bool _darkMode=false;
 
  //metodos de conexão com o SharedPreferences
  @override
  void initState(){
    super.initState();
    _loadPreferences();
  }

  void _loadPreferences() async{
    _prefs = await
SharedPreferences.getInstance(); //pega as informações salvas no Shared
  setState(() {
    _darkMode = _prefs.getBool("darkMode") ?? false; //verificação de nulidade obrigatória, ?? se caso a chave darkMode do Shared seja nula (não tenha valor atribuido ainda) a variável _darkMode será false
  });
  }

  //metodo para salvar dados no Shared
  void savePreferences() async{
    setState(() {
      _darkMode = !_darkMode; //inverte valor da booleana
    });
    await _prefs.setBool("darkMode", _darkMode); //atribuindo o valor daa variavel _dark/mode à chave darkMode do Shared
  }

  @override
  Widget  build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Modo Escuro com Shared Preferences"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tema Atual: ${_darkMode ? "Escuro" : "Claro"}"),
            Switch(
              value: _darkMode,
              onChanged: (_)=>savePreferences())
          ],

        ),
      ),
    );
  }
    

}