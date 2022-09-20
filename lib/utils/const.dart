import 'package:flutter/animation.dart';
import 'package:tamine/model/selector_model.dart';

const kDefaultPadding = 16.0;
const kDefaultSpacing = 14.0;
const kDefaultTextSpacing = 4.0;
const kDefaultBorderRadius = 16.0;
const kDefaultDuration = 400;
const curveType = Curves.decelerate;
const curveType1 = Curves.bounceIn;
const kFigmaScale = 1.4;

const apiKey = "AIzaSyBHMFwbDUmBmfvfgdCktSPx60-9wcWVDow";
const userKeyStorage = "tamwin_app_user_storage";

final maritalStatusOptions = [
  OptionModel(id: 0, title: "personal_case_1", index: 0),
  OptionModel(id: 1, title: "personal_case_2", index: 1),
  OptionModel(id: 2, title: "personal_case_3", index: 2),
  OptionModel(id: 3, title: "personal_case_4", index: 3),
];

final academicAchievementOptions = [
  OptionModel(id: 0, title: "study_case_1", index: 0),
  OptionModel(id: 1, title: "study_case_2", index: 1),
  OptionModel(id: 2, title: "study_case_3", index: 2),
  OptionModel(id: 3, title: "study_case_4", index: 3),
  OptionModel(id: 4, title: "study_case_5", index: 4),
  OptionModel(id: 5, title: "study_case_6", index: 5),
  OptionModel(id: 6, title: "study_case_7", index: 6)
];

final cardTypeOptions = [
  OptionModel(id: 0, title: "personal_card_type_1", index: 0),
  OptionModel(id: 1, title: "personal_card_type_2", index: 1),
];

final ganderOptions = [
  OptionModel(id: 0, title: "male", index: 0),
  OptionModel(id: 1, title: "female", index: 1),
];
final desitionOptions = [
  OptionModel(id: 0, title: "yes", index: 0),
  OptionModel(id: 1, title: "no", index: 1),
];

final workTypeOptions = [
  OptionModel(id: 0, title: "work_1", index: 0),
  OptionModel(id: 1, title: "work_2", index: 1),
  OptionModel(id: 2, title: "work_3", index: 2),
  OptionModel(id: 3, title: "work_4", index: 3)
];
final connectionTypeOptionAll = [
  OptionModel(id: 0, title: "wife", index: 0),
  OptionModel(id: 1, title: "son", index: 1),
  OptionModel(id: 2, title: "doter", index: 2),
  OptionModel(id: 3, title: "brother", index: 3),
  OptionModel(id: 4, title: "sister", index: 4),
];

final connectionTypeOptionList = [
  [
    OptionModel(id: 3, title: "brother", index: 0),
    OptionModel(id: 4, title: "sister", index: 1),
  ],
  [
    OptionModel(id: 0, title: "wife", index: 0),
    OptionModel(id: 1, title: "son", index: 1),
    OptionModel(id: 2, title: "doter", index: 2),
  ],
  [
    OptionModel(id: 1, title: "son", index: 0),
    OptionModel(id: 2, title: "doter", index: 1),
  ],
  [
    OptionModel(id: 1, title: "son", index: 0),
    OptionModel(id: 2, title: "doter", index: 1),
  ]
];

final salaryOption = [
  OptionModel(id: 0, title: "salary_1", index: 0),
  OptionModel(id: 1, title: "salary_2", index: 1),
  OptionModel(id: 2, title: "salary_3", index: 2),
  OptionModel(id: 3, title: "salary_4", index: 3),
  OptionModel(id: 4, title: "salary_5", index: 4),
];

final workPlaceList = [
  OptionModel(id: 0, title: "وزارة التجارة", index: 0),
  OptionModel(id: 1, title: "وزارة الكهرباء", index: 1),
  OptionModel(id: 2, title: "وزارة النفط", index: 2),
];
const fatherImKeyF = "id-front-0";
const fatherImKeyB = "id-back-0";

const childImKeyF = "id-front-";
const childImKeyB = "id-back-";

const imKey2F = "id-front-2";
const imKey2B = "id-back-2";

const imKey3F = "id-front-3";
const imKey3B = "id-back-3";

const imKey4F = "id-front-4";
const imKey4B = "id-back-4";
const imLocationKeyF = 'resident-front';
const imLocationKeyB = 'resident-back';

const imDeathKey0 = "death-0";
const imDeathKey1 = "death-1";
const imPerson = "photo-0";

String? getMotherName(String name, int index) {
  var names = name.split("@");
  if (index > names.length - 1) {
    return null;
  }
  return names[index];
}

String moneyFormat(String price) {
  if (price.length > 2) {
    var value = price;
    value = value.replaceAll(RegExp(r'\D'), '');
    value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    return value;
  }
  return price;
}
