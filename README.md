A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

1. First install dependencies
```shell
dart pub get
```

2. Next run! and enjoy!
```shell
dart run
```
And while debugging, I get this:
![image](https://github.com/lecksfrawen/dart-budyboss-activities-get-dio-cli-example/assets/303818/2aa05ee0-9126-46ce-aafd-a755826b49b7)


## Notes
Generated DTO with: https://app.quicktype.io/  
From this URL: https://online-communities.demos.buddyboss.com/wp-json/buddyboss/v1/activity  
From this online demo: https://online-communities.demos.buddyboss.com    
Looking at this docs: https://www.buddyboss.com/resources/api/  


## Env
Tested on macOS 
```shell
$ dart --version
Dart SDK version: 3.0.4 (stable) (Wed Jun 7 14:55:32 2023 +0000) on "macos_arm64"
```
And created this repo with:
```shell
brew install asdf
asdf plugin-add dart https://github.com/patoconnor43/asdf-dart.git
asdf install dart 3.0.4
asdf local dart 3.0.4
asdf info
asdf current
which dart
dart --version
dart create -t console dart-budyboss-activities-get-dio-cli-example
cd dart-budyboss-activities-get-dio-cli-example/
git init
git add .
git commit -m "feat: first commit"
gh repo create "dart-budyboss-activities-get-dio-cli-example" --public --push --source .
dart pub add dio
dart pub get
code .
dart run
```
