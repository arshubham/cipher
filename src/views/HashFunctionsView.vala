/*-
 * Copyright (c) 2018-2019 Shubham Arora (https://github.com/arshubham/cipher)
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


public class HashFunctionsView : Gtk.Grid  {

    private Cipher.Widgets.TextView plaintext_textview;

    private Cipher.Widgets.Button enchiper_button;

    private Cipher.Widgets.Entry md5_Entry;
    private Cipher.Widgets.Entry sha1_Entry;
    private Cipher.Widgets.Entry sha256_Entry;

    public HashFunctionsView () {
        enchiper_button.clicked.connect (() => {
            var plain_text = plaintext_textview.buffer.text;

            md5_Entry.text = GLib.Checksum.compute_for_string (ChecksumType.MD5, plain_text, plain_text.length);
            sha1_Entry.text = GLib.Checksum.compute_for_string (ChecksumType.SHA1, plain_text, plain_text.length);
            sha256_Entry.text = GLib.Checksum.compute_for_string (ChecksumType.SHA256, plain_text, plain_text.length);
        });
    }

    construct {

        plaintext_textview = new Cipher.Widgets.TextView ();

        enchiper_button = new Cipher.Widgets.Button("Generate Hash", Gtk.STYLE_CLASS_SUGGESTED_ACTION);
        
        md5_Entry = new Cipher.Widgets.Entry ();
        sha1_Entry = new Cipher.Widgets.Entry ();
        sha256_Entry = new Cipher.Widgets.Entry ();

        var hashgrid = new Gtk.Grid();
        hashgrid.column_homogeneous = true;

        hashgrid.attach(new Cipher.Widgets.Label ("MD5"), 0, 0, 1, 1);
        hashgrid.attach(md5_Entry, 1, 0, 4, 1);
        hashgrid.attach(new Cipher.Widgets.Label ("SHA1"), 0, 1, 1, 1);
        hashgrid.attach(sha1_Entry, 1, 1, 4, 1);
        hashgrid.attach(new Cipher.Widgets.Label ("SHA256"), 0, 2, 1, 1);
        hashgrid.attach(sha256_Entry, 1, 2, 4, 1);

        attach (new Cipher.Widgets.Label ("Plain Text"), 0, 0, 1, 1);
        attach (new Cipher.Widgets.ScrolledWindow (plaintext_textview), 0, 1, 1, 1);
        attach (enchiper_button, 0, 2, 1, 1);
        attach (hashgrid, 0, 3, 1, 1);
}}

}