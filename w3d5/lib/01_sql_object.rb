require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @columns.nil?
      result = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{table_name}
      SQL

      @columns = result.first.map { |column| column.to_sym }
    else
      @columns
    end
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) do
        self.attributes["#{column}".to_sym]
      end

      define_method("#{column}=") do |value|
        self.attributes["#{column}".to_sym] = value
      end

    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= ActiveSupport::Inflector.tableize(self.to_s)
  end

  def self.all
    rows = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{table_name}
    SQL

    parse_all(rows)
  end

  def self.parse_all(results)
    return_array = []
    results.each do |hash|
      return_array << self.new(hash)
    end
    return_array
  end

  def self.find(id)
    obj = DBConnection.execute(<<-SQL, id)
      SELECT *
      FROM #{table_name}
      WHERE id = ?
    SQL

    if obj.empty?
      nil
    else
      self.new(obj.first)
    end
  end

  def initialize(params = {})
    params.keys.each do |attr_name|
      unless self.class.columns.include?(attr_name.to_sym)
        raise "unknown attribute '#{attr_name}'"
      end

      self.send("#{attr_name}=".to_sym, params[attr_name])
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |col|
      self.send(col.to_sym)
    end
  end

  def insert
    col_names = self.class.columns[1..-1].join(", ")
    question_marks = ( ["?"] * (self.class.columns.length-1)).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values[1..-1])
      INSERT INTO #{self.class.table_name} (#{col_names})
      VALUES (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_line = self.class.columns[1..-1].map do |col|
      "#{col} = ?"
    end.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values[1..-1], attribute_values[0])
      UPDATE #{self.class.table_name}
      SET #{set_line}
      WHERE id = ?
    SQL
  end

  def save
    if self.id.nil?
      self.insert
    else
      self.update
    end
  end
end
