require 'swagger_helper'

RSpec.describe 'api/companies', type: :request do
  path '/companies' do

    get 'Retrieves all companies' do
      tags 'Companies'
      produces 'application/json'

      response '200', 'company found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            content: { type: :string }
          },
          required: [ 'id', 'title', 'content' ]

        let(:id) { Blog.create(title: 'foo', content: 'bar').id }
        run_test!
      end

      response '404', 'company not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end

    post 'Creates an company' do
      tags 'Companies'
      consumes 'application/json'
      parameter name: :company, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          company: { type: :integer },
          name: { type: :string },
          company: { type: :string },
          cbu: { type: :string },
          description: { type: :text },
          balance: { type: :decimal }
        },
        required: [ 'user_id', 'company', 'name', 'balance' ]
      }

      response '201', 'company created' do
        let(:company) { { user_id: 1, company: 1, name: 'Cuenta chica', balance: 0 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:company) { { user_id: nil } }
        run_test!
      end
    end
  end

  path '/company/id' do
    get 'Retrieves a company' do
      tags 'Companies'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'company found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            content: { type: :string }
          },
          required: [ 'id', 'title', 'content' ]

        let(:id) { Blog.create(title: 'foo', content: 'bar').id }
        run_test!
      end

      response '404', 'company not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end

    patch 'Updates an company' do
      tags 'Companies'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'company found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            content: { type: :string }
          },
          required: [ 'id', 'title', 'content' ]

        let(:id) { Blog.create(title: 'foo', content: 'bar').id }
        run_test!
      end

      response '404', 'company not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end

    delete 'Delete an company' do
      tags 'Companies'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'company found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            content: { type: :string }
          },
          required: [ 'id', 'title', 'content' ]

        let(:id) { Blog.create(title: 'foo', content: 'bar').id }
        run_test!
      end

      response '404', 'company not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end
