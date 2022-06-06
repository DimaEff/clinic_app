import 'package:clinic_app/domain/doctor.dart';

class Doctors {
  final doctors = [
    Doctor(name: 'Фоминенков Д.К.', specialty: 'Терапевт', experience: '26', education: 'Mining university', id: 'zUfoPdPdQCclFqMmYhY0qzzCQMD2', email: 'doctor1@mail.com'),
    Doctor(name: 'Николаев А.В.', specialty: 'Уролог', experience: '8', education: 'Mining university', id: '123', email: 'doctor2@mail.com'),
    Doctor(name: 'Тептина А.Б.', specialty: 'Хирург', experience: '12', education: 'Mining university', id: '123', email: 'doctor3@mail.com'),
    Doctor(name: 'Кучеров Г.М.', specialty: 'Невролог', experience: '12', education: 'Mining university', id: '123', email: 'doctor4@mail.com'),
    Doctor(name: 'Фксенова Л.В.', specialty: 'Оториноларинголог', experience: '12', education: 'Mining university', id: '123', email: 'doctor5@mail.com'),
    Doctor(name: 'Левченко А.К.', specialty: 'Окулист', experience: '12', education: 'Mining university', id: '123', email: 'doctor6@mail.com'),
    Doctor(name: 'Прокофьева М.В.', specialty: 'Акушер-гинеколог', experience: '12', education: 'Mining university', id: '123', email: 'doctor7@mail.com'),
    Doctor(name: 'Надеждин Ю.А.', specialty: 'Инфекционист', experience: '12', education: 'Mining university', id: '123', email: 'doctor8@mail.com'),
    Doctor(name: 'Балатаева А.С.', specialty: 'Онколог', experience: '12', education: 'Mining university', id: '123', email: 'doctor9@mail.com'),
    Doctor(name: 'Чутчев А.С.', specialty: 'Гастраэнтеролог', experience: '12', education: 'Mining university', id: '123', email: 'doctor10@mail.com'),
    Doctor(name: 'Забайакльская Н.С.', specialty: 'Кардиолог', experience: '12', education: 'Mining university', id: '123', email: 'doctor11@mail.com'),
  ];

  Doctor findByEmail(String email) {
    return doctors.firstWhere((element) => element.email == email);
  }
}