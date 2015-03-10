Sequel.migration do
  change do
    sleep 3
    create_table :foo do
      primary_key :id
      String :name
    end
  end
end