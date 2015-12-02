# == Schema Information
#
# Table name: industries
#
#  id         :integer          not null, primary key
#  name       :string
#  name_seo   :string
#  parent_id  :integer
#  lft        :integer
#  rgt        :integer
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_industries_on_deleted_at  (deleted_at)
#  index_industries_on_lft         (lft)
#  index_industries_on_name        (name)
#  index_industries_on_name_seo    (name_seo)
#  index_industries_on_parent_id   (parent_id)
#  index_industries_on_rgt         (rgt)
#

require 'rails_helper'

RSpec.describe Industry, type: :model do
  it "标准数据" do
    expect(build(:industry)).to be_valid
  end

  describe "name" do
    it { should have_db_column(:name).of_type(:string)}
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_length_of(:name).is_at_most(20) }
  end

  describe "name_seo" do
    subject { build(:industry) }
    it { should have_db_column(:name_seo).of_type(:string)}
    # it { should have_db_index(:name_seo).unique(true)}
    it { should validate_presence_of(:name_seo) }
    it { should validate_length_of(:name_seo).is_at_least(2) }
    it { should validate_length_of(:name_seo).is_at_most(20) }
    it { should validate_uniqueness_of(:name_seo).case_insensitive }
  end
end
