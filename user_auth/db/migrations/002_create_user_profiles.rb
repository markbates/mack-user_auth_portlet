migration 2, :create_user_profiles do

  up do
    create_table :user_profiles do
      column :id, Serial
      column :user_id, Integer
      column :email_address, String
      column :display_name, String
      column :bio, Text, :nullable? => true
      column :birthdate, Date
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :user_profiles
  end

end
