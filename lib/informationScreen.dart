import 'package:flutter/material.dart';
import '../widgets/text.dart';

class UserDataForm extends StatelessWidget {
  final data;
  
  UserDataForm({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            width: 440,
            height: 470,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(300),
                  topLeft: Radius.zero,
                ),
                color: Colors.yellow.shade700,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, top: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    textWidget(textKey: 'Id: ', textValue: data.id.toString()),
                    textWidget(textKey: 'Email: ', textValue: data.email.toString()),
                    textWidget(textKey: 'Username: ', textValue: data.username.toString()),
                    textWidget(textKey: 'Password: ', textValue: data.password.toString()),
                    textWidget(textKey: 'Firstname: ', textValue: data.name.firstname.toString()),
                    textWidget(textKey: 'Lastname: ', textValue: data.name.lastname.toString()),
                    textWidget(textKey: 'Phone: ', textValue: data.phone.toString()),
                    textWidget(textKey: 'V: ', textValue: data.v.toString()),
                    textWidget(textKey: 'Address:', textValue: ""),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          textWidget(textKey: '-City: ', textValue: data.address.city.toString()),
                          textWidget(textKey: '-Street: ', textValue: data.address.street.toString()),
                          textWidget(textKey: '-Number: ', textValue: data.address.number.toString()),
                          textWidget(textKey: '-ZipCode: ', textValue: data.address.zipcode.toString()),
                          textWidget(textKey: '-Geolocation: ', textValue: ""),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Column(
                        children: [
                          textWidget(textKey: '+Lat: ', textValue: data.address.geolocation.lat.toString()),
                          textWidget(textKey: '+Long: ', textValue: data.address.geolocation.long.toString()),
                        ],
                      ),
                    )
                    
                  ],
                ),
              )
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 200, 0, 0),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }

  
}