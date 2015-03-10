Sequel.migration do
  change do
    sleep 3
    create_table :bar do
      primary_key :id
      String :name
    end
  end
end