// To parse this JSON data, do
//
//     final shopModell = shopModellFromJson(jsonString);

import 'dart:convert';

ShopModell shopModellFromJson(String str) =>
    ShopModell.fromJson(json.decode(str));

String shopModellToJson(ShopModell data) => json.encode(data.toJson());

class ShopModell {
  String response;
  List<MenuItem> menuItems;
  String pageTitle;
  Website website;

  ShopModell({
    required this.response,
    required this.menuItems,
    required this.pageTitle,
    required this.website,
  });

  factory ShopModell.fromJson(Map<String, dynamic> json) => ShopModell(
        response: json["response"],
        menuItems: List<MenuItem>.from(
            json["menu_items"].map((x) => MenuItem.fromJson(x))),
        pageTitle: json["page_title"],
        website: Website.fromJson(json["website"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "menu_items": List<dynamic>.from(menuItems.map((x) => x.toJson())),
        "page_title": pageTitle,
        "website": website.toJson(),
      };
}

class MenuItem {
  String name;
  // SliderTitle sliderTitle;
  // SliderDesc sliderDesc;
  String isActive;
  String sliderImage;
  List<Product> products;

  MenuItem({
    required this.name,
    // required this.sliderTitle,
    // required this.sliderDesc,
    required this.isActive,
    required this.sliderImage,
    required this.products,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        name: json["name"],
        // sliderTitle: sliderTitleValues.map[json["slider_title"]]!,
        // sliderDesc: sliderDescValues.map[json["slider_desc"]]!,
        isActive: json["is_active"],
        sliderImage: json["slider_image"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        // "slider_title": sliderTitleValues.reverse[sliderTitle],
        // "slider_desc": sliderDescValues.reverse[sliderDesc],
        "is_active": isActive,
        "slider_image": sliderImage,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  String id;
  String name;
  String desc;
  String amount;
  String productType;
  String isActive;
  String image;
  // Currency currency;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.amount,
    required this.productType,
    required this.isActive,
    required this.image,
    // required this.currency,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        amount: json["amount"],
        productType: json["product_type"],
        isActive: json["is_active"],
        image: json["image"],
        // currency: currencyValues.map[json["currency"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "amount": amount,
        "product_type": productType,
        "is_active": isActive,
        "image": image,
        // "currency": currencyValues.reverse[currency],
      };
}

// enum Currency { EMPTY, INR }

// final currencyValues = EnumValues({"₹": Currency.EMPTY, "INR": Currency.INR});

// enum SliderDesc { EMPTY, STARTER_DISHES }

// final sliderDescValues = EnumValues(
//     {"": SliderDesc.EMPTY, "Starter dishes": SliderDesc.STARTER_DISHES});

// enum SliderTitle { EMPTY, STARTER }

// final sliderTitleValues =
//     EnumValues({"": SliderTitle.EMPTY, "Starter": SliderTitle.STARTER});

class Website {
  String id;
  String restaurantId;
  String eventId;
  String aboutUs;
  String sliderTitle;
  String sliderDesc;
  String phone;
  String mobile;
  String email;
  String address;
  String copyright;
  String facebookLink;
  String instagramLink;
  String twitterLink;
  String pinterestLink;
  String linkedinLink;
  String image;
  String isPdfMenu;
  String pdfMenu;

  Website({
    required this.id,
    required this.restaurantId,
    required this.eventId,
    required this.aboutUs,
    required this.sliderTitle,
    required this.sliderDesc,
    required this.phone,
    required this.mobile,
    required this.email,
    required this.address,
    required this.copyright,
    required this.facebookLink,
    required this.instagramLink,
    required this.twitterLink,
    required this.pinterestLink,
    required this.linkedinLink,
    required this.image,
    required this.isPdfMenu,
    required this.pdfMenu,
  });

  factory Website.fromJson(Map<String, dynamic> json) => Website(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        eventId: json["event_id"],
        aboutUs: json["about_us"],
        sliderTitle: json["slider_title"],
        sliderDesc: json["slider_desc"],
        phone: json["phone"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        copyright: json["copyright"],
        facebookLink: json["facebook_link"],
        instagramLink: json["instagram_link"],
        twitterLink: json["twitter_link"],
        pinterestLink: json["pinterest_link"],
        linkedinLink: json["linkedin_link"],
        image: json["image"],
        isPdfMenu: json["is_pdf_menu"],
        pdfMenu: json["pdf_menu"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_id": restaurantId,
        "event_id": eventId,
        "about_us": aboutUs,
        "slider_title": sliderTitle,
        "slider_desc": sliderDesc,
        "phone": phone,
        "mobile": mobile,
        "email": email,
        "address": address,
        "copyright": copyright,
        "facebook_link": facebookLink,
        "instagram_link": instagramLink,
        "twitter_link": twitterLink,
        "pinterest_link": pinterestLink,
        "linkedin_link": linkedinLink,
        "image": image,
        "is_pdf_menu": isPdfMenu,
        "pdf_menu": pdfMenu,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
