import 'package:json_theme/json_theme_schemas.dart';

class InlineSyntaxSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_markdown/inline_syntax.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/markdown/latest/markdown/InlineSyntax-class.html',
    'title': 'Markdown',
    'type': 'object',
    'additionalProperties': false,
    'required': ['type'],
    'properties': {
      'allowIntraWord': SchemaHelper.boolSchema,
      'pattern': SchemaHelper.stringSchema,
      'requiresDelimiterRun': SchemaHelper.boolSchema,
      'startCharacter': SchemaHelper.numberSchema,
      'sub': SchemaHelper.stringSchema,
      'type': {
        'type': 'string',
        'enum': [
          'autolink',
          'autolink_extension',
          'code',
          'email',
          'emoji',
          'html',
          'line_break',
          'tag',
          'text',
        ],
      },
    },
  };
}
