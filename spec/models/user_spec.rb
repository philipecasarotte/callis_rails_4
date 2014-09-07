require "spec_helper"
require "rails_helper"

describe User do
  
  it { should have_named_scope(:admins) }
  it { should have_and_belong_to_many(:roles) }  
  it { should validate_presence_of(:name) }
  it { should have_db_index(:login) }  
  it { should be_authentic }

end
