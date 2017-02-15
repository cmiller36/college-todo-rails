class AddColumnsToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :request_transcripts, :boolean, default: false
    add_column :colleges, :pay_transcript_fee, :boolean, default: false
    add_column :colleges, :request_scores, :boolean, default: false
    add_column :colleges, :pay_score_request_fee, :boolean, default: false
    add_column :colleges, :request_rec_letters, :boolean, default: false
    add_column :colleges, :pay_app_fee, :boolean, default: false
    add_column :colleges, :submit_application, :boolean, default: false
    add_column :colleges, :college_visit, :datetime
  end
end
