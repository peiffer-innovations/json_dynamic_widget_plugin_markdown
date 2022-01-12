import 'package:json_dynamic_widget_plugin_markdown/json_dynamic_widget_plugin_markdown.dart';
import 'package:json_theme/json_theme_schemas.dart';

class MarkdownSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_markdown/markdown.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/flutter_markdown/latest/flutter_markdown/Markdown-class.html',
    'title': 'Markdown',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'blockSyntaxes': SchemaHelper.arraySchema(
        BlockSyntaxSchema.id,
        includeObject: true,
      ),
      'builders': SchemaHelper.anySchema,
      'bulletBuilder': SchemaHelper.stringSchema,
      'checkboxBuilder': SchemaHelper.stringSchema,
      'controller': SchemaHelper.stringSchema,
      'data': SchemaHelper.stringSchema,
      'extensionSet': SchemaHelper.objectSchema(ExtensionSetSchema.id),
      'imageBuilder': SchemaHelper.stringSchema,
      'imageDirectory': SchemaHelper.stringSchema,
      'inlineSyntaxes': SchemaHelper.arraySchema(
        InlineSyntaxSchema.id,
        includeObject: true,
      ),
      'listItemCrossAxisAlignment': SchemaHelper.objectSchema(
        MarkdownListItemCrossAxisAlignmentSchema.id,
      ),
      'onTapLink': SchemaHelper.stringSchema,
      'onTapText': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'paddingBuilders': SchemaHelper.stringSchema,
      'physics': SchemaHelper.objectSchema(ScrollPhysicsSchema.id),
      'selectable': SchemaHelper.boolSchema,
      'shrinkWrap': SchemaHelper.boolSchema,
      'softLineBreak': SchemaHelper.boolSchema,
      'styleSheet': SchemaHelper.objectSchema(MarkdownStyleSheetSchema.id),
      'styleSheetTheme': SchemaHelper.objectSchema(
        MarkdownStyleSheetBaseThemeSchema.id,
      ),
      'syntaxHighlighter': SchemaHelper.stringSchema,
    },
  };
}
