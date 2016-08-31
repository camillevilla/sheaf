class Students < ActiveRecord::Base

  def generate_password(grade_level)
    # query the appropriate database for the grade level spelling words
    # concatenate a random word from the list, 
    #     plus a random 2-digit number, 
    #     plus another random word from the list
    # r = Random.new
    random_num = rand(10...99)
    
  end

end
