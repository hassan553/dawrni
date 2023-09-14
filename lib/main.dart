import 'package:dawrni/app/app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() => runApp(DevicePreview(
      builder: (context) => Dawrni(), // Wrap your app
    ));
    
//
/*
PinCodeFields(
  length: 4,
  fieldBorderStyle: FieldBorderStyle.square,
  responsive: false,
  fieldHeight: 130.0,
  fieldWidth: 130.0,
  borderWidth: 5.0,
  activeBorderColor: Colors.blue,
  activeBackgroundColor: Colors.white,
  borderRadius: BorderRadius.circular(20.0),
  keyboardType: TextInputType.number,
  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  autoHideKeyboard: false,
  fieldBackgroundColor: Colors.black12,
  borderColor: Colors.black12,
  textStyle: TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  ),
  onComplete(text) => print(text),
)
*/
/*
IntlPhoneField(
    decoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
            borderSide: BorderSide(),
        ),
    ),
    initialCountryCode: 'IN',
    onChanged: (phone) {
        print(phone.completeNumber);
    },
)
*/