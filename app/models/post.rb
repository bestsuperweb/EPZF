require "render_anywhere"

class Post < ApplicationRecord
	include RenderAnywhere

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def to_pdf
		dir = File.dirname("#{Rails.root}/public/download/posts/##{self.id}/#{self.title}.pdf")
		FileUtils.mkdir_p(dir) unless File.directory?(dir)
		kit = PDFKit.new(as_html, page_size: 'A4')
		kit.to_file("#{Rails.root}/public/download/posts/##{self.id}/#{self.title}.pdf")
	end

	private
	def as_html
		render template: "posts/pdf", layout: "application", locals: { post: self }		
	end
end
