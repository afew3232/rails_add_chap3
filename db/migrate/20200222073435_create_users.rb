class CreateUsers < ActiveRecord::Migration[5.2]
  def change #データベースに当たる変更の定義 db:migrateで実行される
    create_table :users do |t| #create_tableメゾットは、テーブルをデータベースに作成するということ
      t.string :name #nameカラムを作成
      t.string :email

      t.timestamps #create_at と update_atという、マジックカラムを作成し、時間を保存する
    end
  end
end
