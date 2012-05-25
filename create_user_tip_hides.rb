class CreateUserTipHides < ActiveRecord::Migration
  def self.up
    Tipster::CreateUserTipHides.up
  end

  def self.down
    Tipster::CreateUserTipHides.down
  end
end