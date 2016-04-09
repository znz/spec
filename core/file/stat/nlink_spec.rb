require File.expand_path('../../../../spec_helper', __FILE__)

describe "File::Stat#nlink" do
  before :each do
    @file = tmp("stat_nlink")
    @link = @file + ".lnk"
    touch @file
  end

  after :each do
    rm_r @link, @file
  end

  it "returns the number of links to a file" do
    File.open(@file) { |f| f.stat }.nlink.should == 1
    File.link(@file, @link)
    File.open(@file) { |f| f.stat }.nlink.should == 2
  end
end
