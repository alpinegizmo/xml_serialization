## What is this?

ActiveSupport provides a to_xml method that produces appealing XML for ActiveRecord objects and arrays and hashes containing ActiveRecord objects. The xml_serialization gem extends that XML serialization support to allow for arrays and hashes containing strings, symbols, and integers.

The [xslt_render](http://github.com/alpinegizmo/xslt_render/tree/) plugin for rails depends on this gem.

For more information, see [Rails on XML, part 7](http://alpinegizmo.com/2009/03/01/rails-on-xml-part-7-xml-serialization.html).

## Installation

If you haven't already done so:

    gem sources -a http://gems.github.com
    
And then:

    sudo gem install xml_serialization

## Authors

This code was originally written by Larry Baltz and David Anderson of [FolkLogic](http://folklogic.com) for [Mirai España](http://miraiespana.com/).

Copyright (c) 2008 Mirai España, S.L., (c) 2009 FolkLogic SARL. See MIT-LICENSE for details.
