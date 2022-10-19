require '../lib/4_in_line.rb'

describe Game do
  describe "#win?" do
  
    context 'Checks for a win in a bottom-left to top-right Diagonal' do
      before do
        test_inputs = %w(A B C D B C B D C D D)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
        subject.draw_board
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






    context 'Checks for a win in a top-left to bottom-right Diagonal' do
      before do
        test_inputs = %w(B B B B C D C C A E A D)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
      end
      
      xit "checks for a diagonal win bottom-left to top-right " do
        expect(subject.win?('X')).to be(true)
      end
    end


  end
end


