class ModelInventory {
  String name;
  int id;
  int price;
  int price_max;
  String measure_unit;
  String description;
  String image;
  int pack_quantity;
  int qr_status;

  ModelInventory(json) {
    Map<String, dynamic> data = json;

    this.name = data['name'];
    this.id = data['id'];
    this.price = data['price'];
    this.price_max = data['price_max'];
    this.measure_unit = data['measure_unit'];
    this.description = data['description'];
    this.image = data['image'];
    this.pack_quantity = data['pack_quantity'];
    this.qr_status = data['qr_status'];
  }

  int SetQRStatus(int qr_status){
    this.qr_status = qr_status;
  }

}
