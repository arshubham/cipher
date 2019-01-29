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


public class CaesarCipherView : Gtk.Grid  {

    private Gtk.TextView plainTextTextView;
    private Gtk.TextView cipherTextTextView;

    private Gtk.ComboBoxText shiftComboBox;

    private Gtk.Box box;

    private Gtk.Button enchiperButton;
    private Gtk.Button dechiperButton;

    private int shift;
    private string plainText;
    private string cipherText;

    public CaesarCipherView () {
        var caesar = new Cipher.Ciphers.Caesar ();

        enchiperButton.clicked.connect (() => {
            plainText = plainTextTextView.buffer.text;
            shift = int.parse (shiftComboBox.get_active_text ());

            cipherText = "";
            cipherTextTextView.buffer.text = caesar.encrypt (plainText, shift);
        });

        dechiperButton.clicked.connect (() => {
            cipherText = cipherTextTextView.buffer.text;
            shift = int.parse (shiftComboBox.get_active_text ());

            plainText = "";
            plainTextTextView.buffer.text = caesar.decrypt (cipherText, shift);
        });
    }

    construct {

        plainTextTextView = new Cipher.Widgets.TextView ();
        var plainTextScrolledWindow = new Cipher.Widgets.ScrolledWindow ();
        plainTextScrolledWindow.add (plainTextTextView);
        
        shiftComboBox = new Gtk.ComboBoxText ();
        shiftComboBox.margin = 6;

        for (int i = 1; i <= 26; i++ ) {
            shiftComboBox.append (i.to_string (), i.to_string ());
        }
        shiftComboBox.active_id = "0";
        shiftComboBox.active = 0;

        enchiperButton = new Cipher.Widgets.Button("Enchiper", Gtk.STYLE_CLASS_SUGGESTED_ACTION);

        cipherTextTextView = new Cipher.Widgets.TextView ();
        var cipherTextScrolledWindow = new Cipher.Widgets.ScrolledWindow ();
        cipherTextScrolledWindow.add (cipherTextTextView);

        dechiperButton = new Cipher.Widgets.Button("Dechiper", Gtk.STYLE_CLASS_DESTRUCTIVE_ACTION);

        box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        box.pack_start (new Cipher.Widgets.Label ("Number of letters to shift to the right: "), false, false, 0);
        box.pack_start (shiftComboBox, false, false, 0);

        attach (new Cipher.Widgets.Label ("Plain Text"), 0, 1, 1, 1);
        attach (plainTextScrolledWindow, 0, 2, 1, 1);
        attach (box, 0, 3, 1, 1);
        attach (enchiperButton, 0, 3, 1, 1);
        attach (new Cipher.Widgets.Label ("Cipher Text"), 0, 4, 1, 1);
        attach (cipherTextScrolledWindow, 0, 5, 1, 1);
        attach (dechiperButton, 0, 6, 1, 1);
    }

}

}
