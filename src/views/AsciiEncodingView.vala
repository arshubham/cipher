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

public class AsciiEncodingView : Gtk.Grid  {
    private Gtk.TextView plainTextTextView;
    private Gtk.TextView cipherTextTextView;

    private Gtk.Button enchiperButton;
    private Gtk.Button dechiperButton;

    private string plainText;
    private string cipherText;

    public AsciiEncodingView () {
        var ascii = new Cipher.Ciphers.Ascii ();

        enchiperButton.clicked.connect (() => {
            plainText = plainTextTextView.buffer.text;
            cipherText = "";
            cipherTextTextView.buffer.text = ascii.encrypt (plainText);
        });

        dechiperButton.clicked.connect (() => {
            cipherText = cipherTextTextView.buffer.text;

            plainText = "";

            plainTextTextView.buffer.text = ascii.decrypt (cipherText);
        });
    }

    construct {

        plainTextTextView = new Cipher.Widgets.TextView ();
        var plainTextScrolledWindow = new Cipher.Widgets.ScrolledWindow ();
        plainTextScrolledWindow.add (plainTextTextView);

        enchiperButton = new Cipher.Widgets.Button("Enchiper", Gtk.STYLE_CLASS_SUGGESTED_ACTION);

        cipherTextTextView = new Cipher.Widgets.TextView ();
        var cipherTextScrolledWindow = new Cipher.Widgets.ScrolledWindow ();
        cipherTextScrolledWindow.add (cipherTextTextView);

        dechiperButton = new Cipher.Widgets.Button("Dechiper", Gtk.STYLE_CLASS_DESTRUCTIVE_ACTION);

        attach (new Cipher.Widgets.Label ("Plain Text"), 0, 0, 1, 1);
        attach (plainTextScrolledWindow, 0, 1, 1, 1);
        attach (enchiperButton, 0, 2, 1, 1);
        attach (new Cipher.Widgets.Label ("Cipher Text"), 0, 3, 1, 1);
        attach (cipherTextScrolledWindow, 0, 4, 1, 1);
        attach (dechiperButton, 0, 5, 1, 1);   
    }

    }

}
