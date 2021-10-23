require 'singleton'

class Set6
  include Singleton

  attr_reader :units, :traits

  def initialize
    # TODO: read json and set up these attributes
    @units = []
    @traits = []
  end
end
