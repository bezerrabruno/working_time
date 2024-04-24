import 'package:flutter/material.dart';
import 'package:working_time/app/core/Utils/date_format_util.dart';
import 'package:working_time/app/core/widgets/app_text_field.dart';
import 'package:working_time/app/db/entities/sprint_entity.dart';

class AddSprintDialog extends StatefulWidget {
  final Function(SprintEntity) finish;

  const AddSprintDialog({super.key, required this.finish});

  @override
  State<AddSprintDialog> createState() => _AddSprintDialogState();
}

class _AddSprintDialogState extends State<AddSprintDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController initialDateController = TextEditingController();
  final TextEditingController finalDateController = TextEditingController();

  DateTime? initialDate;
  DateTime? finalDate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dialog(
      child: SizedBox(
        width: size.width / 2,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Text(
                  'Sprint',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppTextField(
                  controller: nameController,
                  hintText: 'Nome',
                  enabled: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: AppTextField(
                        controller: initialDateController,
                        hintText: 'dia inicial',
                        enabled: false,
                        onTap: () async {
                          initialDate = await showDatePicker(
                            context: context,
                            firstDate:
                                DateTime.now().add(const Duration(days: -30)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 30)),
                          );

                          if (initialDate != null) {
                            initialDateController.text =
                                DateFormatUtil.basicFormat(initialDate!);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 4,
                      child: AppTextField(
                        controller: finalDateController,
                        hintText: 'dia final',
                        enabled: false,
                        onTap: () async {
                          finalDate = await showDatePicker(
                            context: context,
                            firstDate:
                                DateTime.now().add(const Duration(days: -30)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 30)),
                          );

                          if (finalDate != null) {
                            finalDateController.text =
                                DateFormatUtil.basicFormat(finalDate!);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Voltar'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (nameController.text == '' ||
                              initialDateController.text == '' ||
                              finalDateController.text == '') {
                            return;
                          }

                          final SprintEntity entity = SprintEntity(
                            name: nameController.text,
                            initialDate: initialDate!,
                            finalDate: finalDate!,
                          );

                          widget.finish(entity);
                        },
                        child: const Text('Add'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
