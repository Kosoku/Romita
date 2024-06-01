fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### encrypt

```sh
[bundle exec] fastlane encrypt
```

Encrypt platform specific files

- `openssl_password`: The openssl password to use when encrypting files

### decrypt

```sh
[bundle exec] fastlane decrypt
```

Decrypt certificates and profiles

- `openssl_password`: The openssl password to use when decrypting files

- `platform_name`: The platform name (ios/android)

### print_full_version

```sh
[bundle exec] fastlane print_full_version
```

Prints the full version (e.g. "1.0.0 (1)")

- `include_platform_prefix`: Whether to include the platform name in the returned string

- `include_version_prefix`: Whether to include the version prefix in the returned string

----


## Android

### android print_properties_file_key

```sh
[bundle exec] fastlane android print_properties_file_key
```

Print properties file key

- `key`: The properties file key to print

- `path`: The path to the properties file

### android print_properties_file_version_name_key

```sh
[bundle exec] fastlane android print_properties_file_version_name_key
```

Prints the versionName key from the build properties file

- `build_properties_path`: The path to the build properties file

### android print_properties_file_version_code_key

```sh
[bundle exec] fastlane android print_properties_file_version_code_key
```

Prints the versionCode key from the build properties file

- `build_properties_path`: The path to the build properties file

### android set_properties_file_key

```sh
[bundle exec] fastlane android set_properties_file_key
```

Set properties file key

- `key`: The properties file key to set

- `value`: The new value for the properties file key

- `path`: The path to the properties file

### android set_version_code_git_commit_count

```sh
[bundle exec] fastlane android set_version_code_git_commit_count
```

Set version code to git commit count

### android update_version_code

```sh
[bundle exec] fastlane android update_version_code
```

Update version code

----


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

### ios print_info_plist_bundle_short_version_string_key

```sh
[bundle exec] fastlane ios print_info_plist_bundle_short_version_string_key
```

Print info plist bundle short version string key

- `path`: The info plist path

### ios print_info_plist_bundle_version_key

```sh
[bundle exec] fastlane ios print_info_plist_bundle_version_key
```

Print info plist bundle version key

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

### ios update_version_string

```sh
[bundle exec] fastlane ios update_version_string
```

Updates the version string

- `version_string`: The version string to update to

- `info_plist_path` The path to the info plist to update

- `podspec_path`: The path to the podspec to update

### ios increment_version

```sh
[bundle exec] fastlane ios increment_version
```

Increments the version

- `info_plist_path` The path to the info plist to update

### ios set_version_git_commit_count

```sh
[bundle exec] fastlane ios set_version_git_commit_count
```

Set version to git commit count

- `info_plist_path` The path to the info plist to update

### ios update_version

```sh
[bundle exec] fastlane ios update_version
```

Updates the version

- `version`: The version to update to

- `info_plist_path` The path to the info plist to update

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
