class ExerciseObject {
  String bodyPart, equipment, name, target;
  String id;
  String gifUrl;
  List instructions;
  ExerciseObject(this.id, this.bodyPart, this.name,
      this.target, this.equipment, this.gifUrl, this.instructions);
  factory ExerciseObject.fromJson(Map<String, dynamic> json) {
    return ExerciseObject(
      json['id'],
      json['bodyPart'],
      json['name'],
      json['target'],
      json['equipment'],
      json['gifUrl'],
      json['instructions']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'bodyPart': bodyPart,
      'name' : name,
      'target': target,
      'equipment': equipment,
      'gifUrl': gifUrl,
      'instructions' : instructions
    };
  }


}