select * from registration_view where student_code  
  not in (select reg_registerd_course_view.st_id from  reg_registerd_course_view )
and registration_view.reg_term_is_current = 1