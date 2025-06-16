# Multiplier Comparison: Wallace Tree vs Booth's Algorithm (FPGA Implementation)

This project presents a comparative study between two 16-bit multipliers — **Wallace Tree Multiplier** and **Booth's Multiplier**, both designed in Verilog and implemented on the **Xilinx Artix-7 FPGA** using Vivado. The work was conducted under the guidance of *Prof. Janakiraman Viraraghavan* as part of the IIT Madras Summer Fellowship Programme (May 2025). The idea was to explore real-world multiplier trade-offs for small-scale embedded arithmetic cores. Prof. Janakiraman was exploring optimization paths for datapaths in energy-aware designs, and this helped support that evaluation by giving concrete FPGA data.


## Objective

To compare the two multipliers based on:
- Power consumption
- Timing delay
- Area (LUT/FF usage)

## 📊 Post-Implementation Comparison

| Metric                    | Wallace Tree    | Booth's Multiplier |
|--------------------------|-----------------|---------------------|
| Power (Total on-chip)    | 0.108 W         | 0.137 W             |
| Critical Path Delay      | 4.786 ns        | 5.172 ns            |
| Max Frequency            | 208.99 MHz      | 193.28 MHz          |
| LUTs                     | 356             | 57                  |
| Flip-Flops               | 234             | 88                  |
| WNS                      | 5.202 ns        | 4.817 ns            |
| WHS                      | 0.076 ns        | 0.144 ns            |

---

## Conclusion

- **Wallace Tree** offers higher speed due to parallelism but uses significantly more resources.
- **Booth's Multiplier** is compact and efficient in area, better for low-power embedded cores.


## Design Details

- ### Wallace Tree Design and Analysis
    - Schematic
  ![Screenshot 2025-06-16 112749](https://github.com/user-attachments/assets/1c9e189c-ef84-47ce-ae1c-33ac2c204e0a)
    
    - Simulation
  ![Screenshot 2025-06-16 095442](https://github.com/user-attachments/assets/59becb63-1ee7-4869-8558-19c64564a8b4)
    
    - Power Consumption
  ![Screenshot 2025-06-16 120806](https://github.com/user-attachments/assets/5a433f06-bf5b-426a-b992-6c9729d48edf)
    
    - Crtical Path Delay
  ![Screenshot 2025-06-16 120847](https://github.com/user-attachments/assets/22a23f44-33ff-47e7-918f-7d87680eb548)
    
    - Timing Reports
  ![Screenshot 2025-06-16 120757](https://github.com/user-attachments/assets/cb6b75ee-74e2-430e-87d4-896c614bf473)
    
    - Resource Utilization
  ![Screenshot 2025-06-16 120830](https://github.com/user-attachments/assets/c0ff1854-432c-453c-b3cf-f0d8525f7fef)
    

- ### Booth's Multiplier Design and Analysis
    - Schematic
  ![Screenshot 2025-06-16 013229](https://github.com/user-attachments/assets/e1d87191-9d8b-4345-a5c7-10971e573a30)

    - Simulation
  ![Screenshot 2025-06-16 010421](https://github.com/user-attachments/assets/58fe16c1-3d3e-4d30-9a68-00d24593e736)
    
    - Timing Reports
  ![Screenshot 2025-06-16 015202](https://github.com/user-attachments/assets/c4ad78a8-cb30-4519-a9b3-ea1b5dc20046)
    
    - Critical Path Delay
  ![Screenshot 2025-06-16 015821](https://github.com/user-attachments/assets/f50ab2cc-bde6-406c-95a2-26207d06cc35)
    
    - Power Consumption
  ![Screenshot 2025-06-16 015150](https://github.com/user-attachments/assets/281d8d29-f1a3-4e45-99bc-851c6953062b)
    
    - Resource Utilization
    ![Screenshot 2025-06-16 015900](https://github.com/user-attachments/assets/31bfadc6-22a6-40d8-90c3-688a4ef26dd6)
    
