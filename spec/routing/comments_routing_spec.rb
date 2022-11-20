# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/comments/1').to route_to('comments#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/comments').to route_to('comments#create')
    end

    it 'routes to #ratings' do
      expect(get: '/comments/1/ratings').to route_to('comments#ratings', id: '1')
    end
  end
end
