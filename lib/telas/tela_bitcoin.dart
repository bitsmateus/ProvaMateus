import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> main() async {
  runApp(const TelaBitcoin());
}

class TelaBitcoin extends StatefulWidget {
  const TelaBitcoin({Key? key}) : super(key: key);

  @override
  State<TelaBitcoin> createState() => _TelaBitcoinState();
}

class _TelaBitcoinState extends State<TelaBitcoin> {

  double buyBlockChain = 0;
  double buyCoinbase = 0;
  double buyBitStamp = 0;
  double buyFoxBit = 0;
  double buyMercadoBitcoin = 0;
  double variBlockChain = 0;
  double variCoinbase = 0;
  double variBitStamp = 0;
  double variFoxBit = 0;
  double variMercadoBitcoin = 0;
  

  void hgFinance2() async {
    final String urlHgFinance =
        'https://api.hgbrasil.com/finance?format=json-cors&key=6c677801';
    Response resposta = await get(Uri.parse(urlHgFinance));
    Map resulta = json.decode(resposta.body);
    setState(() {
      buyBlockChain = resulta['results']['bitcoin']['blockchain_info']['last'];
      buyCoinbase = resulta['results']['bitcoin']['coinbase']['last'];
      buyBitStamp = resulta['results']['bitcoin']['bitstamp']['last'];
      buyFoxBit = resulta['results']['bitcoin']['foxbit']['last'];
      buyMercadoBitcoin = resulta['results']['bitcoin']['mercadobitcoin']['last'];
      variBlockChain = resulta['results']['bitcoin']['blockchain_info']['variation'];
      variCoinbase = resulta['results']['bitcoin']['coinbase']['variation'];
      variBitStamp = resulta['results']['bitcoin']['bitstamp']['variation'];
      variFoxBit = resulta['results']['bitcoin']['foxbit']['variation'];
      variMercadoBitcoin = resulta['results']['bitcoin']['mercadobitcoin']['variation'];
    });
  }

  void initState() {
    super.initState();
    hgFinance2();
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
      body: 
        Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text('Bitcoin', textAlign: TextAlign.center)),
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
                            Text('Blockchain.info: ${buyBlockChain.toStringAsFixed(4)}'),
                            SizedBox(width: 2),
                            Container(decoration: BoxDecoration(color: variBlockChain < 0 ? Colors.red : Colors.blue),
                            child: Text('${variBlockChain.toStringAsFixed(4)}',
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                            Text('CoinBase: ${buyCoinbase.toStringAsFixed(4)}'),
                            SizedBox(width: 2),
                            Container(
                            decoration: BoxDecoration(color: variCoinbase < 0 ? Colors.red : Colors.blue),
                            child: Text('${variCoinbase.toStringAsFixed(4)}',
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('BitStamp: ${buyBitStamp.toStringAsFixed(4)}'),
                            SizedBox(width: 2),
                            Container(decoration: BoxDecoration(color: variBitStamp < 0 ? Colors.red : Colors.blue,),
                            child: Text('${variBitStamp.toStringAsFixed(4)}',
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                            Text('FoxBit: ${buyFoxBit.toStringAsFixed(4)}'),
                            SizedBox(width: 2),
                            Container(
                            decoration: BoxDecoration(color: variFoxBit < 0 ? Colors.red : Colors.blue,),
                            child: Text('${variFoxBit.toStringAsFixed(4)}',
                            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold))),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Mercado Bitcoin: ${buyMercadoBitcoin.toStringAsFixed(4)}'),
                            SizedBox(width: 2),
                            Container(decoration: BoxDecoration(color: variMercadoBitcoin < 0 ? Colors.red : Colors.blue),
                            child: Text('${variMercadoBitcoin.toStringAsFixed(4)}',
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
                            Navigator.pushNamed(context, '/TelaMoedas');
                          },
                          child: const Text('Pagina principal'),
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
