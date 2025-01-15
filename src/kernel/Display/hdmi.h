#define HDMI_H
#ifdef HDMI_H

// Essentials
#define HDMI_SCL_RATE			(100*1000)
#define DDC_BUS_FREQ_L			0x4b
#define DDC_BUS_FREQ_H			0x4c
#define HDMI_SYS_CTRL			0x00

#define HDMI_STATUS			0xc8
#define m_HOTPLUG			(1 << 7)

// still more that needs to be added but ill do that later

#endif // HDMI_H
