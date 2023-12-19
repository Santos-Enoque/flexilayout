# FlexiLayout

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

FlexiLayout is an advanced Flutter package designed to empower developers to quickly assemble and deploy versatile, responsive user interfaces with ease. Tailored for both web and desktop applications, FlexiLayout offers an extensive range of customizable layouts and components, making it the ideal toolkit for creating intuitive and aesthetically pleasing UIs.

## 🚀 Key Features

- **📐 Prebuilt Layout Templates**: Speed up development with a variety of ready-to-use layouts, including adjustable pane designs and dashboard interfaces.
- **📲 Responsive and Adaptive**: Ensure your application looks great on any device, with components that automatically adjust to different screen sizes.
- **🖱️ Drag-and-Drop and Resizable Panes**: Create dynamic user experiences with adjustable and interactive layout elements.
- **🔧 Modular and Customizable**: Enjoy the freedom of customization with modular components that can be tailored to fit your specific design needs.
- **⚙️ Easy Integration**: Seamlessly integrate with existing Flutter projects, thanks to an intuitive and straightforward setup process.
- **📚 Comprehensive Documentation**: Get up to speed quickly with detailed documentation, including usage examples and configuration guides.
- **🌐 Open Source and Community-Driven**: Join a community of developers contributing to the evolution of FlexiLayout, ensuring it stays current with the latest trends and best practices in Flutter development.

## Installation 💻

**❗ In order to start using Flutter Admin Panel you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Add `flexilayout` to your `pubspec.yaml`:

```yaml
dependencies:
  flexilayout: 0.1.0-beta
```

Install it:

```sh
flutter packages get
```

---

## 📖 Example Usage

Here's a quick glimpse at how you can use FlexiLayout in your project:

```dart
import 'package:flexilayout/flexilayout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add example code
  }
}
```

## Continuous Integration 🤖

FlexiLayout comes with a built-in [GitHub Actions workflow][github_actions_link] powered by [Very Good Workflows][very_good_workflows_link] but you can also add your preferred CI/CD solution.

Out of the box, on each pull request and push, the CI `formats`, `lints`, and `tests` the code. This ensures the code remains consistent and behaves correctly as you add functionality or make changes. The project uses [Very Good Analysis][very_good_analysis_link] for a strict set of analysis options used by our team. Code coverage is enforced using the [Very Good Workflows][very_good_coverage_link].

---

## Running Tests 🧪

For first time users, install the [very_good_cli][very_good_cli_link]:

```sh
dart pub global activate very_good_cli
```

To run all unit tests:

```sh
very_good test --coverage
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
open coverage/index.html
```

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows

## 💪 Contributing

Contributions to FlexiLayout are welcome! Whether it's submitting bug reports, feature requests, or contributing code, your involvement significantly enhances the quality and functionality of the package.

## 📜 License

FlexiLayout is available under the MIT license. See the LICENSE file for more info.
