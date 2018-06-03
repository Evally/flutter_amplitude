# Flutter implementation of Amplitude SDK

## Getting Started
To use this plugin, add flutter_amplitude as a dependency in your pubspec.yaml file.

## Example

```dart
    FlutterAmplitude.init("your_apy_key", true);
    FlutterAmplitude.addGeneralProperties(<String, String>{'generalParameter': 'general'});
    FlutterAmplitude.setUserId("info@sample.com");
    FlutterAmplitude.setUserProperties(<String, String>{'userParameter': 'user'});
    FlutterAmplitude.logEvent("EVENT_KEY", <String, String>{'eventParameter': 'event'});
```

# License
	Copyright 2018 Miguel Catalan Bañuls

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.