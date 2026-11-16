import 'details.dart';

import 'package:material_ui/material_ui.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Information')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: students.length,
        separatorBuilder: (_, _) => const Divider(),
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(student.name),
            subtitle: Text('${student.matricNo} · ${student.programme}'),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(student: student),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
