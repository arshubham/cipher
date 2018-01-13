/*-
 * Copyright (c) 2017 Shubham Arora (https://github.com/arshubham/cipher)
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

    public class Ascii {

        public string encryptAscii (string plainText) {
            string cipherText = "";
            unichar character;
            int asciiNum;
             for (int i = 0; plainText.get_next_char (ref i, out character); ) {
                asciiNum = (int) character;

                cipherText = cipherText.concat (asciiNum.to_string (), " ");
             }

            return cipherText;
        }

        public string decryptAscii (string cipherText) {
            string plainText = "";
            string temp = "";
            unichar character,c;
            for (int i = 0; cipherText.get_next_char (ref i, out character); ) {
                temp = temp.concat (character.to_string ());
                if (character == ' ') {
                    int asciiNum = temp.to_int ();
                    c = (unichar) asciiNum;

                    plainText = plainText.concat (c.to_string ());
                    temp = "";
                }

            }

            return plainText;
        }
}

}
