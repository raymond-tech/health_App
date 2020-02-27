require 'test_helper'

class AuthenticationTest < Minitest::Test
  describe 'authentication' do
    before do
      auth_stub

      stub_request(:post, File.join(ChangeHealth.configuration.api_endpoint, ChangeHealth::Authentication::AUTH_ENDPOINT))
        .with(body: { client_id: 'wrong', client_secret: ChangeHealth.configuration.client_secret, grant_type: ChangeHealth.configuration.grant_type })
        .to_return(status: 401, body: 'Invalid request')

      @change_health_auth = ChangeHealth::Authentication.new
      @config = ChangeHealth.configuration.to_h
    end

    after do
      ChangeHealth.configuration.from_h(@config)
    end

    describe 'authentication' do
      it 'calls change_health endpoint' do
        @change_health_auth.authenticate
        assert_requested(@auth_stub, times: 1)
      end

      it 'makes no calls when token wont expire inside padding time' do
        @change_health_auth.authenticate
        @change_health_auth.authenticate

        assert_requested(@auth_stub, times: 1)

        assert_equal('let.me.in', @change_health_auth.access_token)
      end

      it 'fails with a resonable exception and with nil response' do
        @change_health_auth.expire!

        key = ChangeHealth.configuration.client_id
        ChangeHealth.configuration.client_id = 'wrong'

        error = assert_raises(ChangeHealth::ChangeHealthException) { @change_health_auth.authenticate }

        ChangeHealth.configuration.client_id = key

        assert_match(/Failed Authenticat/, error.message)
        assert_match(/HTTP code: 401/, error.message)
        assert_match(/MSG: Invalid request/, error.message)
        assert_nil(@change_health_auth.response)
      end
    end

    describe 'responses' do
      before do
        @change_health_auth.authenticate
      end

      it 'has an access token' do
        assert_equal('let.me.in', @change_health_auth.access_token)
      end

      it 'can create the auth header' do
        assert_equal('let.me.in', @change_health_auth.access_token)
      end
    end

    describe '#expires?' do
      before do
        @change_health_auth.authenticate
      end

      it 'is true when token is too close to expire padding' do
        assert(@change_health_auth.expires?(3600))
      end

      it 'is false when token is far enough from expire' do
        assert_equal(false, @change_health_auth.expires?(0))
      end
    end
  end
end