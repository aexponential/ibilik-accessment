class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.string :title
			t.text :body
			t.integer :user_id
			t.integer :property_id

			t.timestamps null: false
		end
	end
end