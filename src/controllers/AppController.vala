/*-
 * Copyright (c) 2018 Shubham Arora (https://github.com/arshubham/cipher)
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
using Cipher.Views;

namespace Cipher.Controllers {

	public class AppController {

        private Gtk.Application     application;
        private Gtk.Stack view_stack;
        private Gtk.ApplicationWindow window { get; set; default = null; }
        private Gtk.HeaderBar headerbar;

		public AppController (Gtk.Application application) {
            this.application = application;
            this.window = new Window (this.application);
            this.headerbar = new Gtk.HeaderBar ();
            this.headerbar.show_close_button = true;

            view_stack = new Gtk.Stack ();
            view_stack.transition_type = Gtk.StackTransitionType.NONE;
            view_stack.transition_duration = 300;
            view_stack.hhomogeneous = true;
            view_stack.vhomogeneous = true;

            var cipher_view = new CipherView();
            var atbash_cipher_view = new AtbashCipherView ();
            var caesar_cipher_view = new CaesarCipherView ();
            var polybius_cipher_view = new PolybiusSquareCipherView ();
            var ascii_view = new AsciiView ();
            var rot13_view = new ROT13View ();
            var base64_view = new Base64View ();
            var hash_view = new HashView ();

            view_stack.show_all ();

            view_stack.add_named (cipher_view, "ciphers_view");
            view_stack.add_named (caesar_cipher_view, "caesar_cipher");
            view_stack.add_named (atbash_cipher_view, "atbash_cipher");
            view_stack.add_named (polybius_cipher_view, "polybius_cipher");
            view_stack.add_named (ascii_view, "ascii");
            view_stack.add_named (rot13_view, "rot13");
            view_stack.add_named (base64_view, "base64");
            view_stack.add_named (hash_view, "hash");
            
            
            cipher_view.switch_view.connect ((view) => {
                view_stack.visible_child_name = view;
            });

            this.window.add (this.view_stack);
            this.window.set_default_size (700, 500);
            this.window.set_size_request (700, 500);
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
