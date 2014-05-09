class TipCalc
  def calculate_rate(base, percentage)
    amount = base * percentage / 100
    return amount
  end

  def print_values
    3.times do
      print "/";sleep(0.1);print "\b";print "-";sleep(0.1);print "\b";
      print "\\";sleep(0.1);print "\b";print "|";sleep(0.1);print "\b"
    end
    meal_plus_tax = @meal + calculate_rate(@meal, @tax)
    total = meal_plus_tax + calculate_rate(meal_plus_tax, @tip)
    puts "cost of meal $#{@meal}"
    puts "tax #{@tax.to_i}%"
    puts "tip #{@tip.to_i}%"
    puts "total amount due: $%.2f\n" % total
    gets
  end

  def grab_user_values
    puts "Please input the meal cost $0.00"
    @meal = gets.chomp.to_f
    puts "Please input the tax 0%"
    @tax = gets.chomp.to_f
    puts "Would you like to give a random tip? (y/n)"
    input = gets.chomp.to_s.downcase
    while input != 'y' and input != 'n'
      puts "please enter 'y' or 'n'"
      input = gets.chomp.to_s.downcase
    end
    if input == 'y'
      random_tip
    end
    if input == 'n'
       puts "input tip 0%"
      @tip = gets.chomp.to_f
    end
  end

  def random_tip
    output = (0..30).map { |i| i }
    @tip = output.sample.to_f
  end
end

tip_object = TipCalc.new
tip_object.grab_user_values
tip_object.print_values