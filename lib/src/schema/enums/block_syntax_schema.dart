import 'package:json_theme/json_theme_schemas.dart';

class BlockSyntaxSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_markdown/block_syntax.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/markdown/latest/markdown/BlockSyntax-class.html',
    'type': 'string',
    'title': 'BlockSyntax',
    'oneOf': SchemaHelper.enumSchema([
      'blockquote',
      'code',
      'empty',
      'fenced_code',
      'header',
      'horizontal_rule',
      'ordered_list',
      'paragraph',
      'setext_header',
      'setext_header_with_id',
      'table',
      'unordered_list',
    ]),
  };
}
