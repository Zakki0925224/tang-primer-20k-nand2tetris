// 8x16 font
// https://github.com/slavfox/Cozette
module ascii_font(
    input reg[15:0] ascii_font_index,
    output reg[15:0] out
);
    reg[15:0] ascii_font[128 * 8 - 1:0];

    initial begin
        // 'A'
        ascii_font[8 * 65 + 7] <= 16'h0000;
        ascii_font[8 * 65 + 6] <= 16'h1fc0;
        ascii_font[8 * 65 + 5] <= 16'h0220;
        ascii_font[8 * 65 + 4] <= 16'h0220;
        ascii_font[8 * 65 + 3] <= 16'h0220;
        ascii_font[8 * 65 + 2] <= 16'h1fc0;
        ascii_font[8 * 65 + 1] <= 16'h0000;
        ascii_font[8 * 65 + 0] <= 16'h0000;

        // 'B'
        ascii_font[8 * 66 + 7] <= 16'h0000;
        ascii_font[8 * 66 + 6] <= 16'h1fe0;
        ascii_font[8 * 66 + 5] <= 16'h1120;
        ascii_font[8 * 66 + 4] <= 16'h1120;
        ascii_font[8 * 66 + 3] <= 16'h1120;
        ascii_font[8 * 66 + 2] <= 16'h0ec0;
        ascii_font[8 * 66 + 1] <= 16'h0000;
        ascii_font[8 * 66 + 0] <= 16'h0000;

        // 'C'
        ascii_font[8 * 67 + 7] <= 16'h0000;
        ascii_font[8 * 67 + 6] <= 16'h0fc0;
        ascii_font[8 * 67 + 5] <= 16'h1020;
        ascii_font[8 * 67 + 4] <= 16'h1020;
        ascii_font[8 * 67 + 3] <= 16'h1020;
        ascii_font[8 * 67 + 2] <= 16'h0840;
        ascii_font[8 * 67 + 1] <= 16'h0000;
        ascii_font[8 * 67 + 0] <= 16'h0000;

        // 'D'
        ascii_font[8 * 68 + 7] <= 16'h0000;
        ascii_font[8 * 68 + 6] <= 16'h1fe0;
        ascii_font[8 * 68 + 5] <= 16'h1020;
        ascii_font[8 * 68 + 4] <= 16'h1020;
        ascii_font[8 * 68 + 3] <= 16'h0840;
        ascii_font[8 * 68 + 2] <= 16'h0780;
        ascii_font[8 * 68 + 1] <= 16'h0000;
        ascii_font[8 * 68 + 0] <= 16'h0000;

        // 'E'
        ascii_font[8 * 69 + 7] <= 16'h0000;
        ascii_font[8 * 69 + 6] <= 16'h1fe0;
        ascii_font[8 * 69 + 5] <= 16'h1120;
        ascii_font[8 * 69 + 4] <= 16'h1120;
        ascii_font[8 * 69 + 3] <= 16'h1120;
        ascii_font[8 * 69 + 2] <= 16'h1020;
        ascii_font[8 * 69 + 1] <= 16'h0000;
        ascii_font[8 * 69 + 0] <= 16'h0000;

        // 'F'
        ascii_font[8 * 70 + 7] <= 16'h0000;
        ascii_font[8 * 70 + 6] <= 16'h1fe0;
        ascii_font[8 * 70 + 5] <= 16'h0120;
        ascii_font[8 * 70 + 4] <= 16'h0120;
        ascii_font[8 * 70 + 3] <= 16'h0120;
        ascii_font[8 * 70 + 2] <= 16'h0020;
        ascii_font[8 * 70 + 1] <= 16'h0000;
        ascii_font[8 * 70 + 0] <= 16'h0000;

        // 'G'
        ascii_font[8 * 71 + 7] <= 16'h0000;
        ascii_font[8 * 71 + 6] <= 16'h0fc0;
        ascii_font[8 * 71 + 5] <= 16'h1020;
        ascii_font[8 * 71 + 4] <= 16'h1020;
        ascii_font[8 * 71 + 3] <= 16'h1220;
        ascii_font[8 * 71 + 2] <= 16'h1e40;
        ascii_font[8 * 71 + 1] <= 16'h0000;
        ascii_font[8 * 71 + 0] <= 16'h0000;

        // 'H'
        ascii_font[8 * 72 + 7] <= 16'h0000;
        ascii_font[8 * 72 + 6] <= 16'h1fe0;
        ascii_font[8 * 72 + 5] <= 16'h0100;
        ascii_font[8 * 72 + 4] <= 16'h0100;
        ascii_font[8 * 72 + 3] <= 16'h0100;
        ascii_font[8 * 72 + 2] <= 16'h1fe0;
        ascii_font[8 * 72 + 1] <= 16'h0000;
        ascii_font[8 * 72 + 0] <= 16'h0000;

        // 'I'
        ascii_font[8 * 73 + 7] <= 16'h0000;
        ascii_font[8 * 73 + 6] <= 16'h0000;
        ascii_font[8 * 73 + 5] <= 16'h1020;
        ascii_font[8 * 73 + 4] <= 16'h1fe0;
        ascii_font[8 * 73 + 3] <= 16'h1020;
        ascii_font[8 * 73 + 2] <= 16'h0000;
        ascii_font[8 * 73 + 1] <= 16'h0000;
        ascii_font[8 * 73 + 0] <= 16'h0000;

        // 'J'
        ascii_font[8 * 74 + 7] <= 16'h0000;
        ascii_font[8 * 74 + 6] <= 16'h0c00;
        ascii_font[8 * 74 + 5] <= 16'h1000;
        ascii_font[8 * 74 + 4] <= 16'h1020;
        ascii_font[8 * 74 + 3] <= 16'h1020;
        ascii_font[8 * 74 + 2] <= 16'h0fe0;
        ascii_font[8 * 74 + 1] <= 16'h0000;
        ascii_font[8 * 74 + 0] <= 16'h0000;

        // 'K'
        ascii_font[8 * 75 + 7] <= 16'h0000;
        ascii_font[8 * 75 + 6] <= 16'h1fe0;
        ascii_font[8 * 75 + 5] <= 16'h0100;
        ascii_font[8 * 75 + 4] <= 16'h0180;
        ascii_font[8 * 75 + 3] <= 16'h0640;
        ascii_font[8 * 75 + 2] <= 16'h1820;
        ascii_font[8 * 75 + 1] <= 16'h0000;
        ascii_font[8 * 75 + 0] <= 16'h0000;

        // 'L'
        ascii_font[8 * 76 + 7] <= 16'h0000;
        ascii_font[8 * 76 + 6] <= 16'h1fe0;
        ascii_font[8 * 76 + 5] <= 16'h1000;
        ascii_font[8 * 76 + 4] <= 16'h1000;
        ascii_font[8 * 76 + 3] <= 16'h1000;
        ascii_font[8 * 76 + 2] <= 16'h1000;
        ascii_font[8 * 76 + 1] <= 16'h0000;
        ascii_font[8 * 76 + 0] <= 16'h0000;

        // 'M'
        ascii_font[8 * 77 + 7] <= 16'h0000;
        ascii_font[8 * 77 + 6] <= 16'h1fe0;
        ascii_font[8 * 77 + 5] <= 16'h0040;
        ascii_font[8 * 77 + 4] <= 16'h0180;
        ascii_font[8 * 77 + 3] <= 16'h0040;
        ascii_font[8 * 77 + 2] <= 16'h1fe0;
        ascii_font[8 * 77 + 1] <= 16'h0000;
        ascii_font[8 * 77 + 0] <= 16'h0000;

        // 'N'
        ascii_font[8 * 78 + 7] <= 16'h0000;
        ascii_font[8 * 78 + 6] <= 16'h1fe0;
        ascii_font[8 * 78 + 5] <= 16'h00c0;
        ascii_font[8 * 78 + 4] <= 16'h0300;
        ascii_font[8 * 78 + 3] <= 16'h0c00;
        ascii_font[8 * 78 + 2] <= 16'h1fe0;
        ascii_font[8 * 78 + 1] <= 16'h0000;
        ascii_font[8 * 78 + 0] <= 16'h0000;

        // 'O'
        ascii_font[8 * 79 + 7] <= 16'h0000;
        ascii_font[8 * 79 + 6] <= 16'h0fc0;
        ascii_font[8 * 79 + 5] <= 16'h1020;
        ascii_font[8 * 79 + 4] <= 16'h1020;
        ascii_font[8 * 79 + 3] <= 16'h1020;
        ascii_font[8 * 79 + 2] <= 16'h0fc0;
        ascii_font[8 * 79 + 1] <= 16'h0000;
        ascii_font[8 * 79 + 0] <= 16'h0000;

        // 'P'
        ascii_font[8 * 80 + 7] <= 16'h0000;
        ascii_font[8 * 80 + 6] <= 16'h1fe0;
        ascii_font[8 * 80 + 5] <= 16'h0220;
        ascii_font[8 * 80 + 4] <= 16'h0220;
        ascii_font[8 * 80 + 3] <= 16'h0220;
        ascii_font[8 * 80 + 2] <= 16'h01c0;
        ascii_font[8 * 80 + 1] <= 16'h0000;
        ascii_font[8 * 80 + 0] <= 16'h0000;

        // 'Q'
        ascii_font[8 * 81 + 7] <= 16'h0000;
        ascii_font[8 * 81 + 6] <= 16'h0fc0;
        ascii_font[8 * 81 + 5] <= 16'h1020;
        ascii_font[8 * 81 + 4] <= 16'h1020;
        ascii_font[8 * 81 + 3] <= 16'h0820;
        ascii_font[8 * 81 + 2] <= 16'h37c0;
        ascii_font[8 * 81 + 1] <= 16'h0000;
        ascii_font[8 * 81 + 0] <= 16'h0000;

        // 'R'
        ascii_font[8 * 82 + 7] <= 16'h0000;
        ascii_font[8 * 82 + 6] <= 16'h1fe0;
        ascii_font[8 * 82 + 5] <= 16'h0120;
        ascii_font[8 * 82 + 4] <= 16'h0120;
        ascii_font[8 * 82 + 3] <= 16'h0320;
        ascii_font[8 * 82 + 2] <= 16'h1cc0;
        ascii_font[8 * 82 + 1] <= 16'h0000;
        ascii_font[8 * 82 + 0] <= 16'h0000;

        // 'S'
        ascii_font[8 * 83 + 7] <= 16'h0000;
        ascii_font[8 * 83 + 6] <= 16'h08c0;
        ascii_font[8 * 83 + 5] <= 16'h1120;
        ascii_font[8 * 83 + 4] <= 16'h1120;
        ascii_font[8 * 83 + 3] <= 16'h1120;
        ascii_font[8 * 83 + 2] <= 16'h0e40;
        ascii_font[8 * 83 + 1] <= 16'h0000;
        ascii_font[8 * 83 + 0] <= 16'h0000;

        // 'T'
        ascii_font[8 * 84 + 7] <= 16'h0000;
        ascii_font[8 * 84 + 6] <= 16'h0020;
        ascii_font[8 * 84 + 5] <= 16'h0020;
        ascii_font[8 * 84 + 4] <= 16'h1fe0;
        ascii_font[8 * 84 + 3] <= 16'h0020;
        ascii_font[8 * 84 + 2] <= 16'h0020;
        ascii_font[8 * 84 + 1] <= 16'h0000;
        ascii_font[8 * 84 + 0] <= 16'h0000;

        // 'U'
        ascii_font[8 * 85 + 7] <= 16'h0000;
        ascii_font[8 * 85 + 6] <= 16'h0fe0;
        ascii_font[8 * 85 + 5] <= 16'h1000;
        ascii_font[8 * 85 + 4] <= 16'h1000;
        ascii_font[8 * 85 + 3] <= 16'h1000;
        ascii_font[8 * 85 + 2] <= 16'h0fe0;
        ascii_font[8 * 85 + 1] <= 16'h0000;
        ascii_font[8 * 85 + 0] <= 16'h0000;

        // 'V'
        ascii_font[8 * 86 + 7] <= 16'h0000;
        ascii_font[8 * 86 + 6] <= 16'h00e0;
        ascii_font[8 * 86 + 5] <= 16'h0700;
        ascii_font[8 * 86 + 4] <= 16'h1800;
        ascii_font[8 * 86 + 3] <= 16'h0700;
        ascii_font[8 * 86 + 2] <= 16'h00e0;
        ascii_font[8 * 86 + 1] <= 16'h0000;
        ascii_font[8 * 86 + 0] <= 16'h0000;

        // 'W'
        ascii_font[8 * 87 + 7] <= 16'h0000;
        ascii_font[8 * 87 + 6] <= 16'h03e0;
        ascii_font[8 * 87 + 5] <= 16'h1c00;
        ascii_font[8 * 87 + 4] <= 16'h0700;
        ascii_font[8 * 87 + 3] <= 16'h1c00;
        ascii_font[8 * 87 + 2] <= 16'h03e0;
        ascii_font[8 * 87 + 1] <= 16'h0000;
        ascii_font[8 * 87 + 0] <= 16'h0000;

        // 'X'
        ascii_font[8 * 88 + 7] <= 16'h0000;
        ascii_font[8 * 88 + 6] <= 16'h1860;
        ascii_font[8 * 88 + 5] <= 16'h0480;
        ascii_font[8 * 88 + 4] <= 16'h0300;
        ascii_font[8 * 88 + 3] <= 16'h0480;
        ascii_font[8 * 88 + 2] <= 16'h1860;
        ascii_font[8 * 88 + 1] <= 16'h0000;
        ascii_font[8 * 88 + 0] <= 16'h0000;

        // 'Y'
        ascii_font[8 * 89 + 7] <= 16'h0000;
        ascii_font[8 * 89 + 6] <= 16'h00e0;
        ascii_font[8 * 89 + 5] <= 16'h0100;
        ascii_font[8 * 89 + 4] <= 16'h1e00;
        ascii_font[8 * 89 + 3] <= 16'h0100;
        ascii_font[8 * 89 + 2] <= 16'h00e0;
        ascii_font[8 * 89 + 1] <= 16'h0000;
        ascii_font[8 * 89 + 0] <= 16'h0000;

        // 'Z'
        ascii_font[8 * 90 + 7] <= 16'h0000;
        ascii_font[8 * 90 + 6] <= 16'h1820;
        ascii_font[8 * 90 + 5] <= 16'h1620;
        ascii_font[8 * 90 + 4] <= 16'h11a0;
        ascii_font[8 * 90 + 3] <= 16'h1060;
        ascii_font[8 * 90 + 2] <= 16'h1020;
        ascii_font[8 * 90 + 1] <= 16'h0000;
        ascii_font[8 * 90 + 0] <= 16'h0000;
    end

    assign out = ascii_font[ascii_font_index];
endmodule
