class Copy < ApplicationRecord
  belongs_to :owner, foreign_key: "user_id",class_name: "User"
  belongs_to :edition
  belongs_to :format

  validates :edition, presence: true
  validates :owner, presence: true
  validate :url_valid?, if: 'url.present?'


  def url_valid?
    copy_url = URI(url) rescue false
    errors.add(:url, "not a valid URL") unless (copy_url.kind_of?(URI::HTTP) || copy_url.kind_of?(URI::HTTPS))
  end 

  def available?
    Loan.where(copy_id: id, status_code: 1).empty?
  end

  def requested?(current_user)
    Loan.where(borrower: current_user, copy_id: id, status_code: 0).exists?
  end

  def loan_pending?
    Loan.where(copy_id: id, status_code: 0).exists?
  end

  def borrowed?
    Loan.where(copy_id: id, status_code: 1).exists?
  end
  
  def current_loan
    Loan.find_by(copy_id: id, status_code: 1)
  end

  def self.csv_export
    attributes = %w{id user_id acquisition_date url edition_id format_id}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |copy|
        csv << attributes.map { |attr| copy.send(attr)}
      end
    end
  end

  def full_record
    copy_info = {acquisition_date: acquisition_date, url: url}
    edition = Edition.find(self.edition_id)
    publisher = Publisher.find(edition.publisher_id)
    work = Work.find(edition.work_id)
    author = Author.find(work.author_id)
    format = Format.find(format_id)

    copy_info[:publication_year] = edition.publication_year
    copy_info[:isbn10] = edition.isbn10
    copy_info[:isbn13] = edition.isbn13
    copy_info[:publisher] = publisher.name
    copy_info[:work] = work.title
    copy_info[:author] = author.name

    copy_info
  end

end
