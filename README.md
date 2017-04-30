# Custom Styles

In some use cases we may want to offer the same sets of variants for a large number of functionally equivalent products. Attempting to use the standard Spree store to support this can result in exponentially increasing numbers of variants. Here we introduce another model, CustomStyle, to supplement the Variant model. Customers choose a style for the product in the same way that they choose variants otherwise. Images associated with products are now accessed via the CustomStyle model.

Custom Styles is modeled after other Spree extensions. Comments and pull requests are welcomed.

## Install

The extension contains a rails generator that will add the necessary migrations and give you the option to run the migrations, or run them later, perhaps after installing other extensions. Once you have bundled the extension, run the install generator and its ready to use.

      rails generate spree_custom_styles:install
