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

  
end