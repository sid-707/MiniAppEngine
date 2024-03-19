class CreateDeployments < ActiveRecord::Migration[7.1]
  def change
    create_table :deployments do |t|
      t.datetime :deployed_at
      t.string :status

      t.timestamps
    end
  end
end
