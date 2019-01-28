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


public class ROT13View : Gtk.Grid  {


    private Gtk.TextView plainTextTextView;
    private Gtk.TextView cipherTextTextView;

    private Gtk.ScrolledWindow plainTextScrolledWindow;
    private Gtk.ScrolledWindow cipherTextScrolledWindow;

    private Gtk.Button enchiperButton;
    private Gtk.Button dechiperButton;

    private string plainText;
    private string cipherText;



    construct {

        var labelPlainText = new Cipher.Widgets.Label ("Plain Text");

        plainTextTextView = new Gtk.TextView ();
        plainTextTextView.left_margin = 1;
        plainTextTextView.set_wrap_mode (Gtk.WrapMode.WORD);
        plainTextScrolledWindow = new Gtk.ScrolledWindow (null, null);
        plainTextScrolledWindow.expand = true;
        plainTextScrolledWindow.get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);
        plainTextScrolledWindow.get_style_context ().add_class ("textview");
        plainTextScrolledWindow.add (plainTextTextView);

        enchiperButton = new Gtk.Button.with_label (_("Enchiper"));
        enchiperButton.margin = 6;
        enchiperButton.halign = Gtk.Align.END;

        var labelCipherText = new Cipher.Widgets.Label ("Cipher Text");


        cipherTextTextView = new Gtk.TextView ();
        cipherTextTextView.left_margin = 1;
        cipherTextTextView.set_wrap_mode (Gtk.WrapMode.WORD);
        cipherTextScrolledWindow = new Gtk.ScrolledWindow (null, null);
        cipherTextScrolledWindow.expand = true;
        cipherTextScrolledWindow.get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);
        cipherTextScrolledWindow.get_style_context ().add_class ("textview");        cipherTextScrolledWindow.add (cipherTextTextView);

        dechiperButton = new Gtk.Button.with_label (_("Dechiper"));
        dechiperButton.margin = 6;
        dechiperButton.halign = Gtk.Align.END;

        attach (labelPlainText, 0, 2, 1, 1);
        attach (plainTextScrolledWindow, 0, 4, 1, 1);
        attach (enchiperButton, 0, 5, 1, 1);
        attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 6, 1, 1);
        attach (labelCipherText, 0, 7, 1, 1);
        attach (cipherTextScrolledWindow, 0, 8, 1, 1);
        attach (dechiperButton, 0, 9, 1, 1);


        var rot13 = new Cipher.Ciphers.Rot13 ();

        //  button.clicked.connect (() => {
        //   try {
        //                  AppInfo.launch_default_for_uri ("https://wikipedia.org/wiki/ROT13", null);
        //              } catch (Error e) {
        //                  warning (e.message);
        //              }
        //  });

        enchiperButton.clicked.connect (() => {
            plainText = plainTextTextView.buffer.text;
            cipherText = "";
            cipherTextTextView.buffer.text = rot13.encrypt (plainText);
        });

        dechiperButton.clicked.connect (() => {
            cipherText = cipherTextTextView.buffer.text;

            plainText = "";

            plainTextTextView.buffer.text = rot13.decrypt (cipherText);
        });
    }

}

}
