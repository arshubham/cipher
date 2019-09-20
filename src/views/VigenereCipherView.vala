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
        private Cipher.Widgets.Entry key_entry;

        private Cipher.Widgets.Button encipher_button;
        private Cipher.Widgets.Button decipher_button;
        private Granite.Widgets.Toast keynull_toast;
        private Gtk.Switch switcher;


        public VigenereCipherView () {
            var vigenere = new Cipher.Ciphers.Vigenere ();

            encipher_button.clicked.connect (() => {
                if (key_entry.buffer.text == "") {
                    keynull_toast.send_notification ();
                    return;
                }
                ciphertext_textview.buffer.text =
                vigenere.encrypt (plaintext_textview.buffer.text, key_entry.buffer.text, switcher.active);

            });

            decipher_button.clicked.connect (() => {
                if (key_entry.buffer.text == "") {
                    keynull_toast.send_notification ();
                    return;
                }
                plaintext_textview.buffer.text =
                vigenere.decrypt (ciphertext_textview.buffer.text, key_entry.buffer.text, switcher.active);

            });
        }

        construct {
            plaintext_textview = new Cipher.Widgets.TextView ();
            ciphertext_textview = new Cipher.Widgets.TextView ();
            key_entry = new Cipher.Widgets.Entry ();
            key_entry.editable = true;
            key_entry.valign = Gtk.Align.CENTER;
            keynull_toast = new Granite.Widgets.Toast (_("Key must be at least 1 character long"));
            switcher = new Gtk.Switch ();


            encipher_button = new Cipher.Widgets.Button (_("Encipher"), Gtk.STYLE_CLASS_SUGGESTED_ACTION);
            decipher_button = new Cipher.Widgets.Button (_("Decipher"), Gtk.STYLE_CLASS_DESTRUCTIVE_ACTION);

            encipher_button.valign = Gtk.Align.CENTER;

            var box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            box.margin_top = 8;
            box.valign = Gtk.Align.CENTER;
            box.pack_start (new Cipher.Widgets.Label (_("Key: ")), false, false, 0);
            box.pack_start (key_entry, false, true, 0);
            box.pack_start (new Cipher.Widgets.Label (_("Preserve Case: ")), false, false, 0);
            box.pack_start (switcher, false, true, 0);

            var grid = new Gtk.Grid ();
            grid.attach (new Cipher.Widgets.Label (_("Plain Text")), 0, 1, 1, 1);
            grid.attach (new Cipher.Widgets.ScrolledWindow (plaintext_textview), 0, 2, 1, 1);
            grid.attach (box, 0, 3, 1, 1);
            grid.attach (encipher_button, 0, 3, 1, 1);
            grid.attach (new Cipher.Widgets.Label (_("Cipher Text")), 0, 4, 1, 1);
            grid.attach (new Cipher.Widgets.ScrolledWindow (ciphertext_textview), 0, 5, 1, 1);
            grid.attach (decipher_button, 0, 6, 1, 1);
            attach (grid, 0, 0, 1, 1);
            attach (keynull_toast, 0, 0, 1, 1);
        }
    }
}
