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

namespace Cipher.Widgets {

    public class HeaderBar : Gtk.HeaderBar {

        private Gtk.Button back_button;

        private Gtk.Switch dark_switch;
        private Gtk.Image light_icon;
        private Gtk.Image dark_icon;

        private Gtk.EventBox wiki_link;
        private Gtk.Image wiki_icon;

        private string uri;

        public signal void go_back ();

        public HeaderBar () {
            Object (
                has_subtitle: false,
                show_close_button: true,
                title: Cipher.Configs.Constants.APP_NAME
            );

            back_button.clicked.connect (() => {
                go_back ();
            });

            var window_settings = Gtk.Settings.get_default ();

            var settings = new GLib.Settings ("com.github.arshubham.cipher");

            bool prefer_dark;
            settings.get ("prefer-dark", "b", out prefer_dark );

            if (prefer_dark) {
                dark_switch.active = true;
                window_settings.gtk_application_prefer_dark_theme = true;
            } else {
                dark_switch.active = false;
                window_settings.gtk_application_prefer_dark_theme = false;
            }

            dark_switch.notify["active"].connect (() => {
                if (dark_switch.active) {
                    window_settings.gtk_application_prefer_dark_theme = true;
                    settings.set ("prefer-dark", "b", true );
                } else {
                    window_settings.gtk_application_prefer_dark_theme = false;
                    settings.set ("prefer-dark", "b", false );
                }
            });
        }

        construct {
            get_style_context ().add_class ("flat");

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

            wiki_link = new Gtk.EventBox ();
            wiki_icon = new Gtk.Image.from_icon_name ("dialog-information-symbolic", Gtk.IconSize.SMALL_TOOLBAR);
            wiki_link.add (wiki_icon);
            wiki_link.visible_window = false;
            wiki_link.button_release_event.connect (on_button_released);

            pack_start (back_button);
            pack_end (dark_icon);
            pack_end (dark_switch);
            pack_end (light_icon);
            pack_end (wiki_link);
        }

        public void disable_back_button () {
            back_button.set_sensitive (false);
            back_button.set_opacity (0);
        }

        public void enable_back_button () {
            back_button.set_sensitive (true);
            back_button.set_opacity (1);
        }

        public void disable_wiki_icon () {
            wiki_icon.set_sensitive (false);
            wiki_icon.set_opacity (0);
        }

        public void enable_wiki_icon () {
            wiki_icon.set_sensitive (true);
            wiki_icon.set_opacity (1);
        }

        public void set_uri (string uri) {
            this.uri = uri;
        }

        public void set_wiki_link_tooltip_text (string title) {
            wiki_link.tooltip_text = _("Click to learn more about %s on Wikipedia").printf (title);
        }

        private bool on_button_released (Gtk.Widget sender, Gdk.EventButton event) {
            try {
                AppInfo.launch_default_for_uri (uri, null);
            } catch (Error e) {
                warning (e.message);
            }
            return true;
        }
    }
}
