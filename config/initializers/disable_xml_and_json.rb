# Per https://groups.google.com/forum/?fromgroups=#!topic/rubyonrails-security/ZOdH5GH5jCU
ActionDispatch::ParamsParser::DEFAULT_PARSERS.delete(Mime::XML)
ActionDispatch::ParamsParser::DEFAULT_PARSERS.delete(Mime::JSON) 
