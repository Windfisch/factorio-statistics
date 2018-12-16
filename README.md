# Factorio statistics tool

This will be a factorio statistics logger + viewer to analyze resource
consumption and buffer levels.

## Usage:

For now, find the `scripts_output` directory in the factorio installation
directory and run `tail -f script-output/outfile | nc <host> <port>`

Note that no output will be written unless you actually have some chests with
items in them.
