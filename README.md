# Picker

Pick a value using a promise, supporting user cancellation and system interruption.

Usage
-----

```swift
class LanguageListController : UIViewController {
  private let picker = Picker<Language>()
  var result: PickerPromise<Language> { return picker.promise }

  func selectLanguage(_ language: Language) {
    picker.complete(with: language)
  }

  func cancelButtonTapped() {
    picker.cancel()
  }
}

// Elsewhere:

func pickLanguage() -> PickerPromise<Language> {
  let languageList = LanguageListController()
  self.present(languageList, animated: true, completion: nil)

  return languageList.result
    .then { [weak languageList] _ in
      languageList?.dismiss(animated: true, completion: nil)
    }
}

```


Releases
--------

 - 0.3.1 - 2020-08-08 - Add platform versions
 - **0.3.0** - 2019-06-10 - Swift 5.1 update
 - **0.2.0** - 2018-08-21 - Swift 4.2 update
 - **0.1.0** - 2017-06-05 - Initial public release
 - 0.0.0 - 2017-04-24 - Initial private version for project at [Q42](http://q42.com)

Licence & Credits
-----------------

Picker is written by [Q42](https://q42.com) and available under the [MIT license](https://github.com/Q42/Picker/blob/develop/LICENSE), so feel free to use it in commercial and non-commercial projects.

