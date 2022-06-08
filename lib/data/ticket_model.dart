class Ticket {
  int id;
  String name;
  String imageUrl;
  String formattedDate;
  String formattedTime;
  String numericDate;
  double price;
  String location;
  String remainingHours;
  bool isReserved;
  bool isSaved;

  Ticket({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.formattedDate,
    required this.formattedTime,
    required this.numericDate,
    required this.price,
    required this.location,
    required this.remainingHours,
    this.isReserved = false,
    this.isSaved = false,
  });
}
