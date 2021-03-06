require "spec_helper"

describe Mongoid::Criterion::Marshalable do

  describe "Marshal.dump" do

    let(:criteria) do
      Band.where(name: "Depeche Mode")
    end

    it "does not error" do
      expect {
        Marshal.dump(criteria)
      }.not_to raise_error
    end
  end

  describe "Marshal.load" do

    let(:criteria) do
      Band.where(name: "Depeche Mode")
    end

    it "loads the proper attributes" do
      Marshal.load(Marshal.dump(criteria)).should eq(criteria)
    end
  end
end
