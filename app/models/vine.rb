require 'open-uri'
require 'uri'
require 'nokogiri'

class Vine < Couchbase::Model
  after_save :extract_video_url

  belongs_to :user

  attribute :title
  attribute :vine_url
  attribute :video_url

  #Voting API
  attribute :score, :default => 1

  validates_presence_of :title, :vine_url

  view :all, :limit => 10, :descending => true

  private

  def extract_video_url
    doc = Nokogiri(open(vine_url).read)
    self.video_url = doc.css("source").first["src"]
    save_without_callbacks
  end

end
