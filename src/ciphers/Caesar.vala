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

    public class Caesar {

        public int getComboBoxValue (Gtk.ComboBox comboBox, Gtk.ListStore list_store) {
            Gtk.TreeIter iterator;
            Value value;
            comboBox.get_active_iter (out iterator);
            list_store.get_value (iterator, 0, out value);
            return (int) value;
        }
    
        public string encryptCaeser (string plainText, int shift) {
            string cipherText = "";
            unichar character;
            
            for (int i = 0; plainText.get_next_char (ref i, out character); ) {
                if (character >= 'A' && character <= 'Z') {
                    character = (character + shift > 'Z') ? (character + shift) - 26 : (character + shift);
                } else if (character >= 'a' && character <= 'z') {
                    character = (character + shift > 'z') ? (character + shift) - 26 : (character + shift);
                }
        
            cipherText = cipherText.concat (character.to_string());
            }

            return cipherText;
        }
    
        public string decryptCaeser (string cipherText, int shift) {
            string plainText = "";
            unichar character;
            for (int i = 0; cipherText.get_next_char (ref i, out character);) {
                if (character >= 'A' && character <= 'Z') {
                    character = (character - shift < 'A') ? (character - shift) + 26 : (character - shift);
                } else if (character >= 'a' && character <= 'z') {
                    character = (character - shift < 'a') ? (character - shift) + 26 : (character - shift);
                }
    
            plainText = plainText.concat (character.to_string());
            }
            return plainText;
        }
    }
}