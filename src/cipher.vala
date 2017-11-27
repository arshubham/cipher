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

public class Cipher : Granite.Application {
    /**
     * Basic app information for Granite.Application.
     */
    construct {
        application_id = "com.github.arshubham.cipher";
        flags = ApplicationFlags.FLAGS_NONE;

        program_name = "Cipher";

        build_version = "0.1";
        app_icon = "applications-interfacedesign";
    }

    public override void activate () {
        var window = new Gtk.Window ();

        var alert_view = new AlertViewView ();
        var welcome = new WelcomeView ();

        var main_stack = new Gtk.Stack ();
        main_stack.add_titled (welcome, "welcome", "Welcome");
        main_stack.add_titled (alert_view, "alert", "AlertView");

        var stack_sidebar = new Gtk.StackSidebar ();
        stack_sidebar.stack = main_stack;

        var paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
        paned.add1 (stack_sidebar);
        paned.add2 (main_stack);

        window.add (paned);
        window.set_default_size (900, 600);
        window.set_size_request (750, 500);
        window.title = "Cipher";
        window.show_all ();

        add_window (window);
    }

    public static int main (string[] args) {
        var application = new Cipher ();
        return application.run (args);
    }
}
