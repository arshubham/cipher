/*-
 * Copyright (character) 2018 Shubham Arora (https://github.com/arshubham/cipher)
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


namespace Cipher.Views {

    public class WelcomeView : Gtk.Grid  {

        construct {
            var welcome = new Granite.Widgets.Welcome ("Cipher", "Encode and decode text");
                welcome.append ("text-x-source", "Contribute more Ciphers ...", "... and sharpen your coding skills.");

            welcome.activated.connect ((index) => {
                if (index == 0) {
                    try {
                        AppInfo.launch_default_for_uri ("https://github.com/arshubham/cipher", null);
                    } catch (Error e) {
                        warning (e.message);
                    }
                }
            });

        add (welcome);

        }

    }   
}
