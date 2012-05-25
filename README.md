Tipster
==============

Tipster is a plugin that allows to display contextual tips anywhere in your application.
Those tips are easy to integrate into your views and can be hidden by users.

Requirements
==============

1. User table with user_id foreign key to be connected to hidding tips (optionnal, but necessary to hide tips)

Installation
==============

1. Clone repository to vendor/plugins

<code>
    git clone git@github.com:jgagnon1/Tipster.git vendor/plugins/tipster
</code>

3. Run Tipster migrations

<code>
    rake db:migrate:tipster
</code>

2. Include routes into your route.rb file by adding this line;

<code>
    map.tipster
</code>

3. Enjoy !

Example
=======

## view.html.erb

    <% tip "Welcome to Tipster" do %>
        Tipster is a plugin that allows to display contextual tips anywhere in your application.
    <% end %>

### Generates:

<code>
    <div class="tip">
        <div class="title">
            <h3>Welcome to Tipster</h3>
            <a href="/tipster/-736365685/hide" class="close"></a>
        </div>
        <div class="content">
            Portal is a user management gateway that allows you to manage your users and give them access to certain sections of Dakis services. 
        </div>
    </div>
</code>

Copyright (c) 2012 Jerome Gagnon, released under the MIT license
