import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recette_flutter/screens/components/rounded_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:recette_flutter/screens/recipe_view.dart';
import 'package:recette_flutter/screens/test.dart';

// ignore: must_be_immutable
class RecipeCard extends StatelessWidget {
  final String url;
  final String title;
  final String author;
  Map<String, dynamic> recipe;

  RecipeCard(
      {super.key,
      required this.url,
      required this.title,
      required this.author,
      required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        width: 250.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.yellow.shade50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RoundedImage(imageUrl: url),
                const SizedBox(
                  height: 10.0,
                ),
                Row(children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.sarabun(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ]),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  width: 200.0,
                  child: Text(
                    "By $author",
                    style: GoogleFonts.sarabun(
                      fontSize: 15.0,
                      color: Colors.grey.shade800,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade900,
                        padding: const EdgeInsets.all(15.0)),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => RecipeView(
                                  recipes: recipe,
                                ))),
                    icon: const Icon(
                      EvaIcons.arrowRightOutline,
                      color: Colors.white,
                    ),
                    label: const Text("Explore Recipe")),
              ]),
        ),
      ),
    );
  }
}
