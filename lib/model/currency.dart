class Currency{
  final bool success;
  final int timestamp;
  final String base;
  final String date; 
  final List<Rate> rates;

  Currency({this.success, this.timestamp, this.base, this.date, this.rates});

  factory Currency.fromJson(Map<String, dynamic> json){

    Map<String, dynamic> mapRates = json["rates"];
    List<Rate> rates = new List<Rate>();

    mapRates.forEach((key, value) {
      print(" key : $key value : $value");
      
      rates.add(Rate(key, value.toDouble()));
    });


    /*mapRates.forEach(k, v) {
      rates.add(Rate(k, v));
    }*/
 
    return Currency(
      success: json["success"],
      timestamp: json["timestamp"],
      base: json["base"],
      date: json["date"],
      rates: rates
    );
  }
}


class Rate {
  final String countryId;
  final double rate;
  Rate(this.countryId, this.rate, );
}