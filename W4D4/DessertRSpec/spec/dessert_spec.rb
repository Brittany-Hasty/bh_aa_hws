require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { Chef.new("") }
  let(:dessert) {Dessert.new("", 0, chef)}

  describe "#initialize" do
    it "sets a type"
      chef.type = "sous chef"
      expect(chef.type).to eq("sous chef")
    it "sets a quantity"
      chef.quantity = 10
      expect(chef.quantity).to eq(10)
    it "starts ingredients as an empty array"
      expect(chef.ingredients).to eq([])
    it "raises an argument error when given a non-integer quantity"
      expect do
        chef.quantity = "a metric ton"
      end.to raise_error(ArgumentError)
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
      chef.add_ingredient("vanilla")
      expect(chef.ingredients).to eq(["vanilla"])
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
      chef.add_ingredient("vanilla")
      chef.add_ingredient("eggs")
      chef.add_ingredient("milk")
      chef.add_ingredient("heavy cream")
      chef.add_ingredient("sugar")
      chef.mix!
      expect(chef.ingredients).not_to eq(["vanilla", "eggs", "milk", "heavy cream", "sugar"])
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"
      chef.quantity = 10
      chef.eat(2)
      expect(chef.quantity).to eq(8)
    it "raises an error if the amount is greater than the quantity"
      expect do  
        chef.quantity = 10
        chef.eat(12)      
      end.to raise_error("not enough left!")
    end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
      chef.name = "boyardee"
      expect(chef.titleize).to eq("Chef Boyardee the Great Baker")
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
      chef.bake("Creme Brulee")
      expect(chef.temp).to eq(400)
  end
end
