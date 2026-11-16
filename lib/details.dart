import 'package:material_ui/material_ui.dart';

class Student {
  final String name;
  final String matricNo;
  final String programme;
  final String email;
  final double cgpa;

  const Student({
    required this.name,
    required this.matricNo,
    required this.programme,
    required this.email,
    required this.cgpa,
  });
}

const List<Student> students = [
  Student(
    name: 'Ali',
    matricNo: '100000',
    programme: 'Multimedia Computing',
    email: '100000@siswa.unimas.my',
    cgpa: 3.4,
  ),
  Student(
    name: 'Bala',
    matricNo: '100003',
    programme: 'Network Computing',
    email: '100003@siswa.unimas.my',
    cgpa: 2.7,
  ),
  Student(
    name: 'Hafiz',
    matricNo: '100005',
    programme: 'Data Engineering',
    email: '100005@siswa.unimas.my',
    cgpa: 3.1,
  ),
  Student(
    name: 'Jee Hui Ying',
    matricNo: '104511',
    programme: 'Software Engineering',
    email: '104511@siswa.unimas.my',
    cgpa: 4.0,
  ),
  Student(
    name: 'Leong Jao Yuan',
    matricNo: '104742',
    programme: 'Software Engineering',
    email: '104742@siswa.unimas.my',
    cgpa: 4.0,
  ),
  Student(
    name: 'Lim Gek Hong',
    matricNo: '104763',
    programme: 'Software Engineering',
    email: '104763@siswa.unimas.my',
    cgpa: 4.0,
  ),
  Student(
    name: 'Loh Zhi Yun',
    matricNo: '104788',
    programme: 'Software Engineering',
    email: '104788@siswa.unimas.my',
    cgpa: 4.0,
  ),
  Student(
    name: 'Loh Zhi Yun',
    matricNo: '104788',
    programme: 'Software Engineering',
    email: '104788@siswa.unimas.my',
    cgpa: 4.0,
  ),
  Student(
    name: 'Siti',
    matricNo: '100001',
    programme: 'Multimedia Computing',
    email: '100001@siswa.unimas.my',
    cgpa: 2.8,
  ),
  Student(
    name: 'Zara',
    matricNo: '100004',
    programme: 'Data Engineering',
    email: '100004@siswa.unimas.my',
    cgpa: 2.3,
  ),
];

class Details extends StatelessWidget {
  final Student student;
  const Details({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Name"),
                subtitle: SelectableText(student.name),
              ),
              ListTile(
                leading: Icon(Icons.badge),
                title: Text('Matric Number'),
                subtitle: SelectableText(student.matricNo),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text('Course'),
                subtitle: SelectableText(student.programme),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: SelectableText(student.email),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
