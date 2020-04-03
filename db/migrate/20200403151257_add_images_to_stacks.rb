class AddImagesToStacks < ActiveRecord::Migration[6.0]
  def change
    add_column :stacks, :images, :string
  end
end
