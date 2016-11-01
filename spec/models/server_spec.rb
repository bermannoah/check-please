require 'rails_helper'

RSpec.describe Server, type: :model do
  describe 'validations' do
    context "invalid attributes" do
      it "cannot be created without a name" do
        server = Server.new(username: "test", password: "test")

        expect(server).to be_invalid
      end

      it "cannot be created without a username" do
        server = Server.new(name: "test", password: "test")

        expect(server).to be_invalid
      end

      it "cannot be created without a password" do
        server = Server.new(username: "test", name: "test")

        expect(server).to be_invalid
      end

      it "cannot be created without a unique username" do
        Server.create(name: "test",username:"test", password: "test")
        server = Server.new(name: "test", username: "test", password: "test")

        expect(server).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        server = Server.new(name: "test", username: "test", password: "test")

        expect(server).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many tables" do
      server = Server.new(name: "test", username: "test", password: "test")

      expect(server).to respond_to(:tables)
    end
  end
end
