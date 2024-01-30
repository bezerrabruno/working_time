import 'package:flutter/material.dart';
import 'package:working_time/app/core/Utils/date_format.dart';
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
  Widget build(BuildContext context) {
    horasController.text = widget.dayEntity.time.toString();
    comentarioController.text = widget.dayEntity.comment;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.deepPurpleAccent[100],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  'Data: ${DateFormat.basicFormat(widget.dayEntity.date)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: AppTextField(
                  controller: horasController,
                  hintText: 'Horas',
                  enabled: true,
                ),
              ),
              SizedBox(
                width: 300,
                child: GestureDetector(
                  onTap: () {
                    widget.dayEntity.time =
                        double.tryParse(horasController.text)!;
                    widget.dayEntity.comment = comentarioController.text;

                    widget.onSave(widget.dayEntity);
                  },
                  child: const Icon(
                    Icons.save_as_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              child: AppTextField(
                controller: comentarioController,
                hintText: 'Comentarios',
                enabled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
