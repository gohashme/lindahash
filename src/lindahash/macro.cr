macro mainRenderer(filename)
  render "src/views/#{{{filename}}}.ecr", "src/views/layouts/layout.ecr"
end