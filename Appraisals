[6.0, 6.1, 7.0, 7.2, 8.0].each do |ver|
  appraise "rails-#{ver}" do
    gem "rails", "~> #{ver}.0"
  end
end

appraise "rails-edge" do
  gem "rails", github: "rails/rails", branch: "main"
end
