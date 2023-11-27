import 'package:f_jzshop/app/config/reponsive.dart';
import 'package:f_jzshop/app/data/bloc/auth/AuthCubit.dart';
import 'package:f_jzshop/app/data/bloc/auth/AuthState.dart';
import 'package:f_jzshop/app/model/user_model.dart';
import 'package:f_jzshop/screen/auth/profile_screen.dart';
import 'package:f_jzshop/screen/home/home_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
    int _selectedIndex = 0;
    var user = UserModel();

    @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getUsers();
  }
  void _onItemTapped(int index){
   setState(() {
      _selectedIndex = index;
   });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = [
      HomeScreen(),
      ProfileScreen(user: user),
    ];
    return Scaffold(
       body: BlocBuilder<AuthCubit,AuthState>(
          builder: (context, state) {
            if(state is AuthLoadedState){
                 user = state.user!;
                  return Responsive(
              desktop: navBar(
                context,user
              ),
              tablet: navBar(
                context,user
              ),
              mobile: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.blue,
                  title: const Text(
                    "JZENO",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "Cart");
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ))
                  ],
                ),
                body: widgetOptions[_selectedIndex],
                bottomNavigationBar: BottomNavigationBar(
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person")
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.blue,
                  onTap: _onItemTapped,
                ),
              ),
            );
             }else{
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
             }
           
          }
        ),
    );
  }
}

Widget navBar(BuildContext context, UserModel user) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.blue,
      title: Row(
        children: [
           const Text("JZENO",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          itemNav(context, "Home", Icons.home, user)
        ],
      ),
      actions: [
        itemNav(context, "", Icons.shopping_cart, user),
        itemNav(context, user.fullName!, Icons.person, user),
        itemNav(context, "LogOut", Icons.logout, user),
      ],
    ),
    body: const HomeScreen(),
  );
}

Widget itemNav(
    BuildContext context, String text, IconData icon, UserModel? user) {
  return InkWell(
      onTap: () {
        switch (icon) {
          case Icons.shopping_cart:
            Navigator.pushNamed(context, "Cart");
          case Icons.logout:
            {
              AuthCubit.token = "";
              Navigator.pop(context);
            }
            case Icons.person:
            {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen(user: user!)));
            }
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
