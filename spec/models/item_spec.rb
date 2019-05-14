require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belongs_to(:todo) }

  it { should validate_presense_of(:name) }
end
