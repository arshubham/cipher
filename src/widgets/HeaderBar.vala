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

namespace Cipher.Widgets {

    public class HeaderBar : Gtk.HeaderBar {
        private Gtk.Button back_button;

        private Gtk.Switch dark_switch;
        private Gtk.Image light_icon;
        private Gtk.Image dark_icon;

        public signal void go_back (); 

        public HeaderBar () {
            Object (
                title: "Cipher",
                has_subtitle: false,
                show_close_button: true
            );

            back_button.clicked.connect (() => {
                go_back ();
            });
        }

        construct {
            back_button = new Gtk.Button.with_label ("Back");
            back_button.get_style_context ().add_class (Granite.STYLE_CLASS_BACK_BUTTON);
            back_button.valign = Gtk.Align.CENTER;
            

            dark_switch = new Gtk.Switch ();
            dark_switch.valign = Gtk.Align.CENTER;
            dark_switch.get_style_context ().add_class (Granite.STYLE_CLASS_MODE_SWITCH);
            light_icon = new Gtk.Image.from_icon_name ("display-brightness-symbolic", Gtk.IconSize.SMALL_TOOLBAR);
            light_icon.tooltip_text = _("Light background");
            dark_icon = new Gtk.Image.from_icon_name ("weather-clear-night-symbolic", Gtk.IconSize.SMALL_TOOLBAR);
            dark_icon.tooltip_text = _("Dark background");

            pack_start (back_button);
            pack_end (dark_icon);
            pack_end (dark_switch);
            pack_end (light_icon);

        }

        public void disable_back_button () {
            back_button.set_sensitive (false);
            back_button.set_opacity (0);
        }

        public void enable_back_button () {
            back_button.set_sensitive (true);
            back_button.set_opacity (1);
        }
    }
}
