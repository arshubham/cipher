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

	/**
     * The {@code AppView} class.
     *
     * @since 0.1.0
     */
	public class AppView : Gtk.Grid {

        private Gtk.ApplicationWindow app;
        public HeaderBar headerbar;

		/**
         * Constructs a new {@code AppView} object.
         */
		public AppView (Gtk.ApplicationWindow app) {
            this.app = app;
            this.app.set_default_size (800, 700);
            this.app.set_size_request (800, 700);
            this.app.deletable = true;
            this.app.resizable = true;
            
            this.headerbar = new HeaderBar ();
			this.app.set_titlebar (this.headerbar);

            var atbash_cipher = new AtbashCipherView ();
            var caesar_cipher = new CaesarCipherView ();
            var polybius_cipher = new PolybiusSquareCipherView ();
    
            var main_stack = new Gtk.Stack ();
            main_stack.add_titled (caesar_cipher, "caesar", "Caesar Cipher");
            main_stack.add_titled (atbash_cipher, "atbash", "Atbash Cipher");
            main_stack.add_titled (polybius_cipher, "polybius", "Polybius Square Cipher");
    
            var stack_sidebar = new Gtk.StackSidebar ();
            stack_sidebar.stack = main_stack;
            stack_sidebar.set_size_request (150, 200);
    
            var paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
            paned.add1 (stack_sidebar);
            paned.add2 (main_stack);
    
            this.add (paned);

		}
	}
}