import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recette_flutter/screens/test.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class RecipeView extends StatelessWidget {
  Map<String, dynamic> recipes;

  RecipeView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> ingredients = recipes['ingredients'].split('|');
    List<String> procedure = recipes['description'].split('.');

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(255, 189, 0, 1),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Image.network(
                recipes['image_url'],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                fit: BoxFit.cover,
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        recipes['title'],
                        style: GoogleFonts.sarabun(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          EvaIcons.heartOutline,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ingredients",
                                style: GoogleFonts.sarabun(fontSize: 20.0),
                              ),
                              OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.content_copy),
                                label: const Text('Copy'),
                              )
                            ],
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 1.0,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: ingredients.length,
                            itemBuilder: (context, index) {
                              return Text(
                                ingredients[index],
                                style: GoogleFonts.sarabun(fontSize: 16.0),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Procedure",
                              style: GoogleFonts.sarabun(fontSize: 20.0),
                            ),
                            const Divider(
                              thickness: 1.0,
                              color: Colors.black,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: procedure.length - 1,
                              itemBuilder: (context, index) {
                                return Text(
                                  '${index + 1}. ${procedure[index]}',
                                  style: GoogleFonts.sarabun(fontSize: 16.0),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade900,
                            padding: const EdgeInsets.all(18.0)),
                        onPressed: () {},
                        icon: const Icon(
                          EvaIcons.bookmarkOutline,
                          color: Colors.white,
                        ),
                        label: const Text("Save Recipe")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
