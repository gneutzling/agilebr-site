$stdout.sync = true

use Rack::Static,
  :urls => ["/stylesheets", "/javascripts", "/images", "/fonts"],
  :root => "."

run lambda { |env|
  status = 404
  content = ["File not found (Error 404)..."]
  headers = {
    'Content-Type' => 'text/html',
    'Cache-Control' => 'public, max-age=86400'
  }
  file = env['REQUEST_PATH'].gsub(%r(^/), '')
  file = "index.html" if file.empty?

  if File.exists?(file)
    status = 200
    content = File.open(file, File::RDONLY)
  elsif file == 'pull-origin'
    %x(echo "`date -R` - IP: #{env["REMOTE_ADDR"]}" >> git.log)
    message = %x(git pull origin master)
    %x(echo "#{message}" >> git.log)
    status = 200
    content = ["Git-Pull realizado com sucesso.<br /><br />Mensagem de retorno: <br />#{message}"]
  end

  [ status, headers, content ]
}
