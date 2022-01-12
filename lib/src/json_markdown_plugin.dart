import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_markdown/json_dynamic_widget_plugin_markdown.dart';
import 'package:json_theme/json_theme_schemas.dart';

import 'schema/json_markdown_schemas.dart';

class JsonMarkdownPlugin {
  static void bind(JsonWidgetRegistry registry) {
    var schemaCache = SchemaCache();
    Enums.all.addAll(JsonMarkdownSchemas.enums.keys);

    schemaCache.addSchemas(JsonMarkdownSchemas.enums);
    schemaCache.addSchemas(JsonMarkdownSchemas.objects);

    registry.registerCustomBuilders({
      MarkdownBuilder.type: JsonWidgetBuilderContainer(
        builder: MarkdownBuilder.fromDynamic,
        schemaId: MarkdownSchema.id,
      ),
    });
  }
}
