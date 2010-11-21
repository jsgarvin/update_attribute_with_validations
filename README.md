UpdateAttributeWithValidations
==============================

Changes ActiveRecord's update_attribute (singular) method to behave more intuitively and consistently like
update_attributes (plural). ActiveRecord's built-in update_attribute (singular) will skip validation checks
and save the record regardless, unlike update_attributes (plural), which will not.

Installation
------------

Add the following to your Rails 3 Gemfile

`gem 'update_attribute_with_validations'`

Justification
-------------

* We *should* be using [attr_accessible](http://api.rubyonrails.org/classes/ActiveModel/MassAssignmentSecurity/ClassMethods.html#method-i-attr_accessible)
  to white list attributes that can be safely mass assigned from a web form.
* `update_attributes` (plural), therefore, *cannot* be used within the application to quickly update other attributes
  that are not, and should not, be updateable via a web form.
* We are then left with three alternatives.
  * `attribute=value; save` which is not beautiful code. 
  * `update_attribute(:attribute => value)` and hope we never inadvertently create an invalid object in the database.
  * define a new method that intuitively does what we expect. But what shall we call it? I know! How about `update_attribu`... oh, shucks!
  * "Fix" the built-in `update_attribute` method so that safe updates are easy, and unsafe updates are hard(er).
* This gem takes the last approach.

But Sometimes...
----------------

Occasionally it is necessary to save some value regardless of whether or not the resultant object passes
validations. Or, you just *know* that's it's safe and in your particular case there's a significant performance
boost to be gained by skipping unnecessary validations.  

`update_attribute_without_validations(:attribute => value)` will not only get you what you need, but also comes
with the free bonus of self documenting code.

It is the author's opinion, however, that this is an edge case and should not dictate the default behavior.

Discussion
----------

The built-in behavior of `update_attribute` has been [debated at length](http://groups.google.com/group/rubyonrails-core/browse_thread/thread/e9e9763e96af7175?hl=en&pli=1).
The winning argument seems to primarily be that many people have code that relies on the existing behavior and do not
want to update that code to adjust for new behavior. The author of this gem harbors no delusions of ever changing the
core team's mind, but is unmoved by that rationale. New versions of libraries always require dependent code to be updated
if it is to be expected to work with the new way of doing things. The referenced discussion, however, was over three
years ago, Rails 3 has since been released, and the behavior in question remains.  End of discussion.