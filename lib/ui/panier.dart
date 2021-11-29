import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pizzeria_td1/Models/cart.dart';
import 'package:flutter_pizzeria_td1/ui/share/pizzera_style.dart';

import 'package:intl/intl.dart';

class Panier extends StatefulWidget {
  final Cart _cart;

  const Panier(this._cart, {Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    var format = NumberFormat("###.00€");
    String totalAffiche = format.format(widget._cart.tva());

    return Scaffold(
      appBar: AppBar(
        title: Text('Mon panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: widget._cart.totalItems(),
                itemBuilder: (context, index) {
                  return _buildItem(widget._cart.getCartItem(index));
                }),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Table(
              defaultColumnWidth: FixedColumnWidth(120.0),
              border: TableBorder.all(
                  color: Colors.red, style: BorderStyle.solid, width: 1.5),
              children: [
                TableRow(children: [
                  Column(children: []),
                  Column(children: [
                    Text('TOTAL HT',
                        style: PizzeriaStyle.priceSubTotalTextStyle)
                  ]),
                  Column(children: [
                    Text('${widget._cart.ht()}', style: PizzeriaStyle.priceSubTotalTextStyle)
                  ]),
                ]),
                TableRow(children: [
                  Column(children: []),
                  Column(children: [
                    Text('TVA', style: PizzeriaStyle.priceSubTotalTextStyle)
                  ]),
                  Column(children: [
                    Text('${totalAffiche}', style: PizzeriaStyle.priceSubTotalTextStyle)
                  ]),
                ]),
                TableRow(children: [
                  Column(children: []),
                  Column(children: [
                    Text('TOTAL TTC', style: PizzeriaStyle.priceTotalTextStyle)
                  ]),
                  Column(children: [
                    Text('${widget._cart.getTotal()}', style: PizzeriaStyle.priceTotalTextStyle)
                  ]),
                ])
              ],
            ),
          ),
          Container(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red.shade800)),
                  child: Row(children: [
                    Text('Valider le panier'),
                    SizedBox(width: 5),
                  ]),
                  onPressed: () {
                    print('Achat effectué');
                  })),
        ],
      ),
    );
  }

  Widget _buildItem(CartItem cartItem) {
    return Row(
      children: [
        Image.asset('assets/images/pizza/${cartItem.pizza.image}', height: 150),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${cartItem.pizza.title}',
                style: PizzeriaStyle.pageTitleTextStyle,
              ),
              _buyItem(cartItem),
              Text(
                "Sous-Total : ${(cartItem.pizza.total * cartItem.quantity).toString()} €",
                style: PizzeriaStyle.priceTotalTextStyle,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buyItem(CartItem cartItem) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Text(cartItem.pizza.price.toString()),
        IconButton(
          onPressed: () {
            setState(() {
              cartItem.quantity++;
            });
          },
          icon: Icon(Icons.add),
        ),
        Text(cartItem.quantity.toString()),
        IconButton(
            onPressed: () {
              setState(() {
                cartItem.quantity--;
              });
            },
            icon: Icon(Icons.remove))
      ]),
    );
  }
}
