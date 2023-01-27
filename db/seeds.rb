samples = [
  { name: 'りんご', number:2222, content:'daksodkaokfoakaodpsoa'},
  { name: 'いちご', number:2333, content:'daksodkdsadsaaokfoakaodpsoa'},
  { name: 'みかん', number:4444, content:'daksasaodkaokfoakaodpsoa'},
]
ActiveRecord::Base.transaction do
    samples.each do |sample|
    Sample.create!(samples)
  end
end