class HousieTicketGenerator
  def self.generate_ticket
    ticket = Array.new(3) { Array.new(9, 'X') }  # Initialize a 3x9 ticket with 'X' (empty spots)

    9.times do |col|
      num_elements = rand(0..3)  # Determine the number of elements for the current column (including empty spots)
      column_range = (col * 10 + 1)..(col * 10 + 10)  # Calculate the range of numbers for the current column(for all 9 colums one by one)
      numbers = column_range.to_a.sample(num_elements)  # Randomly select numbers for the column
      numbers.each_with_index { |num, row| ticket[row][col] = num }  # Place the numbers in the corresponding cells
    end

    puts "------------------------"  # Print a separator line

    ticket.each { |row| puts row.map { |num| num.to_s.rjust(2) }.join(" ") }  # Print the ticket rows with proper formatting

    puts "------------------------"  # Print a separator line
  end
end

HousieTicketGenerator.generate_ticket  # Generate and print a Housie ticket
