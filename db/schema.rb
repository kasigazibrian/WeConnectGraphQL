# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_181_210_101_900) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'businesses', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'contact_number'
    t.text 'description'
    t.string 'location'
    t.bigint 'user_id'
    t.bigint 'category_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_businesses_on_category_id'
    t.index %w[contact_number name email], name: 'index_businesses_on_contact_number_and_name_and_email', unique: true
    t.index ['user_id'], name: 'index_businesses_on_user_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_categories_on_name', unique: true
  end

  create_table 'reviews', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.bigint 'business_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['business_id'], name: 'index_reviews_on_business_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'password_digest'
    t.string 'gender'
    t.string 'username'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[username email], name: 'index_users_on_username_and_email', unique: true
  end

  add_foreign_key 'businesses', 'categories'
  add_foreign_key 'businesses', 'users'
  add_foreign_key 'reviews', 'businesses'
  add_foreign_key 'reviews', 'users'
end
