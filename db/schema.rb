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

ActiveRecord::Schema.define(version: 20171013015504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.boolean  "editable"
    t.integer  "unidade_id"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_id"], name: "index_events_on_unidade_id", using: :btree
    t.index ["usuario_id"], name: "index_events_on_usuario_id", using: :btree
  end

  create_table "telefones", force: :cascade do |t|
    t.string   "numero"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_telefones_on_usuario_id", using: :btree
  end

  create_table "tipo_plantaos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_unidades", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidades", force: :cascade do |t|
    t.string   "nome"
    t.string   "localizacao"
    t.integer  "tipo_unidade_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["tipo_unidade_id"], name: "index_unidades_on_tipo_unidade_id", using: :btree
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "password_digest"
    t.date     "datanascimento"
    t.string   "crefito"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
    t.boolean  "ativo",           default: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_usuarios_on_email", using: :btree
  end

  add_foreign_key "events", "unidades"
  add_foreign_key "events", "usuarios"
  add_foreign_key "telefones", "usuarios"
  add_foreign_key "unidades", "tipo_unidades"
end
