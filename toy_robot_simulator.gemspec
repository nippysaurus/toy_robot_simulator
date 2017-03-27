Gem::Specification.new do |gem|
  gem.name = "toy_robot_simulator"
  gem.version = "0.0.0"
  gem.authors = ["Michael Dawson"]
  gem.licenses = ["Nonstandard"]
  gem.email = "nippysaurus@gmail.com"
  gem.homepage = "https://github.com/nippysaurus/toy_robot_simulator"
  gem.summary = "Simulate the movement of a toy robot on a flat surface."
  gem.description = ""
  gem.require_paths = ["lib"]
  gem.files = [ 
    "lib/toy_robot_simulator.rb",
    "lib/bounded_planar_surface_world.rb",
    "lib/instruction.rb",
    "lib/position.rb",
    "lib/robot_controller.rb",
    "lib/simple_robot.rb"
  ]
  gem.bindir = "bin"
  gem.executables = ["toy_robot_simulator"]
  gem.required_ruby_version = "> 2"
  gem.add_development_dependency "rspec", "~> 3.5.0"
end
