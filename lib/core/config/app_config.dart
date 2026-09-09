abstract final class AppConfig {
  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://6aa0077e3e0d88d3d7e54fe9.mockapi.io/v1',
  );
}
