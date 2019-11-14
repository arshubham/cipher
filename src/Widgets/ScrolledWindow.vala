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

    public class ScrolledWindow : Gtk.ScrolledWindow {

        public ScrolledWindow (Cipher.Widgets.TextView? textview) {
            Object (
                expand: true,
                hadjustment: null,
                margin: 6,
                vadjustment: null
            );

            get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);
            get_style_context ().add_class (Granite.STYLE_CLASS_CARD);
            get_style_context ().add_class ("textview");
            add (textview);
        }
    }
}
