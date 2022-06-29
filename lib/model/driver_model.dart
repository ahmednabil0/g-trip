// ignore_for_file: non_constant_identifier_names

class DriverModel {
  String email;
  String name;
  String phoneNum;
  String date;
  String address;
  String cartype;
  String car_name;
  String plate_number;
  String changesPerKilo;
  String accountname;
  String accountnum;
  String bankname;
  String driverid;
  String drivername;
  String payment_method;
  String uid;
  double lat;
  double long;
  DriverModel({
    required this.email,
    required this.name,
    required this.phoneNum,
    required this.date,
    required this.address,
    required this.cartype,
    required this.car_name,
    required this.plate_number,
    required this.changesPerKilo,
    required this.accountname,
    required this.accountnum,
    required this.bankname,
    required this.driverid,
    required this.drivername,
    required this.payment_method,
    required this.uid,
    required this.lat,
    required this.long,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'phoneNum': phoneNum});
    result.addAll({'date': date});
    result.addAll({'address': address});
    result.addAll({'cartype': cartype});
    result.addAll({'car_name': car_name});
    result.addAll({'plate_number': plate_number});
    result.addAll({'changesPerKilo': changesPerKilo});
    result.addAll({'accountname': accountname});
    result.addAll({'accountnum': accountnum});
    result.addAll({'bankname': bankname});
    result.addAll({'driverid': driverid});
    result.addAll({'drivername': drivername});
    result.addAll({'payment_method': payment_method});
    result.addAll({'uid': uid});
    result.addAll({'lat': lat});
    result.addAll({'long': long});

    return result;
  }

  factory DriverModel.fromMap(map) {
    return DriverModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phoneNum: map['phoneNum'] ?? '',
      date: map['date'] ?? '',
      address: map['address'] ?? '',
      cartype: map['cartype'] ?? '',
      car_name: map['car_name'] ?? '',
      plate_number: map['plate_number'] ?? '',
      changesPerKilo: map['changesPerKilo'] ?? '',
      accountname: map['accountname'] ?? '',
      accountnum: map['accountnum'] ?? '',
      bankname: map['bankname'] ?? '',
      driverid: map['driverid'] ?? '',
      drivername: map['drivername'] ?? '',
      payment_method: map['payment_method'] ?? '',
      uid: map['uid'] ?? '',
      lat: map['lat']?.toDouble() ?? 0.0,
      long: map['long']?.toDouble() ?? 0.0,
    );
  }
}
