/*-
 * Copyright (c) 2019 Shubham Arora (https://github.com/arshubham/cipher)
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

namespace Cipher.Views {
    public class CipherView : Gtk.FlowBox {
        public CipherView () {
            Object(
                min_children_per_line: 2,
                max_children_per_line: 4,
                column_spacing: 12,
                row_spacing: 12,
                margin: 8,
                homogeneous: true
            );
        }

        construct {
            var caesarCipher = new Cipher.Widgets.CipherBox("Caesar Cipher", "caesar");
            var atbashCipher = new Cipher.Widgets.CipherBox("Atbash Cipher", "atbash");
            var polybiusSquareCipher = new Cipher.Widgets.CipherBox("Polybius Square Cipher", "polybius");
            var rot13Cipher = new Cipher.Widgets.CipherBox("ROT 13 Cipher", "rot13");
            var base64Cipher = new Cipher.Widgets.CipherBox("Base 64 Cipher", "base64");
            var hashs = new Cipher.Widgets.CipherBox("Hashes", "hash");
            var ascii = new Cipher.Widgets.CipherBox("Ascii", "ascii");

            add (caesarCipher);
            add (atbashCipher);
            add (polybiusSquareCipher);
            add (rot13Cipher);
            add (base64Cipher);
            add (hashs);
            add (ascii);
        }
    }
}