import 'package:flutter/material.dart';
import 'package:gndu_project/data.dart';
import 'package:gndu_project/details.dart';

class Donate extends StatefulWidget {
  final String title;
  final DataClass d;
  final Function(Details, String) f;
  final Function(Donation) addDonation;
  Donate(this.title, this.d, this.f, this.addDonation);

  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  String note;
  bool form = false;
  TextEditingController name, email, contact, addr, city, state, zip, country;
  void initState() {
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    contact = TextEditingController();
    addr = TextEditingController();
    city = TextEditingController();
    state = TextEditingController();
    zip = TextEditingController();
    country = TextEditingController();
  }

  Widget fieldPadding(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            fieldPadding(TextField(
              onChanged: (String str) {
                note = str;
                setState(() {});
              },
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Donate Commodities  :",
              ),
            )),
            fieldPadding(TextFormField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name  :"),
            )),
            fieldPadding(TextFormField(
              controller: addr,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Address  :"),
              maxLines: 2,
            )),
            fieldPadding(TextFormField(
              controller: city,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "City  :"),
            )),
            fieldPadding(TextFormField(
              controller: state,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "State  :"),
            )),
            fieldPadding(TextFormField(
              controller: country,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Country  :"),
            )),
            fieldPadding(TextFormField(
              controller: zip,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Zip  :"),
              keyboardType: TextInputType.number,
            )),
            fieldPadding(TextFormField(
              controller: contact,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Contact  :"),
              keyboardType: TextInputType.number,
            )),
            fieldPadding(TextFormField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email  :",
              ),
            )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.send),
          onPressed: () {
            widget.addDonation(Donation(
              contact: contact.text,
              location: Loc(
                  addr: addr.text,
                  city: city.text,
                  country: country.text,
                  state: state.text),
              name: name.text,
              zip: zip.text,
              email: email.text,
              note: note,
            ));
            Navigator.pop(context);
          },
        ));
  }
}
