import 'package:flutter/material.dart';
import 'package:working_time/app/core/Utils/date_format_util.dart';
import 'package:working_time/app/core/widgets/app_text_field.dart';
import 'package:working_time/app/db/entities/day_entity.dart';

class DayCard extends StatefulWidget {
  final DayEntity dayEntity;
  final Function(DayEntity) onSave;

  const DayCard({super.key, required this.dayEntity, required this.onSave});

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  final TextEditingController horasController = TextEditingController();
  final TextEditingController comentarioController = TextEditingController();

  @override
  void initState() {
    horasController.text = widget.dayEntity.time.toString();
    comentarioController.text = widget.dayEntity.comment;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.deepPurple.shade300,
      ),
      child: LayoutBuilder(
        builder: (context, box) {
          final height = box.maxHeight / 100;
          int lines = 1;

          if (height <= 2) {
            lines = 1;
          }

          if (height > 2) {
            final teste = height - 2;
            lines += (teste * 4).toInt();
          }

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Data: ${DateFormatUtil.basicFormat(widget.dayEntity.date)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: AppTextField(
                      controller: horasController,
                      hintText: 'Horas',
                      enabled: true,
                      mode: 1,
                      onChange: (change) {
                        widget.dayEntity.time = double.tryParse(change) ?? 0;

                        widget.onSave(widget.dayEntity);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: AppTextField(
                  controller: comentarioController,
                  hintText: 'Notas',
                  enabled: true,
                  mode: 1,
                  maxLines: lines,
                  onChange: (change) {
                    widget.dayEntity.comment = change;

                    widget.onSave(widget.dayEntity);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
