import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

var recipesUrl = 'http://127.0.0.1:8000/api/recipes';
var topRecipesUrl = 'http://127.0.0.1:8000/api/recipes/topRecipes';
var latestRecipesUrl = 'http://127.0.0.1:8000/api/recipes/latestRecipes';
var usersUrl = 'http://127.0.0.1:8000/api/users';

class Recipes {
  List<dynamic> recipes = [];
  List<dynamic> allRecipes = [];
  List<dynamic> latestRecipes = [];
  fetchRecipes() async {
    var response = await http.get(Uri.parse(topRecipesUrl));
    var latestResponse = await http.get(Uri.parse(latestRecipesUrl));
    var allRecipesJson = await http.get(Uri.parse(recipesUrl));

    var jsonRes = convert.jsonDecode(response.body) as Map<String, dynamic>;
    recipes = jsonRes['data'];

    var jsonRes2 =
        convert.jsonDecode(latestResponse.body) as Map<String, dynamic>;
    latestRecipes = jsonRes2['data'];

    var jsonResRecipes =
        convert.jsonDecode(allRecipesJson.body) as Map<String, dynamic>;
    allRecipes = jsonResRecipes['data'];
  }
}
