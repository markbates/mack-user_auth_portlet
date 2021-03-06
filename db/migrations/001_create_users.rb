migration 1, :create_users do

  up do
    create_table :users do
      column :id, Serial
      column :username, String
      column :password, BCryptHash
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :users
  end

end
