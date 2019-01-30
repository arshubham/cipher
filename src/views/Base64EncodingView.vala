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


public class Base64EncodingView : Gtk.Grid  {

    private Cipher.Widgets.TextView plaintext_textview;
    private Cipher.Widgets.TextView ciphertext_textview;

    private Cipher.Widgets.Button enchiper_button;
    private Cipher.Widgets.Button dechiper_button;

    private string plainText;
    private string cipherText;

    public Base64EncodingView () {
        var base64 = new Cipher.Ciphers.Base64 ();

        enchiper_button.clicked.connect (() => {
            plainText = plaintext_textview.buffer.text;
            cipherText = "";
            ciphertext_textview.buffer.text = base64.encrypt (plainText);
        });

        dechiper_button.clicked.connect (() => {
            cipherText = ciphertext_textview.buffer.text;

            plainText = "";

            plaintext_textview.buffer.text = base64.decrypt (cipherText);
        });
    }


    construct {

        plaintext_textview = new Cipher.Widgets.TextView ();

        enchiper_button = new Cipher.Widgets.Button("Enchiper", Gtk.STYLE_CLASS_SUGGESTED_ACTION);

        ciphertext_textview = new Cipher.Widgets.TextView ();

        dechiper_button = new Cipher.Widgets.Button("Dechiper", Gtk.STYLE_CLASS_DESTRUCTIVE_ACTION);

        attach (new Cipher.Widgets.Label ("Plain Text"), 0, 0, 1, 1);
        attach (new Cipher.Widgets.ScrolledWindow (plaintext_textview), 0, 1, 1, 1);
        attach (enchiper_button, 0, 2, 1, 1);
        attach (new Cipher.Widgets.Label ("Cipher Text"), 0, 3, 1, 1);
        attach (new Cipher.Widgets.ScrolledWindow (ciphertext_textview), 0, 4, 1, 1);
        attach (dechiper_button, 0, 5, 1, 1);

    }

}

}