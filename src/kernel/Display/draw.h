#define DRAW_H
#ifdef DRAW_H

#include "../include/libc/stdint.h"

#ifdef VGA
#define vga_frame_buffer 0xA0000
#define vga_width 320
#define vga_height 200

#elif HDMI
#define hdmi_frame_buffer 0x00000000
#define hdmi_width 1920
#define hdmi_height 1080
#endif // HDMI

void init_display(){
    #ifdef VGA
    {
    uint8_t *vga = (uint8_t *)vga_frame_buffer;
    for (int i = 0; i < vga_width * vga_height; i++) {
        vga[i] = 0;
        }
    }
    #elif HDMI
    {

    // TODO
    }
    #endif
}
void draw_pixel(int x, int y, uint32_t color, bool is_vga) {
    #ifdef VGA
        color &= 0xFF;
        int bounds = (vga_width * vga_height);
        if (x >= 0 && x < vga_width && y >= 0 && y < vga_height) {
            uint8_t *vga = (uint8_t *)vga_frame_buffer;
            vga[y * vga_width + x] = color;
        }
    #elif defined(HDMI)
        // TODO
    #endif
}

void draw_line(int x1, int y1, int x2, int y2, uint32_t color, bool is_vga) {
    #ifdef VGA
        int dx = x2 - x1;
        int dy = y2 - y1;
        int steps = abs(dx) > abs(dy) ? abs(dx) : abs(dy);
        float Xinc = dx / (float)steps;
        float Yinc = dy / (float)steps;
        float X = x1;
        float Y = y1;
        for (int i = 0; i <= steps; i++) {
            draw_pixel(X, Y, color, is_vga);
            X += Xinc;
            Y += Yinc;
        }
    #elif HDMI
        // TODO 
    #endif
}

#endif // DRAW_H