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

    public class VigenereCipherView : Gtk.Grid {

        private Cipher.Widgets.TextView plaintext_textview;
        private Cipher.Widgets.TextView ciphertext_textview;
        private Cipher.Widgets.KeyEntry key_entry;

        private Cipher.Widgets.Button encipher_button;
        private Cipher.Widgets.Button decipher_button;


        public VigenereCipherView () {
            var vigenere = new Cipher.Ciphers.Vigenere ();

            encipher_button.clicked.connect (() => {
                ciphertext_textview.buffer.text = vigenere.encrypt (plaintext_textview.buffer.text, key_entry.buffer.text);
            });

            decipher_button.clicked.connect (() => {
                plaintext_textview.buffer.text = vigenere.decrypt (ciphertext_textview.buffer.text, key_entry.buffer.text);
            });
        }

        construct {
            plaintext_textview = new Cipher.Widgets.TextView ();
            ciphertext_textview = new Cipher.Widgets.TextView ();
            key_entry = new Cipher.Widgets.KeyEntry();
            key_entry.valign = Gtk.Align.CENTER;

            

            encipher_button = new Cipher.Widgets.Button (_("Encipher"), Gtk.STYLE_CLASS_SUGGESTED_ACTION);
            decipher_button = new Cipher.Widgets.Button (_("Decipher"), Gtk.STYLE_CLASS_DESTRUCTIVE_ACTION);

            encipher_button.valign = Gtk.Align.CENTER;

            var box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            box.margin_top = 10;
            box.valign = Gtk.Align.CENTER;
            box.pack_start (new Cipher.Widgets.Label (_("Key: ")), false, false, 0);
            box.pack_start (key_entry, false, true, 0);

            attach (new Cipher.Widgets.Label (_("Plain Text")), 0, 1, 1, 1);
            attach (new Cipher.Widgets.ScrolledWindow (plaintext_textview), 0, 2, 1, 1);
            attach (box, 0, 3, 1, 1);
            attach (encipher_button, 0, 3, 1, 1);
            attach (new Cipher.Widgets.Label (_("Cipher Text")), 0, 4, 1, 1);
            attach (new Cipher.Widgets.ScrolledWindow (ciphertext_textview), 0, 5, 1, 1);
            attach (decipher_button, 0, 6, 1, 1);
        }
    }
}
