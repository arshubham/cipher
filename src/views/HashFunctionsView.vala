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

    public class HashFunctionsView : Gtk.Grid {

        private Cipher.Widgets.TextView plaintext_textview;

        private Cipher.Widgets.Button encipher_button;

        private Cipher.Widgets.Entry md5_entry;
        private Cipher.Widgets.Entry sha1_entry;
        private Cipher.Widgets.Entry sha256_entry;
        private Cipher.Widgets.Entry sha384_entry;
        private Cipher.Widgets.Entry sha512_entry;

        public HashFunctionsView () {
            encipher_button.clicked.connect (() => {
                var plain_text = plaintext_textview.buffer.text;

                md5_entry.text = GLib.Checksum.compute_for_string (ChecksumType.MD5, plain_text, plain_text.length);
                sha1_entry.text = GLib.Checksum.compute_for_string (ChecksumType.SHA1, plain_text, plain_text.length);
                sha256_entry.text = GLib.Checksum.compute_for_string (ChecksumType.SHA256, plain_text, plain_text.length);
                sha384_entry.text = GLib.Checksum.compute_for_string (ChecksumType.SHA384, plain_text, plain_text.length);
                sha512_entry.text = GLib.Checksum.compute_for_string (ChecksumType.SHA512, plain_text, plain_text.length);
            });
        }

        construct {
            plaintext_textview = new Cipher.Widgets.TextView ();

            encipher_button = new Cipher.Widgets.Button (_("Generate Hash"), Gtk.STYLE_CLASS_SUGGESTED_ACTION);

            md5_entry = new Cipher.Widgets.Entry ();
            sha1_entry = new Cipher.Widgets.Entry ();
            sha256_entry = new Cipher.Widgets.Entry ();
            sha384_entry = new Cipher.Widgets.Entry ();
            sha512_entry = new Cipher.Widgets.Entry ();

            var hash_entry_grid = new Gtk.Grid ();
            hash_entry_grid.column_homogeneous = true;

            hash_entry_grid.attach (new Cipher.Widgets.Label ("MD5"), 0, 0, 1, 1);
            hash_entry_grid.attach (md5_entry, 1, 0, 4, 1);
            hash_entry_grid.attach (new Cipher.Widgets.Label ("SHA1"), 0, 1, 1, 1);
            hash_entry_grid.attach (sha1_entry, 1, 1, 4, 1);
            hash_entry_grid.attach (new Cipher.Widgets.Label ("SHA256"), 0, 2, 1, 1);
            hash_entry_grid.attach (sha256_entry, 1, 2, 4, 1);
            hash_entry_grid.attach (new Cipher.Widgets.Label ("SHA384"), 0, 3, 1, 1);
            hash_entry_grid.attach (sha384_entry, 1, 3, 4, 1);
            hash_entry_grid.attach (new Cipher.Widgets.Label ("SHA512"), 0, 4, 1, 1);
            hash_entry_grid.attach (sha512_entry, 1, 4, 4, 1);

            attach (new Cipher.Widgets.Label (_("Plain Text")), 0, 0, 1, 1);
            attach (new Cipher.Widgets.ScrolledWindow (plaintext_textview), 0, 1, 1, 1);
            attach (encipher_button, 0, 2, 1, 1);
            attach (hash_entry_grid, 0, 3, 1, 1);
        }
    }
}
