require 'spec_helper'

describe CsvIterator, '#parse' do
  it 'parses each row' do
    data = <<-EOF.strip_heredoc
      header_1,header_2,header_3
      01,02,03
      04,05,06
      07,08,09
      10,11,12
      13,14,15
      16,17,18
      19,20,21
    EOF

    header_1_values = []
    header_2_values = []
    header_3_values = []
    rows_processed = CsvIterator.new(data).parse do |row|
      header_1_values << row[:header_1].to_i
      header_2_values << row[:header_2].to_i
      header_3_values << row[:header_3].to_i
    end

    expect(header_1_values).to match_array [1, 4, 7, 10, 13, 16, 19]
    expect(header_2_values).to match_array [2, 5, 8, 11, 14, 17, 20]
    expect(header_3_values).to match_array [3, 6, 9, 12, 15, 18, 21]
    expect(rows_processed).to eq 7
  end
end
