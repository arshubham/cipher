/*-
 * Copyright (character) 2017 Shubham Arora (https://github.com/arshubham/cipher)
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

using Cipher.Widgets;
using Cipher.Configs;
using Cipher.Ciphers;

namespace Cipher.Views {


public class KeywordCipherView : Gtk.Grid  {
    private Gtk.TextView plainTextTextView;
    private Gtk.TextView cipherTextTextView;

    private Gtk.Entry keywordEntry;

    private Gtk.ScrolledWindow plainTextScrolledWindow;
    private Gtk.ScrolledWindow cipherTextScrolledWindow;

    private Gtk.Box box;

    private Gtk.Button enchiperButton;
    private Gtk.Button dechiperButton;

    private Gtk.Label labelPlainText;
    private Gtk.Label labelCipherText;
    private Gtk.Label labelKeyword;
    private Gtk.Label labelTitle;

    private string keywordText;
    private string plainText;
    private string cipherText;

    construct {

        labelTitle = new Gtk.Label ("Keyword Cipher");
        labelTitle.halign = Gtk.Align.CENTER;
        labelTitle.margin_top = 6;
        labelTitle.margin_bottom = 6;
        labelTitle.margin_start = 24;
        labelTitle.margin_end = 24;
        labelTitle.get_style_context ().add_class (Granite.STYLE_CLASS_H1_LABEL);


        labelPlainText = new Gtk.Label ("<b>Plain Text</b>");
        labelPlainText.set_use_markup (true);
        labelPlainText.margin = 6;
        labelPlainText.halign = Gtk.Align.START;
        labelPlainText.set_line_wrap (true);

        plainTextTextView = new Gtk.TextView ();
        plainTextScrolledWindow = new Gtk.ScrolledWindow (null, null);
        plainTextScrolledWindow.expand = true;
        plainTextScrolledWindow.get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);
        plainTextScrolledWindow.add (plainTextTextView);

        labelKeyword = new Gtk.Label ("<b>Keyword: </b>");
        labelKeyword.set_use_markup (true);
        labelKeyword.margin = 6;
        labelKeyword.halign = Gtk.Align.START;
        labelKeyword.set_line_wrap (true);

        keywordEntry = new Gtk.Entry ();

        enchiperButton = new Gtk.Button.with_label ("Enchiper");
        enchiperButton.margin = 6;
        enchiperButton.halign = Gtk.Align.END;

        labelCipherText = new Gtk.Label ("<b>Cipher Text</b>");
        labelCipherText.set_use_markup (true);
        labelCipherText.margin = 6;
        labelCipherText.halign = Gtk.Align.START;
        labelCipherText.set_line_wrap (true);

        cipherTextTextView = new Gtk.TextView ();

        cipherTextScrolledWindow = new Gtk.ScrolledWindow (null, null);
        cipherTextScrolledWindow.expand = true;
        cipherTextScrolledWindow.get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);
        cipherTextScrolledWindow.add (cipherTextTextView);
        
        dechiperButton = new Gtk.Button.with_label ("Dechiper");
        dechiperButton.margin = 6;
        dechiperButton.halign = Gtk.Align.END;
        box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        box.pack_start (labelKeyword, false, false, 0);
        box.pack_start (keywordEntry, false, false, 0);

        attach (labelTitle, 0, 0, 1, 1);
        attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 1, 1, 1);
        attach (labelPlainText, 0, 2, 1, 1);
        attach (plainTextScrolledWindow, 0, 4, 1, 1);
        attach (box, 0, 5, 1, 1);
        attach (enchiperButton, 0, 5, 1, 1);
        attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 6, 1, 1);
        attach (labelCipherText, 0, 7, 1, 1);
        attach (cipherTextScrolledWindow, 0, 8, 1, 1);
        attach (dechiperButton, 0, 9, 1, 1);
        
        Keyword keyword = new Keyword ();

        enchiperButton.clicked.connect (() => {
            plainText = plainTextTextView.buffer.text;
            keywordText = keywordEntry.text;


            cipherText = ""; 
            cipherTextTextView.buffer.text = keyword.encryptKeyword (plainText, keywordText);
        });

        //  dechiperButton.clicked.connect (() => {
        //      cipherText = cipherTextTextView.buffer.text;
        //      keywordText = keywordEntry.text;

        //      plainText = "";
        //      plainTextTextView.buffer.text = keyword.decryptKeyword (cipherText, keyword);
        //  });
    }

}

}