ActiveList
==========

ActiveList is a simple list management tool. It permits to create a controller 
method and view helper to easy use and display lists in various formats.

Install in Rails >= 3.1
-----------------------

In app/assets/stylesheets/application.css adds:

  *= require list

In app/assets/javascripts/application.js adds:
  //= require list.jquery


Use in Rails
------------

The simple way to use it is to writre in our controller:
  
  class PeopleController < ApplicationController
    list

    def index
    end
  end

And in the view app/views/people/index.html.erb:
  <%=list-%>

More options
------------
Columns are configurables.
