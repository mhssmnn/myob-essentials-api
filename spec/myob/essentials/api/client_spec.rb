require 'spec_helper'

describe Myob::Essentials::Api::Client do

  let(:consumer) { {key: 'key', secret: 'secret'} }
  let(:params) { {redirect_uri: 'redirect_uri', consumer: consumer, access_token: 'access_token', refresh_token: 'refresh_token'} }

  subject { Myob::Essentials::Api::Client.new(params) }

  describe ".get_access_code_url" do 
    it "generates the access code url" do
      expect(subject.get_access_code_url).to eql('https://secure.myob.com/oauth2/account/authorize?client_id=key&redirect_uri=redirect_uri&response_type=code&scope=la.global')
    end
  end

  describe ".get_access_token" do 
    let(:access_code) { '123' }

    before { Timecop.freeze(Time.parse("2015-01-01T00:00:00")) }
    after { Timecop.return }

    it "requests the access_token" do
      stub_request(:post, "https://secure.myob.com/oauth2/v1/authorize").
         to_return(:status => 200, :body => { 'access_token'=>'access_code','token_type'=>'bearer','expires_in'=>1200,'refresh_token'=>'refresh_token',
                                              'scope'=>'la.global','user'=>{'uid'=>'uid','username'=>'username'}}.to_json, 
                                   :headers => {"content-type"=>"application/json; charset=utf-8"})

      subject.get_access_token(access_code)
      expect(subject.access_token).to eql('access_code')
      expect(subject.refresh_token).to eql('refresh_token')
      expect(subject.expires_at).to eql((Time.now+1200).to_i)
    end
  end

  describe ".refresh!" do 
    before { Timecop.freeze(Time.parse("2015-01-01T00:00:00")) }
    after { Timecop.return }

    it "refreshes the access_token" do
      stub_request(:post, "https://secure.myob.com/oauth2/v1/authorize")
         .with(:body => {"client_id"=>"key", "client_secret"=>"secret", "grant_type"=>"refresh_token", "refresh_token"=>"refresh_token"},
               :headers => {'Content-Type'=>'application/x-www-form-urlencoded'})
         .to_return(:status => 200, :body => { 'access_token'=>'new_access_code','token_type'=>'bearer','expires_in'=>1200,'refresh_token'=>'new_refresh_token',
                                              'scope'=>'la.global','user'=>{'uid'=>'uid','username'=>'username'}}.to_json,
                                    :headers => {"content-type"=>"application/json; charset=utf-8"})

      subject.refresh!
      expect(subject.access_token).to eql('new_access_code')
      expect(subject.refresh_token).to eql('new_refresh_token')
      expect(subject.expires_at).to eql((Time.now+1200).to_i)
    end
  end

  describe ".connection" do 
    let (:expires_in) { 1200 }
    
    before { stub_request(:post, "https://secure.myob.com/oauth2/v1/authorize").
              to_return(:status => 200, :body => { 'access_token'=>'access_code','token_type'=>'bearer','expires_in'=>expires_in,'refresh_token'=>'refresh_token',
                                              'scope'=>'la.global','user'=>{'uid'=>'uid','username'=>'username'}}.to_json, 
                                        :headers => {"content-type"=>"application/json; charset=utf-8"}) }
    before { subject.get_access_token('access_code') }

    context "current token is valid" do
      it "returns the current access token" do
        expect(subject.connection).to be_a(OAuth2::AccessToken)
      end
    end

    context "current token is expired" do
      let (:expires_in) { -1200 }

      it "returns the current access token" do
        expect(subject).to receive(:refresh!)
        expect(subject.connection).to be_a(OAuth2::AccessToken)
      end
    end
  end
end
