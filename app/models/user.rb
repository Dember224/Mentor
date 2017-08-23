class User < ApplicationRecord
has_secure_password
has_one :career
has_one :resume

end
