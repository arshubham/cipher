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

using Cipher.Configs;

namespace Cipher {

    /**
     * The {@code Application} class is a foundation for all granite-based applications.
     *
     * @see Granite.Application
     * @since 0.1.0
     */
    public class Application : Granite.Application {

        private Window window { get; private set; default = null; }

        /**
         * Constructs a new {@code Application} object.
         *
         * @see Ciano.Configs.Constants
         */
        public Application () {
            Object (
                application_id: Constants.ID,
                flags: ApplicationFlags.FLAGS_NONE
            );
        }


        /**
         * Create the window of this application through the class {@code Window} and show it. If user clicks
         * <quit> or press <control + q> the window will be destroyed.
         * 
         * @return {@code void}
         */
        public override void activate () {
            if (window == null) {
                window = new Window (this);
                add_window (window);
                window.show_all ();
            }

            var quit_action = new SimpleAction ("quit", null);
            quit_action.activate.connect (() => {
                if (window != null) {
                    window.destroy ();
                }
            });

            add_action (quit_action);
            add_accelerator ("<Control>q", "app.quit", null);
        }
    }
}
