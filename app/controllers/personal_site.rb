require 'rack'

class PersonalSite
  def self.call(env)
    case env["PATH_INFO"]
    when '/' then index
    when '/about' then about
    else
      error
    end
  end

  def self.index
    render_view('index')
  end

  def self.error
    render_view('error', '404')
  end

  def self.about
    render_view('about')
  end

  def self.render_view(page, code = '200')
    [code, {'Content-Type' => 'text/html'}, [File.read("./app/views/#{page}.html")]]
  end
end
