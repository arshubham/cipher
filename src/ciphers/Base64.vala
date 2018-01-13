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

    public class Base64 {

        public string encryptBase64 (string plainText) {
            string cipherText = "";
                cipherText = cipherText.concat (GLib.Base64.encode (plainText.data));

            return cipherText;
        }

        public string decryptBase64 (string cipherText) {
            string plainText = "";
                plainText = plainText.concat ((string) GLib.Base64.decode (cipherText));
            return plainText;
        }
    }
}
