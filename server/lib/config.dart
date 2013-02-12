part of terrestra;

/**
 * Config class for the *.json files in config folder
 * @TODO split possibility for several different configfiles
 * 
 */
class Config {
  
  Map systemConfig;
  
  /**
   * Initialize a new Config instance
   * 
   */
  Config() {
    try{
      var config = new File('config/system.json');
  
      //reads the whole file with UTF8 encoding
      String readIn = config.readAsStringSync(Encoding.UTF_8);
    

      //parses the String to JSON Map
      this.systemConfig = parse(readIn);
  
      
      // Put the whole file in a single string.
      config.readAsString(Encoding.UTF_8).then((String contents) {
        print('The entire file is ${contents.length} characters long');
      });
      
      // Put each line of the file into its own string.
      config.readAsLines(Encoding.UTF_8).then((List<String> lines) {
        print('The entire file is ${lines.length} lines long');
      });
    
    }catch(e) {
      print("something went wrong whilest reading in the config file");
    }
  }
  
  /**
   * Getter for the systemConfig JSON Map
   * 
   * @return Map systemConfig 
   */
  Map getConfig(){
    
    return this.systemConfig;
    
  }
}

