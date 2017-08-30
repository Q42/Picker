# Picker

_NOTE: This library is a work in progress_

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


Licence & Credits
-----------------

Picker is written by [Q42](https://q42.com) and available under the [MIT license](https://github.com/Q42/Picker/blob/develop/LICENSE), so feel free to use it in commercial and non-commercial projects.

