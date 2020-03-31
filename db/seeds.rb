# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Province.destroy_all
AdminUser.destroy_all

GST_RATE = 0.05
tax_rates = {
  'Alberta' => { 'pst_rate' => 0.0, 'hst_rate' => 0.0 },
  'British Columbia' => { 'pst_rate' => 0.07, 'hst_rate' => 0.0 },
  'Manitoba' => { 'pst_rate' => 0.07, 'hst_rate' => 0.0 },
  'New Brunswick' => { 'pst_rate' => 0.0, 'hst_rate' => 0.15 },
  'Newfoundland and Laborador' => { 'pst_rate' => 0.0, 'hst_rate' => 0.15 },
  'Northwest Territories' => { 'pst_rate' => 0.0, 'hst_rate' => 0.0 },
  'Nova Scotia' => { 'pst_rate' => 0.0, 'hst_rate' => 0.15 },
  'Nunavut' => { 'pst_rate' => 0.0, 'hst_rate' => 0.0 },
  'Ontario' => { 'pst_rate' => 0.0, 'hst_rate' => 0.13 },
  'Prince Edward Island' => { 'pst_rate' => 0.0, 'hst_rate' => 0.15 },
  'Quebec' => { 'pst_rate' => 0.09975, 'hst_rate' => 0.0 },
  'Saskatchewan' => { 'pst_rate' => 0.06, 'hst_rate' => 0.0 },
  'Yukon' => { 'pst_rate' => 0.0, 'hst_rate' => 0.0 }
}

tax_rates.each do |prov, rate|
  Province.create(
    name: prov,
    pst_rate: rate['hst_rate'] == 0.0 ? rate['pst_rate'] : 0.0,
    gst_rate: rate['hst_rate'] == 0.0 ? GST_RATE : 0.0,
    hst_rate: rate['hst_rate']
  )
end

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end

puts "Created #{Province.count} Provinces"
