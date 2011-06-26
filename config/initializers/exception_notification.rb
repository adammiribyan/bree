Bree::Application.config.middleware.use ExceptionNotifier,
    :email_prefix => "[exception] ",
    :sender_address => %{"notifier" <notifier@example.com>},
    :exception_recipients => %w{adam.miribyan@gmail.com}