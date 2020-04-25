class Webcam{
  final String country;
  final String city;
  final String url;
  
  

  Webcam({this.country, this.city, this.url});

  factory Webcam.fromJson(Map<String, dynamic> json){

    return Webcam(
      country: json["country"],
      city: json["city"],
      url: json["url"],    
    );

  }
}