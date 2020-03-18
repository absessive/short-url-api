# frozen_string_literal: true

Rails.application.routes.draw do
  mount Api::Base, at: '/'
end
