class DrinkListModel {
  List<Drinks> drinks;

  DrinkListModel({this.drinks});

  DrinkListModel.fromJson(Map<String, dynamic> json) {
    if (json["drinks"] is List)
      this.drinks = json["drinks"] == null
          ? null
          : (json["drinks"] as List).map((e) => Drinks.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drinks != null)
      data["drinks"] = this.drinks.map((e) => e.toJson()).toList();
    return data;
  }
}

class Drinks {
  String idDrink;
  String strDrink;
  dynamic strDrinkAlternate;
  dynamic strTags;
  dynamic strVideo;
  String strCategory;
  dynamic strIba;
  String strAlcoholic;
  String strGlass;
  String strInstructions;
  dynamic strInstructionsEs;
  String strInstructionsDe;
  dynamic strInstructionsFr;
  String strInstructionsIt;
  dynamic strInstructionsZhHans;
  dynamic strInstructionsZhHant;
  String strDrinkThumb;
  String strIngredient1;
  String strIngredient2;
  String strIngredient3;
  String strIngredient4;
  String strIngredient5;
  dynamic strIngredient6;
  dynamic strIngredient7;
  dynamic strIngredient8;
  dynamic strIngredient9;
  dynamic strIngredient10;
  dynamic strIngredient11;
  dynamic strIngredient12;
  dynamic strIngredient13;
  dynamic strIngredient14;
  dynamic strIngredient15;
  String strMeasure1;
  String strMeasure2;
  String strMeasure3;
  String strMeasure4;
  String strMeasure5;
  dynamic strMeasure6;
  dynamic strMeasure7;
  dynamic strMeasure8;
  dynamic strMeasure9;
  dynamic strMeasure10;
  dynamic strMeasure11;
  dynamic strMeasure12;
  dynamic strMeasure13;
  dynamic strMeasure14;
  dynamic strMeasure15;
  dynamic strImageSource;
  dynamic strImageAttribution;
  String strCreativeCommonsConfirmed;
  String dateModified;

  Drinks(
      {this.idDrink,
      this.strDrink,
      this.strDrinkAlternate,
      this.strTags,
      this.strVideo,
      this.strCategory,
      this.strIba,
      this.strAlcoholic,
      this.strGlass,
      this.strInstructions,
      this.strInstructionsEs,
      this.strInstructionsDe,
      this.strInstructionsFr,
      this.strInstructionsIt,
      this.strInstructionsZhHans,
      this.strInstructionsZhHant,
      this.strDrinkThumb,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strIngredient6,
      this.strIngredient7,
      this.strIngredient8,
      this.strIngredient9,
      this.strIngredient10,
      this.strIngredient11,
      this.strIngredient12,
      this.strIngredient13,
      this.strIngredient14,
      this.strIngredient15,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5,
      this.strMeasure6,
      this.strMeasure7,
      this.strMeasure8,
      this.strMeasure9,
      this.strMeasure10,
      this.strMeasure11,
      this.strMeasure12,
      this.strMeasure13,
      this.strMeasure14,
      this.strMeasure15,
      this.strImageSource,
      this.strImageAttribution,
      this.strCreativeCommonsConfirmed,
      this.dateModified});

  Drinks.fromJson(Map<String, dynamic> json) {
    if (json["idDrink"] is String) this.idDrink = json["idDrink"];
    if (json["strDrink"] is String) this.strDrink = json["strDrink"];
    this.strDrinkAlternate = json["strDrinkAlternate"];
    this.strTags = json["strTags"];
    this.strVideo = json["strVideo"];
    if (json["strCategory"] is String) this.strCategory = json["strCategory"];
    this.strIba = json["strIBA"];
    if (json["strAlcoholic"] is String)
      this.strAlcoholic = json["strAlcoholic"];
    if (json["strGlass"] is String) this.strGlass = json["strGlass"];
    if (json["strInstructions"] is String)
      this.strInstructions = json["strInstructions"];
    this.strInstructionsEs = json["strInstructionsES"];
    if (json["strInstructionsDE"] is String)
      this.strInstructionsDe = json["strInstructionsDE"];
    this.strInstructionsFr = json["strInstructionsFR"];
    if (json["strInstructionsIT"] is String)
      this.strInstructionsIt = json["strInstructionsIT"];
    this.strInstructionsZhHans = json["strInstructionsZH-HANS"];
    this.strInstructionsZhHant = json["strInstructionsZH-HANT"];
    if (json["strDrinkThumb"] is String)
      this.strDrinkThumb = json["strDrinkThumb"];
    if (json["strIngredient1"] is String)
      this.strIngredient1 = json["strIngredient1"];
    if (json["strIngredient2"] is String)
      this.strIngredient2 = json["strIngredient2"];
    if (json["strIngredient3"] is String)
      this.strIngredient3 = json["strIngredient3"];
    if (json["strIngredient4"] is String)
      this.strIngredient4 = json["strIngredient4"];
    if (json["strIngredient5"] is String)
      this.strIngredient5 = json["strIngredient5"];
    this.strIngredient6 = json["strIngredient6"];
    this.strIngredient7 = json["strIngredient7"];
    this.strIngredient8 = json["strIngredient8"];
    this.strIngredient9 = json["strIngredient9"];
    this.strIngredient10 = json["strIngredient10"];
    this.strIngredient11 = json["strIngredient11"];
    this.strIngredient12 = json["strIngredient12"];
    this.strIngredient13 = json["strIngredient13"];
    this.strIngredient14 = json["strIngredient14"];
    this.strIngredient15 = json["strIngredient15"];
    if (json["strMeasure1"] is String) this.strMeasure1 = json["strMeasure1"];
    if (json["strMeasure2"] is String) this.strMeasure2 = json["strMeasure2"];
    if (json["strMeasure3"] is String) this.strMeasure3 = json["strMeasure3"];
    if (json["strMeasure4"] is String) this.strMeasure4 = json["strMeasure4"];
    if (json["strMeasure5"] is String) this.strMeasure5 = json["strMeasure5"];
    this.strMeasure6 = json["strMeasure6"];
    this.strMeasure7 = json["strMeasure7"];
    this.strMeasure8 = json["strMeasure8"];
    this.strMeasure9 = json["strMeasure9"];
    this.strMeasure10 = json["strMeasure10"];
    this.strMeasure11 = json["strMeasure11"];
    this.strMeasure12 = json["strMeasure12"];
    this.strMeasure13 = json["strMeasure13"];
    this.strMeasure14 = json["strMeasure14"];
    this.strMeasure15 = json["strMeasure15"];
    this.strImageSource = json["strImageSource"];
    this.strImageAttribution = json["strImageAttribution"];
    if (json["strCreativeCommonsConfirmed"] is String)
      this.strCreativeCommonsConfirmed = json["strCreativeCommonsConfirmed"];
    if (json["dateModified"] is String)
      this.dateModified = json["dateModified"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["idDrink"] = this.idDrink;
    data["strDrink"] = this.strDrink;
    data["strDrinkAlternate"] = this.strDrinkAlternate;
    data["strTags"] = this.strTags;
    data["strVideo"] = this.strVideo;
    data["strCategory"] = this.strCategory;
    data["strIBA"] = this.strIba;
    data["strAlcoholic"] = this.strAlcoholic;
    data["strGlass"] = this.strGlass;
    data["strInstructions"] = this.strInstructions;
    data["strInstructionsES"] = this.strInstructionsEs;
    data["strInstructionsDE"] = this.strInstructionsDe;
    data["strInstructionsFR"] = this.strInstructionsFr;
    data["strInstructionsIT"] = this.strInstructionsIt;
    data["strInstructionsZH-HANS"] = this.strInstructionsZhHans;
    data["strInstructionsZH-HANT"] = this.strInstructionsZhHant;
    data["strDrinkThumb"] = this.strDrinkThumb;
    data["strIngredient1"] = this.strIngredient1;
    data["strIngredient2"] = this.strIngredient2;
    data["strIngredient3"] = this.strIngredient3;
    data["strIngredient4"] = this.strIngredient4;
    data["strIngredient5"] = this.strIngredient5;
    data["strIngredient6"] = this.strIngredient6;
    data["strIngredient7"] = this.strIngredient7;
    data["strIngredient8"] = this.strIngredient8;
    data["strIngredient9"] = this.strIngredient9;
    data["strIngredient10"] = this.strIngredient10;
    data["strIngredient11"] = this.strIngredient11;
    data["strIngredient12"] = this.strIngredient12;
    data["strIngredient13"] = this.strIngredient13;
    data["strIngredient14"] = this.strIngredient14;
    data["strIngredient15"] = this.strIngredient15;
    data["strMeasure1"] = this.strMeasure1;
    data["strMeasure2"] = this.strMeasure2;
    data["strMeasure3"] = this.strMeasure3;
    data["strMeasure4"] = this.strMeasure4;
    data["strMeasure5"] = this.strMeasure5;
    data["strMeasure6"] = this.strMeasure6;
    data["strMeasure7"] = this.strMeasure7;
    data["strMeasure8"] = this.strMeasure8;
    data["strMeasure9"] = this.strMeasure9;
    data["strMeasure10"] = this.strMeasure10;
    data["strMeasure11"] = this.strMeasure11;
    data["strMeasure12"] = this.strMeasure12;
    data["strMeasure13"] = this.strMeasure13;
    data["strMeasure14"] = this.strMeasure14;
    data["strMeasure15"] = this.strMeasure15;
    data["strImageSource"] = this.strImageSource;
    data["strImageAttribution"] = this.strImageAttribution;
    data["strCreativeCommonsConfirmed"] = this.strCreativeCommonsConfirmed;
    data["dateModified"] = this.dateModified;
    return data;
  }
}
