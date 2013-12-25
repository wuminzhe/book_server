module Admin::StudentsHelper
  def klasses_for_select
    result = []
    klasses = Klass.all
    klasses.each do |klass|
      result << [klass.name, klass.id]
    end
    result
  end

  
end
