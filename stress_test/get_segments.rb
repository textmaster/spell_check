# run in a texmaster rails console and copy the output to post.lua

lines_to_print = []
languages = [
  ['fr-fr', 'fr'],
  ['en-us', 'en-US'],
  ['en-gb', 'en-GB'],
  ['es-es', 'es'],
  ['de-de', 'de-DE'],
]

languages.each do |lang|
  doc = Document.segmented.completed.translation.language_from(lang.first).random.first
  doc.segments.each do |segment|
    txt = segment.source_text.gsub("\n", ' ').squeeze(' ')
    lines_to_print << "{ l = \"#{lang.second}\", t = \"#{txt}\" },"
  end
end

File.open('sources.txt', 'w+') do |f|
  f.puts(lines_to_print)
end
