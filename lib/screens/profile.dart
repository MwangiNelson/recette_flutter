import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recette_flutter/controllers/user_provider.dart';
import 'package:recette_flutter/screens/auth/login.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var user = userProvider.user;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 189, 0, 1),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/user.png",
                width: 150.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                user!.username,
                style: GoogleFonts.barlowSemiCondensed(
                    fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                user!.email,
                style: GoogleFonts.barlowSemiCondensed(
                    fontSize: 25.0, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 20.0,
              ),
              OutlinedButton(
                  onPressed: () {
                    Provider.of<UserProvider>(context, listen: false).signOut();
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: BorderSide(color: Colors.red)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("SIGN OUT"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
