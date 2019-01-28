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
            private Cipher.Widgets.CipherBox caesarCipherBox;
            private Cipher.Widgets.CipherBox atbashCipherBox;
            private Cipher.Widgets.CipherBox polybiusSquareCipherBox;
            private Cipher.Widgets.CipherBox rot13CipherBox;
            private Cipher.Widgets.CipherBox base64CipherBox;
            private Cipher.Widgets.CipherBox hashsBox;
            private Cipher.Widgets.CipherBox asciiBox;

            public signal void switch_view (string view);
            

        public CipherView () {
            Object(
                min_children_per_line: 2,
                max_children_per_line: 4,
                column_spacing: 12,
                row_spacing: 12,
                margin: 8,
                homogeneous: true
            );

            

            caesarCipherBox.clicked.connect(() => {
                switch_view("caesar_cipher");
            });

            atbashCipherBox.clicked.connect(() => {
                switch_view("atbash_cipher");
            });

            polybiusSquareCipherBox.clicked.connect(() => {
                switch_view("polybius_cipher");
            });

            rot13CipherBox.clicked.connect(() => {
                switch_view("rot13");
            });

            base64CipherBox.clicked.connect(() => {
                switch_view("base64");
            });

            hashsBox.clicked.connect(() => {
                switch_view("hash");
            });

            asciiBox.clicked.connect(() => {
                switch_view("ascii");
            });
        }

        construct {
            caesarCipherBox = new Cipher.Widgets.CipherBox("Caesar Cipher", "caesar");
            atbashCipherBox = new Cipher.Widgets.CipherBox("Atbash Cipher", "atbash");
            polybiusSquareCipherBox = new Cipher.Widgets.CipherBox("Polybius Square Cipher", "polybius");
            rot13CipherBox = new Cipher.Widgets.CipherBox("ROT 13 Cipher", "rot13");
            base64CipherBox = new Cipher.Widgets.CipherBox("Base 64 Cipher", "base64");
            hashsBox = new Cipher.Widgets.CipherBox("Hashes", "hash");
            asciiBox = new Cipher.Widgets.CipherBox("Ascii", "ascii");

            add (caesarCipherBox);
            add (atbashCipherBox);
            add (polybiusSquareCipherBox);
            add (rot13CipherBox);
            add (base64CipherBox);
            add (hashsBox);
            add (asciiBox);
            
        }
    }
}