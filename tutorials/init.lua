-- This is a initial scripts for loading modules at startup
--
-- You can save your modules as files on NodeMCU, and add 
-- "load_module" entries below.
--

function load_module(mod_name)
    local a = loadfile(mod_name)
    if a then
        print('module loaded: '..mod_name)
        return a()
    end
end

load_module('sys.lua')
load_module('file_system.lua')