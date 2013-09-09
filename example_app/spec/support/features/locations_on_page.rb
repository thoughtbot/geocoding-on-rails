class LocationsOnPage
  ELEMENT_ID_REGEX = /_(\d+)/

  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def initialize
    visit root_path
  end

  def search(value)
    fill_in 'Search by Location', with: value
    click_on 'Search'
  end

  def suggested_search_value
    field_labeled('Search by Location')['placeholder']
  end

  def include?(location)
    locations.include? location
  end

  private

  def locations
    Location.where(id: location_ids)
  end

  def locations_element
    find('.locations')
  end

  def location_elements
    locations_element.all('li')
  end

  def location_ids
    location_elements.map { |node| node['id'][ELEMENT_ID_REGEX, 1] }
  end
end
