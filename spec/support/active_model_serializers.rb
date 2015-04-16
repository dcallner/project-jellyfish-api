module ActiveModelSerializers
  def serialize(object)
    if object.is_a?(Array)
      serialize_array(object)
    else
      serializer(object).new(object).to_json(root: false)
    end
  end

  private

  def serialize_array(array)
    ActiveModel::ArraySerializer.new(
      array,
      each_serializer: serializer(array.first)
    ).to_json(root: false)
  end

  def serializer(object)
    "#{object.class.name}Serializer".constantize
  end
end