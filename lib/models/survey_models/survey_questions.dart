class ModelSurveyQuestions {
  dynamic id;
  dynamic question;

  dynamic part_number;
  dynamic data_input_type;
  dynamic role;
  dynamic end_survey;

  ModelSurveyQuestions() {}

  ModelSurveyQuestions.from(data) {
    this.id = data['id'];
    this.question = data['question'];
    this.part_number = data['part_number'];
    this.data_input_type = data['data_input_type'];
    this.role = data['role'];
    this.end_survey = data['end_survey'];
  }
}
