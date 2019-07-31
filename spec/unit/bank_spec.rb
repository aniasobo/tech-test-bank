require 'bank'
require 'date_helper'

# RSpec.describe Bank do

# mock object

fake_object = Object.new
fake_object.define_singleton_method(:some_method) { |returned_value| false }

another_fake_object = Object.new
another_fake_object.define_singleton_method(:do_stuff) { |value| value == "some value" }

# mock objects get passed as arguments replacing dependency injections where required
