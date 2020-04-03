class CreateStacks < ActiveRecord::Migration[6.0]
  def change
    create_table :stacks do |t|
      t.string :tilte
      t.string :user
      t.integer :rate

      t.timestamps
    end
  end
end
