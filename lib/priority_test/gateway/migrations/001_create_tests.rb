migration 1, :create_people_table do
  up do
    create_table :tests do
      column :id,   Integer, :serial => true
      column :identifier, Text, :allow_nil => false
      column :file_path, Text, :allow_nil => false
      column :priority, Integer, :allow_nil => false, :default => 0
      column :avg_run_time, Decimal
    end
  end

  down do
    drop_table :people
  end
end

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
