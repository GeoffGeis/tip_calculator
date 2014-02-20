class TipCalc
  def initialize
    @meal, @tax, @tip = 10.00, 0, 0
  end 
    
  def calculate_rate(base, percentage)
    amount = base * percentage / 100
    return amount
  end

  def print_values
    @tip = Float(@tip)
    meal_plus_tax = @meal + calculate_rate(@meal, @tax)
    total = meal_plus_tax + calculate_rate(meal_plus_tax, @tip)
    puts "cost of meal #{@meal}"
    puts "tax #{@tax}"
    puts "tip #{@tip}"
    puts "total amount due: $%.2f\n" % total
  end

  def grab_user_values
    puts "Please input the meal cost 00.00"
    @meal = Float(gets)
    puts "Please input the tax 0"
    @tax = Float(gets)
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
       puts "input tip 0"
       @tip = Float(gets)
    end
  end

  def random_tip
    puts "*rolls dice.. 0 <-> 30"
    output = (0..30).map { |i| i }
    @tip = output.sample
  end
end

tip = TipCalc.new
tip.grab_user_values
tip.print_values