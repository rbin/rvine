class User < Couchbase::Model

  attribute :name
  attribute :twit_username
  attribute :avatar

  def self.find_or_create_from_auth_hash(hash)
    user = User.find_by_id(hash[:uid])
    unless user
      user = User.create!(:id => hash[:uid],
                          :name => hash[:info][:name],
                          :twit_username => hash[:info][:nickname],
                          :avatar => hash[:info][:image])
    end
    user
  end

end
