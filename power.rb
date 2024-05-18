module Math
  def Addition(num1, num2)
    result_add = num1.to_i + num2.to_i
    puts " #{num1} plus #{num2} is equal to #{result_add}"
    return result_add


  end
  def Subtraction(num1, num2)
    result_sub = num1.to_i - num2.to_i
    puts " #{num1} minus #{num2} is equal to #{result_sub}"
    return result_sub
  end


  def Multiplication(num1, num2)
    result_mul = num1.to_i * num2.to_i
    puts " #{num1} times #{num2} is equal to #{result_mul}"
    return result_mul
  end


  def Division(num1, num2)
    result_div = num1.to_i / num2.to_i
    puts " #{num1} divided by #{num2} is equal to #{result_div}"
    return result_div
  end

  def Exponent(num1, num2)
    result_exp = 1
    num2.times do
      result_exp = result_exp * num1.to_i
    end
    puts" #{num1} to the power of #{num2} is equal to #{result_exp}"
    return result_exp
    

  end

end


