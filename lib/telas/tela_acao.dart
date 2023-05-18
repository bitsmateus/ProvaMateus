import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(TelaAcao());

class TelaAcao extends StatefulWidget {
  const TelaAcao({Key? key}) : super(key: key);

  @override
  State<TelaAcao> createState() => _TelaAcaoState();
}

class _TelaAcaoState extends State<TelaAcao> {

  double buyIBOVESPA = 0;
  double buyIFIX = 0;
  double buyNASDAQ = 0;
  double buyDOWJONES = 0;
  double buyCAC = 0;
  double buyNIKKEI = 0;
  double variIBOVESPA = 0;
  double variIFIX = 0;
  double variNASDAQ = 0;
  double variDOWJONES = 0;
  double variCAC = 0;
  double variNIKKEI = 0;

  void hgFinance() async {
    final String urlHgFinance =
        'https://api.hgbrasil.com/finance?format=json-cors&key=6c677801';
    Response resposta = await get(Uri.parse(urlHgFinance));
    Map resulta = json.decode(resposta.body);
    setState(() {
      buyIBOVESPA = resulta['results']['stocks']['IBOVESPA']['points'];
      buyIFIX = resulta['results']['stocks']['IFIX']['points'];
      buyNASDAQ = resulta['results']['stocks']['NASDAQ']['points'];
      buyDOWJONES = resulta['results']['stocks']['DOWJONES']['points'];
      buyCAC = resulta['results']['stocks']['CAC']['points'];
      buyNIKKEI = resulta['results']['stocks']['NIKKEI']['points'];
      variIBOVESPA = resulta['results']['stocks']['IBOVESPA']['variation'];
      variIFIX = resulta['results']['stocks']['IFIX']['variation'];
      variNASDAQ = resulta['results']['stocks']['NASDAQ']['variation'];
      variDOWJONES = resulta['results']['stocks']['DOWJONES']['variation'];
      variCAC = resulta['results']['stocks']['CAC']['variation'];
      variNIKKEI = resulta['results']['stocks']['NIKKEI']['variation'];
      
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
                Expanded(child: Text('Ações', textAlign: TextAlign.center)),
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
                            Text('IBOVESPA: ${buyIBOVESPA.toStringAsFixed(2)}'),
                            Container(decoration: BoxDecoration(color: variIBOVESPA < 0 
                            ? Colors.red : Colors.blue) ,child: Text('${variIBOVESPA.toStringAsFixed(2)}', 
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                            Text('IFIX: ${buyIFIX.toStringAsFixed(2)}'),
                            Container(decoration: BoxDecoration(color: variIFIX < 0 
                            ? Colors.red : Colors.blue) ,child: Text('${variIFIX.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('NASDAQ: ${buyNASDAQ.toStringAsFixed(2)}'),
                            Container(decoration: BoxDecoration(color: variNASDAQ < 0 
                            ? Colors.red : Colors.blue) ,child: Text('${variNASDAQ.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                            
                            Text('DOWJONES: ${buyDOWJONES.toStringAsFixed(2)}'),
                            Container(decoration: BoxDecoration(color: variDOWJONES < 0 
                            ? Colors.red : Colors.blue) ,child: Text('${variDOWJONES.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('CAC: ${buyCAC.toStringAsFixed(2)}'),
                            Container(decoration: BoxDecoration(color: variCAC < 0 
                            ? Colors.red : Colors.blue) ,child: Text('${variCAC.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                            Text('NIKKEI: ${buyNIKKEI.toStringAsFixed(2)}'),
                            Container(decoration: BoxDecoration(color: variNIKKEI < 0 
                            ? Colors.red : Colors.blue) ,child: Text('${variNIKKEI.toStringAsFixed(2)}',
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
                            Navigator.pushNamed(context, '/TelaBitcoin');
                          },
                          child: const Text('Ir para Bitcoin'),
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
