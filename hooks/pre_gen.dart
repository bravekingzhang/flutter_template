import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  // Read vars.
  final projectName = context.vars['project_name'];

  // Use the `Logger` instance.
  context.logger.info('Hello $projectName!');

  // Update vars.
  // context.vars['current_year'] = DateTime.now().year;
}
