Sequel.migration do
  change do
    create_table(:test_results) do
      primary_key :id
      String :status, :null => false
      DateTime :started_at, :null => false
      Numeric :run_time, :size => [10, 6], :null => false
      foreign_key :test_id, :tests
      index :test_id
    end
  end
end
