class HomeModel {
  Categoies? categoies;
  Categoies? popularCourses;
  Categoies? tutors;



  HomeModel.fromJson(Map<String, dynamic> json) {
    categoies = json['categoies'] != null
        ? Categoies.fromJson(json['categoies'])
        : null;
    popularCourses = json['popular_courses'] != null
        ? Categoies.fromJson(json['popular_courses'])
        : null;
    tutors = json['tutors'] != null ? Categoies.fromJson(json['tutors']) : null;
  }
}

class Categoies {
  List<DataModel>? dataModel;
  int? total;

  Categoies.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataModel = <DataModel>[];
      json['data'].forEach((v) {
        dataModel!.add(DataModel.fromJson(v));
      });
    }
    total = json['total'];
  }
}

class DataModel {
  String? image;
  String? name;

  DataModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
  }
}

class PopularCourses {
  List<DataDetail>? dataDetailes;
  int? total;

  PopularCourses.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataDetailes = <DataDetail>[];
      json['data'].forEach((v) {
        dataDetailes!.add(DataDetail.fromJson(v));
      });
    }
    total = json['total'];
  }
}

class DataDetail {
  String? author;
  Fees? fees;
  Rating? rating;
  String? title;

  DataDetail.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    fees = json['fees'] != null ? Fees.fromJson(json['fees']) : null;
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    title = json['title'];
  }
}

class Fees {
  String? currency;
  String? currencySymbol;
  String? value;

  Fees({this.currency, this.currencySymbol, this.value});

  Fees.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    currencySymbol = json['currency_symbol'];
    value = json['value'];
  }
}

class Rating {
  String? avgRating;
  String? totalGivenBy;

  Rating({this.avgRating, this.totalGivenBy});

  Rating.fromJson(Map<String, dynamic> json) {
    avgRating = json['avg_rating'];
    totalGivenBy = json['total_given_by'];
  }
}
