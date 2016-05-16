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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160516104252) do

  create_table "authorships", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "invitee_id"
    t.integer  "inviter_id"
    t.boolean  "accepted",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "authorships", ["accepted"], name: "index_authorships_on_accepted"
  add_index "authorships", ["book_id"], name: "index_authorships_on_book_id"
  add_index "authorships", ["invitee_id"], name: "index_authorships_on_invitee_id"
  add_index "authorships", ["inviter_id"], name: "index_authorships_on_inviter_id"

  create_table "book_versions", force: :cascade do |t|
    t.integer  "book_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "book_versions", ["book_id"], name: "index_book_versions_on_book_id"

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
  end

  add_index "books", ["owner_id"], name: "index_books_on_owner_id"

  create_table "chapter_versions", force: :cascade do |t|
    t.integer  "book_version_id"
    t.string   "title"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "chapter_versions", ["book_version_id"], name: "index_chapter_versions_on_book_version_id"

  create_table "chapters", force: :cascade do |t|
    t.string   "title"
    t.text     "notes"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
  end

  add_index "chapters", ["book_id"], name: "index_chapters_on_book_id"
  add_index "chapters", ["position"], name: "index_chapters_on_position"

  create_table "section_versions", force: :cascade do |t|
    t.integer  "chapter_version_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "section_versions", ["chapter_version_id"], name: "index_section_versions_on_chapter_version_id"

  create_table "sections", force: :cascade do |t|
    t.string   "title"
    t.text     "notes"
    t.text     "content"
    t.integer  "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sections", ["chapter_id"], name: "index_sections_on_chapter_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
