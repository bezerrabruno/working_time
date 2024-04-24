import 'package:flutter/material.dart';
import 'package:working_time/app/core/Utils/date_format_util.dart';
import 'package:working_time/app/db/entities/sprint_entity.dart';

class SprintBar extends StatelessWidget {
  final SprintEntity sprintEntity;

  const SprintBar({super.key, required this.sprintEntity});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) {
        if (box.maxWidth >= 850) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.home_filled,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                'Nome: ${sprintEntity.name}',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepPurple),
              ),
              Text(
                'Data Inicial: ${DateFormatUtil.basicFormat(sprintEntity.initialDate)}',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepPurple),
              ),
              Text(
                'Data Final: ${DateFormatUtil.basicFormat(sprintEntity.finalDate)}',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepPurple),
              ),
            ],
          );
        }

        if (box.maxWidth < 850 && box.maxWidth >= 550) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.home_filled,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                'Nome: ${sprintEntity.name}',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepPurple),
              ),
              Text(
                'Data Inicial: ${DateFormatUtil.basicFormat(sprintEntity.initialDate)}',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepPurple),
              ),
            ],
          );
        }

        if (box.maxWidth < 550 && box.maxWidth >= 300) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.home_filled,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                'Nome: ${sprintEntity.name}',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepPurple),
              ),
            ],
          );
        }

        if (box.maxWidth < 300) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.home_filled,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
