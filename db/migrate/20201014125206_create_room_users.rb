class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, foreign_key: true #referencesは外部キーのカラムを追加する際に使用する型。
      t.references :user, foreign_key: true #foreign_key: trueと言う制約で他テーブルの情報を参照する。
      t.timestamps
    end
  end
end
