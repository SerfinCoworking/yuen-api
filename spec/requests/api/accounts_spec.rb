require 'swagger_helper'

RSpec.describe 'api/accounts', type: :request do
  path '/accounts' do

    get 'Retrieves all accounts' do
      tags 'Accounts'
      produces 'application/json'

      response '200', 'account found' do
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

      response '404', 'account not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end

    post 'Creates an account' do
      tags 'Accounts'
      consumes 'application/json'
      parameter name: :account, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          account_type_id: { type: :integer },
          name: { type: :string },
          account_alias: { type: :string },
          cbu: { type: :string },
          description: { type: :text },
          balance: { type: :decimal }
        },
        required: [ 'user_id', 'account_type_id', 'name', 'balance' ]
      }

      response '201', 'account created' do
        let(:account) { { user_id: 1, account_type_id: 1, name: 'Cuenta chica', balance: 0 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:account) { { user_id: nil } }
        run_test!
      end
    end
  end

  path '/accounts/id' do
    get 'Retrieves a account' do
      tags 'Accounts'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'account found' do
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

      response '404', 'account not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end

    patch 'Updates an account' do
      tags 'Accounts'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'account found' do
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

      response '404', 'account not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end

    delete 'Delete an account' do
      tags 'Accounts'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'account found' do
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

      response '404', 'account not found' do
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
