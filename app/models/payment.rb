class Payment < ApplicationRecord
  belongs_to :booking

  def receipt
    Receipts::Receipt.new(
      id: id,
      product: "Resource Name",
      company: {
        name: "DespacitoBooking, Inc.",
        address: "Al. Grunwaldzka 103A\n80-244 Gdańsk\nPoland",
        email: "hello@netguru.co",
        logo: Rails.root.join("app/assets/images/netguru-logo.png")
      },
      line_items: [
        ["Date",           created_at.to_s],
        ["Account Billed", "#{user.name} (#{user.email})"],
        ["Product",        "Resource Name"],
        ["Amount",         "$#{amount / 100}.00"],
        ["Charged to",     "#{card_type} (**** **** **** #{card_last4})"],
        ["Transaction ID", uuid]
      ],
      font: {
        bold: Rails.root.join('app/assets/fonts/tradegothic/TradeGothic-Bold.ttf'),
        normal: Rails.root.join('app/assets/fonts/tradegothic/TradeGothic.ttf'),
      }
    )
  end
end
