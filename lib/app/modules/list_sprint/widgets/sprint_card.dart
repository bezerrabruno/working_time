import 'package:flutter/material.dart';
import 'package:working_time/app/core/Utils/date_format.dart';
import 'package:working_time/app/db/entities/sprint_entity.dart';

class SprintCard extends StatelessWidget {
  final SprintEntity sprintEntity;
  final Function() onTap;

  const SprintCard(
      {super.key, required this.sprintEntity, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 4, vertical: 8),
      child: Card(
        elevation: 10,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Nome: ${sprintEntity.name}',
                  style: const TextStyle(color: Colors.deepPurple),
                ),
                Text(
                  'Data Inicial: ${DateFormat.basicFormat(sprintEntity.initialDate)}',
                  style: const TextStyle(color: Colors.deepPurple),
                ),
                Text(
                  'Data Final: ${DateFormat.basicFormat(sprintEntity.finalDate)}',
                  style: const TextStyle(color: Colors.deepPurple),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
