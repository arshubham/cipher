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

using Cipher.Configs;

namespace Cipher {

    public class Application : Granite.Application {

        public Cipher.Controllers.AppController controller;

        public Application () {
            Object (
                application_id: Constants.ID,
                flags: ApplicationFlags.FLAGS_NONE
            );

            var quit_action = new SimpleAction ("quit", null);
            quit_action.activate.connect (() => {
                controller.quit ();
            });

            add_action (quit_action);
            set_accels_for_action ("app.quit", {"<Control>q"});
        }

        public override void activate () {
            if (controller == null) {
                controller = new Cipher.Controllers.AppController (this);
            }

            controller.activate ();
        }   
        
    }
}
