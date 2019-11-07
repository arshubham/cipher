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

namespace Cipher.Views {

    public class CipherView : Gtk.FlowBox {

        private Cipher.Widgets.CipherBox caesar_cipher_box;
        private Cipher.Widgets.CipherBox atbash_cipher_box;
        private Cipher.Widgets.CipherBox polybius_square_cipher_box;
        private Cipher.Widgets.CipherBox rot13_cipher_box;
        private Cipher.Widgets.CipherBox base64_encoding_box;
        private Cipher.Widgets.CipherBox hash_functions_box;
        private Cipher.Widgets.CipherBox ascii_encoding_box;
        private Cipher.Widgets.CipherBox vigenere_cipher_box;
        public signal void switch_view (string view, string title, string uri);

        public CipherView () {
            Object (
                column_spacing: 12,
                homogeneous: true,
                margin: 8,
                max_children_per_line: 4,
                min_children_per_line: 2,
                row_spacing: 12
            );

            caesar_cipher_box.clicked.connect (() => {
                switch_view ("caesar_cipher", caesar_cipher_box.get_title (), "https://wikipedia.org/wiki/Caesar_cipher");
            });

            atbash_cipher_box.clicked.connect (() => {
                switch_view ("atbash_cipher", atbash_cipher_box.get_title (), "https://wikipedia.org/wiki/Atbash");
            });

            polybius_square_cipher_box.clicked.connect (() => {
                switch_view ("polybius_cipher", polybius_square_cipher_box.get_title (), "https://wikipedia.org/wiki/Polybius_square");
            });

            rot13_cipher_box.clicked.connect (() => {
                switch_view ("rot13_cipher", rot13_cipher_box.get_title (), "https://wikipedia.org/wiki/ROT13");
            });

            base64_encoding_box.clicked.connect (() => {
                switch_view ("base64_encoding", base64_encoding_box.get_title (), "https://wikipedia.org/wiki/Base64");
            });

            hash_functions_box.clicked.connect (() => {
                switch_view ("hash_functions", hash_functions_box.get_title (), "https://wikipedia.org/wiki/Hash_function");
            });

            ascii_encoding_box.clicked.connect (() => {
                switch_view ("ascii_encoding", ascii_encoding_box.get_title (), "https://wikipedia.org/wiki/ASCII");
            });

            vigenere_cipher_box.clicked.connect (() => {
                switch_view ("vigenere_cipher", vigenere_cipher_box.get_title (), "https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher");
            });

        }

        construct {
            caesar_cipher_box = new Cipher.Widgets.CipherBox (_("Caesar Shift Cipher"), "caesar");
            atbash_cipher_box = new Cipher.Widgets.CipherBox (_("Atbash Cipher"), "atbash");
            polybius_square_cipher_box = new Cipher.Widgets.CipherBox (_("Polybius Square Cipher"), "polybius");
            rot13_cipher_box = new Cipher.Widgets.CipherBox (_("ROT13 Cipher"), "rot13");
            base64_encoding_box = new Cipher.Widgets.CipherBox (_("Base64 Encoding"), "base64");
            hash_functions_box = new Cipher.Widgets.CipherBox (_("Hash Functions"), "hash");
            ascii_encoding_box = new Cipher.Widgets.CipherBox (_("ASCII Encoding"), "ascii");
            vigenere_cipher_box = new Cipher.Widgets.CipherBox (_("Vigenere Cipher"), "vigenere");

            add (caesar_cipher_box);
            add (atbash_cipher_box);
            add (polybius_square_cipher_box);
            add (rot13_cipher_box);
            add (base64_encoding_box);
            add (hash_functions_box);
            add (ascii_encoding_box);
            add (vigenere_cipher_box);
        }
    }
}
