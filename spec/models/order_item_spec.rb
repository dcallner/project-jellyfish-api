# == Schema Information
#
# Table name: order_items
#
#  id                      :integer          not null, primary key
#  order_id                :integer
#  cloud_id                :integer
#  product_id              :integer
#  service_id              :integer
#  provision_status        :integer
#  created_at              :datetime
#  updated_at              :datetime
#  deleted_at              :datetime
#  project_id              :integer
#  miq_id                  :integer
#  uuid                    :uuid
#  setup_price             :decimal(10, 4)   default(0.0)
#  hourly_price            :decimal(10, 4)   default(0.0)
#  monthly_price           :decimal(10, 4)   default(0.0)
#  payload_request         :jsonb
#  payload_acknowledgement :jsonb
#  payload_response        :jsonb
#  status_msg              :string
#
# Indexes
#
#  index_order_items_on_cloud_id    (cloud_id)
#  index_order_items_on_deleted_at  (deleted_at)
#  index_order_items_on_miq_id      (miq_id)
#  index_order_items_on_order_id    (order_id)
#  index_order_items_on_product_id  (product_id)
#  index_order_items_on_service_id  (service_id)
#

describe OrderItem do
  it 'instructs its provisioner to provision', type: :integration do
    allow(NullProvisioner).to receive(:delay).and_return(NullProvisioner)
    allow(NullProvisioner).to receive(:provision)

    id = create(:order_item, product: create(:product, product_type: 'null')).id

    expect(NullProvisioner).to have_received(:delay).with(queue: 'provision_request')
    expect(NullProvisioner).to have_received(:provision).with(id)
  end
end
