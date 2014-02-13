BooksEakr::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books, except: [:new, :edit]
    end
  end
  scope :api do
    scope :v1 do
      resources :books
    end
  end
end