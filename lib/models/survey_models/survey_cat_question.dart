class ModelSurveyCatQuestions {
  dynamic id;
  dynamic full_name;
  dynamic phone;
  dynamic market;
  dynamic which_role;
  dynamic researcher_id;
  dynamic survey_complete;
  dynamic is_eligible;
  dynamic created_at;
  dynamic updated_at;
  dynamic updatedBy;

  ModelSurveyCatQuestions(data) {
    this.id = data['id'];
    this.full_name = data['full_name'];
    this.phone = data['phone'];
    this.market = data['market'];
    this.which_role = data['which_role'];
    this.researcher_id = data['researcher_id'];
    this.survey_complete = data['survey_complete'];
    this.is_eligible = data['is_eligible'];
    this.created_at = data['created_at'];
    this.updated_at = data['updated_at'];
    this.updatedBy = data['updatedBy'];


  }
}
