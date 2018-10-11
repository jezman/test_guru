class TestsController < ApplicationController
  def index
    render plain: Test.all.inspect
  end
end
