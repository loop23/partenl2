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

ActiveRecord::Schema.define(version: 20170430221811) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "text",         limit: 800, default: "", null: false
    t.integer  "paragraph_id",                          null: false
    t.integer  "section_id",                            null: false
    t.datetime "created_at",                            null: false
    t.integer  "user_id",                               null: false
    t.integer  "position"
    t.index ["paragraph_id"], name: "fk_paragraph", using: :btree
    t.index ["section_id"], name: "fk_section", using: :btree
    t.index ["user_id"], name: "fk_user", using: :btree
  end

  create_table "documents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "engine_schema_info", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "engine_name"
    t.integer "version"
  end

  create_table "paragraphs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",      limit: 65535, null: false
    t.integer  "order",                      null: false
    t.integer  "section_id"
    t.integer  "paragraph_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["paragraph_id"], name: "index_paragraphs_on_paragraph_id", using: :btree
    t.index ["section_id"], name: "index_paragraphs_on_section_id", using: :btree
  end

  create_table "schema_info", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "version"
  end

  create_table "sections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.boolean  "editable"
    t.text     "content",     limit: 65535
    t.integer  "order"
    t.integer  "document_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["document_id"], name: "index_sections_on_document_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.string   "locale",           default: "it",  null: false
    t.datetime "oauth_expires_at"
    t.boolean  "admin",            default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_foreign_key "paragraphs", "paragraphs"
  add_foreign_key "paragraphs", "sections"
  add_foreign_key "sections", "documents"
end
