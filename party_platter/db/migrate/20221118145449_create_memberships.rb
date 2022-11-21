class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.references :campaign, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end

    add_index :memberships, [:campaign_id, :character_id], unique: true
  end
end
