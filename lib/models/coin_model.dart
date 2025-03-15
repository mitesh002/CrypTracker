import 'dart:convert';

List<Coin> coinFromJson(String str) =>
    List<Coin>.from(json.decode(str).map((x) => Coin.fromJson(x)));

String coinToJson(List<Coin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coin {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  double marketCap;
  int marketCapRank;
  double totalVolume;
  double high24H;
  double low24H;
  double priceChange24H;
  double priceChangePercentage24H;
  double marketCapChange24H;
  double marketCapChangePercentage24H;
  double circulatingSupply;
  double ath;
  double athChangePercentage;
  DateTime athDate;
  double atl;
  double atlChangePercentage;
  DateTime atlDate;
  Roi? roi;

  Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.circulatingSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    this.roi,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: (json["current_price"] ?? 0).toDouble(),
        marketCap: (json["market_cap"] ?? 0).toDouble(),
        marketCapRank: json["market_cap_rank"] ?? 0,
        totalVolume: (json["total_volume"] ?? 0).toDouble(),
        high24H: (json["high_24h"] ?? 0).toDouble(),
        low24H: (json["low_24h"] ?? 0).toDouble(),
        priceChange24H: (json["price_change_24h"] ?? 0).toDouble(),
        priceChangePercentage24H:
            (json["price_change_percentage_24h"] ?? 0).toDouble(),
        marketCapChange24H: (json["market_cap_change_24h"] ?? 0).toDouble(),
        marketCapChangePercentage24H:
            (json["market_cap_change_percentage_24h"] ?? 0).toDouble(),
        circulatingSupply: (json["circulating_supply"] ?? 0).toDouble(),
        ath: (json["ath"] ?? 0).toDouble(),
        athChangePercentage: (json["ath_change_percentage"] ?? 0).toDouble(),
        athDate: DateTime.tryParse(json["ath_date"] ?? "") ?? DateTime.now(),
        atl: (json["atl"] ?? 0).toDouble(),
        atlChangePercentage: (json["atl_change_percentage"] ?? 0).toDouble(),
        atlDate: DateTime.tryParse(json["atl_date"] ?? "") ?? DateTime.now(),
        roi: json["roi"] != null ? Roi.fromJson(json["roi"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "market_cap": marketCap,
        "market_cap_rank": marketCapRank,
        "total_volume": totalVolume,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "circulating_supply": circulatingSupply,
        "ath": ath,
        "ath_change_percentage": athChangePercentage,
        "ath_date": athDate.toIso8601String(),
        "atl": atl,
        "atl_change_percentage": atlChangePercentage,
        "atl_date": atlDate.toIso8601String(),
        "roi": roi?.toJson(),
      };
}

class Roi {
  double times;
  String currency;
  double percentage;

  Roi({
    required this.times,
    required this.currency,
    required this.percentage,
  });

  factory Roi.fromJson(Map<String, dynamic> json) => Roi(
        times: (json["times"] ?? 0).toDouble(),
        currency: json["currency"] ?? "usd",
        percentage: (json["percentage"] ?? 0).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "times": times,
        "currency": currency,
        "percentage": percentage,
      };
}
