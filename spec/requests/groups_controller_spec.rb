# frozen_string_literal: true

RSpec.describe GroupsController do
  fab!(:user)
  fab!(:admin)
  fab!(:group) { Fabricate(:group, users: [user]) }

  let(:ip_blocks_list) { "198.51.100.0/24" }

  before do
    enable_current_plugin
    group.custom_fields["ip_blocks_list"] = ip_blocks_list
    group.save_custom_fields
  end

  describe "#show" do
    it "redacts IP blocks from ordinary group viewers" do
      sign_in(user)

      get "/groups/#{group.name}.json"

      expect(response.status).to eq(200)
      expect(response.parsed_body["group"]["custom_fields"]).to be_blank
      expect(response.body).not_to include(ip_blocks_list)

      sign_in(admin)

      get "/groups/#{group.name}.json"

      expect(response.status).to eq(200)
      expect(response.parsed_body["group"]["custom_fields"]).to eq(
        "ip_blocks_list" => ip_blocks_list,
      )
    end
  end
end
