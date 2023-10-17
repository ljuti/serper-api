# frozen_string_literal: true

RSpec.describe Serper::Api do
  it "has a version number" do
    expect(Serper::Api.gem_version).not_to be nil
  end
end
