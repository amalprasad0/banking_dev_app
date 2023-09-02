class MyData {
  final int id;
  final String imgUrl;
  final String title;
  final String content;
  final List<String> description;
  final String screenRoute;

  MyData({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.content,
    required this.description,
    required this.screenRoute,
  });
}

class CardData {
  final int id;
  final int homeId;
  final String title;
  final String data;
  final List<String> features;

  CardData({
    required this.id,
    required this.homeId,
    required this.title,
    required this.data,
    required this.features,
  });
}

class FundData {
  final int id;
  final int selectId;
  final String screenRoute;
  final List<String> items;
  FundData({
    required this.id,
    required this.selectId,
    required this.screenRoute,
    required this.items,
  });
}

class UserData {
  final int id;
  final String deviceId;
  final int amount;
  final String item;
  UserData({
    required this.id,
    required this.deviceId,
    required this.amount,
    required this.item,
  });
}
