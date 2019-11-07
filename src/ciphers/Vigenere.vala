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

        public string encrypt (string plain_text, string key, bool preserve_case) {
            int msg_len = plain_text.char_count ();
            int key_len = key.char_count ();
            string cipher_text = "";
            string new_key = "";

            string text_temp = plain_text.up ();
            string key_temp = key.up ();

            //converting to utf format for accesibility
            text_temp.to_utf8 ();
            key_temp.to_utf8 ();
            unichar character;
            unichar temp;

            //generating new key
            int j = 0;
            int i = 0;
            for (i = 0; i < msg_len; ++i, ++j) {
                if (j == key_len) {
                    j = 0;
                }
                new_key = new_key.concat (key_temp[j].to_string ());
            }
            new_key = new_key.concat (' '.to_string ());

            for (i = 0; i < msg_len; ++i) {
                character = ((text_temp[i] + new_key[i]) % 26) + 'A';
                if (text_temp[i].isalpha ())
                    if (preserve_case == false) {
                    cipher_text = cipher_text.concat (character.to_string ());
                    }
                    else {
                        if (plain_text[i].isupper () == true) {
                            temp = character.toupper ();
                            cipher_text = cipher_text.concat (temp.to_string ());
                        }
                        else if (plain_text[i].islower () == true) {
                            temp = character.tolower ();
                            cipher_text = cipher_text.concat (temp.to_string ());
                        }
                    }
                else
                    cipher_text = cipher_text.concat (text_temp[i].to_string ());
            }
            return cipher_text;
        }

        public string decrypt (string cipher_text, string key, bool preserve_case) {
            int msg_len = cipher_text.char_count ();
            int key_len = key.char_count ();
            string plain_text = "";
            string new_key = "";

            string text_temp = cipher_text.up ();
            string key_temp = key.up ();
            //converting to utf format for accesibility
            text_temp.to_utf8 ();
            key_temp.to_utf8 ();
            unichar character;
            unichar temp;

            //generating new key
            int j = 0;
            int i = 0;
            for (i = 0; i < msg_len; ++i, ++j) {
                if (j == key_len)
                    j = 0;

                new_key = new_key.concat (key_temp[j].to_string ());
            }
            new_key = new_key.concat ('\0'.to_string ());

            for (i = 0; i < msg_len; ++i) {
                character = (((text_temp[i] - new_key[i]) + 26) % 26) + 'A';
                if (text_temp[i].isalpha ()) {
                    if (preserve_case == false) {
                    plain_text = plain_text.concat (character.to_string ());
                    }
                    else {
                        if (cipher_text[i].isupper () == true) {
                            temp = character.toupper ();
                            plain_text = plain_text.concat (temp.to_string ());
                        }
                        else if (cipher_text[i].islower () == true) {
                            temp = character.tolower ();
                            plain_text = plain_text.concat (temp.to_string ());
                        }
                    }
                } else {
                    plain_text = plain_text.concat (text_temp[i].to_string ());
                }
            }
            return plain_text;
        }
    }
}
