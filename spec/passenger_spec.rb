require './lib/passenger'

RSpec.describe do
   describe '#initialize' do
      it 'can initialize' do
         passenger = Passenger.new({"name" => "Charlie", "age" => 18})
         expect(passenger).to be_a Passenger
      end

      it 'has a name' do
         passenger = Passenger.new({"name" => "Charlie", "age" => 18})
         expect(passenger.name).to eq "Charlie"
      end

      it 'has a age' do
         passenger = Passenger.new({"name" => "Charlie", "age" => 18})
         expect(passenger.age).to eq 18
      end
   end
end