/*-
 * Copyright (c) 2017 Shubham Arora (https://github.com/arshubham/cipher)
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

namespace Cipher.Views {


public class CaesarCipherView : Gtk.Grid  {
    private Gtk.TextView textView;
    private Gtk.TextView textView2;

    construct {
        textView = new Gtk.TextView ();
        textView2 = new Gtk.TextView ();

        Gtk.ListStore list_store = new Gtk.ListStore (1, typeof (int));
        Gtk.TreeIter iter;
        Gtk.ComboBox box = new Gtk.ComboBox.with_model(list_store);
        box.halign = Gtk.Align.START;
        box.set_active (0);
        Gtk.CellRendererText renderer = new Gtk.CellRendererText ();
		box.pack_start (renderer, true);
		box.add_attribute (renderer, "text", 0);
        box.active = 1;        
        box.margin = 6;

        for (int i = 1; i <= 26 ; i++) {
            list_store.append (out iter);
            list_store.set (iter, 0, i);
    
        }

        var scrolled = new Gtk.ScrolledWindow (null, null);
        scrolled.expand = true;
        scrolled.get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);
        scrolled.add (textView);
        var scrolled2 = new Gtk.ScrolledWindow (null, null);
        scrolled2.expand = true;
        scrolled2.get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);
        scrolled2.add (textView2);
        
        Gtk.Label label = new Gtk.Label ("<b>Plain Text</b>");
        label.set_use_markup (true);
        label.margin = 6;
        label.halign = Gtk.Align.START;
        label.set_line_wrap (true);

        Gtk.Label label2 = new Gtk.Label ("<b>Cipher Text</b>");
        label2.set_use_markup (true);
        label2.margin = 6;
        label2.halign = Gtk.Align.START;
        label2.set_line_wrap (true);

        Gtk.Label label3 = new Gtk.Label ("<b>Number of letters to shift to the right: </b>");
        label3.set_use_markup (true);
        label3.margin = 6;
        label3.halign = Gtk.Align.START;
        label3.set_line_wrap (true);

        var enchiper = new Gtk.Button.with_label ("Enchiper");
        enchiper.margin = 6;
        enchiper.halign = Gtk.Align.END;
        var dechiper = new Gtk.Button.with_label ("Dechiper");
        dechiper.margin = 6;
        dechiper.halign = Gtk.Align.END;
        Gtk.Box box1 = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        box1.pack_start (label3, false, false,0);
        box1.pack_start (box, false, false,0);

        attach (scrolled, 0, 2, 1, 1);
        attach (label, 0, 0, 1, 1);
        attach (label2, 0, 5, 1, 1);
        attach (scrolled2, 0, 6,1 , 1);
        attach (box1, 0,3,1,1);
        attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 4, 1, 1);
        attach (enchiper, 0, 3, 1, 1);
        attach (dechiper, 0, 7, 1, 1);
        int shift = 3;
        enchiper.clicked.connect (() => {
            string text = textView.buffer.text;
            unichar c;  
            Value val1;
            box.get_active_iter (out iter);
            list_store.get_value (iter, 0, out val1);
            shift = (int) val1;

            string str = "";
            //  int shift = box.active_id.to_int ();
            //  stdout.printf (shift.to_string ());
        for (int i = 0; text.get_next_char (ref i, out c);) 
        {
             if(c >= 'A' && c <= 'Z')
                     c = (c + shift > 'Z') ? (c + shift) - 26 : (c + shift);
             else if(c >= 'a' && c <= 'z')
                c = (c + shift > 'z') ? (c + shift) - 26 : (c + shift);
        
            str = str.concat(c.to_string());
         }
         textView2.buffer.text = str;
    });

    dechiper.clicked.connect (() => {
        string text = textView2.buffer.text;
        unichar c;  
        Value val1;
        box.get_active_iter (out iter);
        list_store.get_value (iter, 0, out val1);
        shift = (int) val1;

        string str = "";
        //  int shift = box.active_id.to_int ();
        //  stdout.printf (shift.to_string ());
    for (int i = 0; text.get_next_char (ref i, out c);) 
    {
        if(c >= 'A' && c <= 'Z')
        c = (c - shift < 'A') ? (c - shift) + 26 : (c - shift);
    else if(c >= 'a' && c <= 'z')
c = (c - shift < 'a') ? (c - shift) + 26 : (c - shift);
    
        str = str.concat(c.to_string());
     }
     textView.buffer.text = str;
});
    }
}

}