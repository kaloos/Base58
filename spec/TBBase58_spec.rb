require 'TBBase58'

RSpec.describe 'A Base58 address' do
  before :each do
      @tb_base58 = TBBase58.new("00010966776006953D5567439E5E39F86A0D273BEED61967F6")
      @bytes_out = @tb_base58.encode()
  end
  it 'should return its official expected value' do
      expect(@bytes_out).to eq("bSLesHPiFV9jKNeNbUiMyZGJm45zVSB8bSdogLWCmvs88wxHjEQituLz5daEGCrHE7R7")
  end
end

[
%w(73696d706c792061206c6f6e6720737472696e67 3k5chY7JdxKd2h2Koa3By1VVGPjVVHzf1sNrgs1AgApePbYSEqSgjDp),
%w(00eb15231dfceb60925886b67d065299925915aeb172c06647 bSNc36hJPpVtpHkcuwnXh5v7yuj7bZsK4UzqzvwmQcGzuDyDm1p7MkDjCChSFon1m46i),
%w(e 2k)
].each do |a,b|
  describe "Given input #{a}, check its Base58 matches #{b}" do
    it "check they generate the same" do
      tb_base58 = TBBase58.new(a)
      bytes_out = tb_base58.encode()
      expect(bytes_out).to eq(b)
    end
  end
end
