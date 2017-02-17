class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :职缺
      t.text :岗位描述

      t.timestamps
    end
  end
end
