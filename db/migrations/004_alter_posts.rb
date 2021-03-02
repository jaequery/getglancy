Sequel.migration do
  change do
    alter_table :posts do
      add_column :link, String
    end
  end
end