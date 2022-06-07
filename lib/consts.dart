import 'package:clinic_app/domain/doctor.dart';
import 'package:clinic_app/services/auth.dart';
import 'package:clinic_app/services/users.dart';

class Doctors {
  AuthService _authService = AuthService();

  final doctors = [
    Doctor(
        name: 'Фоминенков Д.К.',
        specialty: 'Терапевт',
        experience: '26',
        education: 'Mining university',
        id: 'NCso0Y5sZZTOfsYtWPYFITJDgjj1',
        email: 'doctor1@mail.com'),
    Doctor(
        name: 'Николаев А.В.',
        specialty: 'Уролог',
        experience: '8',
        education: 'Mining university',
        id: 'SJRAQGEiMxYkMwYxQkujfnDYbpA3',
        email: 'doctor2@mail.com'),
    Doctor(
        name: 'Тептина А.Б.',
        specialty: 'Хирург',
        experience: '12',
        education: 'Mining university',
        id: 'QEePclUQOpO1TxEhQmuT1btje262',
        email: 'doctor3@mail.com'),
    Doctor(
        name: 'Кучеров Г.М.',
        specialty: 'Невролог',
        experience: '12',
        education: 'Mining university',
        id: 'u4S0nXSCN1Valv6gIpfvIwxtP6x2',
        email: 'doctor4@mail.com'),
    Doctor(
        name: 'Аксенова Л.В.',
        specialty: 'Оториноларинголог',
        experience: '12',
        education: 'Mining university',
        id: '1PNnwDhI7LMXU0Tew3TeryVo77E2',
        email: 'doctor5@mail.com'),
    Doctor(
        name: 'Левченко А.К.',
        specialty: 'Окулист',
        experience: '12',
        education: 'Mining university',
        id: 'CFidtgPVwhcYfMzgSrD5lgVnSP52',
        email: 'doctor6@mail.com'),
    Doctor(
        name: 'Прокофьева М.В.',
        specialty: 'Акушер-гинеколог',
        experience: '12',
        education: 'Mining university',
        id: '6jSJQ8jKIyMUSPVa83bx3UqDuYC2',
        email: 'doctor7@mail.com'),
    Doctor(
        name: 'Надеждин Ю.А.',
        specialty: 'Инфекционист',
        experience: '12',
        education: 'Mining university',
        id: 'OS3WCQzLK4YpGT8EMSFd9uOYDTd2',
        email: 'doctor8@mail.com'),
    Doctor(
        name: 'Балатаева А.С.',
        specialty: 'Онколог',
        experience: '12',
        education: 'Mining university',
        id: 'sLonpNMYsOh2CDmBRJmwDNJsOoo2',
        email: 'doctor9@mail.com'),
    Doctor(
        name: 'Чутчев А.С.',
        specialty: 'Гастраэнтеролог',
        experience: '12',
        education: 'Mining university',
        id: 'qhHPdIgvpLhb7msy5Hmj6V8ENXz2',
        email: 'doctor10@mail.com'),
    Doctor(
        name: 'Забайакльская Н.С.',
        specialty: 'Кардиолог',
        experience: '12',
        education: 'Mining university',
        id: 'iRUsrM1fpzOLeuapNJU4JsHhPEA2',
        email: 'doctor11@mail.com'),
  ];

  Doctor findById(String id) {
    return doctors.firstWhere((element) => element.id == id);
  }

  Doctor findByEmail(String email) {
    return doctors.firstWhere((element) => element.email == email);
  }

  // Future<void> createDoctors() async {
  //   int i = 10;
  //   var e = doctors[i];
  //   await _authService.createDoctorWithEmailAndPassword(
  //     'doct$i@mail.com',
  //     'doctor$i',
  //     e.name,
  //     e.education,
  //     e.experience,
  //     e.specialty,
  //   );
  // }
}
