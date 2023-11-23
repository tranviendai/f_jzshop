import 'package:f_jzshop/app/config/reponsive.dart';
import 'package:f_jzshop/screen/home/home_sceen.dart';
import 'package:flutter/material.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
              desktop: navBar(context),
              tablet: navBar(context),
              mobile: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blue,
                  title: const Text(
                    "JZENO",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ))
                  ],
                ),
                body: const HomeScreen(),
                bottomNavigationBar: BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "Person")
                  ],
                ),
              ),
            );
  }
}

Widget navBar(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Row(
        children: [
          const Text("JZeno",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          itemNav(context,"Home", Icons.home)
        ],
      ),
      actions: [
        itemNav(context,"Cart", Icons.shopping_cart),
        itemNav(context,"Profile", Icons.person)
      ],
    ),
    body: const HomeScreen(),
  );
}

Widget itemNav(BuildContext context,String text, IconData icon) {
  return InkWell(
      onTap: () {
        if(text=="Cart"){
          Navigator.pushNamed(context, "Cart");
        }
      },
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Center(
              child: Row(children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 5),
            Text(text.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18))
          ]))));
}