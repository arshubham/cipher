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

using Cipher.Widgets;
using Cipher.Configs;
using Cipher.Ciphers;

namespace Cipher.Views {


public class HashView : Gtk.Grid  {

    private Gtk.TextView plainTextTextView;

    private Gtk.ScrolledWindow plainTextScrolledWindow;

    private Gtk.Button enchiperButton;
    private Gtk.Button dechiperButton;

    private Gtk.Box topBox;

    private Gtk.Label labelPlainText;
    private Gtk.Label labelCipherText;
    private Gtk.Label labelTitle;

    private string plainText;

    private Gtk.Label md5Label;
    private Gtk.Entry md5Entry;

    private Gtk.Label sha1Label;
    private Gtk.Entry sha1Entry;

    private Gtk.Label sha256Label;
    private Gtk.Entry sha256Entry;



    construct {

        
        labelTitle = new Gtk.Label ("Hash functions");
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

        enchiperButton = new Gtk.Button.with_label (_("Generate Hash"));
        enchiperButton.margin = 6;
        enchiperButton.halign = Gtk.Align.END;

        Gtk.Grid md5grid = new Gtk.Grid();
        md5Label = new Gtk.Label ("<b>MD5</b>");
        md5Label.set_use_markup (true);
        md5Label.margin = 6;2019
        md5Label.halign = Gtk.Align.START;
        md5Entry = new Gtk.Entry ();
        md5Entry.editable = false;
        md5Entry.margin = 6;
        md5grid.column_homogeneous = true;
        md5grid.attach(md5Label, 0, 0, 1, 1);
        md5grid.attach(md5Entry, 1, 0, 4, 1);

        Gtk.Grid sha1grid = new Gtk.Grid();
        sha1Label = new Gtk.Label ("<b>SHA1</b>");
        sha1Label.set_use_markup (true);
        sha1Label.margin = 6;
        sha1Label.halign = Gtk.Align.START;
        sha1Entry = new Gtk.Entry ();
        sha1Entry.editable = false;
        sha1Entry.margin = 6;
        sha1grid.column_homogeneous = true;
        sha1grid.attach(sha1Label, 0, 0, 1, 1);
        sha1grid.attach(sha1Entry, 1, 0, 4, 1);

        Gtk.Grid sha256grid = new Gtk.Grid();
        sha256Label = new Gtk.Label ("<b>SHA256</b>");
        sha256Label.set_use_markup (true);
        sha256Label.margin = 6;
        sha256Label.halign = Gtk.Align.START;
        sha256Entry = new Gtk.Entry ();
        sha256Entry.editable = false;
        sha256Entry.margin = 6;
        sha256grid.column_homogeneous = true;
        sha256grid.attach(sha256Label, 0, 0, 1, 1);
        sha256grid.attach(sha256Entry, 1, 0, 4, 1);

        attach (topBox, 0, 0, 1, 1);
        attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 1, 1, 1);
        attach (labelPlainText, 0, 2, 1, 1);
        attach (plainTextScrolledWindow, 0, 4, 1, 1);
        attach (enchiperButton, 0, 5, 1, 1);
        attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 6, 1, 1);
        attach (md5grid, 0, 7, 1, 1);
        attach (sha1grid, 0, 8, 1, 1);
        attach (sha256grid, 0, 9, 1, 1);

        button.clicked.connect (() => {
         try {
                        AppInfo.launch_default_for_uri ("https://wikipedia.org/wiki/Hash_function", null);
                    } catch (Error e) {
                        warning (e.message);
                    }
        });

        enchiperButton.clicked.connect (() => {
            plainText = plainTextTextView.buffer.text;

            string hashmd5 = GLib.Checksum.compute_for_string (ChecksumType.MD5, plainText, plainText.length);
            string hashsha1 = GLib.Checksum.compute_for_string (ChecksumType.SHA1, plainText, plainText.length);
            string hashsha256 = GLib.Checksum.compute_for_string (ChecksumType.SHA256, plainText, plainText.length);


            md5Entry.text = hashmd5;
            sha1Entry.text = hashsha1;
            sha256Entry.text = hashsha256;

        
        });


}}

}
