import 'package:flutter/material.dart';

class Category extends StatelessWidget {


  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular",
                style: GoogleFonts.sarabun(
                    fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const Test())),
                child: const Text("See more"),
              )
            ],
          ),
        ),
        Divider(
          thickness: 2.5,
          color: Colors.orange[500],
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: _buildTopRecipes()),
      ]),
    );
  }
}
