require '../lib/4_in_line.rb'

describe Game do
  describe "#create_board" do
    it "creates a board" do 
      expect(subject.create_board).to eql([[nil, nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil]])
    end

    it "total number of rows" do
      expect(subject.create_board.count).to eql(6)
    end

    it "total number of columns" do
      expect(subject.create_board.all? { |arr| arr.count == 7 }).to eql(true)
    end

    it "total number of elements" do
      expect(subject.create_board.flatten.count).to eql(42)
    end
  end

  describe "#place_marker" do
    subject { Game.new }

    it "checks that the markers goes all the way down until it hits bottom" do
      subject.place_marker('A','X')
      expect(subject.board).to eq([["X", nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil]])
    end

    it "checks that the markers goes all the way down until it hits another marker" do
      subject.place_marker('A','X')
      subject.place_marker('A','X')
      expect(subject.board).to eq([["X", nil, nil, nil, nil, nil, nil],
                                          ["X", nil, nil, nil, nil, nil, nil],
                                          [nil, nil, nil, nil, nil, nil, nil],
                                          [nil, nil, nil, nil, nil, nil, nil],
                                          [nil, nil, nil, nil, nil, nil, nil],
                                          [nil, nil, nil, nil, nil, nil, nil]])
    end

    it "checks that the markers goes all the way down until it hits another marker" do
      2.times {subject.place_marker('A','X')}
      subject.place_marker('E','X')
      expect(subject.board).to eq([["X", nil, nil, nil, "X", nil, nil],
                                           ["X", nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil],
                                           [nil, nil, nil, nil, nil, nil, nil]])
    end
  end

  describe '#column_letter_to_array_index' do

    it "checks that the column A is correctly change in to number 1" do
      expect(subject.column_letter_to_array_index('A')).to eql(0)
    end

    it "checks that the column F is correctly change in to number 6" do
        expect(subject.column_letter_to_array_index('F')).to eql(5)
    end

    it "checks that the column C is correctly change in to number 3" do
      expect(subject.column_letter_to_array_index('C')).not_to eql(3)
    end

    it "checks that the column G is correctly change in to number 7" do
      expect(subject.column_letter_to_array_index('G')).to eql(6)
    end
  end
  
  describe '#user_input_verifier' do 

    it 'Accepts A as an input' do
      expect(subject.user_input_verifier('A')).to be true
    end

    it 'Accepts C as an input' do
      expect(subject.user_input_verifier('C')).to be true
    end

    it 'Accepts G as an input' do
      expect(subject.user_input_verifier('G')).to be true
    end

    it "Doesn't accepts numbers H as an input" do
      expect(subject.user_input_verifier('H')).to be false
    end

    it "Doesn't accepts numbers Z as an input" do
      expect(subject.user_input_verifier('Z')).to be false
    end

    it "Doesn't accepts numbers as an input" do
      expect(subject.user_input_verifier('1')).to be false
    end

    it "Doesn't accepts more than one character as an input" do
      expect(subject.user_input_verifier('ABC')).to be false
    end

    it "Doesn't accept more than one character as an input" do
      expect(subject.user_input_verifier('1234')).to be false
    end
  end

  describe '#column_full?' do 

    it  "Checks if the theres space in the column" do
      expect(subject.column_full?('A')).to be true
    end

    it  "Checks if the theres space in the column" do
      # im filling the column with this line, cause the placing is not ready and function will depend on this one.
      (0..5).each {|i| subject.board[i][0] = 'X'} 
      expect(subject.column_full?('A')).to be false
    end

    it "Checks if the theres space in the column" do
      (0..4).each {|i| subject.board[5-i][1] = 'X'}
      expect(subject.column_full?('A')).to be true
    end
  end

  describe "#last_move" do
    subject { Game.new }

    context "It should return the an array with the [row, column] after 3 inputs" do 
      before do
        test_inputs = %w(A B A)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
      end

      it "check for the position of the last input" do
        expect(subject.last_move).to eql([1, 0])
      end
    end

    context "It should return the an array with the [column, row] after 4 inputs" do 
      before do
        test_inputs = %w(A B A B)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
      end

      it "check for the position of the last input" do
        expect(subject.last_move).to eql([1, 1])
      end
    end

    context "It should return the an array with the [column, row] after 9 inputs" do 

      before do
        test_inputs = %w(A B C D B C B D C D)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
      end

      it "check for the position of the last input" do
        expect(subject.last_move).to eql([2, 3])
      end
    end

    context "It should return the an array with the [column, row] after 10 inputs" do 

      before do
        test_inputs = %w(A B C D B C B D C D E)
        for index in 0...test_inputs.length do
          index.even? ? (subject.place_marker(test_inputs[index], 'X')) : (subject.place_marker(test_inputs[index], '0')) 
        end
      end
      it "check for the position of the last input" do
        expect(subject.last_move).to eql([0, 4])
      end
    end
  end

end

