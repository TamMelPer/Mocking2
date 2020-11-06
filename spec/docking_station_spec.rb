require 'docking_station'
# class MockWorkingBike
#   def working?
#     true
#   end
# end
#
# class MockBrokenBike
#   def working?
#     false
#   end
# end
describe DockingStation do


  describe '#working_bike_count' do
    context '1 working bike' do
      it "returns 1" do
        mockworkingbike = double('the mock working bike', working?: true)
        bikes = []
        bikes << mockworkingbike
        docking_station = DockingStation.new(bikes)
        #allow(mockworkingbike).to receive(:working?).and_return true
        expect(docking_station.working_bike_count).to eq(1)
      end
    end

    context '1 working bike, 1 broken bike' do
      it "returns 1" do
        mockworkingbike = double('the mock working bike', working?: true)
        mockbrokenbike = double('the mock broken bike', working?: false)
        bikes = []
        bikes << mockworkingbike
        bikes << mockbrokenbike
        docking_station = DockingStation.new(bikes)
        expect(docking_station.working_bike_count).to eq(1)
      end
    end
  end

  describe '#random_bike_working?' do
    context 'random bike is working' do
      it 'returns true' do
        mockworkingbike = double('the mock working bike', working?: true)
        mockbrokenbike = double('the mock broken bike', working?: false)
        bikes = []
        bikes << mockworkingbike
        bikes << mockbrokenbike
        docking_station = DockingStation.new(bikes)
        allow(bikes).to receive(:sample).and_return mockworkingbike
        #allow_any_instance_of(Array).to receive(:sample).and_return mockworkingbike
        expect(docking_station.random_bike_working?).to eq(true)
      end
    end

    context 'random bike is broken' do
      it 'returns false' do
        mockworkingbike = double('the mock working bike', working?: true)
        mockbrokenbike = double('the mock broken bike', working?: false)
        bikes = []
        bikes << mockworkingbike
        bikes << mockbrokenbike
        docking_station = DockingStation.new(bikes)
        allow(bikes).to receive(:sample).and_return mockbrokenbike
        expect(docking_station.random_bike_working?).to eq(false)
      end
    end
  end
end
