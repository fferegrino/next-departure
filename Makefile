localizations:
	@echo "Generating localizations..."
	@flutter gen-l10n
	@echo "Localizations generated successfully."

build_runner:
	@echo "Running build_runner..."
	@dart run build_runner build --delete-conflicting-outputs
	@echo "build_runner completed successfully."