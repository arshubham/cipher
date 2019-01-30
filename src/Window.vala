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

namespace Cipher {

    public class Window : Gtk.ApplicationWindow {

        public Window (Gtk.Application app) {
            Object (
                application: app,
                deletable: true,
                icon_name: Cipher.Configs.Constants.APP_ICON,
                resizable: true,
                title: "Cipher"
            );

            var settings = new GLib.Settings ("com.github.arshubham.cipher");
            
            int window_x, window_y;
            settings.get ("window-position", "(ii)", out window_x, out window_y);

            if (window_x != -1 ||  window_y != -1) {
                move (window_x, window_y);
            }

            int window_width, window_height;
            settings.get ("window-size", "(ii)", out window_width, out window_height);

            var rect = Gtk.Allocation ();
            rect.width = window_width;
            rect.height = window_height;
            set_allocation (rect);

            if (settings.get_boolean ("window-maximized")) {
                this.maximize ();
            }

            delete_event.connect (() => {
                if (this.is_maximized) {
                    settings.set_boolean ("window-maximized", true);
                } else {
                    settings.set_boolean ("window-maximized", false);

                    get_allocation (out rect);
                    settings.set ("window-size", "(ii)", rect.width, rect.height);

                    int root_x, root_y;
                    get_position (out root_x, out root_y);
                    settings.set ("window-position", "(ii)", root_x, root_y);
                }
                return false;
            });

            style_provider ();
         }

        private void style_provider () {
            var css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource (Cipher.Configs.Constants.URL_CSS);

            Gtk.StyleContext.add_provider_for_screen (
                Gdk.Screen.get_default (),
                css_provider,
                Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            );
        }
    }
}
