class CreateUserTipHides < ActiveRecord::Migration
    def self.up
        create_table :user_tip_hides, :id => false do |t|
            t.column :user_id,   :integer,   :null => false
            t.column :tip_id,    :string,    :null => false
        end
        
        add_index :user_tip_hides, [:user_id, :tip_id], :unique => true
    end

    def self.down
        drop_table :user_tip_hides
    end
end
