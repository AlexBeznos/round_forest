RSpec.shared_context 'controller' do
  let(:status)      { response.status }
  let(:body)        { response.body }
  let(:parsed_body) { JSON.parse(body) }
  let(:data)        { parsed_body['data'] }
end
