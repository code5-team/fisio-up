class AddPasswordDigest < ActiveRecord::Migration[5.0]
  def change
    rename_column :usuarios, :senha_criptografada, :password_digest 
  end
end
