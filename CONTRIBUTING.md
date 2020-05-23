# Contributing to the google_fonts package

Thank you for your interest in contributing to the `dart_code_viewer` package! We love receiving contributions, and your work helps the whole community. This doc will walk you through the easiest way to make a change and have it submitted to the `dart_code_viewer` package.

## Developer workflow

The easiest workflow for adding a feature/fixing a bug is to test it out on the example app in this
repo.

### Environment

1. Fork the [dart-code-viewer](https://github.com/JoseAlba/dart-code-viewer)
 repo on github.
1. Clone your fork of the `dart-code-viewer` repo.
1. Build and run the example app in `example/lib/main.dart` (from the `example/` directory, use `$ flutter run`).

### Development

1. Make the changes to your local copy of the `dart-code-viewer` package, testing the changes in the example app.
1. Write a unit test for your change, if possible, in one of the files in `test/`.
1. Update the `CHANGELOG.md` with a new version number, and a description of the change you're making.
1. Update the `version:` in the `pubspec.yaml` file to your new version.

### Review

1. Make sure all the existing tests are passing by using the following command (from the root of the project): `$ flutter test test/`.
1. Create a PR to merge the branch on your fork into `dart-code-viewer/master`.
1. Add `JoseAlba` as reviewers on the PR. We will take a look and add any comments. When the PR is ready to be merged, we will merge it and update the package on [pub.dev](https://pub.dev/packages/dart_code_viewer)!
