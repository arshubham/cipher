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

    public class Vigenere {

        public string encrypt (string plain_text, string key) {
            int msgLen = plain_text.char_count ();
            int keyLen = key.char_count ();
            string cipher_text = "";
            string newKey = "";

            string texttemp = plain_text.up ();
            string keytemp = key.up ();

            //converting to utf format for accesibility
            texttemp.to_utf8 ();
            keytemp.to_utf8 ();
            unichar character;

            //generating new key
            int j = 0;
            int i = 0;
            for (i = 0; i < msgLen; ++i, ++j) {
                if (j == keyLen) {
                    j = 0;
                }
                newKey = newKey.concat (keytemp[j].to_string ());
            }
            newKey = newKey.concat (' '.to_string ());

            for (i = 0; i < msgLen; ++i) {
                character = ((texttemp[i] + newKey[i]) % 26) + 'A';
                if (texttemp[i].isalpha ())
                    cipher_text = cipher_text.concat (character.to_string ());
                else
                    cipher_text = cipher_text.concat (texttemp[i].to_string ());
            }

            return cipher_text;
        }

        public string decrypt (string cipher_text, string key) {
            int msgLen = cipher_text.char_count ();
            int keyLen = key.char_count ();
            string plain_text = "";
            string newKey = "";

            string texttemp = cipher_text.up ();
            string keytemp = key.up ();
            //converting to utf format for accesibility
            texttemp.to_utf8 ();
            keytemp.to_utf8 ();
            unichar character;

            //generating new key
            int j = 0;
            int i = 0;
            for (i = 0; i < msgLen; ++i, ++j) {
                if (j == keyLen)
                    j = 0;

                newKey = newKey.concat (keytemp[j].to_string ());
            }
            newKey = newKey.concat ('\0'.to_string ());

            for (i = 0; i < msgLen; ++i) {
                character = (((texttemp[i] - newKey[i]) + 26) % 26) + 'A';
                if (texttemp[i].isalpha ()) {
                    plain_text = plain_text.concat (character.to_string ());
                } else {
                    plain_text = plain_text.concat (texttemp[i].to_string ());
                }
            }

            return plain_text;
        }
    }
}