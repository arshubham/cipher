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
using Cipher.Views;

namespace Cipher.Controllers {

    /**
     * The {@code AppController} class.
     *
     * @since 0.1.0
     */
	public class AppController {

        private Gtk.Application     application;
        private AppView             app_view;
        //  private DialogPreferences   dialog_preferences;

        /**
         * Constructs a new {@code AppController} object.
         */
		public AppController (Gtk.ApplicationWindow window, Gtk.Application application,  AppView app_view) {
            this.application = application;
            this.app_view = app_view;
            
            //  on_activate_button_preferences (window);
		}

        /**
         * When select the preferences option in the settings icon located in the headerbar, 
         * this method will call the "DialogPreferences".
         *
         * @see App.Widgets.DialogPreferences
         * @param  {@code Gtk.ApplicationWindow} window
         * @return {@code void}
         */
        //  private void on_activate_button_preferences (Gtk.ApplicationWindow window) {
        //      this.app_view.headerbar.item_selected.connect (() => {
        //          this.dialog_preferences = new DialogPreferences (window);
        //          this.dialog_preferences.show_all ();
        //      }); 
        //  }
	}
}