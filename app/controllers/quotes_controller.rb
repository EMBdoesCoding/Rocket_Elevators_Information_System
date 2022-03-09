class QuotesController < ApplicationController
  def create
    q = Quote.new
    q.department = 'goblble'
    q.save
  end
end
