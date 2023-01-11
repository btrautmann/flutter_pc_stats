using LibreHardwareMonitor.Hardware;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using LibreHardwareMonitor.Hardware.CPU;
using LibreHardwareMonitor.Hardware.Gpu;

namespace PC_Client2
{

    internal class HardwareAccess
    {
        public class UpdateVisitor : IVisitor
        {
            public void VisitComputer(IComputer computer)
            {
                computer.Traverse(this);
            }
            public void VisitHardware(IHardware hardware)
            {
                hardware.Update();
                foreach (IHardware subHardware in hardware.SubHardware) subHardware.Accept(this);
            }
            public void VisitSensor(ISensor sensor) { }
            public void VisitParameter(IParameter parameter) { }
        }


        public static Dictionary<String, Dictionary<String, String>> GetHardwareSummary()
        {
            Computer computer = new Computer
            {
                IsCpuEnabled = true,
                IsGpuEnabled = true,
                IsMemoryEnabled = true,
                IsMotherboardEnabled = true,
                IsControllerEnabled = true,
                IsNetworkEnabled = true,
                IsStorageEnabled = true
            };

            computer.Open();
            computer.Accept(new UpdateVisitor());

            Dictionary<String, Dictionary<String, String>> hardwareSummary = new();

            foreach (IHardware hardware in computer.Hardware)
            {
                hardwareSummary[hardware.Name] = new()
                {
                    ["type"] = hardware.HardwareType.ToString()
                };
                foreach (ISensor sensor in hardware.Sensors)
                {
                    Debug.WriteLine($"Hardware Sensor: {sensor.Name}, value: {sensor.Value}");
                    hardwareSummary[hardware.Name][$"{sensor.Name}-{sensor.SensorType}"] = sensor.Value.ToString();
                }

                foreach (IHardware subhardware in hardware.SubHardware)
                {
                    Debug.WriteLine($"Subhardware: {subhardware.Name}");

                    foreach (ISensor sensor in subhardware.Sensors)
                    {
                        Debug.WriteLine($"Subhardware Sensor: {sensor.Name}, value: {sensor.Value}");
                        hardwareSummary[hardware.Name][$"{subhardware.Name}-{sensor.Name}-{sensor.SensorType}"] = sensor.Value.ToString();
                    }
                }

            }

            Debug.WriteLine("Gathered Summary:");
            Debug.WriteLine(hardwareSummary);

            computer.Close();
            return hardwareSummary;
        }
    }
}
