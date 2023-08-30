require( leap ).set_default_keymaps()
require( leap ).setup({
max_phase_one_targets = nil,
highlight_unlabeled_phase_one_targets = false,
max_highlighted_traversal_targets = 10,
case_sensitive = false,
equivalence_classes = {   \t\r\n , },
substitute_chars = {},
labels = {  d ,  n ,  r ,  e , t , a , s ,  i ,  D ,  N ,  R ,  E , T , A , S ,  I },
safe_labels = {   n ,  r ,  t ,  s  },
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
