require( leap ).set_default_keymaps()
require( leap ).setup({
max_phase_one_targets = nil,
highlight_unlabeled_phase_one_targets = false,
max_highlighted_traversal_targets = 10,
case_sensitive = false,
equivalence_classes = {   \t\r\n , },
substitute_chars = {},
labels = {  a ,  o ,  e ,  u ,  i ,  d ,  h ,  t ,  n ,  s ,  A ,  O ,  E ,  U ,  I ,  D ,  H ,  T ,  N ,  S },
safe_labels = {   o ,  u ,  t ,  n ,  s ,  A ,  O ,  E ,  U ,  I ,  H ,  T ,  N ,  S },
special_keys = {
  repeat_search =  <enter> ,
  next_phase_one_target =  <enter> ,
  next_target = { <enter> ,  ; },
  prev_target = { <tab> ,  , },
  next_group =  <space> ,
  prev_group =  <tab> ,
  multi_accept =  <enter> ,
  multi_revert =  <backspace> ,
}})
