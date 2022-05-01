import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EnterNumberPage extends StatefulWidget {
  const EnterNumberPage({Key? key}) : super(key: key);

  @override
  State<EnterNumberPage> createState() => _EnterNumberPageState();
}

class _EnterNumberPageState extends State<EnterNumberPage> {
  late String whatsAppNumber;
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 135.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _numberController,
                decoration: InputDecoration(
                  labelText: 'Enter your 10 digits WhatsApp Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFE0DBFC), width: 8.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.yellow..shade800,
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(
                top: 20.0,
              )),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                child: ElevatedButton(
                  child: Text('Gbemilo WhatsApp'),
                  onPressed: () {
                    _sendMessageToWhatsApp();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessageToWhatsApp() async {
    var whatsAppNumber = _numberController.text;
    final whatsappURlAndroid =
        Uri.parse('whatsapp://send?phone=' '+234$whatsAppNumber' '&text=hwfa my boss..Oya drop message');
    final whatappURLIOS =
        Uri.parse('https://wa.me/$whatsAppNumber?text=${Uri.parse('hello')}');
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(whatappURLIOS)) {
        await launchUrl(
          whatappURLIOS,
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text('whatsapp no installed')));
      }
    } else {
      // android , web
      if (await canLaunchUrl(whatsappURlAndroid)) {
        await launchUrl(whatsappURlAndroid);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: new Text('whatsapp no installed'),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {},
            ),
          ),
        );
      }
    }
  }
}



//Error messages-- u no wan tell me ur nameeee???