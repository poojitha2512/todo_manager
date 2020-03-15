class User < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. username:#{name} email:#{email}"
  end
end
