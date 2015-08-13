require 'testanything/stream'

describe Testanything::Stream do
  before do
    @output = StringIO.new
    @stream = Testanything::Stream.new @output
  end

  describe "a run of 6 tests" do
    before do
      @stream.plan 5

      @stream.start "with incidental output" do
        @stream.stdout << "this is some output that happened during the test run"
        @stream.stderr << "this is some warning text that happened"
      end

      @stream.start "fails by throwing an exception" do
        fail "boom!"
      end

      @stream.start "fails explicitly"

      @stream.start "succeeds, but also contains metadata"

      @stream.start "begins with a digit"

      # a test with directives


      # a skipped test

      # a TODO test

      # contains
    end
    it "formats the stream accordingly" do
      expect(@output.string).to eql <<-EOF
TAP version 13
1..6
ok 1 a test with incidental output
 ---
 stdout: "this is some output that happened during the test run"
 stderr: "this is some warning text that happened"
not ok 2 a test that fails by throwing an exception
 ---
 message: "boom!"

EOF
    end

    describe "running the second test which fails by throwing an exception" do
      before do
        @stream.start
      end

    end
    describe "running the second test that explicitly fails" do

    end
  end
end
