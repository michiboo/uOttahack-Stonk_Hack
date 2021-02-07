import 'package:flutter/material.dart';
import 'dart:convert';

import 'stock.dart';

void main() => runApp(MaterialApp(title: 'Stonk Hack 4', home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int teslaPrice = 0;
  int nokiaPrice = 0;
  int gameStopPrice = 0;

  List<Stock> stockList = [];

  List<Stock> createStocksFromJSON(String jsonString) {
    /*
    Decode a JSON string and creates a List of Stock objects
     */
    List<Stock> _stocks = [];

    var stocksJson = json.decode(jsonString);
    for (var stockJson in stocksJson) {
      _stocks.add(Stock.fromJson(stockJson));
    }

    return _stocks;
  }

  @override
  void initState() {
    String jsonString = '''
    [
      {"ticker":"TSLA", "price":20, "covidScore":-1,  "sentimentScore":1},
      {"ticker":"NOK",  "price":20, "covidScore":-1,  "sentimentScore":1},
      {"ticker":"GME",  "price":20, "covidScore":-1,  "sentimentScore":1}
    ]
    ''';

    stockList = createStocksFromJSON(jsonString);
    stockList.forEach((s) => print(s.ticker));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.teal,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/5843.png',
              fit: BoxFit.cover,
              height: 35.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: Text('Stonk Hack 4')),
            ),
          ],
        ),
      ),

      body: ListView(children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Stonk Picks',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red, letterSpacing: 2.0),
            ),
          ),
        ),
        DataTable(
          columns: [
            DataColumn(label: Text(  
                    'TICKER',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal, letterSpacing: 2.0)  
                )),  
                DataColumn(label: Text(  
                    'PRICE',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal, letterSpacing: 2.0)  
                )),  
                DataColumn(label: Text(  
                    'COVID SCORE',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal, letterSpacing: 2.0)  
                )),
                DataColumn(label: Text(  
                    'STONK SCORE',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal, letterSpacing: 2.0)  
                )),
                DataColumn(label: Text(  
                    'BUY/SELL',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal, letterSpacing: 2.0)  
                )),  
          ], rows: stockList.map((stock) => DataRow(
            cells: [
              DataCell(
                Text('${stock.ticker}')
              ),
              DataCell(
                  Text('${stock.price}')
              ),
              DataCell(
                  Text('${stock.covidScore}')
              ),
              DataCell(
                  Text('${stock.sentimentScore}')
              ),
              DataCell(
                  Text('NOPE')
              ),
            ]
        )).toList()
        )
      ],
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('?'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
