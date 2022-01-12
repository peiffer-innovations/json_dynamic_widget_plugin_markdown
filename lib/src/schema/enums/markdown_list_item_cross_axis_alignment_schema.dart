import 'package:json_theme/json_theme_schemas.dart';

class MarkdownListItemCrossAxisAlignmentSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_markdown/markdown_list_item_cross_axis_alignment.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/flutter_markdown/latest/flutter_markdown/MarkdownListItemCrossAxisAlignment.html',
    'type': 'string',
    'title': 'MarkdownListItemCrossAxisAlignment',
    'oneOf': SchemaHelper.enumSchema([
      'baseline',
      'start',
    ]),
  };
}
