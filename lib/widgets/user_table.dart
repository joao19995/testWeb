import 'package:flutter/material.dart';
import 'package:namer_app/model/user.dart';

class UserTable extends StatelessWidget {
  final List<User> users;
  const UserTable({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Email')),
      ],
      rows: users.map((user) {
        return DataRow(cells: [
          DataCell(Text(user.id.toString())),
          DataCell(Text(user.name)),
          DataCell(Text(user.email)),
        ]);
      }).toList(),
    );
  }
}