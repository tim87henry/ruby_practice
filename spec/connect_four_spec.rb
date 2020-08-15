require './connect_four'
describe "#connect_four" do
   it "First row horizontal" do
      c=ConnectFour.new
      c.board[5][0]="\u2605".encode('utf-8')
      c.board[5][1]="\u2605".encode('utf-8')
      c.board[5][2]="\u2605".encode('utf-8')
      c.board[5][3]="\u2605".encode('utf-8')
      expect(c.game_not_over?).to eql(false)
   end

   it "Third column vertical" do
      c=ConnectFour.new
      c.board[4][2]="\u2605".encode('utf-8')
      c.board[3][2]="\u2605".encode('utf-8')
      c.board[2][2]="\u2605".encode('utf-8')
      c.board[1][2]="\u2605".encode('utf-8')
      expect(c.game_not_over?).to eql(false)
   end

   it "Diagonal pattern" do
      c=ConnectFour.new
      c.board[4][1]="\u2605".encode('utf-8')
      c.board[3][2]="\u2605".encode('utf-8')
      c.board[2][3]="\u2605".encode('utf-8')
      c.board[1][4]="\u2605".encode('utf-8')
      expect(c.game_not_over?).to eql(false)
   end

   it "Negative scenario" do
      c=ConnectFour.new
      c.board[4][1]="\u2606".encode('utf-8')
      c.board[3][2]="\u2605".encode('utf-8')
      c.board[2][3]="\u2605".encode('utf-8')
      c.board[1][4]="\u2605".encode('utf-8')
      expect(c.game_not_over?).to eql(true)
   end


end

