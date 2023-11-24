import 'package:f_jzshop/app/model/user_model.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final UserModel user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
  var user = widget.user;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text(user.fullName!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(user.image!,height: 150),
              Text("FullName: ${user.fullName!}",style: const TextStyle(fontSize: 30)),
              Text("Email: ${user.email!}",style: const TextStyle(fontSize: 24)),
              Text("Phone Number: ${user.phoneNumber!}",style:const  TextStyle(fontSize: 22)),
              Text("Date Created: ${user.dateCreated!}",style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}