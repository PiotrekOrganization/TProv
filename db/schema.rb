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

ActiveRecord::Schema.define(:version => 20130905102552) do

  create_table "address_translation", :id => false, :force => true do |t|
    t.integer   "id",                            :null => false
    t.integer   "job_id",                        :null => false
    t.string    "postman_id"
    t.integer   "address_id"
    t.string    "addr_line_1",    :limit => 200, :null => false
    t.string    "addr_line_2",    :limit => 200, :null => false
    t.string    "addr_line_3",    :limit => 200, :null => false
    t.string    "addr_line_4",    :limit => 200, :null => false
    t.string    "addr_line_5",    :limit => 200, :null => false
    t.string    "addr_line_6",    :limit => 200, :null => false
    t.string    "addr_line_7",    :limit => 200, :null => false
    t.string    "addr_line_8",    :limit => 200, :null => false
    t.string    "addr_line_9",    :limit => 200, :null => false
    t.string    "addr_line_10",   :limit => 200, :null => false
    t.integer   "source_id",                     :null => false
    t.text      "source_address",                :null => false
    t.timestamp "accepted",       :limit => 0
  end

  add_index "address_translation", ["address_id"], :name => "idx_a3a666a4f5b7af75"
  add_index "address_translation", ["job_id"], :name => "idx_a3a666a4be04ea9"
  add_index "address_translation", ["postman_id"], :name => "idx_a3a666a4fe201fbb"

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
    t.integer  "balance",                :default => 0
    t.boolean  "notify_new_item",        :default => true
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "balance_histories", :force => true do |t|
    t.integer  "admin_id"
    t.integer  "item_id"
    t.integer  "user_id"
    t.string   "comment"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "payment_id"
  end

  create_table "biller_group", :id => false, :force => true do |t|
    t.integer "id",                           :null => false
    t.string  "group_name",     :limit => 50, :null => false
    t.string  "canonical_name", :limit => 50, :null => false
  end

  create_table "challenge", :id => false, :force => true do |t|
    t.integer "id",                                        :null => false
    t.string  "sequence", :limit => nil, :default => "{}", :null => false
  end

  create_table "conflicts", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "admin_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "item_id"
  end

  create_table "customer", :id => false, :force => true do |t|
    t.integer "id",                               :null => false
    t.string  "company",           :limit => 100, :null => false
    t.boolean "popular",                          :null => false
    t.string  "realex_subaccount",                :null => false
  end

  create_table "customer_biller_group_m2m", :id => false, :force => true do |t|
    t.integer "customer_id", :null => false
    t.integer "group_id",    :null => false
  end

  add_index "customer_biller_group_m2m", ["customer_id"], :name => "idx_1ed0874d9395c3f3"
  add_index "customer_biller_group_m2m", ["group_id"], :name => "idx_1ed0874dfe54d947"

  create_table "glbuser", :id => false, :force => true do |t|
    t.integer   "id",                                  :null => false
    t.integer   "partials_id"
    t.integer   "address_id"
    t.integer   "publication_id"
    t.integer   "challenge_id"
    t.integer   "salutation_id",                       :null => false
    t.string    "username",                            :null => false
    t.string    "username_canonical",                  :null => false
    t.string    "email",                               :null => false
    t.string    "email_canonical",                     :null => false
    t.boolean   "enabled",                             :null => false
    t.string    "salt",                                :null => false
    t.string    "password",                            :null => false
    t.timestamp "last_login",            :limit => 0
    t.boolean   "locked",                              :null => false
    t.boolean   "expired",                             :null => false
    t.timestamp "expires_at",            :limit => 0
    t.string    "confirmation_token"
    t.timestamp "password_requested_at", :limit => 0
    t.text      "roles",                               :null => false
    t.boolean   "credentials_expired",                 :null => false
    t.timestamp "credentials_expire_at", :limit => 0
    t.string    "firstname",             :limit => 50, :null => false
    t.string    "secondname",            :limit => 50, :null => false
    t.string    "lastname",              :limit => 50, :null => false
    t.integer   "country",                             :null => false
    t.string    "mobile",                :limit => 20
    t.integer   "challenge_tries",                     :null => false
    t.timestamp "challenge_lock",        :limit => 0,  :null => false
    t.string    "sms_token",             :limit => 8
    t.timestamp "sms_requested_at",      :limit => 0
    t.boolean   "agreement_main",                      :null => false
    t.timestamp "confirmed",             :limit => 0
    t.timestamp "created",               :limit => 0,  :null => false
    t.timestamp "modified",              :limit => 0
    t.timestamp "deleted",               :limit => 0
    t.text      "tags",                                :null => false
    t.text      "filters",                             :null => false
    t.integer   "namesuffix_id"
  end

  add_index "glbuser", ["address_id"], :name => "uniq_e36e4f4cf5b7af75", :unique => true
  add_index "glbuser", ["challenge_id"], :name => "idx_e36e4f4c98a21ac6"
  add_index "glbuser", ["email_canonical"], :name => "uniq_e36e4f4ca0d96fbf", :unique => true
  add_index "glbuser", ["namesuffix_id"], :name => "idx_e36e4f4cde1552b2"
  add_index "glbuser", ["partials_id"], :name => "uniq_e36e4f4c3c01a4bd", :unique => true
  add_index "glbuser", ["publication_id"], :name => "uniq_e36e4f4c38b217a7", :unique => true
  add_index "glbuser", ["salutation_id"], :name => "idx_e36e4f4c2e5ad854"
  add_index "glbuser", ["username_canonical"], :name => "uniq_e36e4f4c92fc23a8", :unique => true

  create_table "ie_address", :id => false, :force => true do |t|
    t.string "address_reference", :limit => 21,  :null => false
    t.string "addr_line_1",       :limit => 200, :null => false
    t.string "addr_line_2",       :limit => 200, :null => false
    t.string "addr_line_3",       :limit => 200, :null => false
    t.string "addr_line_4",       :limit => 200, :null => false
    t.string "addr_line_5",       :limit => 200, :null => false
    t.string "addr_line_6",       :limit => 200, :null => false
    t.string "addr_line_7",       :limit => 200, :null => false
    t.string "addr_line_8",       :limit => 200, :null => false
    t.string "addr_line_9",       :limit => 200, :null => false
    t.string "addr_line_10",      :limit => 200, :null => false
    t.string "pp152",             :limit => 100
    t.string "pp61",              :limit => 100
  end

  create_table "items", :force => true do |t|
    t.integer  "order_id"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "expires"
    t.integer  "status"
    t.integer  "price"
  end

  create_table "mailer_suggestion", :id => false, :force => true do |t|
    t.integer   "id",                   :null => false
    t.integer   "user_id"
    t.timestamp "created", :limit => 0, :null => false
    t.string    "mailer",               :null => false
  end

  add_index "mailer_suggestion", ["user_id"], :name => "idx_a3189196a76ed395"

  create_table "mailing_document", :id => false, :force => true do |t|
    t.integer   "id",                                                             :null => false
    t.integer   "recipient_id"
    t.integer   "mailer_id",                                                      :null => false
    t.integer   "batch_id",                                                       :null => false
    t.string    "title",             :limit => 100,                               :null => false
    t.timestamp "created",           :limit => 0,                                 :null => false
    t.timestamp "opened",            :limit => 0
    t.timestamp "paid",              :limit => 0
    t.timestamp "deleted",           :limit => 0
    t.string    "tags",                                                           :null => false
    t.decimal   "due",                              :precision => 6, :scale => 2
    t.timestamp "due_date",          :limit => 0
    t.string    "s3url",                                                          :null => false
    t.integer   "reminder_days",                                                  :null => false
    t.integer   "reminder_methods",                                               :null => false
    t.string    "payment_reference", :limit => 200,                               :null => false
  end

  add_index "mailing_document", ["batch_id"], :name => "idx_575265af39ebe7a"
  add_index "mailing_document", ["mailer_id"], :name => "idx_575265a3f989867"
  add_index "mailing_document", ["recipient_id"], :name => "idx_575265ae92f8f78"

  create_table "mailing_document_note", :id => false, :force => true do |t|
    t.integer   "id",                       :null => false
    t.integer   "document_id",              :null => false
    t.timestamp "created",     :limit => 0, :null => false
    t.string    "content",                  :null => false
  end

  add_index "mailing_document_note", ["document_id"], :name => "idx_4a2ff379c33f7837"

  create_table "mailing_document_reminder", :id => false, :force => true do |t|
    t.integer   "id",                       :null => false
    t.integer   "document_id",              :null => false
    t.timestamp "created",     :limit => 0, :null => false
    t.integer   "days",                     :null => false
    t.integer   "methods",                  :null => false
  end

  add_index "mailing_document_reminder", ["document_id"], :name => "uniq_580fc426c33f7837", :unique => true

  create_table "mailing_job", :id => false, :force => true do |t|
    t.integer   "id",                                :null => false
    t.integer   "mailer_id",                         :null => false
    t.string    "status_id",           :limit => 30, :null => false
    t.timestamp "created",             :limit => 0,  :null => false
    t.timestamp "status_changed",      :limit => 0,  :null => false
    t.string    "matching_worker",     :limit => 20
    t.string    "listing_worker",      :limit => 20
    t.timestamp "dispatched",          :limit => 0
    t.integer   "records_to_send"
    t.integer   "records_not_to_send"
    t.string    "xml_document_name"
    t.integer   "xml_document_count"
    t.integer   "xml_page_count"
    t.timestamp "xml_document_stamp",  :limit => 0
    t.integer   "xml_document_type"
  end

  add_index "mailing_job", ["mailer_id"], :name => "idx_29536dc93f989867"
  add_index "mailing_job", ["status_id"], :name => "idx_29536dc96bf700bd"

  create_table "mailing_job_batch", :id => false, :force => true do |t|
    t.integer   "id",                              :null => false
    t.integer   "job_id"
    t.integer   "batch",                           :null => false
    t.integer   "batch_begin",                     :null => false
    t.integer   "batch_end",                       :null => false
    t.timestamp "batch_scheduled_at", :limit => 0, :null => false
    t.timestamp "batch_sent_at",      :limit => 0
  end

  add_index "mailing_job_batch", ["job_id"], :name => "idx_cb529febbe04ea9"

  create_table "mailing_job_status", :id => false, :force => true do |t|
    t.string  "id",           :limit => 30, :null => false
    t.integer "search_index",               :null => false
    t.integer "list_order",                 :null => false
    t.string  "name_mailer",  :limit => 30, :null => false
    t.string  "name_postman", :limit => 30, :null => false
    t.text    "desctiption",                :null => false
  end

  add_index "mailing_job_status", ["search_index"], :name => "uniq_cd5511ecb446a4e8", :unique => true

  create_table "name_suffix", :id => false, :force => true do |t|
    t.integer "id",                       :null => false
    t.integer "list_order",               :null => false
    t.string  "name",       :limit => 30, :null => false
    t.string  "short_name", :limit => 10, :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "quantity"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
    t.text     "description"
    t.integer  "ticket_time"
    t.integer  "price"
    t.integer  "signs"
    t.text     "comment"
    t.integer  "admin_id"
    t.integer  "customer_id"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  create_table "partials", :id => false, :force => true do |t|
    t.integer "id",                                        :null => false
    t.string  "partials", :limit => nil, :default => "{}", :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "status"
  end

  create_table "postman", :id => false, :force => true do |t|
    t.string    "id",                                 :null => false
    t.string    "username",                           :null => false
    t.string    "username_canonical",                 :null => false
    t.string    "email",                              :null => false
    t.string    "email_canonical",                    :null => false
    t.boolean   "enabled",                            :null => false
    t.string    "salt",                               :null => false
    t.string    "password",                           :null => false
    t.timestamp "last_login",            :limit => 0
    t.boolean   "locked",                             :null => false
    t.boolean   "expired",                            :null => false
    t.timestamp "expires_at",            :limit => 0
    t.string    "confirmation_token"
    t.timestamp "password_requested_at", :limit => 0
    t.text      "roles",                              :null => false
    t.boolean   "credentials_expired",                :null => false
    t.timestamp "credentials_expire_at", :limit => 0
  end

  add_index "postman", ["email_canonical"], :name => "uniq_446a51c4a0d96fbf", :unique => true
  add_index "postman", ["username_canonical"], :name => "uniq_446a51c492fc23a8", :unique => true

  create_table "realex_transactions", :id => false, :force => true do |t|
    t.integer "id",                                                           :null => false
    t.integer "document_id",                                                  :null => false
    t.string  "name",            :limit => 40
    t.decimal "amount",                        :precision => 15, :scale => 0, :null => false
    t.string  "currency",        :limit => 3
    t.date    "begin_date",                                                   :null => false
    t.date    "paid_date"
    t.date    "finished_date"
    t.text    "realex_request"
    t.text    "realex_feedback"
    t.integer "status",                                                       :null => false
  end

  add_index "realex_transactions", ["document_id"], :name => "idx_a86b6d61c33f7837"
  add_index "realex_transactions", ["name"], :name => "uniq_a86b6d615e237e06", :unique => true

  create_table "recipient_mailer_m2m", :id => false, :force => true do |t|
    t.integer "user_id",     :null => false
    t.integer "customer_id", :null => false
  end

  add_index "recipient_mailer_m2m", ["customer_id"], :name => "idx_a100867b9395c3f3"
  add_index "recipient_mailer_m2m", ["user_id"], :name => "idx_a100867ba76ed395"

  create_table "salutation", :id => false, :force => true do |t|
    t.integer "id",                       :null => false
    t.integer "list_order",               :null => false
    t.string  "name",       :limit => 30, :null => false
    t.string  "short_name", :limit => 10, :null => false
  end

  create_table "subscription", :id => false, :force => true do |t|
    t.integer   "id",                     :null => false
    t.timestamp "published", :limit => 0, :null => false
    t.timestamp "accepted",  :limit => 0
  end

  create_table "user_address", :id => false, :force => true do |t|
    t.integer   "id",                               :null => false
    t.integer   "user_id"
    t.integer   "mailer_id"
    t.string    "base_address_ref",  :limit => 21
    t.string    "addr_line_1",       :limit => 200, :null => false
    t.string    "addr_line_2",       :limit => 200, :null => false
    t.string    "addr_line_3",       :limit => 200, :null => false
    t.string    "addr_line_4",       :limit => 200, :null => false
    t.string    "addr_line_5",       :limit => 200, :null => false
    t.string    "addr_line_6",       :limit => 200, :null => false
    t.string    "addr_line_7",       :limit => 200, :null => false
    t.string    "addr_line_8",       :limit => 200, :null => false
    t.string    "addr_line_9",       :limit => 200, :null => false
    t.string    "addr_line_10",      :limit => 200, :null => false
    t.text      "address_canonical",                :null => false
    t.text      "address_dirty",                    :null => false
    t.string    "address_token",     :limit => 8
    t.timestamp "token_sent_at",     :limit => 0
    t.integer   "token_tries",                      :null => false
    t.timestamp "token_locked_at",   :limit => 0,   :null => false
    t.timestamp "verified_at",       :limit => 0
  end

  add_index "user_address", ["base_address_ref"], :name => "idx_5543718b560492d4"
  add_index "user_address", ["mailer_id"], :name => "idx_5543718b3f989867"
  add_index "user_address", ["user_id"], :name => "idx_5543718ba76ed395"

  create_table "user_device", :id => false, :force => true do |t|
    t.integer "id",                        :null => false
    t.integer "user_id"
    t.string  "identifier", :limit => 100, :null => false
    t.string  "secret",     :limit => 100, :null => false
  end

  add_index "user_device", ["user_id"], :name => "idx_6c7dadb3a76ed395"

  create_table "user_subscription_m2m", :id => false, :force => true do |t|
    t.integer "user_id",         :null => false
    t.integer "subscription_id", :null => false
  end

  add_index "user_subscription_m2m", ["subscription_id"], :name => "idx_f80364c39a1887dc"
  add_index "user_subscription_m2m", ["user_id"], :name => "idx_f80364c3a76ed395"

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.integer  "type"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "confirmed_terms",        :default => 0
    t.boolean  "notify_new_order",       :default => true
    t.boolean  "notify_item_accept",     :default => true
    t.boolean  "notify_item_reject",     :default => true
    t.integer  "balance",                :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
