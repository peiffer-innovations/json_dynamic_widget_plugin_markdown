import 'package:json_theme/json_theme_schemas.dart';

class MarkdownStyleSheetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_markdown/markdown_style_sheet.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/flutter_markdown/latest/flutter_markdown/MarkdownStyleSheet-class.html',
    'title': 'MarkdownStyleSheet',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'a': SchemaHelper.objectSchema(TextStyleSchema.id),
      'blockSpacing': SchemaHelper.numberSchema,
      'blockquote': SchemaHelper.objectSchema(TextStyleSchema.id),
      'blockquoteAlign': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      'blockquoteDecoration': SchemaHelper.objectSchema(BoxDecorationSchema.id),
      'blockquotePadding': SchemaHelper.objectSchema(
        EdgeInsetsGeometrySchema.id,
      ),
      'checkbox': SchemaHelper.objectSchema(TextStyleSchema.id),
      'code': SchemaHelper.objectSchema(TextStyleSchema.id),
      'codeblockAlign': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      'codeblockDecoration': SchemaHelper.objectSchema(BoxDecorationSchema.id),
      'codeblockPadding': SchemaHelper.objectSchema(
        EdgeInsetsGeometrySchema.id,
      ),
      'del': SchemaHelper.objectSchema(TextStyleSchema.id),
      'em': SchemaHelper.objectSchema(TextStyleSchema.id),
      'h1': SchemaHelper.objectSchema(TextStyleSchema.id),
      'h1Align': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      'h1Padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'h2': SchemaHelper.objectSchema(TextStyleSchema.id),
      'h2Align': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      'h2Padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'h3': SchemaHelper.objectSchema(TextStyleSchema.id),
      'h3Align': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      'h3Padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'h4': SchemaHelper.objectSchema(TextStyleSchema.id),
      'h4Align': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      'h4Padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'h5': SchemaHelper.objectSchema(TextStyleSchema.id),
      'h5Align': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      'h5Padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'h6': SchemaHelper.objectSchema(TextStyleSchema.id),
      'h6Align': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      'h6Padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'horizontalRuleDecoration': SchemaHelper.objectSchema(
        BoxDecorationSchema.id,
      ),
      'img': SchemaHelper.objectSchema(TextStyleSchema.id),
      'listBullet': SchemaHelper.objectSchema(TextStyleSchema.id),
      'listBulletPadding': SchemaHelper.objectSchema(
        EdgeInsetsGeometrySchema.id,
      ),
      'listIndent': SchemaHelper.numberSchema,
      'orderedListAlign': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      'p': SchemaHelper.objectSchema(TextStyleSchema.id),
      'pPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'strong': SchemaHelper.objectSchema(TextStyleSchema.id),
      'tableBody': SchemaHelper.objectSchema(TextStyleSchema.id),
      'tableBorder': SchemaHelper.objectSchema(TableBorderSchema.id),
      'tableCellsDecoration': SchemaHelper.objectSchema(BoxDecorationSchema.id),
      'tableCellsPadding': SchemaHelper.objectSchema(
        EdgeInsetsGeometrySchema.id,
      ),
      'tableColumnWidth': SchemaHelper.objectSchema(
        TableColumnWidthSchema.id,
      ),
      'tableHead': SchemaHelper.objectSchema(TextStyleSchema.id),
      'tableHeadAlign': SchemaHelper.objectSchema(TextAlignSchema.id),
      'textAlign': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      'textScaleFactor': SchemaHelper.numberSchema,
      'unorderedListAlign': SchemaHelper.objectSchema(WrapAlignmentSchema.id),
    },
  };
}
