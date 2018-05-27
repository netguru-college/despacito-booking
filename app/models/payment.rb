class Payment < ApplicationRecord
  belongs_to :booking

  def receipt
    Receipts::Receipt.new(
      id: id,
      product: "#{booking.resource.name}",
      company: {
        name: "DespacitoBooking, Inc.",
        address: "Al. Grunwaldzka 103A\n80-244 Gdansk\nPoland",
        email: "hello@netguru.co",
        logo: Rails.root.join("app/assets/images/netguru-logo.png")
      },
      line_items: [
        ["Date",           created_at.to_s],
        ["Account Billed", "#{booking.user.email}"],
        ["Product",        "#{booking.resource.name}"],
        ["Amount",         "$#{amount}"],
        ["Charged to",     "(**** **** **** #{Faker::Number.number(4)})"],
      ]
    )
  end
end
