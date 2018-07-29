tags = [
  # id, name
  [1, 'Book'   ],
  [2, 'Fantasy'],
  [3, 'Novel'  ],
  [4, 'Sci-Fi' ],
  [5, 'Japan'  ]
]
tags.each do |id, name|
  Tag.find_or_initialize_by(id: id).tap do |t|
    t.name = name
    t.save
  end
end


products = [
  # id, name, price, tag_ids
  [1, 'Fatemarked', 13.21, [1]],
  [2, 'The Blackout Boxset: EMP Post Apocalyptic Fiction', 98.00, [4]],
  [3, 'Is it wrong to Try to Pick Up Girls in a Dungeon?, Vol.1', 10.29, [1, 2, 3, 5]],
  [4, 'The saga of Tanya the Evil, Vol.1', 12.60, [1, 2, 3, 4, 5]],
]
products.each do |id, name, price, tag_ids|
  Product.find_or_initialize_by(id: id).tap do |t|
    t.name = name
    t.price = price
    t.tag_ids = tag_ids
    t.save
  end
end
