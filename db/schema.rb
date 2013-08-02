# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130802101424) do

  create_table "examinations", :force => true do |t|
    t.integer  "institution_id"
    t.string   "subject"
    t.string   "chapter"
    t.integer  "total_marks"
    t.integer  "total_time"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "teacher_id"
    t.integer  "standard"
    t.integer  "difficulty_level"
  end

  create_table "institutions", :force => true do |t|
    t.string   "email",                     :default => "", :null => false
    t.string   "encrypted_password",        :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "institution_name"
    t.text     "institution_address"
    t.text     "institute_contact_details"
    t.string   "institution_board"
    t.text     "institute_description"
  end

  add_index "institutions", ["email"], :name => "index_institutions_on_email", :unique => true
  add_index "institutions", ["reset_password_token"], :name => "index_institutions_on_reset_password_token", :unique => true

  create_table "members", :force => true do |t|
    t.string   "email",                   :default => "", :null => false
    t.string   "encrypted_password",      :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "age"
    t.string   "qualifications"
    t.string   "institution_specific_id"
    t.integer  "institution_id"
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "questions", :force => true do |t|
    t.integer  "examination_id"
    t.text     "question"
    t.string   "correct_answer"
    t.text     "incorrect_answers"
    t.float    "answer_tat"
    t.integer  "difficulty_level"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "marks"
  end

end
