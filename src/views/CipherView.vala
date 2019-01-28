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

            var atbash_cipher = new AtbashCipherView ();
            var caesar_cipher = new CaesarCipherView ();
            var polybius_cipher = new PolybiusSquareCipherView ();
            var ascii = new AsciiView ();
            var rot13 = new ROT13View ();
            var base64 = new Base64View ();
            var hash = new HashView ();

            var main_stack = new Gtk.Stack ();
            main_stack.add_titled (welcome, "welcome", _("Welcome"));
            main_stack.add_titled (caesar_cipher, "caesar", _("Caesar Shift Cipher"));
            main_stack.add_titled (atbash_cipher, "atbash", _("Atbash Cipher"));
            main_stack.add_titled (polybius_cipher, "polybius", _("Polybius Square Cipher"));
            main_stack.add_titled (rot13, "rot13", _("ROT13 Cipher"));
            main_stack.add_titled (base64, "base64", _("Base64 Encoding"));
            main_stack.add_titled (ascii, "ascii", _("Ascii Encoding"));
            main_stack.add_titled (hash, "hash", _("Hashes"));
        }
    }
}