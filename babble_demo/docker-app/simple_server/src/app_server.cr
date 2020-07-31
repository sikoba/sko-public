class AppServer < Lucky::BaseAppServer
  # Learn about middleware with HTTP::Handlers:
  # https://luckyframework.org/guides/http-and-routing/http-handlers
  def middleware : Array(HTTP::Handler)
    [
      Lucky::ForceSSLHandler.new,
      Lucky::HttpMethodOverrideHandler.new,
      Lucky::LogHandler.new,
      Lucky::ErrorHandler.new(action: Errors::Show),
      Lucky::RemoteIpHandler.new,
      Lucky::RouteHandler.new,

      # Disabled in API mode:
      # Lucky::StaticCompressionHandler.new("./public", file_ext: "gz", content_encoding: "gzip"),
      # Lucky::StaticFileHandler.new("./public", fallthrough: false, directory_listing: false),
      Lucky::RouteNotFoundHandler.new,
    ] of HTTP::Handler
  end

  def base_uri
    "http://#{host}:#{port}"
  end

  def host
    ENV.fetch("HOST")
  end

  def port
    ENV.fetch("PORT_NUMBER").to_i
  end

  def protocol
    "http"
  end

  def listen
    # Learn about bind_tcp: https://tinyurl.com/bind-tcp-docs
    server.bind_tcp(host, port, reuse_port: false)
    server.listen
  end
end
