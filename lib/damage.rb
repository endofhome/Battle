class Damage

  def self.random
    [5,10,15,20,25,30].sample
  end

  def self.sleep
    [true,true,false].sample
  end
end