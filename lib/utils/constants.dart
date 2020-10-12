enum SpecialDays {
  NOTHING,
  BIRTHDAY,
  ANNIVERSARY,
  FIRSTOF,
  ROUTINE,
  HOLIDAY,
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
  SpecialDays.FIRSTOF: "First of...",
  SpecialDays.ROUTINE: "Repeating",
  SpecialDays.HOLIDAY: "Holiday",
  SpecialDays.OTHER: "Other",
  SpecialDays.NOTHING: "Reminder",
  SpecialDays.INVALID: "??? (Opps, we have an error here)",
};

Map<SpecialDays, String> EventIcon = {
  SpecialDays.BIRTHDAY: "🍰",
  SpecialDays.ANNIVERSARY: "💌",
  SpecialDays.FIRSTOF: "📅",
  SpecialDays.ROUTINE: "🔁",
  SpecialDays.HOLIDAY: "🧨",
  SpecialDays.OTHER: "🎁",
  SpecialDays.NOTHING: "🎀",
  SpecialDays.INVALID: "🛑",
};

List<String> constantSpecialDayStrings = [
  EventMap[SpecialDays.BIRTHDAY],
  EventMap[SpecialDays.ANNIVERSARY],
  EventMap[SpecialDays.FIRSTOF],
  EventMap[SpecialDays.ROUTINE],
  EventMap[SpecialDays.HOLIDAY],
  EventMap[SpecialDays.OTHER],
  EventMap[SpecialDays.NOTHING],
];
