class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table "campaigns" do |t|
      t.integer "created_by"
      t.string "name"
      t.integer "minplayers"
      t.integer "maxplayers"
      t.timestamps
    end
  end
end
