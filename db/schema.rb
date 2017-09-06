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

ActiveRecord::Schema.define(version: 20170829194713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "status_usuarios", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telefones", force: :cascade do |t|
    t.string   "numero"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_telefones_on_usuario_id", using: :btree
  end

  create_table "tipo_usuarios", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "password_digest"
    t.date     "datanascimento"
    t.string   "crefito"
    t.integer  "tipo_usuario_id"
    t.integer  "status_usuario_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "admin",             default: false
    t.boolean  "ativo",             default: false
    t.index ["email"], name: "index_usuarios_on_email", using: :btree
    t.index ["status_usuario_id"], name: "index_usuarios_on_status_usuario_id", using: :btree
    t.index ["tipo_usuario_id"], name: "index_usuarios_on_tipo_usuario_id", using: :btree
  end

  add_foreign_key "telefones", "usuarios"
  add_foreign_key "usuarios", "status_usuarios"
  add_foreign_key "usuarios", "tipo_usuarios"
end
