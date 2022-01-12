import 'all.dart';

export 'all.dart';

class JsonMarkdownSchemas {
  static final enums = {
    BlockSyntaxSchema.id: BlockSyntaxSchema.schema,
    ExtensionSetSchema.id: ExtensionSetSchema.schema,
    MarkdownListItemCrossAxisAlignmentSchema.id:
        MarkdownListItemCrossAxisAlignmentSchema.schema,
    MarkdownStyleSheetBaseThemeSchema.id:
        MarkdownStyleSheetBaseThemeSchema.schema,
  };

  static final objects = {
    InlineSyntaxSchema.id: InlineSyntaxSchema.schema,
    MarkdownStyleSheetSchema.id: MarkdownStyleSheetSchema.schema,
    MarkdownSchema.id: MarkdownSchema.schema,
  };
}
