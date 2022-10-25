# Script Runner test script
cmd("CFS EXAMPLE")
wait_check("CFS STATUS BOOL == 'FALSE'", 5)
