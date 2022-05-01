import 'dart:io';

import 'package:flutter/material.dart';
import 'package:send_a_dm/text_field_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class EnterNumberPage extends StatefulWidget {
  const EnterNumberPage({Key? key}) : super(key: key);

  @override
  State<EnterNumberPage> createState() => _EnterNumberPageState();
}

class _EnterNumberPageState extends State<EnterNumberPage> {
  late String whatsAppNumber;
  final TextEditingController _numberController = TextEditingController();
  final String helloMessage =
      'Hello Sapien!!!\nI hope you have a lovely day...\nSobuur✌.';
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusNode.dispose();

    super.dispose();
  }

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
              TextFieldWidget(
                numberController: _numberController,
                focusNode: _focusNode,
                labelText: 'Enter your 11 digits WhatsApp Number',
              ),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                child: ElevatedButton(
                  child: const Text('Gbemilo WhatsApp'),
                  onPressed: () {
                    _focusNode.requestFocus();
                    _sendMessageToWhatsApp();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF7D5FFF),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessageToWhatsApp() async {
    whatsAppNumber = _numberController.text;
    final whatsappURlAndroid = Uri.parse('whatsapp://send?phone='
        '+234$whatsAppNumber'
        '&text=$helloMessage');
    final whatappURLIOS = Uri.parse(
        'https://wa.me/$whatsAppNumber?text=${Uri.parse(helloMessage)}');
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(whatappURLIOS)) {
        await launchUrl(
          whatappURLIOS,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Kindly confirm that WhatsApp is installed'),
          ),
        );
      }
    } else {
      // android , web
      if (await canLaunchUrl(whatsappURlAndroid)) {
        await launchUrl(whatsappURlAndroid);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Kindly confirm that WhatsApp is installed'),
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