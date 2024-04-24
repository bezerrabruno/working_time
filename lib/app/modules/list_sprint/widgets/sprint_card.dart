import 'package:flutter/material.dart';
import 'package:working_time/app/core/Utils/date_format_util.dart';
import 'package:working_time/app/core/Utils/size_util.dart';
import 'package:working_time/app/db/entities/sprint_entity.dart';

class SprintCard extends StatelessWidget {
  final SprintEntity sprintEntity;
  final Function() onTap;

  const SprintCard({
    super.key,
    required this.sprintEntity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtil.width(context) / 8,
        vertical: 8,
      ),
      child: Card(
        elevation: 10,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LayoutBuilder(
              builder: (context, box) {
                if (box.maxWidth >= 500) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Nome: ${sprintEntity.name}',
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                      Text(
                        'Data Inicial: ${DateFormatUtil.basicFormat(sprintEntity.initialDate)}',
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                      Text(
                        'Data Final: ${DateFormatUtil.basicFormat(sprintEntity.finalDate)}',
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                    ],
                  );
                }

                if (box.maxWidth < 500 && box.maxWidth >= 320) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Nome: ${sprintEntity.name}',
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                      Text(
                        'Data Inicial: ${DateFormatUtil.basicFormat(sprintEntity.initialDate)}',
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                    ],
                  );
                }

                if (box.maxWidth < 320 && box.maxWidth >= 170) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Nome: ${sprintEntity.name}',
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                    ],
                  );
                }

                if (box.maxWidth < 170) {
                  return const Center(
                    child: Text(
                      'Error',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
