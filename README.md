# Introduction
This project is going to hold the Minimig project running on the QMTech Artix-7A100T Core board, with the Open AARS V3.0/2.0 board.

A few patterns and the deFEEST logo are shown via de HDMI output, to test the FPGA -> ADV7511 -> HDMI display pipeline.

Please make sure to initialize the adv7511 via the ESP32, because the FPGA code does not include code initialize the ADV7511.

# Making changes to this project

Please make sure to read the [Vivado\_setup](https://github.com/jhallen/vivado\_setup) document before making changes to the project.

Most important to take away from the document above is to **NOT** have source/ip/constraint files inside the Vivado project.

# (Re)build the Vivado project from TCL

```bash
rm -rf project_1
# vivado -source rebuild.tcl
```

After this the project XPR file can be found in the project_1 directory.

# Generate the project script

When Vivado is open, enter the following into the 'TCL console'.

```tcl
write_project_tcl <project_path>/rebuild.tcl
```

This step should be done before checking changes to the project into Git, to make sure the project can be recreated correctly.

# Information about the project setup

[Original repo](https://github.com/jhallen/vivado\_setup)


