script.on_event(defines.events.on_tick, function (event)
	if event.tick % 60 == 0 then
		local sum = {}
		for _, surface in pairs(game.surfaces) do
			for _,ent in ipairs(surface.find_entities_filtered{type="container"}) do
				for item, count in pairs(ent.get_inventory(defines.inventory.chest).get_contents()) do
					sum[item] = (sum[item] or 0) + count
				end
			end
		end

		for item, count in pairs(sum) do
			write_file("{'message_type' : 'container_update', 'container_type' : 'chest', 'timestamp' : "..(event.tick/60.0)..", 'item' : '"..item.."', 'count' : "..count.." }")
		end
	end
end);

function write_file(str)
	game.write_file("outfile", str.."\n", true)
	print(str)
end

function dump_statistics()
	for name, force in pairs(game.forces) do
		print("name")
		for item, array in pairs(force.item_production_statistics.input_counts) do
			dump_array(item, array)
		end
		for item, array in pairs(force.item_production_statistics.output_counts) do
			dump_array(item, array)
		end
	end
end

function dump_array(what, arr)
	print(what.." -> "..arr)
end
