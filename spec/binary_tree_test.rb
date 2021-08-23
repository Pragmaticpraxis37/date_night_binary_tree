require './lib/binary_tree'
require './lib/node'

describe 'binary tree' do
  it 'creates a binary search tree object' do
    tree = BinarySearchTree.new

    expect(tree.class).to eq(BinarySearchTree)
  end

  it 'can insert a rating and title into a node' do
    tree = BinarySearchTree.new

    expect(tree.insert(61, "Bill & Ted's Excellent Adventure")).to eq(0)
    expect(tree.insert(16, "Johnny English")).to eq(1)
    expect(tree.insert(92, "Sharknado 3")).to eq(1)
    expect(tree.insert(50, "Hannibal Buress: Animal Furnace")).to eq(2)
  end

  it 'can verify whether or not a score exists in the tree' do
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expect(tree.include?(16)).to eq(true)
    expect(tree.include?(72)).to eq(false)
    expect(tree.include?(50)).to eq(true)
  end

  it 'can provide the depth of a given score, if it exists' do
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expect(tree.depth_of(92)).to eq(1)
    expect(tree.depth_of(50)).to eq(2)
    expect(tree.depth_of(61)).to eq(0)
    expect(tree.depth_of(72)).to eq(nil)
  end

  it 'can return the maximum score with title' do
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expect(tree.max).to eq({'Sharknado 3' => 92})
  end

  it 'can return the minimum score with title' do
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expect(tree.min).to eq({'Johnny English' => 16})
  end

  it 'can return an array of movies and scores in ascending order' do
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    result = [{"Johnny English"=>16},
              {"Hannibal Buress: Animal Furnace"=>50},
              {"Bill & Ted's Excellent Adventure"=>61},
              {"Sharknado 3"=>92}]

    expect(tree.sort).to eq(result)
  end

  xit 'can return the value of all nodes at a particular depth in the tree' do
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    expect(tree.health(0)).to eq([[98, 7, 100]])
    expect(tree.health(1)).to eq([[58, 6, 85]])
    expect(tree.health(2)).to eq([[36, 2, 28], [93, 3, 42]])
  end
end
