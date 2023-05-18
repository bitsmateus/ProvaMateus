import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> main() async {
  runApp(const TelaMoedas());
}

class TelaMoedas extends StatefulWidget {
  const TelaMoedas({Key? key}) : super(key: key);

  @override
  State<TelaMoedas> createState() => _TelaMoedasState();
}

class _TelaMoedasState extends State<TelaMoedas> {

  double buyDolar = 0;
  double buyEuro = 0;
  double buyYen = 0;
  double buyPeso = 0;
  double VariDolar = 0;
  double VariEuro = 0;
  double VariYen = 0;
  double VariPeso = 0;


  void hgFinance() async {
    final String urlHgFinance =
        'https://api.hgbrasil.com/finance?format=json-cors&key=6c677801';
    Response resposta = await get(Uri.parse(urlHgFinance));
    Map resulta = json.decode(resposta.body);
    setState(() {
      buyDolar = resulta['results']['currencies']['USD']['buy'];
      buyEuro = resulta['results']['currencies']['EUR']['buy'];
      buyYen = resulta['results']['currencies']['JPY']['buy'];
      buyPeso = resulta['results']['currencies']['ARS']['buy'];
      VariDolar = resulta['results']['currencies']['USD']['variation'];
      VariEuro = resulta['results']['currencies']['EUR']['variation'];
      VariYen = resulta['results']['currencies']['JPY']['variation'];
      VariPeso = resulta['results']['currencies']['ARS']['variation'];
    });
  }

  void initState() {
    super.initState();
    hgFinance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Finanças Hoje',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        
        backgroundColor: Colors.green,
      ),
      body: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text('Moedas', textAlign: TextAlign.center)),
              ],
            ),
            SizedBox(height: 40),
            Column(
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 700,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Dólar: ${buyDolar.toStringAsFixed(4)}'),
                            SizedBox(width: 2),
                            Container(decoration: BoxDecoration(color: VariDolar < 0 ? Colors.red : Colors.blue),
                            child: Text('${VariDolar.toStringAsFixed(4)}',
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                            Text('Euro: ${buyEuro.toStringAsFixed(4)}'),
                            SizedBox(width: 2),
                            Container(decoration: BoxDecoration(color: VariEuro < 0 ? Colors.red : Colors.blue),
                            child: Text('${VariEuro.toStringAsFixed(4)}',
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                           Text('Peso: ${buyPeso.toStringAsFixed(4)}'),
                           SizedBox(width: 2),
                            Container(decoration: BoxDecoration(color: VariPeso < 0 ? Colors.red : Colors.blue),
                            child: Text('${VariPeso.toStringAsFixed(4)}',
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                            Text('Iene: ${buyYen.toStringAsFixed(4)}'),
                            SizedBox(width: 2),
                            Container(decoration: BoxDecoration(color: VariYen < 0 ? Colors.red : Colors.blue),
                            child: Text('${VariYen.toStringAsFixed(4)}',
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                  padding: EdgeInsets.only(right: 175),
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    ElevatedButton(
                    onPressed: () {
                            Navigator.pushNamed(context, '/TelaAcao');
                          },
                          child: const Text('Ir para Ações'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ],
            ),
          ],
        ),
      );
    
  }
}
