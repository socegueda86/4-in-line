require '../lib/4_in_line.rb'

describe Game do
  describe "#win?" do

    context 'Checks for a win in a bottom-left to top-right Diagonal' do
      before do
        test_inputs = %w(A B C D B C B D C D D)
        for index in 0...test_inputs.length do
          index.even? ? ( subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0') ) 
        end
      end

      it "checks for a diagonal win bottom-left to top-right " do
        expect(subject.win?('X')).to be(true)
      end
    end

    context 'Checks for a win in a bottom-left to top-right Diagonal' do
      before do
        test_inputs = %w(A B B C C D E D C D D)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0'))  
        end
      end

      it "checks for a diagonal win bottom-left to top-right starting and row 0 column 0" do
        expect(subject.win?('X')).to be(true)
      end
    end
  
    context 'Checks for win? not_to be true in a bottom-left to top-right Diagonal' do
      before do
        test_inputs = %w(E F G E F G G)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
      end

      it "checks for a diagonal win bottom-left to top-right " do
        expect(subject.win?('X')).not_to be(true)
      end
    end

    context 'Checks for win? not_to be true in a bottom-left to top-right Diagonal with only 3 online marks' do
      before do
        test_inputs = %w(C D E F D E E)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
      end

      it "checks for a diagonal win bottom-left to top-right " do
        expect(subject.win?('X')).not_to be(true)
      end
    end

    context 'Checks for a win in a top-left to bottom-right Diagonal' do
      before do
        test_inputs = %w(B B B B C D C C A E A D)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
      end

      it "checks for a diagonal win top-left to bottom-right " do
        expect(subject.win?('0')).to be(true)
      end
    end

    context 'Checks for a win in a top-left to bottom-right Diagonal' do
      before do
        test_inputs = %w(B B B B C D C C A E A D)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
      end

      it "checks for a diagonal win top-left to bottom-right " do
        expect(subject.win?('0')).to be(true)
      end
    end

    context 'Checks for a vertical win from row-1 to row-4' do
      before do
        test_inputs = %w(B A B A B A B)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
      end

      it "checks for a vetrtical win " do
        expect(subject.win?('X')).to be(true)
      end
    end

   # context 'Checks for a vertical win from row-3 to row-6' do
   #   before do
   #     test_inputs = %w(B A B A B A B)
   #     for index in 0...test_inputs.length do
   #       index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
   #     end
   #   end
#
   #   it "checks for a vetrtical win " do
   #     expect(subject.win?('X')).to be(true)
   #   end
   # end

    context 'Checks for not_to win? from row-1 to row-4' do
      before do
        test_inputs = %w(B A B A B A C)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
      end

      it "checks for a vetrtical win " do
        expect(subject.win?('X')).not_to be(true)
      end
    end


    context 'Checks for a horizontal win on row 1' do
      before do
        test_inputs = %w(A A B B C C D)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
      end

      it "checks for a horizontal win " do
        expect(subject.win?('X')).to be(true)
      end
    end

#    context 'Checks for a horizontal win on row 5' do
#      before do
##        test_inputs = %w(A A B B B C C D)
#        for index in 0...test_inputs.length do
#          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
#        end
#      end
#
#      it "checks for a horizontal win eoth '0' mark " do
#        expect(subject.win?('0')).to be(true)
#      end
#
#    end


  end
end


