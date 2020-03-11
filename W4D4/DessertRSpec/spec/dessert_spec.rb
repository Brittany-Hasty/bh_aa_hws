require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:dessert) {Dessert.new("brulee", 10, Chef.new("chef"))}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("brulee")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end
    
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end
    
    it "raises an argument error when given a non-integer quantity" do
      expect {dessert.quantity = "a metric ton"}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("vanilla")
      expect(dessert.ingredients).to eq(["vanilla"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("vanilla")
      dessert.add_ingredient("eggs")
      dessert.add_ingredient("milk")
      dessert.add_ingredient("heavy cream")
      dessert.add_ingredient("sugar")
      dessert.mix!
      expect(dessert.ingredients).not_to eq(["vanilla", "eggs", "milk", "heavy cream", "sugar"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.quantity = 10
      dessert.eat(2)
      expect(dessert.quantity).to eq(8)
    end

    it "raises an error if the amount is greater than the quantity" do
      dessert.quantity = 10
      expect{dessert.eat(12)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      dessert.name = "boyardee"
      expect(chef.titleize).to eq("dessert Boyardee the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's dessert with the dessert passed in" do
      chef.bake(dessert)
      expect(dessert.temp).to eq(400)
    end
  end
end