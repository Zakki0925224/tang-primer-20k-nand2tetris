// 8x16 font
// https://github.com/slavfox/Cozette
module ascii_font(
    input reg[15:0] ascii_font_index,
    output reg[15:0] out
);
    reg[15:0] ascii_font[128 * 8 - 1:0];

    initial begin
        // '!'
        ascii_font[8 * 33 + 7] <= 16'h0000;
        ascii_font[8 * 33 + 6] <= 16'h0000;
        ascii_font[8 * 33 + 5] <= 16'h0000;
        ascii_font[8 * 33 + 4] <= 16'h17e0;
        ascii_font[8 * 33 + 3] <= 16'h0000;
        ascii_font[8 * 33 + 2] <= 16'h0000;
        ascii_font[8 * 33 + 1] <= 16'h0000;
        ascii_font[8 * 33 + 0] <= 16'h0000;

        // '"'
        ascii_font[8 * 34 + 7] <= 16'h0000;
        ascii_font[8 * 34 + 6] <= 16'h0000;
        ascii_font[8 * 34 + 5] <= 16'h0070;
        ascii_font[8 * 34 + 4] <= 16'h0000;
        ascii_font[8 * 34 + 3] <= 16'h0070;
        ascii_font[8 * 34 + 2] <= 16'h0000;
        ascii_font[8 * 34 + 1] <= 16'h0000;
        ascii_font[8 * 34 + 0] <= 16'h0000;

        // '#'
        ascii_font[8 * 35 + 7] <= 16'h0000;
        ascii_font[8 * 35 + 6] <= 16'h0480;
        ascii_font[8 * 35 + 5] <= 16'h1fe0;
        ascii_font[8 * 35 + 4] <= 16'h0480;
        ascii_font[8 * 35 + 3] <= 16'h1fe0;
        ascii_font[8 * 35 + 2] <= 16'h0480;
        ascii_font[8 * 35 + 1] <= 16'h0000;
        ascii_font[8 * 35 + 0] <= 16'h0000;

        // '$'
        ascii_font[8 * 36 + 7] <= 16'h0000;
        ascii_font[8 * 36 + 6] <= 16'h08c0;
        ascii_font[8 * 36 + 5] <= 16'h1120;
        ascii_font[8 * 36 + 4] <= 16'h3ff0;
        ascii_font[8 * 36 + 3] <= 16'h1120;
        ascii_font[8 * 36 + 2] <= 16'h0e40;
        ascii_font[8 * 36 + 1] <= 16'h0000;
        ascii_font[8 * 36 + 0] <= 16'h0000;

        // '%'
        ascii_font[8 * 37 + 7] <= 16'h0000;
        ascii_font[8 * 37 + 6] <= 16'h0420;
        ascii_font[8 * 37 + 5] <= 16'h0250;
        ascii_font[8 * 37 + 4] <= 16'h0920;
        ascii_font[8 * 37 + 3] <= 16'h1480;
        ascii_font[8 * 37 + 2] <= 16'h0840;
        ascii_font[8 * 37 + 1] <= 16'h0000;
        ascii_font[8 * 37 + 0] <= 16'h0000;

        // '&'
        ascii_font[8 * 38 + 7] <= 16'h0000;
        ascii_font[8 * 38 + 6] <= 16'h0e00;
        ascii_font[8 * 38 + 5] <= 16'h1160;
        ascii_font[8 * 38 + 4] <= 16'h1190;
        ascii_font[8 * 38 + 3] <= 16'h0e60;
        ascii_font[8 * 38 + 2] <= 16'h1100;
        ascii_font[8 * 38 + 1] <= 16'h0000;
        ascii_font[8 * 38 + 0] <= 16'h0000;

        // '''
        ascii_font[8 * 39 + 7] <= 16'h0000;
        ascii_font[8 * 39 + 6] <= 16'h0000;
        ascii_font[8 * 39 + 5] <= 16'h0000;
        ascii_font[8 * 39 + 4] <= 16'h0070;
        ascii_font[8 * 39 + 3] <= 16'h0000;
        ascii_font[8 * 39 + 2] <= 16'h0000;
        ascii_font[8 * 39 + 1] <= 16'h0000;
        ascii_font[8 * 39 + 0] <= 16'h0000;

        // '('
        ascii_font[8 * 40 + 7] <= 16'h0000;
        ascii_font[8 * 40 + 6] <= 16'h0000;
        ascii_font[8 * 40 + 5] <= 16'h0f80;
        ascii_font[8 * 40 + 4] <= 16'h3060;
        ascii_font[8 * 40 + 3] <= 16'h4010;
        ascii_font[8 * 40 + 2] <= 16'h0000;
        ascii_font[8 * 40 + 1] <= 16'h0000;
        ascii_font[8 * 40 + 0] <= 16'h0000;

        // ')'
        ascii_font[8 * 41 + 7] <= 16'h0000;
        ascii_font[8 * 41 + 6] <= 16'h0000;
        ascii_font[8 * 41 + 5] <= 16'h4010;
        ascii_font[8 * 41 + 4] <= 16'h3060;
        ascii_font[8 * 41 + 3] <= 16'h0f80;
        ascii_font[8 * 41 + 2] <= 16'h0000;
        ascii_font[8 * 41 + 1] <= 16'h0000;
        ascii_font[8 * 41 + 0] <= 16'h0000;

        // '*'
        ascii_font[8 * 42 + 7] <= 16'h0000;
        ascii_font[8 * 42 + 6] <= 16'h0200;
        ascii_font[8 * 42 + 5] <= 16'h0a80;
        ascii_font[8 * 42 + 4] <= 16'h0700;
        ascii_font[8 * 42 + 3] <= 16'h0a80;
        ascii_font[8 * 42 + 2] <= 16'h0200;
        ascii_font[8 * 42 + 1] <= 16'h0000;
        ascii_font[8 * 42 + 0] <= 16'h0000;

        // '+'
        ascii_font[8 * 43 + 7] <= 16'h0000;
        ascii_font[8 * 43 + 6] <= 16'h0200;
        ascii_font[8 * 43 + 5] <= 16'h0200;
        ascii_font[8 * 43 + 4] <= 16'h0f80;
        ascii_font[8 * 43 + 3] <= 16'h0200;
        ascii_font[8 * 43 + 2] <= 16'h0200;
        ascii_font[8 * 43 + 1] <= 16'h0000;
        ascii_font[8 * 43 + 0] <= 16'h0000;

        // ','
        ascii_font[8 * 44 + 7] <= 16'h0000;
        ascii_font[8 * 44 + 6] <= 16'h0000;
        ascii_font[8 * 44 + 5] <= 16'h5800;
        ascii_font[8 * 44 + 4] <= 16'h3800;
        ascii_font[8 * 44 + 3] <= 16'h0000;
        ascii_font[8 * 44 + 2] <= 16'h0000;
        ascii_font[8 * 44 + 1] <= 16'h0000;
        ascii_font[8 * 44 + 0] <= 16'h0000;

        // '-'
        ascii_font[8 * 45 + 7] <= 16'h0000;
        ascii_font[8 * 45 + 6] <= 16'h0200;
        ascii_font[8 * 45 + 5] <= 16'h0200;
        ascii_font[8 * 45 + 4] <= 16'h0200;
        ascii_font[8 * 45 + 3] <= 16'h0200;
        ascii_font[8 * 45 + 2] <= 16'h0200;
        ascii_font[8 * 45 + 1] <= 16'h0000;
        ascii_font[8 * 45 + 0] <= 16'h0000;

        // '.'
        ascii_font[8 * 46 + 7] <= 16'h0000;
        ascii_font[8 * 46 + 6] <= 16'h0000;
        ascii_font[8 * 46 + 5] <= 16'h1800;
        ascii_font[8 * 46 + 4] <= 16'h1800;
        ascii_font[8 * 46 + 3] <= 16'h0000;
        ascii_font[8 * 46 + 2] <= 16'h0000;
        ascii_font[8 * 46 + 1] <= 16'h0000;
        ascii_font[8 * 46 + 0] <= 16'h0000;

        // '/'
        ascii_font[8 * 47 + 7] <= 16'h0000;
        ascii_font[8 * 47 + 6] <= 16'h3000;
        ascii_font[8 * 47 + 5] <= 16'h0c00;
        ascii_font[8 * 47 + 4] <= 16'h0300;
        ascii_font[8 * 47 + 3] <= 16'h00c0;
        ascii_font[8 * 47 + 2] <= 16'h0030;
        ascii_font[8 * 47 + 1] <= 16'h0000;
        ascii_font[8 * 47 + 0] <= 16'h0000;

        // '0'
        ascii_font[8 * 48 + 7] <= 16'h0000;
        ascii_font[8 * 48 + 6] <= 16'h0fc0;
        ascii_font[8 * 48 + 5] <= 16'h1020;
        ascii_font[8 * 48 + 4] <= 16'h1320;
        ascii_font[8 * 48 + 3] <= 16'h1020;
        ascii_font[8 * 48 + 2] <= 16'h0fc0;
        ascii_font[8 * 48 + 1] <= 16'h0000;
        ascii_font[8 * 48 + 0] <= 16'h0000;

        // '1'
        ascii_font[8 * 49 + 7] <= 16'h0000;
        ascii_font[8 * 49 + 6] <= 16'h1080;
        ascii_font[8 * 49 + 5] <= 16'h1040;
        ascii_font[8 * 49 + 4] <= 16'h1fe0;
        ascii_font[8 * 49 + 3] <= 16'h1000;
        ascii_font[8 * 49 + 2] <= 16'h1000;
        ascii_font[8 * 49 + 1] <= 16'h0000;
        ascii_font[8 * 49 + 0] <= 16'h0000;

        // '2'
        ascii_font[8 * 50 + 7] <= 16'h0000;
        ascii_font[8 * 50 + 6] <= 16'h1840;
        ascii_font[8 * 50 + 5] <= 16'h1420;
        ascii_font[8 * 50 + 4] <= 16'h1220;
        ascii_font[8 * 50 + 3] <= 16'h1120;
        ascii_font[8 * 50 + 2] <= 16'h10c0;
        ascii_font[8 * 50 + 1] <= 16'h0000;
        ascii_font[8 * 50 + 0] <= 16'h0000;

        // '3'
        ascii_font[8 * 51 + 7] <= 16'h0000;
        ascii_font[8 * 51 + 6] <= 16'h0840;
        ascii_font[8 * 51 + 5] <= 16'h1020;
        ascii_font[8 * 51 + 4] <= 16'h1120;
        ascii_font[8 * 51 + 3] <= 16'h1120;
        ascii_font[8 * 51 + 2] <= 16'h0ec0;
        ascii_font[8 * 51 + 1] <= 16'h0000;
        ascii_font[8 * 51 + 0] <= 16'h0000;

        // '4'
        ascii_font[8 * 52 + 7] <= 16'h0000;
        ascii_font[8 * 52 + 6] <= 16'h0600;
        ascii_font[8 * 52 + 5] <= 16'h0500;
        ascii_font[8 * 52 + 4] <= 16'h0480;
        ascii_font[8 * 52 + 3] <= 16'h0440;
        ascii_font[8 * 52 + 2] <= 16'h1fe0;
        ascii_font[8 * 52 + 1] <= 16'h0400;
        ascii_font[8 * 52 + 0] <= 16'h0000;

        // '5'
        ascii_font[8 * 53 + 7] <= 16'h0000;
        ascii_font[8 * 53 + 6] <= 16'h09e0;
        ascii_font[8 * 53 + 5] <= 16'h1120;
        ascii_font[8 * 53 + 4] <= 16'h1120;
        ascii_font[8 * 53 + 3] <= 16'h1120;
        ascii_font[8 * 53 + 2] <= 16'h0e20;
        ascii_font[8 * 53 + 1] <= 16'h0000;
        ascii_font[8 * 53 + 0] <= 16'h0000;

        // '6'
        ascii_font[8 * 54 + 7] <= 16'h0000;
        ascii_font[8 * 54 + 6] <= 16'h0f80;
        ascii_font[8 * 54 + 5] <= 16'h1140;
        ascii_font[8 * 54 + 4] <= 16'h1120;
        ascii_font[8 * 54 + 3] <= 16'h1120;
        ascii_font[8 * 54 + 2] <= 16'h0e00;
        ascii_font[8 * 54 + 1] <= 16'h0000;
        ascii_font[8 * 54 + 0] <= 16'h0000;

        // '7'
        ascii_font[8 * 55 + 7] <= 16'h0000;
        ascii_font[8 * 55 + 6] <= 16'h0020;
        ascii_font[8 * 55 + 5] <= 16'h1820;
        ascii_font[8 * 55 + 4] <= 16'h0620;
        ascii_font[8 * 55 + 3] <= 16'h01a0;
        ascii_font[8 * 55 + 2] <= 16'h0060;
        ascii_font[8 * 55 + 1] <= 16'h0000;
        ascii_font[8 * 55 + 0] <= 16'h0000;

        // '8'
        ascii_font[8 * 56 + 7] <= 16'h0000;
        ascii_font[8 * 56 + 6] <= 16'h0ec0;
        ascii_font[8 * 56 + 5] <= 16'h1120;
        ascii_font[8 * 56 + 4] <= 16'h1120;
        ascii_font[8 * 56 + 3] <= 16'h1120;
        ascii_font[8 * 56 + 2] <= 16'h0ec0;
        ascii_font[8 * 56 + 1] <= 16'h0000;
        ascii_font[8 * 56 + 0] <= 16'h0000;

        // '9'
        ascii_font[8 * 57 + 7] <= 16'h0000;
        ascii_font[8 * 57 + 6] <= 16'h01c0;
        ascii_font[8 * 57 + 5] <= 16'h1220;
        ascii_font[8 * 57 + 4] <= 16'h1220;
        ascii_font[8 * 57 + 3] <= 16'h0a20;
        ascii_font[8 * 57 + 2] <= 16'h07c0;
        ascii_font[8 * 57 + 1] <= 16'h0000;
        ascii_font[8 * 57 + 0] <= 16'h0000;

        // ':'
        ascii_font[8 * 58 + 7] <= 16'h0000;
        ascii_font[8 * 58 + 6] <= 16'h0000;
        ascii_font[8 * 58 + 5] <= 16'h1980;
        ascii_font[8 * 58 + 4] <= 16'h1980;
        ascii_font[8 * 58 + 3] <= 16'h0000;
        ascii_font[8 * 58 + 2] <= 16'h0000;
        ascii_font[8 * 58 + 1] <= 16'h0000;
        ascii_font[8 * 58 + 0] <= 16'h0000;

        // ';'
        ascii_font[8 * 59 + 7] <= 16'h0000;
        ascii_font[8 * 59 + 6] <= 16'h0000;
        ascii_font[8 * 59 + 5] <= 16'h5980;
        ascii_font[8 * 59 + 4] <= 16'h3980;
        ascii_font[8 * 59 + 3] <= 16'h0000;
        ascii_font[8 * 59 + 2] <= 16'h0000;
        ascii_font[8 * 59 + 1] <= 16'h0000;
        ascii_font[8 * 59 + 0] <= 16'h0000;

        // '<'
        ascii_font[8 * 60 + 7] <= 16'h0000;
        ascii_font[8 * 60 + 6] <= 16'h0000;
        ascii_font[8 * 60 + 5] <= 16'h0200;
        ascii_font[8 * 60 + 4] <= 16'h0500;
        ascii_font[8 * 60 + 3] <= 16'h0880;
        ascii_font[8 * 60 + 2] <= 16'h1040;
        ascii_font[8 * 60 + 1] <= 16'h0000;
        ascii_font[8 * 60 + 0] <= 16'h0000;

        // '='
        ascii_font[8 * 61 + 7] <= 16'h0000;
        ascii_font[8 * 61 + 6] <= 16'h0500;
        ascii_font[8 * 61 + 5] <= 16'h0500;
        ascii_font[8 * 61 + 4] <= 16'h0500;
        ascii_font[8 * 61 + 3] <= 16'h0500;
        ascii_font[8 * 61 + 2] <= 16'h0500;
        ascii_font[8 * 61 + 1] <= 16'h0000;
        ascii_font[8 * 61 + 0] <= 16'h0000;

        // '>'
        ascii_font[8 * 62 + 7] <= 16'h0000;
        ascii_font[8 * 62 + 6] <= 16'h0000;
        ascii_font[8 * 62 + 5] <= 16'h1040;
        ascii_font[8 * 62 + 4] <= 16'h0880;
        ascii_font[8 * 62 + 3] <= 16'h0500;
        ascii_font[8 * 62 + 2] <= 16'h0200;
        ascii_font[8 * 62 + 1] <= 16'h0000;
        ascii_font[8 * 62 + 0] <= 16'h0000;

        // '?'
        ascii_font[8 * 63 + 7] <= 16'h0000;
        ascii_font[8 * 63 + 6] <= 16'h0040;
        ascii_font[8 * 63 + 5] <= 16'h0020;
        ascii_font[8 * 63 + 4] <= 16'h1620;
        ascii_font[8 * 63 + 3] <= 16'h0120;
        ascii_font[8 * 63 + 2] <= 16'h00c0;
        ascii_font[8 * 63 + 1] <= 16'h0000;
        ascii_font[8 * 63 + 0] <= 16'h0000;

        // '@'
        ascii_font[8 * 64 + 7] <= 16'h0000;
        ascii_font[8 * 64 + 6] <= 16'h0fc0;
        ascii_font[8 * 64 + 5] <= 16'h1020;
        ascii_font[8 * 64 + 4] <= 16'h1720;
        ascii_font[8 * 64 + 3] <= 16'h1520;
        ascii_font[8 * 64 + 2] <= 16'h17c0;
        ascii_font[8 * 64 + 1] <= 16'h0000;
        ascii_font[8 * 64 + 0] <= 16'h0000;

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

        // '['
        ascii_font[8 * 91 + 7] <= 16'h0000;
        ascii_font[8 * 91 + 6] <= 16'h0000;
        ascii_font[8 * 91 + 5] <= 16'h7ff0;
        ascii_font[8 * 91 + 4] <= 16'h4010;
        ascii_font[8 * 91 + 3] <= 16'h4010;
        ascii_font[8 * 91 + 2] <= 16'h0000;
        ascii_font[8 * 91 + 1] <= 16'h0000;
        ascii_font[8 * 91 + 0] <= 16'h0000;

        // '\'
        ascii_font[8 * 92 + 7] <= 16'h0000;
        ascii_font[8 * 92 + 6] <= 16'h0030;
        ascii_font[8 * 92 + 5] <= 16'h00c0;
        ascii_font[8 * 92 + 4] <= 16'h0300;
        ascii_font[8 * 92 + 3] <= 16'h0c00;
        ascii_font[8 * 92 + 2] <= 16'h3000;
        ascii_font[8 * 92 + 1] <= 16'h0000;
        ascii_font[8 * 92 + 0] <= 16'h0000;

        // ']'
        ascii_font[8 * 93 + 7] <= 16'h0000;
        ascii_font[8 * 93 + 6] <= 16'h0000;
        ascii_font[8 * 93 + 5] <= 16'h4010;
        ascii_font[8 * 93 + 4] <= 16'h4010;
        ascii_font[8 * 93 + 3] <= 16'h7ff0;
        ascii_font[8 * 93 + 2] <= 16'h0000;
        ascii_font[8 * 93 + 1] <= 16'h0000;
        ascii_font[8 * 93 + 0] <= 16'h0000;

        // '^'
        ascii_font[8 * 94 + 7] <= 16'h0000;
        ascii_font[8 * 94 + 6] <= 16'h0020;
        ascii_font[8 * 94 + 5] <= 16'h0010;
        ascii_font[8 * 94 + 4] <= 16'h0008;
        ascii_font[8 * 94 + 3] <= 16'h0010;
        ascii_font[8 * 94 + 2] <= 16'h0020;
        ascii_font[8 * 94 + 0] <= 16'h0000;
        ascii_font[8 * 94 + 1] <= 16'h0000;

        // '_'
        ascii_font[8 * 95 + 7] <= 16'h0000;
        ascii_font[8 * 95 + 6] <= 16'h2000;
        ascii_font[8 * 95 + 5] <= 16'h2000;
        ascii_font[8 * 95 + 4] <= 16'h2000;
        ascii_font[8 * 95 + 3] <= 16'h2000;
        ascii_font[8 * 95 + 2] <= 16'h2000;
        ascii_font[8 * 95 + 1] <= 16'h0000;
        ascii_font[8 * 95 + 0] <= 16'h0000;

        // '`'
        ascii_font[8 * 96 + 7] <= 16'h0000;
        ascii_font[8 * 96 + 6] <= 16'h0000;
        ascii_font[8 * 96 + 5] <= 16'h0010;
        ascii_font[8 * 96 + 4] <= 16'h0020;
        ascii_font[8 * 96 + 3] <= 16'h0000;
        ascii_font[8 * 96 + 2] <= 16'h0000;
        ascii_font[8 * 96 + 1] <= 16'h0000;
        ascii_font[8 * 96 + 0] <= 16'h0000;

        // 'a'
        ascii_font[8 * 97 + 7] <= 16'h0000;
        ascii_font[8 * 97 + 6] <= 16'h0f00;
        ascii_font[8 * 97 + 5] <= 16'h1080;
        ascii_font[8 * 97 + 4] <= 16'h1080;
        ascii_font[8 * 97 + 3] <= 16'h0880;
        ascii_font[8 * 97 + 2] <= 16'h1f80;
        ascii_font[8 * 97 + 1] <= 16'h0000;
        ascii_font[8 * 97 + 0] <= 16'h0000;

        // 'b'
        ascii_font[8 * 98 + 7] <= 16'h0000;
        ascii_font[8 * 98 + 6] <= 16'h1ff0;
        ascii_font[8 * 98 + 5] <= 16'h1080;
        ascii_font[8 * 98 + 4] <= 16'h1080;
        ascii_font[8 * 98 + 3] <= 16'h1080;
        ascii_font[8 * 98 + 2] <= 16'h0f00;
        ascii_font[8 * 98 + 1] <= 16'h0000;
        ascii_font[8 * 98 + 0] <= 16'h0000;

        // 'c'
        ascii_font[8 * 99 + 7] <= 16'h0000;
        ascii_font[8 * 99 + 6] <= 16'h0f00;
        ascii_font[8 * 99 + 5] <= 16'h1080;
        ascii_font[8 * 99 + 4] <= 16'h1080;
        ascii_font[8 * 99 + 3] <= 16'h1080;
        ascii_font[8 * 99 + 2] <= 16'h0900;
        ascii_font[8 * 99 + 1] <= 16'h0000;
        ascii_font[8 * 99 + 0] <= 16'h0000;

        // 'd'
        ascii_font[8 * 100 + 7] <= 16'h0000;
        ascii_font[8 * 100 + 6] <= 16'h0f00;
        ascii_font[8 * 100 + 5] <= 16'h1080;
        ascii_font[8 * 100 + 4] <= 16'h1080;
        ascii_font[8 * 100 + 3] <= 16'h1080;
        ascii_font[8 * 100 + 2] <= 16'h1ff0;
        ascii_font[8 * 100 + 1] <= 16'h0000;
        ascii_font[8 * 100 + 0] <= 16'h0000;

        // 'e'
        ascii_font[8 * 101 + 7] <= 16'h0000;
        ascii_font[8 * 101 + 6] <= 16'h0f00;
        ascii_font[8 * 101 + 5] <= 16'h1280;
        ascii_font[8 * 101 + 4] <= 16'h1280;
        ascii_font[8 * 101 + 3] <= 16'h1280;
        ascii_font[8 * 101 + 2] <= 16'h0b00;
        ascii_font[8 * 101 + 1] <= 16'h0000;
        ascii_font[8 * 101 + 0] <= 16'h0000;

        // 'f'
        ascii_font[8 * 102 + 7] <= 16'h0000;
        ascii_font[8 * 102 + 6] <= 16'h0080;
        ascii_font[8 * 102 + 5] <= 16'h1fe0;
        ascii_font[8 * 102 + 3] <= 16'h0090;
        ascii_font[8 * 102 + 4] <= 16'h0090;
        ascii_font[8 * 102 + 2] <= 16'h0010;
        ascii_font[8 * 102 + 1] <= 16'h0000;
        ascii_font[8 * 102 + 0] <= 16'h0000;

        // 'g'
        ascii_font[8 * 103 + 7] <= 16'h0000;
        ascii_font[8 * 103 + 6] <= 16'h0f00;
        ascii_font[8 * 103 + 5] <= 16'h9080;
        ascii_font[8 * 103 + 4] <= 16'h9080;
        ascii_font[8 * 103 + 3] <= 16'h9080;
        ascii_font[8 * 103 + 2] <= 16'h7f80;
        ascii_font[8 * 103 + 1] <= 16'h0000;
        ascii_font[8 * 103 + 0] <= 16'h0000;

        // 'h'
        ascii_font[8 * 104 + 7] <= 16'h0000;
        ascii_font[8 * 104 + 6] <= 16'h1ff0;
        ascii_font[8 * 104 + 5] <= 16'h0080;
        ascii_font[8 * 104 + 4] <= 16'h0080;
        ascii_font[8 * 104 + 3] <= 16'h0080;
        ascii_font[8 * 104 + 2] <= 16'h1f00;
        ascii_font[8 * 104 + 1] <= 16'h0000;
        ascii_font[8 * 104 + 0] <= 16'h0000;

        // 'i'
        ascii_font[8 * 105 + 7] <= 16'h0000;
        ascii_font[8 * 105 + 6] <= 16'h0000;
        ascii_font[8 * 105 + 5] <= 16'h0080;
        ascii_font[8 * 105 + 4] <= 16'h0fa0;
        ascii_font[8 * 105 + 3] <= 16'h1000;
        ascii_font[8 * 105 + 2] <= 16'h1000;
        ascii_font[8 * 105 + 1] <= 16'h0000;
        ascii_font[8 * 105 + 0] <= 16'h0000;

        // 'j'
        ascii_font[8 * 106 + 7] <= 16'h0000;
        ascii_font[8 * 106 + 6] <= 16'h0000;
        ascii_font[8 * 106 + 5] <= 16'h2000;
        ascii_font[8 * 106 + 4] <= 16'h4080;
        ascii_font[8 * 106 + 3] <= 16'h3fa0;
        ascii_font[8 * 106 + 2] <= 16'h0000;
        ascii_font[8 * 106 + 1] <= 16'h0000;
        ascii_font[8 * 106 + 0] <= 16'h0000;

        // 'k'
        ascii_font[8 * 107 + 7] <= 16'h0000;
        ascii_font[8 * 107 + 6] <= 16'h1ff0;
        ascii_font[8 * 107 + 5] <= 16'h0400;
        ascii_font[8 * 107 + 4] <= 16'h0600;
        ascii_font[8 * 107 + 3] <= 16'h0900;
        ascii_font[8 * 107 + 2] <= 16'h1080;
        ascii_font[8 * 107 + 1] <= 16'h0000;
        ascii_font[8 * 107 + 0] <= 16'h0000;

        // 'l'
        ascii_font[8 * 108 + 7] <= 16'h0000;
        ascii_font[8 * 108 + 6] <= 16'h0000;
        ascii_font[8 * 108 + 5] <= 16'h0010;
        ascii_font[8 * 108 + 4] <= 16'h1ff0;
        ascii_font[8 * 108 + 3] <= 16'h1000;
        ascii_font[8 * 108 + 2] <= 16'h0000;
        ascii_font[8 * 108 + 1] <= 16'h0000;
        ascii_font[8 * 108 + 0] <= 16'h0000;

        // 'm'
        ascii_font[8 * 109 + 7] <= 16'h0000;
        ascii_font[8 * 109 + 6] <= 16'h1f80;
        ascii_font[8 * 109 + 5] <= 16'h0080;
        ascii_font[8 * 109 + 4] <= 16'h1f00;
        ascii_font[8 * 109 + 3] <= 16'h0080;
        ascii_font[8 * 109 + 2] <= 16'h1f00;
        ascii_font[8 * 109 + 1] <= 16'h0000;
        ascii_font[8 * 109 + 0] <= 16'h0000;

        // 'n'
        ascii_font[8 * 110 + 7] <= 16'h0000;
        ascii_font[8 * 110 + 6] <= 16'h1f80;
        ascii_font[8 * 110 + 5] <= 16'h0080;
        ascii_font[8 * 110 + 4] <= 16'h0080;
        ascii_font[8 * 110 + 3] <= 16'h0080;
        ascii_font[8 * 110 + 2] <= 16'h1f00;
        ascii_font[8 * 110 + 1] <= 16'h0000;
        ascii_font[8 * 110 + 0] <= 16'h0000;

        // 'o'
        ascii_font[8 * 111 + 7] <= 16'h0000;
        ascii_font[8 * 111 + 6] <= 16'h0f00;
        ascii_font[8 * 111 + 5] <= 16'h1080;
        ascii_font[8 * 111 + 4] <= 16'h1080;
        ascii_font[8 * 111 + 3] <= 16'h1080;
        ascii_font[8 * 111 + 2] <= 16'h0f00;
        ascii_font[8 * 111 + 1] <= 16'h0000;
        ascii_font[8 * 111 + 0] <= 16'h0000;

        // 'p'
        ascii_font[8 * 112 + 7] <= 16'h0000;
        ascii_font[8 * 112 + 6] <= 16'hff80;
        ascii_font[8 * 112 + 5] <= 16'h1080;
        ascii_font[8 * 112 + 4] <= 16'h1080;
        ascii_font[8 * 112 + 3] <= 16'h1080;
        ascii_font[8 * 112 + 2] <= 16'h0f00;
        ascii_font[8 * 112 + 1] <= 16'h0000;
        ascii_font[8 * 112 + 0] <= 16'h0000;

        // 'q'
        ascii_font[8 * 113 + 7] <= 16'h0000;
        ascii_font[8 * 113 + 6] <= 16'h0f00;
        ascii_font[8 * 113 + 5] <= 16'h1080;
        ascii_font[8 * 113 + 4] <= 16'h1080;
        ascii_font[8 * 113 + 3] <= 16'h1080;
        ascii_font[8 * 113 + 2] <= 16'hff80;
        ascii_font[8 * 113 + 1] <= 16'h8000;
        ascii_font[8 * 113 + 0] <= 16'h0000;

        // 'r'
        ascii_font[8 * 114 + 7] <= 16'h0000;
        ascii_font[8 * 114 + 6] <= 16'h1f80;
        ascii_font[8 * 114 + 5] <= 16'h0080;
        ascii_font[8 * 114 + 4] <= 16'h0080;
        ascii_font[8 * 114 + 3] <= 16'h0080;
        ascii_font[8 * 114 + 2] <= 16'h0100;
        ascii_font[8 * 114 + 1] <= 16'h0000;
        ascii_font[8 * 114 + 0] <= 16'h0000;

        // 's'
        ascii_font[8 * 115 + 7] <= 16'h0000;
        ascii_font[8 * 115 + 6] <= 16'h1100;
        ascii_font[8 * 115 + 5] <= 16'h1280;
        ascii_font[8 * 115 + 4] <= 16'h1280;
        ascii_font[8 * 115 + 3] <= 16'h1280;
        ascii_font[8 * 115 + 2] <= 16'h0c80;
        ascii_font[8 * 115 + 1] <= 16'h0000;
        ascii_font[8 * 115 + 0] <= 16'h0000;

        // 't'
        ascii_font[8 * 116 + 7] <= 16'h0000;
        ascii_font[8 * 116 + 6] <= 16'h0080;
        ascii_font[8 * 116 + 5] <= 16'h0fe0;
        ascii_font[8 * 116 + 4] <= 16'h1080;
        ascii_font[8 * 116 + 3] <= 16'h1080;
        ascii_font[8 * 116 + 2] <= 16'h1000;
        ascii_font[8 * 116 + 1] <= 16'h0000;
        ascii_font[8 * 116 + 0] <= 16'h0000;

        // 'u'
        ascii_font[8 * 117 + 7] <= 16'h0000;
        ascii_font[8 * 117 + 6] <= 16'h0f80;
        ascii_font[8 * 117 + 5] <= 16'h1000;
        ascii_font[8 * 117 + 4] <= 16'h1000;
        ascii_font[8 * 117 + 3] <= 16'h1000;
        ascii_font[8 * 117 + 2] <= 16'h1f80;
        ascii_font[8 * 117 + 1] <= 16'h0000;
        ascii_font[8 * 117 + 0] <= 16'h0000;

        // 'v'
        ascii_font[8 * 118 + 7] <= 16'h0000;
        ascii_font[8 * 118 + 6] <= 16'h0180;
        ascii_font[8 * 118 + 5] <= 16'h0600;
        ascii_font[8 * 118 + 4] <= 16'h1800;
        ascii_font[8 * 118 + 3] <= 16'h0600;
        ascii_font[8 * 118 + 2] <= 16'h0180;
        ascii_font[8 * 118 + 1] <= 16'h0000;
        ascii_font[8 * 118 + 0] <= 16'h0000;

        // 'w'
        ascii_font[8 * 119 + 7] <= 16'h0000;
        ascii_font[8 * 119 + 6] <= 16'h0780;
        ascii_font[8 * 119 + 5] <= 16'h1800;
        ascii_font[8 * 119 + 4] <= 16'h0600;
        ascii_font[8 * 119 + 3] <= 16'h1800;
        ascii_font[8 * 119 + 2] <= 16'h0780;
        ascii_font[8 * 119 + 1] <= 16'h0000;
        ascii_font[8 * 119 + 0] <= 16'h0000;

        // 'x'
        ascii_font[8 * 120 + 7] <= 16'h0000;
        ascii_font[8 * 120 + 6] <= 16'h1080;
        ascii_font[8 * 120 + 5] <= 16'h0900;
        ascii_font[8 * 120 + 4] <= 16'h0600;
        ascii_font[8 * 120 + 3] <= 16'h0900;
        ascii_font[8 * 120 + 2] <= 16'h1080;
        ascii_font[8 * 120 + 1] <= 16'h0000;
        ascii_font[8 * 120 + 0] <= 16'h0000;

        // 'y'
        ascii_font[8 * 121 + 7] <= 16'h0000;
        ascii_font[8 * 121 + 6] <= 16'h0f80;
        ascii_font[8 * 121 + 5] <= 16'h9000;
        ascii_font[8 * 121 + 4] <= 16'h9000;
        ascii_font[8 * 121 + 3] <= 16'h9000;
        ascii_font[8 * 121 + 2] <= 16'h7f80;
        ascii_font[8 * 121 + 1] <= 16'h0000;
        ascii_font[8 * 121 + 0] <= 16'h0000;

        // 'z'
        ascii_font[8 * 122 + 7] <= 16'h0000;
        ascii_font[8 * 122 + 6] <= 16'h1880;
        ascii_font[8 * 122 + 5] <= 16'h1480;
        ascii_font[8 * 122 + 4] <= 16'h1280;
        ascii_font[8 * 122 + 3] <= 16'h1180;
        ascii_font[8 * 122 + 2] <= 16'h1080;
        ascii_font[8 * 122 + 1] <= 16'h0000;
        ascii_font[8 * 122 + 0] <= 16'h0000;

        // '{'
        ascii_font[8 * 123 + 7] <= 16'h0000;
        ascii_font[8 * 123 + 6] <= 16'h0200;
        ascii_font[8 * 123 + 5] <= 16'h0200;
        ascii_font[8 * 123 + 4] <= 16'h3de0;
        ascii_font[8 * 123 + 3] <= 16'h4010;
        ascii_font[8 * 123 + 2] <= 16'h4010;
        ascii_font[8 * 123 + 1] <= 16'h0000;
        ascii_font[8 * 123 + 0] <= 16'h0000;

        // '|'
        ascii_font[8 * 124 + 7] <= 16'h0000;
        ascii_font[8 * 124 + 6] <= 16'h0000;
        ascii_font[8 * 124 + 5] <= 16'h0000;
        ascii_font[8 * 124 + 4] <= 16'h7ff0;
        ascii_font[8 * 124 + 3] <= 16'h0000;
        ascii_font[8 * 124 + 2] <= 16'h0000;
        ascii_font[8 * 124 + 1] <= 16'h0000;
        ascii_font[8 * 124 + 0] <= 16'h0000;

        // '}'
        ascii_font[8 * 125 + 7] <= 16'h0000;
        ascii_font[8 * 125 + 6] <= 16'h4010;
        ascii_font[8 * 125 + 5] <= 16'h4010;
        ascii_font[8 * 125 + 4] <= 16'h3de0;
        ascii_font[8 * 125 + 3] <= 16'h0200;
        ascii_font[8 * 125 + 2] <= 16'h0200;
        ascii_font[8 * 125 + 1] <= 16'h0000;
        ascii_font[8 * 125 + 0] <= 16'h0000;

        // '~'
        ascii_font[8 * 126 + 7] <= 16'h0000;
        ascii_font[8 * 126 + 6] <= 16'h0600;
        ascii_font[8 * 126 + 5] <= 16'h0100;
        ascii_font[8 * 126 + 4] <= 16'h0200;
        ascii_font[8 * 126 + 3] <= 16'h0400;
        ascii_font[8 * 126 + 2] <= 16'h0300;
        ascii_font[8 * 126 + 0] <= 16'h0000;
        ascii_font[8 * 126 + 1] <= 16'h0000;
    end

    assign out = ascii_font[ascii_font_index];
endmodule
