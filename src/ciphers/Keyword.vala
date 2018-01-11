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
using Gee;

namespace Cipher.Ciphers {

    public class Keyword {
        unichar substitutionArray[] = {};
        unichar alphabetArray[]= {};

        public unichar[] generateSubstitution (string keyword) {
            unichar character;

            var keywordSet = new HashSet<unichar> ();

            for (int i = 0; keyword.get_next_char (ref i, out character); ) {
                keywordSet.add (character.toupper ());
            }
            int i = 0;

            for (unichar c = 'A'  ; c <= 'Z' ; c++, i++) {
                alphabetArray[i] = c;
            }

            foreach (unichar c in keywordSet) {
                substitutionArray[i] = c;
                i++;
            }

            for (unichar c = 'A' ; c <= 'Z' ; c++) {
                if (!keywordSet.contains (c)) {
                    substitutionArray[i] = c;
                    i++;
                }
                
            }

            return substitutionArray;

        }

        //  public string encryptKeyword (string plainText, string keyword) {
        //      string cipherText = "";
        //      subArray = generateSubstitution (keyword);

        //      for ( int i =0 ; i < 26; i++ ) {
        //          stdout.printf ("%s", subArray[i].to_string ());
        //      }
          
 
        //      //  for (int i = 0; plainText.get_next_char (ref i, out character); ) {
               
        //      //      cipherText = cipherText.concat (character.to_string());
        //      //  }
        //      return cipherText;
        //  }
    
        //  public string decryptAtbash (string cipherText) {
        //      string plainText = "";
        //      unichar character;
        //      unichar subtractor;

        //      for (int i = 0; cipherText.get_next_char (ref i, out character); ) {
        //          if (character > 96 && character < 123) {
        //              subtractor = 2 * (character % 97);
        //              character = character + (25 - subtractor);
        //          }
        //          else if (character > 64 && character < 91) {
        //              subtractor = 2 * (character % 65);
        //              character = character + (25 - subtractor);
        //          }
        //          plainText = plainText.concat (character.to_string());
        //      }

        //      return plainText;
        //  }
    }
}