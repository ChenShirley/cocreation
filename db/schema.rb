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

ActiveRecord::Schema.define(:version => 20131212092850) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "answerforideas", :force => true do |t|
    t.string   "name"
    t.string   "context"
    t.integer  "questionforidea_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "answers", :force => true do |t|
    t.string   "name"
    t.string   "context"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "askforhelps", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "projectparam_id"
    t.integer  "user_id"
    t.integer  "presub_id"
    t.integer  "pro_id"
    t.integer  "money"
    t.string   "plan"
    t.boolean  "limit"
    t.integer  "amount"
    t.integer  "investamount",    :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "investments", :force => true do |t|
    t.integer  "howmuch"
    t.boolean  "confirm"
    t.boolean  "showname"
    t.boolean  "showemail"
    t.boolean  "remit"
    t.string   "account_name"
    t.integer  "account_num"
    t.string   "time"
    t.integer  "feedback_id"
    t.integer  "user_id"
    t.integer  "pro_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "delivername"
    t.string   "delivermail"
    t.string   "deliverphone"
    t.string   "deliveraddress"
    t.string   "memo"
    t.string   "bank"
  end

  create_table "members", :force => true do |t|
    t.integer  "projectparam_id"
    t.integer  "user_id"
    t.integer  "presub_id"
    t.integer  "pro_id"
    t.string   "email"
    t.integer  "write"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "message"
    t.boolean  "ques"
    t.string   "user_name"
    t.integer  "pro_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "presubs", :force => true do |t|
    t.string   "name"
    t.string   "classify"
    t.integer  "goal"
    t.text     "intro"
    t.text     "summary"
    t.text     "pic"
    t.text     "video"
    t.string   "describe"
    t.text     "version"
    t.integer  "modify"
    t.boolean  "confirm"
    t.boolean  "teacheron"
    t.integer  "user_id"
    t.integer  "projectparam_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "upfile_id"
  end

  create_table "projectparams", :force => true do |t|
    t.integer  "mentor_id"
    t.integer  "keeper1_id"
    t.integer  "keeper2_id"
    t.string   "mentor_email"
    t.string   "keeper1_email"
    t.string   "keeper2_email"
    t.string   "due0"
    t.string   "due1"
    t.string   "due2"
    t.string   "due3"
    t.integer  "nowstage"
    t.integer  "restday0"
    t.integer  "restday1"
    t.integer  "restday2"
    t.integer  "restday3"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "pros", :force => true do |t|
    t.string   "classify"
    t.integer  "got"
    t.string   "start"
    t.boolean  "teacheron"
    t.boolean  "resultletter"
    t.integer  "user_id"
    t.integer  "presub_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "questionforideas", :force => true do |t|
    t.string   "name"
    t.boolean  "show"
    t.string   "context"
    t.integer  "user_id"
    t.integer  "presub_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.boolean  "show"
    t.string   "context"
    t.integer  "user_id"
    t.integer  "pro_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reasons", :force => true do |t|
    t.string   "context"
    t.integer  "user_id"
    t.integer  "presub_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stories", :force => true do |t|
    t.string   "topic"
    t.string   "history"
    t.integer  "pro_id"
    t.integer  "presub_id"
    t.integer  "user_id"
    t.string   "send"
    t.boolean  "show"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "upfiles", :force => true do |t|
    t.string   "filename"
    t.string   "filetoken"
    t.string   "filetype"
    t.string   "size"
    t.string   "usage"
    t.boolean  "currentuse"
    t.integer  "user_id"
    t.integer  "projectparam_id"
    t.integer  "presub_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.string   "name"
    t.boolean  "show"
    t.string   "marketability"
    t.string   "feasibility"
    t.string   "innovative"
    t.integer  "user_id"
    t.integer  "presub_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
