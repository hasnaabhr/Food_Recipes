import 'package:share_plus/share_plus.dart';

class ShareRecipe {
  static share(String recipeLink) async {
    await Share.share(recipeLink);
  }
}
