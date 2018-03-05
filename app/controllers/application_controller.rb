require "simply_paginate"
require "addressable/template"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include SimplyPaginate
  include Addressable
end
