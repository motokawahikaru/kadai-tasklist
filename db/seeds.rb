(1..100).each do |number|
  Task.create(content: 'test content ' + number.to_s, status: 'test st' + number.to_s)
end