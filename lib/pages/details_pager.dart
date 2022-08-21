import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mrz_parser/mrz_parser.dart';

class DetailsPage extends HookWidget {
  late List<String> data;
  DetailsPage({required this.data});

  @override
  Widget build(BuildContext context) {
    final details = useState<MRZResult?>(null);
    final first = useState(true);
    if (first.value) {
      first.value = false;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      try {
        details.value = MRZParser.parse(data);
      } catch (e) {
        print(e);
      }
    }
    return Scaffold(
      appBar: AppBar(),
      body: details.value != null
          ? ListView(
              children: [
                ElevatedButton(
                  onPressed: () async {},
                  child: Text("new "),
                ),
                ElevatedButton(onPressed: () async {}, child: Text("dfh")),
                const Text(
                  'You have pushed the button this many times:',
                ),
                ListTile(
                  title: Text(details.value!.surnames),
                  subtitle: Text("name"),
                ),
                const Divider(),
                ListTile(
                  title: Text(details.value!.birthDate.toString()),
                  subtitle: Text("BirthDay"),
                ),
                const Divider(),
                ListTile(
                  title: Text(details.value!.personalNumber),
                  subtitle: Text("Phone"),
                ),
                const Divider(),
                ListTile(
                  title: Text(details.value!.personalNumber2 ?? "----"),
                  subtitle: Text("Phone1"),
                ),
                const Divider(),
                ListTile(
                  title: Text(details.value!.expiryDate.toString()),
                  subtitle: Text("Expire Date"),
                ),
                const Divider(),
                ListTile(
                  title: Text(details.value!.sex.name),
                  subtitle: Text("Gander"),
                ),
                const Divider(),
                ListTile(
                  title: Text(details.value!.documentNumber),
                  subtitle: Text("Document Number"),
                ),
                const Divider(),
                ListTile(
                  title: Text(details.value!.documentType),
                  subtitle: Text("Document Type"),
                ),
                const Divider(),
                ListTile(
                  title: Text(details.value!.countryCode),
                  subtitle: Text("ContryCode"),
                ),
                const Divider(),
              ],
            )
          : const Center(
              child: Text("waite for result ...."),
            ),
    );
  }
}
