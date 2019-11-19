class StaticPagesController < ApplicationController
  def home; end

  def room; end
  def about_us
  		render "about_us";
   end
   def term_condition
  		render "term_condition";
   end
   def privacy_policy
  		render "privacy_policy";
   end
   def room
  		render "room";
   end
end
