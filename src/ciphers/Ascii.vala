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
            //  for (int i = 0; plainText.get_next_char (ref i, out character); ) {
            //      asciiNum = (int) character;

            //      cipherText = cipherText.concat (asciiNum.to_string (), " ");
            //  }
            cipherText = plainText.to_ascii (null);
            return cipherText;
        }
    
        public string decryptAscii (string cipherText) {
            string plainText = "";
            unichar character, character_next , character_next_next, c;
            unichar array[] = {};
            for (int i = 0; cipherText.get_next_char (ref i, out character); ) {
                    cipherText.get_next_char (ref i, out character_next);
                    cipherText.get_next_char (ref i, out character_next_next);

                    string c1 = character.to_string ();
                    string c2 = character_next.to_string ();
                    string c3 = character_next_next.to_string ();

                    if (c3 != " ")
                    c = (unichar) int.parse(c1.concat (c2));
                    else 
                    c = (unichar) int.parse(c1.concat (c2,c3));

                    plainText = plainText.concat (c.to_string ());
                            
            }

                
        

            return plainText;
        }}
    
}