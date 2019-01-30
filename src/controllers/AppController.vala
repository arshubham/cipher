/*-
 * Copyright (c) 2017-2019 Shubham Arora (https://github.com/arshubham/cipher)
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

namespace Cipher.Controllers {

    public class AppController {

        private Gtk.Application application;
        private Gtk.Stack view_stack;
        private Gtk.ApplicationWindow window { get; set; default = null; }
        private Cipher.Widgets.HeaderBar headerbar;

        public AppController (Gtk.Application application) {
            this.application = application;
            this.window = new Window (this.application);
            this.headerbar = new Cipher.Widgets.HeaderBar ();
            this.headerbar.show_close_button = true;

            view_stack = new Gtk.Stack ();
            view_stack.transition_type = Gtk.StackTransitionType.SLIDE_LEFT;
            view_stack.transition_duration = 300;
            view_stack.hhomogeneous = true;
            view_stack.vhomogeneous = true;

            var cipher_view = new Cipher.Views.CipherView ();
            var atbash_cipher_view = new Cipher.Views.AtbashCipherView ();
            var caesar_cipher_view = new Cipher.Views.CaesarCipherView ();
            var polybius_cipher_view = new Cipher.Views.PolybiusSquareCipherView ();
            var ascii_encoding_view = new Cipher.Views.AsciiEncodingView ();
            var rot13_cipher_view = new Cipher.Views.ROT13CipherView ();
            var base64_encoding_view = new Cipher.Views.Base64EncodingView ();
            var hash_functions_view = new Cipher.Views.HashFunctionsView ();

            view_stack.show_all ();

            view_stack.add_named (cipher_view, "ciphers_view");
            view_stack.add_named (caesar_cipher_view, "caesar_cipher");
            view_stack.add_named (atbash_cipher_view, "atbash_cipher");
            view_stack.add_named (polybius_cipher_view, "polybius_cipher");
            view_stack.add_named (ascii_encoding_view, "ascii_encoding");
            view_stack.add_named (rot13_cipher_view, "rot13_cipher");
            view_stack.add_named (base64_encoding_view, "base64_encoding");
            view_stack.add_named (hash_functions_view, "hash_functions");

            headerbar.disable_back_button ();
            headerbar.disable_wiki_icon ();

            cipher_view.switch_view.connect ((view, title, uri) => {
                view_stack.transition_type = Gtk.StackTransitionType.SLIDE_LEFT;
                view_stack.visible_child_name = view;
                headerbar.enable_back_button ();
                headerbar.enable_wiki_icon ();
                headerbar.set_title (title);
                headerbar.set_uri (uri);
                headerbar.set_wiki_link_tooltip_text (title);
            });

            headerbar.go_back.connect (() => {
                view_stack.transition_type = Gtk.StackTransitionType.SLIDE_RIGHT;
                view_stack.visible_child_name = "ciphers_view";
                headerbar.disable_back_button ();
                headerbar.disable_wiki_icon ();
                headerbar.set_title (_("Cipher"));
            });

            this.window.add (this.view_stack);
            this.application.add_window (this.window);
            this.window.set_titlebar (this.headerbar);
        }

        public void activate () {
            window.show_all ();
            view_stack.activate ();
            view_stack.visible_child_name = "ciphers_view";
        }

        public void quit () {
            window.destroy ();

        }
    }
}
