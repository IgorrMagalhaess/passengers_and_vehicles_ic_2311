class Park
   attr_reader :name,
               :admission_price,
               :vehicles_entered_park,
               :passengers_entered_park,
               :revenue
   
   def initialize(name, admission_price)
      @name = name
      @admission_price = admission_price
      @vehicles_entered_park = []
      @passengers_entered_park = []
      @revenue = 0
   end

   def add_vehicle(vehicle)
      @vehicles_entered_park.push(vehicle)
      add_passenger_to_park(vehicle)
      add_revenue(vehicle)
      @vehicles_entered_park
   end

   def add_passenger_to_park(vehicle)
      vehicle.passengers.each do |passenger| 
         @passengers_entered_park.push(passenger)
      end
   end

   def add_revenue(vehicle)
      vehicle.passengers.each do |passenger| 
         passenger.adult? ? @revenue += @admission_price : @revenue
      end
   end

   def patrons
      {
         "Adults" => adults_entered_park,
         "Minors" => minors_entered_park
      }
   end

   def minors_entered_park
      minors = @passengers_entered_park.select do |passenger| 
         !passenger.adult?
      end
      minors_sorted = minors.map{ |minors| minors.name}.sort.uniq
   end

   def adults_entered_park
      @passengers_entered_park.select(&:adult?).map(&:name).sort.uniq
   end
end