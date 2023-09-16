import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget_plugin_markdown/json_dynamic_widget_plugin_markdown.dart';

void main() {
  test('output', () async {
    final output = Directory('output');
    if (output.existsSync()) {
      output.deleteSync(recursive: true);
    }

    output.createSync(recursive: true);

    const encoder = JsonEncoder.withIndent('  ');
    final all = [
      ...JsonMarkdownPluginRegistrar.registerDefaults().schemas.values,
    ];
    for (var schema in all) {
      for (var i = 0; i < 3; i++) {
        try {
          final id = schema['\$id'].toString();
          final fileName = id.split('/').last;

          final file = File('${output.path}/$fileName');
          file.createSync(recursive: true);

          file.writeAsStringSync(encoder.convert(schema));

          // ignore: avoid_print
          print('Wrote: $fileName');
          break;
        } catch (e) {
          if (i == 2) {
            rethrow;
          }

          await Future.delayed(const Duration(milliseconds: 100));
        }
      }
    }
  });
}
