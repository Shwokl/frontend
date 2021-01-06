debug-chrome:
	flutter run -d chrome --web-hostname 0.0.0.0 --web-port 8080 --debug

debug-web:
	flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080 --debug

release-chrome:
	flutter run -d chrome --web-hostname 0.0.0.0 --web-port 8080 --release

release-web:
	flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080 --release
