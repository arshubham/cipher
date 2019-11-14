/*-
 * Copyright (c) 2017-2019 Shubham Arora (https://github.com/arshubham/cipher)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
 *
 * Authored by: Shubham Arora <shubhamarora@protonmail.com>
 */

namespace Cipher.Ciphers {

    public class PolybiusSquare {

        char[,] polybius_array = {
            { 'A', 'B', 'C', 'D', 'E'},
            { 'F', 'G', 'H', 'I', 'K'},
            { 'L', 'M', 'N', 'O', 'P'},
            { 'Q', 'R', 'S', 'T', 'U'},
            { 'V', 'W', 'X', 'Y', 'Z'}
        };

        public string encrypt (string plain_text) {
            string cipher_text = "";
            string temp = plain_text.up ();
            unichar character;
            string val = "";

            for (int i = 0; temp.get_next_char (ref i, out character); ) {

                for (int j = 0; j < 5; j++) {
                    for (int k = 0; k < 5; k++) {
                        if (character == polybius_array[j,k] && (character >= 'A' && character <= 'Z')) {
                            val = ((j + 1).to_string ()).concat ((k + 1).to_string ());
                        }
                        if (character == 'J') {
                            val = "24";
                        }
                    }
                }
                if (character >= 'A' && character <= 'Z') {
                    cipher_text = cipher_text.concat (val);
                } else {
                    cipher_text = cipher_text.concat (character.to_string ());
                }
            }
            return cipher_text;
        }

        public string decrypt (string cipher_text) {
            string plain_text = "";
            unichar character;
            unichar character_next;
            unichar character_plain;

            for (int i = 0; cipher_text.get_next_char (ref i, out character); ) {
                if (character >= '0' && character <= '9') {
                    cipher_text.get_next_char (ref i, out character_next);
                    int c1 = int.parse (character.to_string ());
                    int c2 = int.parse (character_next.to_string ());
                    character_plain = polybius_array [c1 - 1 , c2 - 1];
                }
                else {
                    character_plain = character;
                }
                plain_text = plain_text.concat (character_plain.to_string ());
            }

            return plain_text.down ();
        }
    }
}
