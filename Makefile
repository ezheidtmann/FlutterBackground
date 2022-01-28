.PHONY: pigeon

pigeon:
	make my_flutter/lib/messages.dart

my_flutter/lib/messages.dart: my_flutter/pigeon_stubs.dart
	cd my_flutter && flutter pub run pigeon \
		--input pigeon_stubs.dart \
		--dart_out lib/pigeon_generated_messages.dart \
		--objc_header_out ../FlutterBackground/Pigeon/Pigeon.h \
        --objc_source_out ../FlutterBackground/Pigeon/Pigeon.m
