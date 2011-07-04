module LotsHelper

  def owner_or_admin?(lot)
    return false if lot.nil?
    return true if current_user.try(:admin?) || lot.user_id == current_user.id
  end

end
