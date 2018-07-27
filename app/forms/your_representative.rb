class YourRepresentative < BaseForm
  attribute :have_representative, :boolean

  def to_h
    { have_representative: have_representative }
  end
end
