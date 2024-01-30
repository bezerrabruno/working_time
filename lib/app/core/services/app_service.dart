import 'package:working_time/app/db/entities/sprint_entity.dart';

/// Instancia global do [SprintService]
late final AppService appService;

/// Classe [AppService] responsavel por servir dados a aplicação durante uso
class AppService {
  SprintEntity? sprintAtual;
}
