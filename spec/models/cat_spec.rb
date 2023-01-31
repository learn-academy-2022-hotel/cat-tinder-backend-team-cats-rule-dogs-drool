require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate that a cat cannot be created without a name" do
    cat = Cat.create(
        age: 3,
        enjoys: 'sleeping',
        image: 'https://live.staticflickr.com/3587/3471300822_c0b9996897_b.jpg'
    )
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate that a cat cannot be created without an age" do
    cat = Cat.create(
        name: 'Steven',
        enjoys: 'sleeping',
        image: 'https://live.staticflickr.com/3587/3471300822_c0b9996897_b.jpg'
    )
    expect(cat.errors[:age]).to_not be_empty
  end  

  it "should validate that a cat cannot be created without an enjoys section" do
    cat = Cat.create(
        name: 'Steven',
        age: 3,
        image: 'https://live.staticflickr.com/3587/3471300822_c0b9996897_b.jpg'
    )
    expect(cat.errors[:enjoys]).to_not be_empty
  end  
  
  it "should validate that a cat cannot be created without an image" do
    cat = Cat.create(
        name: 'Steven',
        age: 3,
        enjoys: 'sleeping'
    )
    expect(cat.errors[:image]).to_not be_empty
  end  

  it "should validate that a cat cannot be created if the enjoys entry is less than 10 characters long" do
    cat = Cat.create(
        name: 'Steven',
        age: 3,
        enjoys: 'sleeping',
        image: 'https://live.staticflickr.com/3587/3471300822_c0b9996897_b.jpg'
    )
    expect(cat.errors[:enjoys]).to_not be_empty
  end  
end
