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

ActiveRecord::Schema.define(version: 2019_08_25_035802) do

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "first_name", limit: 25
    t.string "last_name", limit: 50
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "password_digest"
  end

  create_table "admin_users_pages", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.bigint "page_id"
    t.index ["admin_user_id"], name: "index_admin_users_pages_on_admin_user_id"
    t.index ["page_id"], name: "index_admin_users_pages_on_page_id"
  end

  create_table "pages", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "subject_id"
    t.string "name"
    t.string "permalink"
    t.integer "position"
    t.boolean "visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permalink"], name: "index_pages_on_permalink"
    t.index ["subject_id"], name: "index_pages_on_subject_id"
  end

  create_table "section_edits", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.bigint "section_id"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id", "section_id"], name: "index_section_edits_on_admin_user_id_and_section_id"
    t.index ["admin_user_id"], name: "index_section_edits_on_admin_user_id"
    t.index ["section_id"], name: "index_section_edits_on_section_id"
  end

  create_table "sections", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "page_id"
    t.string "name"
    t.integer "position"
    t.boolean "visible"
    t.string "content_type"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_sections_on_page_id"
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.boolean "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
