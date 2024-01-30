import 'package:flutter/material.dart';
import 'package:working_time/app/core/Utils/date_format.dart';
import 'package:working_time/app/db/entities/sprint_entity.dart';

class SprintBar extends StatelessWidget {
  final SprintEntity sprintEntity;

  const SprintBar({super.key, required this.sprintEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Nome: ${sprintEntity.name}',
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.deepPurple),
        ),
        Text(
          'Data Inicial: ${DateFormat.basicFormat(sprintEntity.initialDate)}',
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.deepPurple),
        ),
        Text(
          'Data Final: ${DateFormat.basicFormat(sprintEntity.finalDate)}',
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.deepPurple),
        ),
      ],
    );
  }
}
