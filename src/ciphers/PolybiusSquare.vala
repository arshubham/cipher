/*-
 * Copyright (c) 2018 Shubham Arora (https://github.com/arshubham/cipher)
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

        char[,] polybiusArray = {
            {'A', 'B', 'C', 'D','E'},
            {'F', 'G', 'H', 'I','K'},
            {'L', 'M', 'N', 'O','P'},
            {'Q', 'R', 'S', 'T','U'},
            {'V', 'W', 'X', 'Y','Z'}
        };

        public string encryptPolybiusSquare (string plainText) {
            string cipherText = "";
            string temp = plainText.up ();
            unichar character;
            string val = "";
            for (int i = 0; temp.get_next_char (ref i, out character); ) {

                for (int j = 0; j < 5; j++) {
                    for (int k = 0; k < 5; k++) {
                        if (character == polybiusArray[j,k] && (character >= 'A' && character <= 'Z')) {
                            val = ((j+1).to_string ()).concat ((k+1).to_string ());
                        }
                        if (character == 'J') {
                            val = "24";
                        }
                    }
                }
                if (character >= 'A' && character <= 'Z') {
                    cipherText = cipherText.concat (val);
                } else {
                    cipherText = cipherText.concat (character.to_string ());
                }
            }
            return cipherText;
        }

        public string decryptPolybiusSquare (string cipherText) {
            string plainText = "";
            unichar character;
            unichar character_next;
            unichar characterPlain;

            for (int i = 0; cipherText.get_next_char (ref i, out character); ) {
                if (character >= '0' && character <= '9') {
                    cipherText.get_next_char (ref i, out character_next);
                    int c1 = int.parse (character.to_string ());
                    int c2 = int.parse (character_next.to_string ());
                    characterPlain = polybiusArray[c1-1,c2-1];
                }
                else {
                    characterPlain = character;
                }
                plainText = plainText.concat (characterPlain.to_string());
            }

            return plainText.down ();
        }
    }
}
