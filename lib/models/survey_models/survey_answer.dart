class ModelSurveyAnswers {

  dynamic id;
  dynamic survey_id;
  dynamic survey_question_id;
  dynamic survey_data;
  dynamic created_at;
  dynamic updated_at;
  dynamic status;

  ModelSurveyAnswers() {}

  ModelSurveyAnswers.from(data) {

    this.id = data['id'];
    this.survey_id = data['survey_id'];
    this.survey_question_id = data['survey_question_id'];
    this.survey_data = data['survey_data'];
    this.created_at = data['created_at'];
    this.updated_at = data['updated_at'];
    this.status = data['status'];
  }



}
