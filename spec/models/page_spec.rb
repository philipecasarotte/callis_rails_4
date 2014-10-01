require "spec_helper"
require "rails_helper"

describe Page do
  
  it { should belong_to(:parent) }
  it { should have_many(:children) }  
  it { should validate_presence_of(:name) }
  it { should have_db_column(:position) }  

  it "should have a permalink when saved" do
    page = Page.create(:name => "Title of Permalink", :body => "Testing text!")
    page.permalink.should == "title-of-permalink"
  end

  context "with duplicated title" do
    before(:each) do
      @page_one ||= Page.new(:name=>'Page', :body=>'Lorem')
      @page_two ||= Page.new(:name=>'Page', :body=>'Lorem')
      @page_three ||= Page.new(:name=>'Page', :body=>'Lorem')
      @page_one.save
      @page_two.save
      @page_three.save
    end

    it "should be able to be created" do
      @page_one.new_record?.should be false
      @page_two.new_record?.should be false
      @page_three.new_record?.should be false
    end

    it "should have different permalinks" do
      @page_one.permalink.should eq('page')
      @page_two.permalink.should eq('page-1')
      @page_three.permalink.should eq('page-2')
    
      @page_one.to_param.should eq("page")
    end
  end

  context "protected" do
    before(:each) do
      @page = FactoryGirl.create(:page, :is_protected => true)
    end

    it "should not change the permalink" do
      permalink = @page.permalink
      @page.is_protected.should be true

      @page.update_attribute(:name,"CHANGED")
      @page.permalink.should == permalink
    end
  end

  context "with especial characters" do
    before(:each) do
      @page = Page.create(:name => "Página & $ * é nóis")
    end

    it "should remove accents from permalink" do
      @page.permalink.should == "pagina-e-nois"
    end
  end

end
