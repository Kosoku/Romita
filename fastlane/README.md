fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios lint_local_podspec

```sh
[bundle exec] fastlane ios lint_local_podspec
```

Lint local podspec

- `podspec_path`: The path to the podspec to lint

### ios lint_remote_podspec

```sh
[bundle exec] fastlane ios lint_remote_podspec
```

Lint remote podspec

- `podspec_path`: The path to the podspec to lint

### ios publish_remote_podspec

```sh
[bundle exec] fastlane ios publish_remote_podspec
```

Publish remote podspec

- `podspec_path`: The path to the podspec to lint

### ios unit_tests

```sh
[bundle exec] fastlane ios unit_tests
```

Unit tests

- `scheme_name`: The scheme name to run unit tests for

### ios code_coverage

```sh
[bundle exec] fastlane ios code_coverage
```

Generate code coverage XML file

- `scheme_name`: The scheme name to generate code coverage XML file for

- `xcodeproj_path`: The path to the xcodeproj file

### ios print_info_plist_key

```sh
[bundle exec] fastlane ios print_info_plist_key
```

Print info plist key

- `key`: The info plist key to print

- `path`: The info plist path

### ios update_docs

```sh
[bundle exec] fastlane ios update_docs
```

Update docs

- `module_name`: The module name

- `info_plist_path`: The path to the info plist

### ios create_push_git_tag

```sh
[bundle exec] fastlane ios create_push_git_tag
```

Create push git tag

- `info_plist_path`: The info plist path

### ios update_version

```sh
[bundle exec] fastlane ios update_version
```

Updates the version

- `version_name`: The version name to update to

- `info_plist_path` The path to the info plist to update

- `podspec_path`: The path to the podspec to update

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
