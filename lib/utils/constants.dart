enum SpecialDays {
  NOTHING,
  BIRTHDAY,
  ANNIVERSARY,
  FIRSTOF,
  ROUTINE,
  OTHER,
  INVALID
}

enum DateTypes {
  LUNAR,
  SOLAR,
  INVALID
}

Map<SpecialDays, String> EventMap = {
  SpecialDays.BIRTHDAY: "Birthday",
  SpecialDays.ANNIVERSARY: "Anniversary",
  SpecialDays.FIRSTOF: "first",
  SpecialDays.ROUTINE: "repeating",
  SpecialDays.OTHER: "",
  SpecialDays.NOTHING: "null-ish (Opps, we have an error here)",
  SpecialDays.INVALID: "??? (Opps, we have an error here)",
};