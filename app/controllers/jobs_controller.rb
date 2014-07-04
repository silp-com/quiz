class JobsController < ApplicationController

  def index                         
    @match_confirmation = MatchConfirmation.new                       
    @requirements = ['foo', 'bar', 'bla', 'blubb']
  end

end