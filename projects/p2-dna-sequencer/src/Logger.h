#pragma once

#include <map>
#include <string>

namespace mesa
{
  /**
   * Defines the level of detail of a message.
   * 
   * Every message must define a single LogLevel.
   * The log level controls when the message is printed.
   * Messages equal to or grater in severity to the current log level are printed.
   */
  enum class LogLevel 
  {
    /** 
     * The most detailed log level.  Use for function parameter logging, return values, etc.
     */
    TRACE,
    /** 
     * A detailed log level.  Use for items you don't want to see logged often.
     */
    DEBUG,
    /** 
     * A general log level.  The default level.
     */
    INFO,
    /** 
     * Warnings.  Things that may impact correct output.
     */
    WARN,
    /** 
     * Errors.  Errors are unexpected and nearly always mean our results are incorrect.
     */
    ERROR,
    /** 
     * If we get this, we expect the program to exit prematurely.
     */
    FATAL,
    /**
     * Not an severity level, just something we *always* want to see in the log.
     */
    ALWAYS
  };

    
  /**
   * A simple console logger.
   * 
   */
  class Logger {
    public:
      /**
       * Create the default logger.
       */
      Logger() : _log_level{LogLevel::FATAL} {} 
      /**
       * Create a logger with a specific logging threshold.
       * @param log_level the desired minimum logging level.
       * @note 
       *   The supplied string must map to one of the supported log levels.
       *   See mesa::log_name and mesa::LogLevel
       */
      Logger(std::string log_level) 
      {
        level(log_level);
      } 

      /**
       * Change the logging threshold.
       * @param log_level the desired minimum logging level.
       */
      void level (const std::string& log_level);
      /**
       * Change the logging threshold.
       * @param log_level the desired minimum logging level.
       */
      void level (const LogLevel log_level) { _log_level = log_level;}
      /**
       * Get the logging threshold.
       * @return the system logging threshold.
       */
      LogLevel level () const {return _log_level;}
      /**
       * Log a message at a specified importance.
       * @param log_level the importance of this message.
       * @param message the text to log.
       */
      void at    (const LogLevel& log_level, const std::string& message) const;

      
    private:
      LogLevel     _log_level;    /**< The logging threshold. */
  };

  /**
   * Helper to return an instance of the one and only logger for this application.
   * @return the Logger
   */
  Logger& get_logger();

  /**
   * Allows the LogLevel enum class members to be printed with meaningful strings.
   * Example:
   *
   *     cout << "Level is " << level_to_string(LogLevel::FATAL) << endl;
   * @param log_level the LogLevel to be converted
   * @return the std::string representation of the LogLevel
   */
  const std::string& level_to_string(LogLevel log_level);


}


