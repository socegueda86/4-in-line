require './lib/4_in_line.rb'

describe Game do
  describe "#create_board" do
    it "creates board" do 
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

    xit "checks that the markers goes all the way down until it hits bottom" do
        expect(subject.place_marker('A','X')).to eql([[nil, nil, nil, nil, nil, nil, nil],
                                                      [nil, nil, nil, nil, nil, nil, nil],
                                                      [nil, nil, nil, nil, nil, nil, nil],
                                                      [nil, nil, nil, nil, nil, nil, nil],
                                                      [nil, nil, nil, nil, nil, nil, nil],
                                                      ['X', nil, nil, nil, nil, nil, nil]])
    end

    xit "checks that the markers goes all the way down until it hits another marker" do
      subject.place_marker('A','X')
      expect(subject.place_marker('A','X')).to eql([[nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil],
                                                    ['X', nil, nil, nil, nil, nil, nil],
                                                    ['X', nil, nil, nil, nil, nil, nil]])
    end

    xit "checks that the markers goes all the way down until it hits another marker" do
#2.tiomes {subject.place_marker('A', 'X')}  probably i should try to erase this, lets check if the subject its accumulating the markers or if every test its a new start
      expect(subject.place_marker('E', 'X')).to eql([[nil, nil, nil, nil, nil, nil, nil],
                                                     [nil, nil, nil, nil, nil, nil, nil],
                                                     [nil, nil, nil, nil, nil, nil, nil],
                                                     [nil, nil, nil, nil, nil, nil, nil],
                                                     ['X', nil, nil, nil, nil, nil, nil],
                                                     ['X', nil, nil, nil, 'X', nil, nil]])
    end
  end

  describe '#column_letter_to_number' do

    it "checks that the column A is correctly change in to number 1" do
      expect(subject.column_letter_to_number('A')).to eql(1)
    end

    it "checks that the column F is correctly change in to number 6" do
        expect(subject.column_letter_to_number('F')).to eql(6)
    end

    it "checks that the column C is correctly change in to number 3" do
      expect(subject.column_letter_to_number('C')).to eql(3)
    end

    it "checks that the column G is correctly change in to number 7" do
      expect(subject.column_letter_to_number('G')).to eql(7)
    end
  end
  
  describe '#user_input_verifier' do 

    it 'Accepts A as an inpunt' do
      expect(subject.user_input_verifier('A')).to be true
    end

    it 'Accepts C as an inpunt' do
      expect(subject.user_input_verifier('C')).to be true
    end

    it 'Accepts G as an inpunt' do
      expect(subject.user_input_verifier('G')).to be true
    end

    it "Doesn't accepts numbers H as an inpunt" do
      expect(subject.user_input_verifier('H')).to be false
    end

    it "Doesn't accepts numbers Z as an inpunt" do
      expect(subject.user_input_verifier('Z')).to be false
    end

    it "Doesn't accepts numbers as an inpunt" do
      expect(subject.user_input_verifier('1')).to be false
    end

    it "Doesn't accepts more than one character as an inpunt" do
      expect(subject.user_input_verifier('ABC')).to be false
    end

    it "Doesn't accepts more than one character as an inpunt" do
      expect(subject.user_input_verifier('1234')).to be false
    end
  end

  describe '#is_space_in_column' do 

    it  "Checks if the theres space in the column" do
      expect(subject.is_space_in_column('A')).to be true
    end

    it  "Checks if the theres space in the column" do
      # im filling the column with this line, cause the placing is not ready and function will depend on this one.
      (0..5).each {|i| subject.board[i][1] = 'X'} 
      expect(subject.is_space_in_column('A')).to be false
    end

    it "Checks if the theres space in the column" do
      (0..4).each {|i| subject.board[5-i][1] = 'X'}
      expect(subject.is_space_in_column('A')).to be true
    end

  end
end
