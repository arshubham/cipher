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


public class AtbashCipherView : Gtk.Grid  {

    private Gtk.TextView plainTextTextView;
    private Gtk.TextView cipherTextTextView;

    private Gtk.ScrolledWindow plainTextScrolledWindow;
    private Gtk.ScrolledWindow cipherTextScrolledWindow;

    private Gtk.Button enchiperButton;
    private Gtk.Button dechiperButton;

    private Gtk.Box topBox;

    private Gtk.Label labelPlainText;
    private Gtk.Label labelCipherText;
    private Gtk.Label labelTitle;

    private string plainText;
    private string cipherText;



    construct {

        labelTitle = new Gtk.Label ("Atbash Cipher");
        labelTitle.halign = Gtk.Align.CENTER;
        labelTitle.margin_top = 6;
        labelTitle.margin_bottom = 6;
        labelTitle.margin_start = 24;
        labelTitle.margin_end = 24;
        labelTitle.get_style_context ().add_class (Granite.STYLE_CLASS_H1_LABEL);

        Gtk.Button button = new Gtk.Button.from_icon_name ("dialog-information-symbolic");
        button.get_style_context().add_class("info_button");

        topBox = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        topBox.set_center_widget (labelTitle);
        topBox.pack_end (button, false, false, 0);

        labelPlainText = new Gtk.Label ("<b>%s</b>".printf (_("Plain Text")));
        labelPlainText.set_use_markup (true);
        labelPlainText.margin = 6;
        labelPlainText.halign = Gtk.Align.START;
        labelPlainText.set_line_wrap (true);

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

        labelCipherText = new Gtk.Label ("<b>%s</b>".printf (_("Cipher Text")));
        labelCipherText.set_use_markup (true);
        labelCipherText.margin = 6;
        labelCipherText.halign = Gtk.Align.START;
        labelCipherText.set_line_wrap (true);

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

        attach (topBox, 0, 0, 1, 1);
        attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 1, 1, 1);
        attach (labelPlainText, 0, 2, 1, 1);
        attach (plainTextScrolledWindow, 0, 4, 1, 1);
        attach (enchiperButton, 0, 5, 1, 1);
        attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 6, 1, 1);
        attach (labelCipherText, 0, 7, 1, 1);
        attach (cipherTextScrolledWindow, 0, 8, 1, 1);
        attach (dechiperButton, 0, 9, 1, 1);

        var atbash = new Cipher.Ciphers.Atbash ();

        button.clicked.connect (() => {
         try {
                        AppInfo.launch_default_for_uri ("https://wikipedia.org/wiki/Atbash", null);
                    } catch (Error e) {
                        warning (e.message);
                    }
        });

        enchiperButton.clicked.connect (() => {
            plainText = plainTextTextView.buffer.text;
            cipherText = "";
            cipherTextTextView.buffer.text = atbash.encryptAtbash (plainText);
        });

        dechiperButton.clicked.connect (() => {
            cipherText = cipherTextTextView.buffer.text;

            plainText = "";

            plainTextTextView.buffer.text = atbash.decryptAtbash (cipherText);
        });
    }

}

}
