class JsonDb {
  List<SavedEntries> savedEntries;

  JsonDb({this.savedEntries});

  JsonDb.fromJson(Map<String, dynamic> json) {
    if (json['savedEntries'] != null) {
      savedEntries = new List<SavedEntries>();
      json['savedEntries'].forEach((v) {
        savedEntries.add(new SavedEntries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.savedEntries != null) {
      data['savedEntries'] = this.savedEntries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SavedEntries {
  String firstName;
  String lastName;
  int id;
  List<SavedDays> savedDays;

  SavedEntries({this.firstName, this.lastName, this.id, this.savedDays});

  SavedEntries.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    id = json['id'];
    if (json['savedDays'] != null) {
      savedDays = new List<SavedDays>();
      json['savedDays'].forEach((v) {
        savedDays.add(new SavedDays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['id'] = this.id;
    if (this.savedDays != null) {
      data['savedDays'] = this.savedDays.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SavedDays {
  int type;
  String date;
  bool reminderDay;
  bool reminderprior;
  bool automessage;
  String messageContent;

  SavedDays(
      {this.type,
        this.date,
        this.reminderDay,
        this.reminderprior,
        this.automessage,
        this.messageContent});

  SavedDays.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    date = json['date'];
    reminderDay = json['reminderDay'];
    reminderprior = json['reminderprior'];
    automessage = json['automessage'];
    messageContent = json['messageContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['date'] = this.date;
    data['reminderDay'] = this.reminderDay;
    data['reminderprior'] = this.reminderprior;
    data['automessage'] = this.automessage;
    data['messageContent'] = this.messageContent;
    return data;
  }
}
