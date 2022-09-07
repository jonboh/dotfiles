require( dap-python ).setup(os.getenv( XDG_CONFIG_HOME ) ..  ../.virtualenvs/debugpy/bin/python ) -- assuming HOME is the parent to XDG_CONFIG_HOME
table.insert(require( dap ).configurations.python, {
  type =  python ,
  request =  launch ,
  name =  My custom launch configuration ,
  program =  ${file} ,
  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})

