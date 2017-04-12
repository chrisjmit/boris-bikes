require "../lib/docking_station.rb"
require "../lib/bike.rb"

describe DockingStation do

    it { is_expected.to respond_to :release_bike }

    it { is_expected.to respond_to(:dock).with(1).argument }

    #it { is_expected.to respond_to(:bikes) }

    it "docks something" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

      describe "#release_bike" do
        it "should return an error if no bikes available" do
          expect { subject.release_bike}.to raise_error "No bikes available"
        end
      end

      describe "#dock" do
        it "raises an error when full" do
           subject.capacity.times { subject.dock Bike.new }
          expect { subject.dock Bike.new }.to raise_error "Docking station full"
        end
      end

    it "has a default capacity" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    describe 'initialization' do
      subject { DockingStation.new }
      let(:bike) { Bike.new }
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          subject.dock(bike)
        end
        expect { subject.dock(bike) }.to raise_error 'Docking station full'
      end
    end

    # it "should return the number of broken bikes" do
    #   subject = Bike.new
    #   expect(subject.broken Bike.new).to eq "Broken bikes"
    # end
end
