module SharedMethods
  def create_verify_status
    self.build_verify_status.save
  end

  def edit_verify_status
    self.verify_status.reapply!
  end
end
