require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    constantize(@class_name)
  end

  def table_name
    underscore("#{@class_name}s")
  end

  # def self.change_string(name)
  #   define method(name) do |string|
  #      ActiveSupport::Inflector.send(name, string)
  #   end
  # end
  #
  # [:singularize, :pluralize, :camelize, :underscore, :constantize].each do |method|
  #   AssocOptions.send(method)
  # end

  def singularize(name)
    ActiveSupport::Inflector.singularize(name)
  end

  def pluralize(name)
    ActiveSupport::Inflector.pluralize(name)
  end

  def camelize(name)
    ActiveSupport::Inflector.camelize(name)
  end

  def underscore(name)
    ActiveSupport::Inflector.underscore(name)
  end

  def constantize(name)
    ActiveSupport::Inflector.constantize(name)
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @foreign_key = (options[:foreign_key] || "#{name}_id".to_sym)
    @primary_key = (options[:primary_key] || :id)
    @class_name = (options[:class_name] || camelize(singularize(name)))
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @foreign_key = (options[:foreign_key] || "#{underscore(self_class_name)}_id".to_sym)
    @primary_key = (options[:primary_key] || :id)
    @class_name = (options[:class_name] || camelize(singularize(name)))
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)

    define_method(access_association) do
      f_key = options.send(:foreign_key)
      options.send(:model_class).find(f_key).first
    end
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, options)

    define_method(access_association) do
      f_key = options.send(:foreign_key)
      options.send(:model_class).find(f_key).first
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
