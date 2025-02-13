#!/bin/bash

# Create a shortcut for running SQL queries
alias Sqlq='sqlcmd -S localhost -U sa -P P@ssw0rd -d Northwind -Q'

# Save the alias permanently in my environment
echo "alias sqlq='sqlcmd -S localhost -U sa -P P@ssw0rd -d Northwind -Q'" >> ~/.bashrc