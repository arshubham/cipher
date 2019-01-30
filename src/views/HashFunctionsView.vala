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

    private Cipher.Widgets.TextView plainTextTextView;

    private Gtk.Button enchiperButton;

    private string plainText;

    private Cipher.Widgets.Entry md5Entry;
    private Cipher.Widgets.Entry sha1Entry;
    private Cipher.Widgets.Entry sha256Entry;

    public HashFunctionsView () {
        enchiperButton.clicked.connect (() => {
            plainText = plainTextTextView.buffer.text;

            string hashmd5 = GLib.Checksum.compute_for_string (ChecksumType.MD5, plainText, plainText.length);
            string hashsha1 = GLib.Checksum.compute_for_string (ChecksumType.SHA1, plainText, plainText.length);
            string hashsha256 = GLib.Checksum.compute_for_string (ChecksumType.SHA256, plainText, plainText.length);

            md5Entry.text = hashmd5;
            sha1Entry.text = hashsha1;
            sha256Entry.text = hashsha256;
        });
    }

    construct {

        plainTextTextView = new Cipher.Widgets.TextView ();
        var plainTextScrolledWindow = new Cipher.Widgets.ScrolledWindow ();
        plainTextScrolledWindow.add (plainTextTextView);

        enchiperButton = new Cipher.Widgets.Button("Generate Hash", Gtk.STYLE_CLASS_SUGGESTED_ACTION);
        
        md5Entry = new Cipher.Widgets.Entry ();
        sha1Entry = new Cipher.Widgets.Entry ();
        sha256Entry = new Cipher.Widgets.Entry ();

        var hashgrid = new Gtk.Grid();
        hashgrid.column_homogeneous = true;

        hashgrid.attach(new Cipher.Widgets.Label ("MD5"), 0, 0, 1, 1);
        hashgrid.attach(md5Entry, 1, 0, 4, 1);
        hashgrid.attach(new Cipher.Widgets.Label ("SHA1"), 0, 1, 1, 1);
        hashgrid.attach(sha1Entry, 1, 1, 4, 1);
        hashgrid.attach(new Cipher.Widgets.Label ("SHA256"), 0, 2, 1, 1);
        hashgrid.attach(sha256Entry, 1, 2, 4, 1);

        attach (new Cipher.Widgets.Label ("Plain Text"), 0, 0, 1, 1);
        attach (plainTextScrolledWindow, 0, 1, 1, 1);
        attach (enchiperButton, 0, 2, 1, 1);
        attach (hashgrid, 0, 3, 1, 1);
}}

}
