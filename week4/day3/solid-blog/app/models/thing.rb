class Thing

  attr_accessor :title,
                :author,
                :body,
                :image,
                :id,
                :created_at

  def initialize(title, author, body, image, id)
    @title = title
    @author = author
    @body = body
    @image = image
    @id = id
    @created_at = 2.days.ago
  end

  def self.all
    # First time through, @posts is nil.
    # So, it assigns.
    # Next time, it's defined, so it returns the array
    # of five things.
    @posts ||= 5.times.map do |num|
      Thing.new(
        Faker::Book.title,
        Faker::Superhero.name,
        Faker::Lorem.paragraphs(6).join("\n\n"),
        Faker::Placeholdit.image,
        num
      )
    end
  end

  def self.sorted
    all.sort_by{|thing| thing.created_at}
  end


end
