class NoHtmlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.to_s == ActionController::Base.helpers.strip_tags(value.to_s)
      record.errors[attribute] << 'can not contain HTML, use BBCode instead.'
    end
  end
end

class Exercise < ActiveRecord::Base
  include ActiveModel::Validations

  has_many :exams_exercises
  has_many :exams, :through => :exams_exercises

  validates_numericality_of :points, greater_than_or_equal_to: 0
  validates :question, :presence => true, :no_html => true
  validates :answer, :no_html => true
  validates :criteria, :no_html => true

  def to_html(string)
    string.to_s.bbcode_to_html_with_formatting({}, false, :enable,
                                               :bold, :italics, :underline, :strikeout, :size, :color,
                                               :code, :quote,
                                               :orderedlist, :unorderedlist, :listitem, :definelist, :defineterm, :definition,
                                               :latex)
  end
end

module BBRuby
  @@tags = @@tags.merge({
      'Latex' => [
          /\[latex(:.+)?\](.*?)\[\/latex\1?\]/mi,
          '<img src="http://chart.apis.google.com/chart?cht=tx&chl=\2"/>',
          'A LaTeX snippet from Google Graphs',
          '[latex]\LaTeX[/latex]',
          :latex
      ]
  })
end