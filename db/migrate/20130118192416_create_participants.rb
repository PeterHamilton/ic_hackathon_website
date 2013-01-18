class CreateParticipants < ActiveRecord::Migration
  def up
    create_table :participants do |t|
      t.string    :name
      t.string    :email
      t.integer   :year
      t.string    :department
      t.string    :team
    end
  end

  def down
    drop_table :participants
  end
end
