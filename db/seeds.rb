# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.create user_name: 'User1',
            email: 'user1@mail.com',
            password: '12345678',
            password_confirmation: '12345678'

Status.create(
    [
        {status_type: 'Waiting for Staff Response'},
        {status_type: 'Waiting for Customer'},
        {status_type: 'On Hold'},
        {status_type: 'Cancelled'},
        {status_type: 'Completed'}
    ])

Department.create(
    [
        {department_type: 'IT'},
        {department_type: 'HR'},
        {department_type: 'Sale'},
        {department_type: 'Support'}
    ])
