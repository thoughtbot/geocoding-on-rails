require 'csv'

class CsvIterator
  def self.iterate(file, &block)
    new(File.read(file)).parse(&block)
  end

  def initialize(text)
    @text = text
  end

  def parse(&block)
    CSV.parse(@text, headers: true) do |row|
      progress_bar.increment
      block.call row.to_hash.with_indifferent_access
    end

    number_of_rows
  end

  private

  def number_of_rows
    @text.split("\n").length - 1
  end

  def progress_bar
    @progress_bar ||= ProgressBar.create(title: 'Rows', total: number_of_rows)
  end
end
