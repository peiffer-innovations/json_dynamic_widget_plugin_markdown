import 'package:json_theme/json_theme_schemas.dart';

class ExtensionSetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_markdown/extension_set.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/markdown/latest/markdown/ExtensionSet-class.html',
    'type': 'string',
    'title': 'ExtensionSet',
    'oneOf': SchemaHelper.enumSchema([
      'common_mark',
      'git_hub_flavored',
      'git_hub_web',
      'none',
    ]),
  };
}
