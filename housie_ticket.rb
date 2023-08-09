class HousieTicketGenerator
    def self.generate_ticket
      # Initialize a 3x9 2d Array with 'X' (empty spots)
      ticket = Array.new(3) { Array.new(9, 'X') }
  
      # Generating the  column ranges for numbers in each column
      column_ranges = (0..8).map { |col| (col * 10 + 1)..(col * 10 + 10) }.to_a
  
      # looping each row of ticket
      3.times do |row|
        # Shuffle the column indices to randomly picking columns
        available_columns = (0..8).to_a.shuffle
        num_numbers = 5  # no.of numbers to be placed in each row
  
        # Place the required number of numbers in the row
        num_numbers.times do
          col = available_columns.pop  # Take a column index from the shuffled list
          col_range = column_ranges[col]  # Get the column range for numbers
          num = col_range.reject { |num| ticket.any? { |ticket_row| ticket_row[col] == num } }.sort.first || col_range.max
          # ^ Find a number that is not present in the same column of previous rows or use the largest available if necessary
          ticket[row][col] = num  # Place the number in the ticket
        end
      end
  
      puts "------------------------"  
  
      # Print the ticket rows with proper formatting
      ticket.each { |row| puts row.map { |num| num.to_s.rjust(2) }.join(" ") }
  
      puts "------------------------"  
    end
  end
  
  # Call the generate_ticket method of HousieTicketGenerator class to generate and print a ticket
  HousieTicketGenerator.generate_ticket
  