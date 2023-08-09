class TicketGenerator
    def self.generate_and_print_housie
      # Initialize a 3x9 2d Array
      rows = 3
      columns = 9
      numbers = []
      grid = Array.new(rows) { Array.new(columns) }
  
      # Generate and sort 5 random numbers for each row.
      row = []
      row[0] = (1..9).to_a.sort{ rand() - 0.5 }[0..4].sort
      row[1] = (1..9).to_a.sort{ rand() - 0.5 }[0..4].sort
      row[2] = (1..9).to_a.sort{ rand() - 0.5 }[0..4].sort
      all_rows = (row[0] + row[1] + row[2]).sort 
  
      # Place the required number of numbers in the row
      1.upto(9) do |i|
        column_count = all_rows.count(i)
        lower_range = i == 1 ? 1 : (i - 1) * 10
        upper_range = (i * 10) - 1
        numbers = (lower_range..upper_range).to_a.sort{ rand() - 0.5 }[0..column_count].sort
  
        0.upto(2) do |j|
          if !row[j].include?(i)
            grid[j][i - 1] = "X" # Replace nil values with 'X'
          else
            grid[j][i - 1] = numbers.shift
          end
        end
      end
  
      # Print the generated random housie ticket.
      grid.each do |row|
        puts row.join("       ")
      end
    end
  end
  
  # Generate and print the random housie ticket in proper formate
  TicketGenerator.generate_and_print_housie
  