class JsonValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
      record.errors[attribute] << (options[:message] || "not in json format") unless JSON.is_json?(value)
  end
end