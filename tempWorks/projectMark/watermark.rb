require 'combine_pdf'

# load the logo as a pdf page
company_logo = CombinePDF.load("watermark.pdf").pages[0]

# load the content file
pdf = CombinePDF.load "report.pdf"

# inject the logo to each page in the content
pdf.pages.each {|page| page << company_logo}

# save to a new file, with the logo.
pdf.save "reportmark.pdf"

