require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
@store1.employees.create(first_name: "Tim", last_name: "Lu", hourly_rate: 100)
@store1.employees.create(first_name: "Jim", last_name: "Wu", hourly_rate: 90)
@store1.employees.create(first_name: "Sim", last_name: "Gu", hourly_rate: 1)

@store2.employees.create(first_name: "Tom", last_name: "Lu", hourly_rate: 100)
@store2.employees.create(first_name: "Jom", last_name: "Wu", hourly_rate: 90)
@store2.employees.create(first_name: "Som", last_name: "Gu", hourly_rate: 1)