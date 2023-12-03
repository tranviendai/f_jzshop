import 'package:f_jzshop/app/config/reponsive.dart';
import 'package:f_jzshop/app/data/repository/repository.dart';
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
    return Responsive(
      desktop: profile(user,true),
      mobile: profile(user,false),
      tablet: profile(user,true),
    );
  }
  Widget profile(UserModel user, bool isAppBar){
    return Scaffold(
      appBar: isAppBar ? AppBar(
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
      ) : AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "avt",
                child: Image.network(user.image!,height: 150),
              ),
              Text("FullName: ${user.fullName!}",style: const TextStyle(fontSize: 30)),
              Text("Email: ${user.email!}",style: const TextStyle(fontSize: 24)),
              Text("Phone Number: ${user.phoneNumber!}",style:const  TextStyle(fontSize: 22)),
              Text("Date Created: ${user.dateCreated!}",style: const TextStyle(fontSize: 20)),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black12),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(20))
                ),
                onPressed: (){
                 APIRepository().logOut();
                Navigator.pushNamed(context, "SignIn");
              }, child: const Text("LogOut", style: TextStyle(color: Colors.blue,letterSpacing: 2.5),)
              )
            ],
          ),
        ),
      ),
    );
  }
}