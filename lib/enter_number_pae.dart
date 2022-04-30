import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EnterNumberPage extends StatefulWidget {
  const EnterNumberPage({Key? key}) : super(key: key);

  @override
  State<EnterNumberPage> createState() => _EnterNumberPageState();
}

class _EnterNumberPageState extends State<EnterNumberPage> {
  // late String whatsAppNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(
            child: Text('Gbemilo WhatsApp'),
            onPressed: () {
              _sendMessageToWhatsApp();
            },
          )
        ],
      )),
    );
  }

  void _sendMessageToWhatsApp() async {
    var whatsappNumber = "+2349061913344";
    final whatsappURlAndroid =
        Uri.parse("whatsapp://send?phone=" + whatsappNumber + "&text=hello");
    final whatappURLIOS =
        Uri.parse("https://wa.me/$whatsappNumber?text=${Uri.parse("hello")}");
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(whatappURLIOS)) {
        await launchUrl(whatappURLIOS,);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(whatsappURlAndroid)) {
        await launchUrl(whatsappURlAndroid);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }
}
