class Block::Receive < ApiAction
  # Retrieves the balance of the current user per currency.
  # Balance represents summarized values of IOUs.
  post "/block" do
    pp! params

    return json(200)
  end

  get "/block" do
    return json({message: "YEP"})
  end
end
