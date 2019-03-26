class SendResultsService

  def initialize(umbrella_id)
    @umbrella_id = umbrella_id
  end

  def call
    umbrella = Umbrella.find(@umbrella_id)

    # Return because result already sent when all frineds answeard
    return if umbrella.friends.all? { |f| f.answear.present? } && umbrella.days_to_end.zero?
    UmbrellaMailer.send_results(umbrella).deliver_now
  end
end