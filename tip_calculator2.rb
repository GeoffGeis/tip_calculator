class TipCalc
  def initialize
    @meal, @tax, @tip = 10.00, 0.0825, 0.15
  end

  def meal_plus_tax
    @meal + @meal * @tax
  end

  def total
    meal_plus_tax + meal_plus_tax * @tip
  end

  def print_attributes
    puts "total cost of meal = #{@meal}"
    puts "total tax = #{@tax}"
    puts "total tip = #{@tip}"
  end

  def print_values
    print_attributes
    puts "total amount due: $%.2f\n" % total
  end

  def grab_user_values
    puts "Please input the meal cost 00.00"
    input = gets.chomp.to_f
    @meal = input
    puts "Please input the tax 0.0000"
    input = gets.chomp.to_f
    @tax = input
    puts "input tip 0.00"
    input = gets.chomp.to_f
    @tip = input
  end


  def random_tip
    puts "*rolls dice.. 0 <-> 30"
    output = [0.00, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09,
      0.10, 0.11, 0.12, 0.13, 0.14, 0.15, 0.16, 0.17, 0.18, 0.19, 0.20, 
      0.21, 0.22, 0.23, 0.24, 0.25, 0.26, 0.27, 0.28, 0.29, 0.30]
    random = output.sample
    puts "the meal was $%.2f\n" % meal_plus_tax
    puts "the tip is #{random}"
    puts "the total is $%.2f\n" % [meal_plus_tax + meal_plus_tax * random]
  end

  def end_interface
    puts "Shall we do a random tip? (y/n)?"
    input = gets.chomp.to_s.downcase
    while input != 'y' and input != 'n'
      puts "please enter 'y' or 'n'"
      input = gets.chomp.to_s.downcase
    end
    if input == 'y' 
      random_tip
    end
    if input == 'n'
      print_values
    end
  end
end

tip = TipCalc.new
tip.grab_user_values
tip.end_interface