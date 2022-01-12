import 'package:json_theme/json_theme_schemas.dart';

class MarkdownStyleSheetBaseThemeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_markdown/markdown_style_sheet_base_theme.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/flutter_markdown/latest/flutter_markdown/MarkdownStyleSheetBaseTheme.html',
    'type': 'string',
    'title': 'MarkdownStyleSheetBaseTheme',
    'oneOf': SchemaHelper.enumSchema([
      'cupertino',
      'material',
      'platform',
    ]),
  };
}
