Sequel.migration do
  change do
    create_table(:tests) do
      primary_key :id
      String :identifier, :text => true, :null => false
      String :file_path, :text => true, :null => false
      Integer :priority, :default => 0, :null => false
      Numeric :avg_run_time, :size => [10, 6], :default => 0, :null => false
    end
  end
end
