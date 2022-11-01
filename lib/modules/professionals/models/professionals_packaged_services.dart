class ProfessionalPackagedServices {
  String? title;
  String? description;
  String? price;
  String? days;
  List<ProfessionalServiceModel> services = [];

//<editor-fold desc="Data Methods">

  ProfessionalPackagedServices({
    this.title,
    this.description,
    this.price,
    this.days,
    required this.services,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfessionalPackagedServices &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          price == other.price &&
          days == other.days &&
          services == other.services);

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      price.hashCode ^
      days.hashCode ^
      services.hashCode;

  @override
  String toString() {
    return 'ProfessionalPackagedServices{ title: $title, description: $description, price: $price, days: $days, services: $services,}';
  }

  ProfessionalPackagedServices copyWith({
    String? title,
    String? description,
    String? price,
    String? days,
    List<ProfessionalServiceModel>? services,
  }) {
    return ProfessionalPackagedServices(
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      days: days ?? this.days,
      services: services ?? this.services,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'days': days,
      'services': services,
    };
  }

  factory ProfessionalPackagedServices.fromMap(Map<String, dynamic> map) {
    return ProfessionalPackagedServices(
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      days: map['days'] as String,
      services: map['services'] as List<ProfessionalServiceModel>,
    );
  }

//</editor-fold>
}

class ProfessionalServiceModel {
  String? tag;
  String? price;
  List<dynamic> items = [];

//<editor-fold desc="Data Methods">

  ProfessionalServiceModel({
    this.tag,
    this.price,
    required this.items,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfessionalServiceModel &&
          runtimeType == other.runtimeType &&
          tag == other.tag &&
          price == other.price &&
          items == other.items);

  @override
  int get hashCode => tag.hashCode ^ price.hashCode ^ items.hashCode;

  @override
  String toString() {
    return 'Services{ tag: $tag, price: $price, items: $items,}';
  }

  ProfessionalServiceModel copyWith({
    String? tag,
    String? price,
    List<String>? items,
  }) {
    return ProfessionalServiceModel(
      tag: tag ?? this.tag,
      price: price ?? this.price,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tag': tag,
      'price': price,
      'items': items,
    };
  }

  factory ProfessionalServiceModel.fromMap(Map<String, dynamic> map) {
    return ProfessionalServiceModel(
      tag: map['tag'] as String,
      price: map['price'] as String,
      items: map['items'] as List<dynamic>,
    );
  }

//</editor-fold>
}
