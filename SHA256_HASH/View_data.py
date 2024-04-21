# import json
# from pyDigitalWaveTools.vcd.parser import VcdParser
# fname = "/Users/abhraneelsaha/Desktop/VLSI_PROJ/SHA256_HASH/Hash.vcd"
# output_filename = "View_data.json"
# with open(fname) as vcd_file:
#     vcd = VcdParser()
#     vcd.parse(vcd_file)
#     data = vcd.scope.toJson()
#
# with open(output_filename, "w") as outfile:
#     json.dump(data, outfile, indent=4, sort_keys=True)
#
# print(f"JSON data saved to: {output_filename}")

from sootty import WireTrace, Visualizer, Style
from sootty.utils import evcd2vcd

# Create wiretrace object from vcd file:
wiretrace = WireTrace.from_vcd_file("/Users/abhraneelsaha/Desktop/VLSI_PROJ/SHA256_HASH/Hash.vcd")

# Convert wiretrace to svg:
image = Visualizer(Style.Dark).to_svg(wiretrace, start=0, length=8)

# Display to stdout:
image.display()