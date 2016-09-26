#include <cctype>
#include <iostream>
#include <string>

#include "Logger.h"

namespace mesa {

  void Logger::level (const std::string& log_level)
  {
    switch (toupper(log_level[0])) {
      case 'T':
        _log_level = LogLevel::TRACE;
        break;
      case 'D':
        _log_level = LogLevel::DEBUG;
        break;
      case 'I':
        _log_level = LogLevel::INFO;
        break;
      case 'W':
        _log_level = LogLevel::WARN;
        break;
      case 'E':
        _log_level = LogLevel::ERROR;
        break;
      case 'F':
        _log_level = LogLevel::FATAL;
        break;
      case 'A':
        _log_level = LogLevel::ALWAYS;
        break;
      default:
        _log_level = LogLevel::INFO;
        break;
    }
  }

  void Logger::at (const LogLevel& log_level, const std::string& message) const
  {
    if (_log_level <= log_level) {
      std::cerr << level_to_string(log_level) << ":\t" << message << std::endl;
    }
  }

  const std::string& level_to_string(LogLevel log_level)
  {
    std::map<LogLevel, const std::string> log_name = {
      {LogLevel::TRACE,  "TRACE"},
      {LogLevel::DEBUG,  "DEBUG"},
      {LogLevel::INFO,   "INFO"},
      {LogLevel::WARN,   "WARN"},
      {LogLevel::ERROR,  "ERROR"},
      {LogLevel::FATAL,  "FATAL"},
      {LogLevel::ALWAYS, "ALWAYS"}
    };
    return log_name[log_level];
  }


  Logger& get_logger() {
    static Logger log;
    return log;
  }



}
