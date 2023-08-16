#########################################
# Utility Functions

# # Create a new git repo with one README commit and CD into it
function gitnr
  mkdir $argv[1]; cd $argv[1]; git init; touch README; git add README; git commit -mFirst-commit;
end

# Create a new directory and enter it
function mkd
  mkdir -p $argv && cd $argv;
end


function weather
  curl wttr.in/$argv[1]
end

function ipinfo
  curl ipinfo.io/$argv[1]
end
