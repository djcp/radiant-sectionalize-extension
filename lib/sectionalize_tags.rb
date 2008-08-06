module SectionalizeTags
    include Radiant::Taggable

    desc "Negotiate the section this page appears in by parsing the URL and applying some basic logic."
    tag "in_section" do |tag|
        if tag.locals.page.url == '/'
            return "home"
        end
        tag.locals.page.url.scan(/^\/([a-z0-9\-_]+)/).to_s
    end

end
