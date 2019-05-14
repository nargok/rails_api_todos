require 'rails_helper'

RSpec.describe Todo, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_may(:items).dependent(:destory) }

  # Validation test
  # ensure columns title and created_by are present
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end
