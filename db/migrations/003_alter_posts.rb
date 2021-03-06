Sequel.migration do
  change do
    alter_table :posts do
      add_column :views, Integer, default: 0
      add_column :likes, Integer, default: 0
      add_column :status, String, default: 'active' # active, inactive
    end
  end
end
