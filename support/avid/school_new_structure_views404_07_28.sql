-- View structure for registration_view
-- ----------------------------
DROP VIEW IF EXISTS `registration_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `registration_view` AS SELECT
	reg_registration.reg_date AS reg_date, 
	reg_registration.theory_units AS theory_units, 
	reg_registration.actional_units AS actional_units, 
	reg_registration.fix_salary AS fix_salary, 
	reg_registration.theory_salary AS theory_salary, 
	reg_registration.actional_salary AS actional_salary, 
	reg_registration.other_salary_comment AS other_salary_comment, 
	reg_registration.other_salary_amount AS other_salary_amount, 
	reg_registration.total_salary AS total_salary, 
	reg_registration.off_amount AS off_amount, 
	reg_registration.off_comment AS off_comment, 
	reg_term.`name` AS term_name, 
	reg_field.`name` AS field_name, 
	reg_student.`name` AS `name`, 
	reg_student.famili AS famili, 
	reg_student.national_code AS national_code, 
	reg_student.identifier_code AS identifier_code, 
	reg_student.identifier_serial AS identifier_serial, 
	reg_student.identifier_char AS identifier_char, 
	reg_student.student_code AS student_code, 
	reg_student.father_name AS father_name, 
	reg_student.date_of_birth AS date_of_birth, 
	reg_student.description AS description, 
	reg_student.address AS address, 
	reg_student.mobile AS mobile, 
	reg_student.phone AS phone, 
	reg_student.archive_code AS archive_code, 
	reg_organization.`name` AS org_name, 
	reg_registration.id AS id, 
	reg_student_status.`name` AS status_name, 
	reg_student_status.id AS status_id, 
	reg_organization.id AS st_org_id, 
	reg_field.id AS field_id, 
	reg_term.is_current AS reg_term_is_current, 
	reg_term.id AS reg_term_id, 
	reg_organization.id AS org_unit_id, 
	reg_level.id AS level_id, 
	reg_level.`name` AS level_name, 
	reg_student.created_date AS created_date, 
	reg_student.last_modified AS last_modified, 
	reg_term.from_date AS from_date, 
	reg_student.pish_madrak AS pish_madrak, 
	reg_student.diplom_madrak AS diplom_madrak, 
	reg_base_level.base_name
FROM
	(
		(
			(
				(
					(
						(
							reg_registration
							join
							reg_term
							ON 
								(
									(
										reg_registration.term_id = reg_term.id
									)
								)
						)
						join
						reg_field
						ON 
							(
								(
									reg_registration.field_id = reg_field.id
								)
							)
					)
					join
					reg_student
					ON 
						(
							(
								reg_registration.st_id = reg_student.student_code
							)
						)
				)
				join
				reg_organization
				ON 
					(
						(
							reg_student.org_unit_id = reg_organization.id
						)
					)
			)
			join
			reg_student_status
			ON 
				(
					(
						reg_student.status_id = reg_student_status.id
					)
				)
		)
		join
		reg_level
		ON 
			(
				(
					reg_registration.level_id = reg_level.id
				)
			)
	)
	left  JOIN
	 reg_base_level
	ON 
		reg_registration.base_id = reg_base_level.base_id ;

-- ----------------------------
-- View structure for registration_view2
-- ----------------------------
DROP VIEW IF EXISTS `registration_view2`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `registration_view2` AS SELECT
	reg_registration.reg_date AS reg_date, 
	reg_registration.theory_units AS theory_units, 
	reg_registration.actional_units AS actional_units, 
	reg_registration.fix_salary AS fix_salary, 
	reg_registration.theory_salary AS theory_salary, 
	reg_registration.actional_salary AS actional_salary, 
	reg_registration.other_salary_comment AS other_salary_comment, 
	reg_registration.other_salary_amount AS other_salary_amount, 
	reg_registration.total_salary AS total_salary, 
	reg_registration.off_amount AS off_amount, 
	reg_registration.off_comment AS off_comment, 
	reg_term.`name` AS term_name, 
	reg_field.`name` AS field_name, 
	reg_student.`name` AS `name`, 
	reg_student.famili AS famili, 
	reg_student.national_code AS national_code, 
	reg_student.identifier_code AS identifier_code, 
	reg_student.identifier_serial AS identifier_serial, 
	reg_student.identifier_char AS identifier_char, 
	reg_student.student_code AS student_code, 
	reg_student.father_name AS father_name, 
	reg_student.date_of_birth AS date_of_birth, 
	reg_student.description AS description, 
	reg_student.address AS address, 
	reg_student.mobile AS mobile, 
	reg_student.phone AS phone, 
	reg_student.archive_code AS archive_code, 
	reg_organization.`name` AS org_name, 
	reg_registration.id AS id, 
	reg_student_status.`name` AS status_name, 
	reg_student_status.id AS status_id, 
	reg_organization.id AS st_org_id, 
	reg_field.id AS field_id, 
	reg_term.is_current AS reg_term_is_current, 
	reg_term.id AS reg_term_id, 
	reg_organization.id AS org_unit_id, 
	reg_level.id AS level_id, 
	reg_level.`name` AS level_name, 
	reg_student.created_date AS created_date, 
	reg_student.last_modified AS last_modified, 
	reg_term.from_date AS from_date, 
	reg_student.pish_madrak AS pish_madrak, 
	reg_student.diplom_madrak AS diplom_madrak, 
	reg_base_level.base_name
FROM
	(
		(
			(
				(
					(
						(
							reg_registration
							join
							reg_term
							ON 
								(
									(
										reg_registration.term_id = reg_term.id
									)
								)
						)
						join
						reg_field
						ON 
							(
								(
									reg_registration.field_id = reg_field.id
								)
							)
					)
					join
					reg_student
					ON 
						(
							(
								reg_registration.st_id = reg_student.student_code
							)
						)
				)
				join
				reg_organization
				ON 
					(
						(
							reg_student.org_unit_id = reg_organization.id
						)
					)
			)
			join
			reg_student_status
			ON 
				(
					(
						reg_student.status_id = reg_student_status.id
					)
				)
		)
		join
		reg_level
		ON 
			(
				(
					reg_registration.level_id = reg_level.id
				)
			)
	)
	left  JOIN
	 reg_base_level
	ON 
		reg_registration.base_id = reg_base_level.base_id 
		ORDER BY reg_registration.id ;
-- ------------------------------------------
-- ----------------------------
-- View structure for bank_account_v
-- ----------------------------
DROP VIEW IF EXISTS `bank_account_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bank_account_v` AS select `finance_account_bank`.`id` AS `id`,`finance_account_bank`.`name` AS `name`,`finance_account_bank`.`bank_id` AS `bank_id`,`finance_account_bank`.`first_amount` AS `first_amount`,`finance_account_bank`.`is_cash` AS `is_cash`,`finance_bank`.`name` AS `bank_name` from (`finance_account_bank` left join `finance_bank` on((`finance_account_bank`.`bank_id` = `finance_bank`.`id`))) ;

-- ----------------------------
-- View structure for check_v
-- ----------------------------
DROP VIEW IF EXISTS `check_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `check_v` AS select `finance_check`.`id` AS `id`,`finance_check`.`created_date` AS `created_date`,`finance_check`.`number` AS `number`,`finance_check`.`amount` AS `amount`,`finance_check`.`for_how` AS `for_how`,`finance_check`.`check_date` AS `check_date`,`finance_check`.`bank_id` AS `bank_id`,`finance_check`.`bank_branch` AS `bank_branch`,`finance_check`.`description` AS `description`,`finance_check`.`status_id` AS `status_id`,`finance_check`.`account_id` AS `account_id`,`finance_check`.`bank_account_id` AS `bank_account_id`,`finance_bank`.`name` AS `bank_name`,`finance_check_status`.`name` AS `status_name`,`finance_account`.`name` AS `account_name`,`finance_account`.`phone` AS `phone`,`finance_account`.`person_name` AS `person_name`,`finance_account`.`person_mobile` AS `person_mobile`,`finance_account`.`fax` AS `fax`,`finance_account`.`create_date` AS `create_date`,`finance_account`.`address` AS `address`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`bank_account_v`.`name` AS `bank_account_name`,`bank_account_v`.`bank_id` AS `bank_account_b_id`,`bank_account_v`.`first_amount` AS `first_amount`,`bank_account_v`.`is_cash` AS `is_cash`,`bank_account_v`.`bank_name` AS `bank_account_b_name` from ((((`finance_check` left join `finance_bank` on((`finance_check`.`bank_id` = `finance_bank`.`id`))) left join `finance_check_status` on((`finance_check`.`status_id` = `finance_check_status`.`id`))) left join `finance_account` on((`finance_check`.`account_id` = `finance_account`.`id`))) left join `bank_account_v` on((`finance_check`.`bank_account_id` = `bank_account_v`.`id`))) ;


-- ----------------------------
-- View structure for reg_check_v
-- ----------------------------
DROP VIEW IF EXISTS `reg_check_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_check_v` AS select `reg_reg_check`.`id` AS `id`,`reg_reg_check`.`create_date` AS `create_date`,`reg_reg_check`.`reg_id` AS `reg_id`,`reg_reg_check`.`finance_check_id` AS `finance_check_id`,`check_v`.`created_date` AS `created_date`,`check_v`.`number` AS `number`,`check_v`.`amount` AS `amount`,`check_v`.`for_how` AS `for_how`,`check_v`.`check_date` AS `check_date`,`check_v`.`bank_id` AS `bank_id`,`check_v`.`bank_branch` AS `bank_branch`,`check_v`.`description` AS `description`,`check_v`.`status_id` AS `status_id`,`check_v`.`account_id` AS `account_id`,`check_v`.`bank_account_id` AS `bank_account_id`,`check_v`.`bank_name` AS `bank_name`,`check_v`.`status_name` AS `status_name`,`check_v`.`account_name` AS `account_name`,`check_v`.`phone` AS `phone`,`check_v`.`person_name` AS `person_name`,`check_v`.`person_mobile` AS `person_mobile`,`check_v`.`fax` AS `fax`,`check_v`.`create_date` AS `b_acc_create_date`,`check_v`.`address` AS `address`,`check_v`.`fisrt_payable` AS `fisrt_payable`,`check_v`.`bank_account_name` AS `bank_account_name`,`check_v`.`bank_account_b_id` AS `bank_account_b_id`,`check_v`.`first_amount` AS `first_amount`,`check_v`.`is_cash` AS `is_cash`,`check_v`.`bank_account_b_name` AS `bank_account_b_name` from (`reg_reg_check` join `check_v` on((`reg_reg_check`.`finance_check_id` = `check_v`.`id`))) ;


-- View structure for accounts_accounting_v
-- ----------------------------
DROP VIEW IF EXISTS `accounts_accounting_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `accounts_accounting_v` AS select `accounts`.`id` AS `id`,`accounts`.`name` AS `name`,(select sum(`finance_receive_payment`.`amount`) AS `all_payments` from `finance_receive_payment` where (`finance_receive_payment`.`account_person_id` = `accounts`.`id`)) AS `all_amounts`,(select sum(`finance_factor`.`amount`) AS `all_factors` from `finance_factor` where (`finance_factor`.`account_person_id` = `accounts`.`id`)) AS `all_factors`,(select sum(`finance_check`.`amount`) AS `all_amount` from `finance_check` where ((`finance_check`.`status_id` <> '1') and (`finance_check`.`account_id` = `accounts`.`id`))) AS `waiting_checks` from `finance_account` `accounts` ;

-- ----------------------------
-- View structure for account_student_view
-- ----------------------------
DROP VIEW IF EXISTS `account_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `account_student_view` AS select `reg_student_account`.`st_id` AS `st_id`,`reg_student_account`.`acc_id` AS `acc_id`,`reg_student_account`.`create_date` AS `create_date`,`finance_account`.`name` AS `name`,`finance_account`.`person_name` AS `person_name`,`finance_account`.`person_mobile` AS `person_mobile`,`finance_account`.`fax` AS `fax`,`finance_account`.`address` AS `address`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`finance_account`.`phone` AS `phone`,`finance_account`.`create_date` AS `acc_create_date`,`reg_student`.`name` AS `st_name`,`reg_student`.`famili` AS `st_famili`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`identifier_serial` AS `identifier_serial`,`reg_student`.`identifier_char` AS `identifier_char`,`reg_student`.`student_code` AS `student_code`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `description`,`reg_student`.`status_id` AS `status_id`,`reg_student`.`org_unit_id` AS `org_unit_id`,`reg_student`.`created_date` AS `created_date`,`reg_student`.`last_modified` AS `last_modified`,`reg_student`.`level_id_last` AS `level_id_last`,`reg_student`.`field_id_last` AS `field_id_last`,`reg_student`.`address` AS `st_address`,`reg_student`.`mobile` AS `st_mobile`,`reg_student`.`phone` AS `st_phone`,`reg_student`.`archive_code` AS `archive_code` from ((`reg_student_account` join `finance_account` on((`reg_student_account`.`acc_id` = `finance_account`.`id`))) join `reg_student` on((`reg_student_account`.`st_id` = `reg_student`.`student_code`))) ;

-- ----------------------------
-- View structure for allregs_count__in_term
-- ----------------------------
DROP VIEW IF EXISTS `allregs_count__in_term`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `allregs_count__in_term` AS select  COUNT(student_code) as all_regs_count,student_code,registration_view.`name`,registration_view.famili,reg_term_id , registration_view.term_name as first_term from registration_view WHERE registration_view.reg_term_id  <=9331 and student_code in  (select student_code from registration_view where reg_term_id= 9331)  GROUP BY registration_view.student_code ;

-- ----------------------------
-- View structure for all_terms_checks_payments
-- ----------------------------
DROP VIEW IF EXISTS `all_terms_checks_payments`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_terms_checks_payments` AS select `reg_term`.`id` AS `id`,`reg_term`.`name` AS `name`,sum(`reg_check_v`.`amount`) AS `total_check_amout` from ((`reg_term` join `reg_check_v`) join `reg_registration`) where ((`reg_registration`.`id` = `reg_check_v`.`reg_id`) and (`reg_registration`.`term_id` = `reg_term`.`id`) and (`reg_check_v`.`status_id` <> '1')) group by `reg_term`.`id` ;

-- ----------------------------
-- View structure for receive_pay_v
-- ----------------------------
DROP VIEW IF EXISTS `receive_pay_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `receive_pay_v` AS select `finance_receive_payment`.`id` AS `id`,`finance_receive_payment`.`event_date` AS `event_date`,`finance_receive_payment`.`amount` AS `amount`,`finance_receive_payment`.`account_bank_id` AS `account_bank_id`,`finance_receive_payment`.`account_person_id` AS `account_person_id`,`finance_receive_payment`.`receive_pay_type_id` AS `receive_pay_type_id`,`finance_receive_payment`.`description` AS `description`,`finance_receive_payment`.`code` AS `code`,`bank_account_v`.`name` AS `b_a_name`,`bank_account_v`.`bank_id` AS `bank_id`,`bank_account_v`.`first_amount` AS `first_amount`,`bank_account_v`.`is_cash` AS `is_cash`,`bank_account_v`.`bank_name` AS `bank_name`,`finance_account`.`name` AS `account_name`,`finance_account`.`phone` AS `phone`,`finance_account`.`person_name` AS `person_name`,`finance_account`.`person_mobile` AS `person_mobile`,`finance_account`.`fax` AS `fax`,`finance_account`.`create_date` AS `create_date`,`finance_account`.`address` AS `address`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`finance_receive_pay_type`.`name` AS `rec_pay_type_name` from (((`finance_receive_payment` join `bank_account_v` on((`finance_receive_payment`.`account_bank_id` = `bank_account_v`.`id`))) left join `finance_account` on((`finance_receive_payment`.`account_person_id` = `finance_account`.`id`))) join `finance_receive_pay_type` on((`finance_receive_payment`.`receive_pay_type_id` = `finance_receive_pay_type`.`id`))) ;

-- ----------------------------
-- View structure for reg_pay_rec_v
-- ----------------------------
DROP VIEW IF EXISTS `reg_pay_rec_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_pay_rec_v` AS select `reg_reg_payment`.`id` AS `id`,`reg_reg_payment`.`create_date` AS `reg_pay_date`,`reg_reg_payment`.`reg_id` AS `reg_id`,`reg_reg_payment`.`finance_id` AS `finance_id`,`reg_reg_payment`.`next_payment` AS `next_payment`,`receive_pay_v`.`event_date` AS `event_date`,`receive_pay_v`.`amount` AS `amount`,`receive_pay_v`.`account_bank_id` AS `account_bank_id`,`receive_pay_v`.`account_person_id` AS `account_person_id`,`receive_pay_v`.`receive_pay_type_id` AS `receive_pay_type_id`,`receive_pay_v`.`description` AS `description`,`receive_pay_v`.`code` AS `code`,`receive_pay_v`.`b_a_name` AS `b_a_name`,`receive_pay_v`.`bank_id` AS `bank_id`,`receive_pay_v`.`first_amount` AS `first_amount`,`receive_pay_v`.`is_cash` AS `is_cash`,`receive_pay_v`.`bank_name` AS `bank_name`,`receive_pay_v`.`account_name` AS `account_name`,`receive_pay_v`.`phone` AS `phone`,`receive_pay_v`.`person_name` AS `person_name`,`receive_pay_v`.`person_mobile` AS `person_mobile`,`receive_pay_v`.`fax` AS `fax`,`receive_pay_v`.`create_date` AS `create_date`,`receive_pay_v`.`address` AS `address`,`receive_pay_v`.`fisrt_payable` AS `fisrt_payable`,`receive_pay_v`.`rec_pay_type_name` AS `rec_pay_type_name` from (`reg_reg_payment` join `receive_pay_v` on((`reg_reg_payment`.`finance_id` = `receive_pay_v`.`id`))) ;



-- ----------------------------
-- View structure for reg_payments_v
-- ----------------------------
DROP VIEW IF EXISTS `reg_payments_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_payments_v` AS select `registration_view`.`reg_date` AS `reg_date`,`registration_view`.`theory_units` AS `theory_units`,`registration_view`.`actional_units` AS `actional_units`,`registration_view`.`fix_salary` AS `fix_salary`,`registration_view`.`theory_salary` AS `theory_salary`,`registration_view`.`actional_salary` AS `actional_salary`,`registration_view`.`other_salary_comment` AS `other_salary_comment`,`registration_view`.`other_salary_amount` AS `other_salary_amount`,`registration_view`.`total_salary` AS `total_salary`,`registration_view`.`off_amount` AS `off_amount`,`registration_view`.`off_comment` AS `off_comment`,`registration_view`.`term_name` AS `term_name`,`registration_view`.`field_name` AS `field_name`,`registration_view`.`name` AS `name`,`registration_view`.`famili` AS `famili`,`registration_view`.`national_code` AS `national_code`,`registration_view`.`identifier_code` AS `identifier_code`,`registration_view`.`identifier_serial` AS `identifier_serial`,`registration_view`.`identifier_char` AS `identifier_char`,`registration_view`.`student_code` AS `student_code`,`registration_view`.`father_name` AS `father_name`,`registration_view`.`date_of_birth` AS `date_of_birth`,`registration_view`.`address` AS `address`,`registration_view`.`mobile` AS `mobile`,`registration_view`.`phone` AS `phone`,`registration_view`.`archive_code` AS `archive_code`,`registration_view`.`org_name` AS `org_name`,`registration_view`.`id` AS `id`,`registration_view`.`status_name` AS `status_name`,`registration_view`.`status_id` AS `status_id`,`registration_view`.`st_org_id` AS `st_org_id`,`registration_view`.`field_id` AS `field_id`,`registration_view`.`reg_term_is_current` AS `reg_term_is_current`,`registration_view`.`reg_term_id` AS `reg_term_id`,`registration_view`.`org_unit_id` AS `org_unit_id`,`registration_view`.`level_id` AS `level_id`,`registration_view`.`level_name` AS `level_name`,`registration_view`.`created_date` AS `created_date`,`registration_view`.`last_modified` AS `last_modified`,`registration_view`.`from_date` AS `from_date`,`reg_pay_rec_v`.`reg_id` AS `reg_id`,`reg_pay_rec_v`.`amount` AS `amount`,`reg_pay_rec_v`.`finance_id` AS `finance_id`,`reg_pay_rec_v`.`next_payment` AS `next_payment`,`reg_pay_rec_v`.`account_bank_id` AS `account_bank_id`,`reg_pay_rec_v`.`receive_pay_type_id` AS `receive_pay_type_id`,`reg_pay_rec_v`.`description` AS `description`,`reg_pay_rec_v`.`code` AS `code`,`reg_pay_rec_v`.`b_a_name` AS `b_a_name`,`reg_pay_rec_v`.`is_cash` AS `is_cash`,`reg_pay_rec_v`.`bank_name` AS `bank_name`,`reg_pay_rec_v`.`account_name` AS `account_name`,`reg_pay_rec_v`.`rec_pay_type_name` AS `rec_pay_type_name` from (`reg_pay_rec_v` join `registration_view`) where (`reg_pay_rec_v`.`reg_id` = `registration_view`.`id`) ;


-- ----------------------------
-- View structure for all_terms_naghd_payments
-- ----------------------------
DROP VIEW IF EXISTS `all_terms_naghd_payments`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_terms_naghd_payments` AS select sum(`reg_payments_v`.`amount`) AS `totalTermPayments`,`reg_term`.`id` AS `term_id`,`reg_term`.`name` AS `name` from (`reg_term` join `reg_payments_v`) where (`reg_term`.`id` = `reg_payments_v`.`reg_term_id`) group by `reg_term`.`id` ;

-- ----------------------------
-- View structure for all_terms_salary
-- ----------------------------
DROP VIEW IF EXISTS `all_terms_salary`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_terms_salary` AS select sum(`reg_registration`.`total_salary`) AS `totalSalary`,sum(`reg_registration`.`off_amount`) AS `totalOf`,`reg_term`.`name` AS `term_name`,count(`reg_registration`.`id`) AS `countOfRegistrations`,`reg_term`.`id` AS `term_id` from (`reg_term` join `reg_registration`) where (`reg_term`.`id` = `reg_registration`.`term_id`) group by `reg_registration`.`term_id` ;

-- ----------------------------
-- View structure for all_term_details
-- ----------------------------
DROP VIEW IF EXISTS `all_term_details`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_term_details` AS select `registration_view`.`term_name` AS `term_name`,sum(`registration_view`.`off_amount`) AS `sum_off`,sum(`registration_view`.`total_salary`) AS `sum_total`,sum(`registration_view`.`theory_units`) AS `sum_theory_uints`,sum(`registration_view`.`actional_units`) AS `sum_actional_units`,count(`registration_view`.`id`) AS `sum_registrations`,count(`registration_view`.`student_code`) AS `sum_students`,`registration_view`.`reg_term_id` AS `reg_term_id` from `registration_view` group by `registration_view`.`term_name`,`registration_view`.`reg_term_id` order by `registration_view`.`reg_term_id` desc ;



-- ----------------------------
-- View structure for course_field_view
-- ----------------------------
DROP VIEW IF EXISTS `course_field_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `course_field_view` AS SELECT
	reg_course_field.id AS id, 
	reg_course_field.field_id AS field_id, 
	reg_course_field.course_id AS course_id, 
	reg_course_field.is_final AS is_final, 
	reg_course_field.unitCount AS unit_Count, 
	reg_field.`name` AS field_name, 
	reg_course.`code` AS course_code, 
	reg_course.`name` AS course_name, 
	reg_course.display_name AS course_display_name, 
	reg_course.description AS course_description
FROM
	(
		(
			reg_course_field
			join
			reg_course
			ON 
				(
					(
						reg_course_field.course_id = reg_course.ID
					)
				)
		)
		join
		reg_field
		ON 
			(
				(
					reg_course_field.field_id = reg_field.id
				)
			)
	) ;

-- ----------------------------
-- View structure for course_view
-- ----------------------------
DROP VIEW IF EXISTS `course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `course_view` AS SELECT
	reg_course.`code` AS course_code, 
	reg_course.`name` AS course_name, 
	reg_course.display_name AS course_display_name, 
	reg_course.description AS course_description, 
	reg_exam_course.Id AS exam_course_id, 
	reg_exam_course.exam_time_id AS exam_time_id, 
	reg_exam_course.course_id AS course_id, 
	reg_exam_time.term_id AS term_id, 
	reg_exam_time.exam_date AS exam_date, 
	reg_exam_time.`hour` AS exam_hour, 
	reg_term.`name` AS term_name, 
	reg_term.is_current AS term_is_current
FROM
	reg_exam_course
	INNER JOIN
	reg_course
	ON 
		reg_exam_course.course_id = reg_course.ID
	INNER JOIN
	reg_exam_time
	ON 
		reg_exam_course.exam_time_id = reg_exam_time.ID
	INNER JOIN
	reg_term
	ON 
		reg_exam_time.term_id = reg_term.id ;

-- ----------------------------
-- View structure for current_accunting_view
-- ----------------------------
DROP VIEW IF EXISTS `current_accunting_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `current_accunting_view` AS select sum(`finance_receive_payment`.`amount`) AS `naghd`,`finance_account`.`id` AS `id`,sum(`factor`.`amount`) AS `factor`,sum(`ckecks`.`amount`) AS `check`,(((sum(`factor`.`amount`) + sum(`finance_receive_payment`.`amount`)) + sum(`ckecks`.`amount`)) + `finance_account`.`fisrt_payable`) AS `test`,`finance_account`.`fisrt_payable` AS `fisrt_payable`,`account_student_view`.`st_name` AS `st_name`,`account_student_view`.`st_famili` AS `st_famili`,`account_student_view`.`national_code` AS `national_code`,`account_student_view`.`st_mobile` AS `st_mobile`,`account_student_view`.`status_id` AS `status_id`,`account_student_view`.`org_unit_id` AS `org_unit_id`,`reg_organization`.`name` AS `org_name`,`reg_student_status`.`name` AS `status_name` from ((((((`finance_check` `ckecks` join `finance_account`) join `finance_receive_payment` on((`finance_account`.`id` = `finance_receive_payment`.`account_person_id`))) join `finance_factor` `factor` on((('' = '') and (`ckecks`.`status_id` <> 1)))) join `account_student_view` on((`finance_account`.`id` = `account_student_view`.`acc_id`))) join `reg_student_status` on((`account_student_view`.`status_id` = `reg_student_status`.`id`))) join `reg_organization` on((`reg_organization`.`id` = `account_student_view`.`org_unit_id`))) group by `finance_account`.`id` order by `account_student_view`.`st_famili` ;

-- ----------------------------
-- View structure for exam_course_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `exam_course_view` AS SELECT
	reg_course.`code` AS course_code, 
	reg_course.`name` AS course_name, 
	reg_course.display_name AS course_display_name, 
	reg_course.description AS course_description, 
	reg_exam_course.Id AS exam_course_id, 
	reg_exam_course.exam_time_id AS exam_time_id, 
	reg_exam_course.course_id AS course_id, 
	reg_exam_time.term_id AS term_id, 
	reg_exam_time.exam_date AS exam_date, 
	reg_exam_time.`hour` AS exam_hour, 
	reg_term.`name` AS term_name, 
	reg_term.is_current AS term_is_current
FROM
	reg_exam_course
	INNER JOIN
	reg_course
	ON 
		reg_exam_course.course_id = reg_course.ID
	INNER JOIN
	reg_exam_time
	ON 
		reg_exam_course.exam_time_id = reg_exam_time.ID
	INNER JOIN
	reg_term
	ON 
		reg_exam_time.term_id = reg_term.id ;


-- ----------------------------
-- View structure for reg_registerd_course_view
-- ----------------------------
DROP VIEW IF EXISTS `reg_registerd_course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_registerd_course_view` AS SELECT
	reg_registration.id AS reg_id, 
	reg_registration.reg_date, 
	reg_registration.st_id, 
	reg_registration.field_id, 
	reg_registration.term_id, 
	reg_registration.level_id, 
	reg_registration.theory_units, 
	reg_registration.actional_units, 
	reg_registration.fix_salary, 
	reg_registration.actional_salary, 
	reg_registration.theory_salary, 
	reg_registration.other_salary_comment, 
	reg_registration.other_salary_amount, 
	reg_registration.total_salary, 
	reg_registration.off_amount, 
	reg_registration.off_comment, 
	reg_registration.base_id, 
	reg_student.`name` AS first_name, 
	reg_student.famili, 
	reg_student.national_code, 
	reg_student.father_name, 
	reg_student.date_of_birth, 
	reg_student.description AS st_description, 
	reg_student.status_id, 
	reg_student.org_unit_id, 
	reg_student.created_date, 
	reg_student.last_modified, 
	reg_student.address, 
	reg_student.mobile, 
	reg_student.archive_code, 
	reg_student.pish_madrak, 
	reg_student.diplom_madrak, 
	reg_course.ID AS course_id, 
	reg_course.`code` AS course_code, 
	reg_course.`name` AS course_name, 
	reg_course.unit AS course_unit, 
	reg_course.is_final AS course_is_final, 
	reg_course.display_name AS course_dispaly_name, 
	reg_course.description AS course_description
FROM
	reg_reg_course
	INNER JOIN
	reg_course
	ON 
		reg_reg_course.course_id = reg_course.ID
	INNER JOIN
	reg_registration
	ON 
		reg_reg_course.reg_id = reg_registration.id
	INNER JOIN
	reg_student
	ON 
		reg_registration.st_id = reg_student.student_code
	INNER JOIN
	reg_term
	ON 
		reg_registration.term_id = reg_term.id
WHERE
	reg_term.is_current = 1 ;



-- ----------------------------
-- View structure for exam_kart_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_kart_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `exam_kart_view` AS SELECT
	exam_course_view.term_id, 
	reg_registerd_course_view.first_name, 
	reg_registerd_course_view.famili, 
	exam_course_view.course_display_name, 
	exam_course_view.course_code, 
	exam_course_view.exam_date, 
	pdate(exam_course_view.exam_date) AS exam_farsi_date, 
	pweekday(exam_course_view.exam_date) AS exam_week_day, 
	pmonthname(exam_course_view.exam_date) AS exam_month_name, 
	exam_course_view.exam_hour, 
	exam_course_view.exam_time_id, 
	reg_registerd_course_view.father_name, 
	course_field_view.field_name, 
	reg_student_image.st_image, 
	exam_course_view.term_name, 
	reg_exam_kart_config.manager_name, 
	reg_exam_kart_config.school_name, 
	reg_exam_kart_config.exam_location, 
	reg_registerd_course_view.st_id, 
	reg_registerd_course_view.national_code,
	course_field_view.is_final
FROM
	reg_registerd_course_view
	INNER JOIN
	exam_course_view
	ON 
		exam_course_view.term_id = reg_registerd_course_view.term_id AND
		exam_course_view.course_id = reg_registerd_course_view.course_id
	INNER JOIN
	course_field_view
	ON 
		reg_registerd_course_view.course_id = course_field_view.course_id AND
		reg_registerd_course_view.field_id = course_field_view.field_id
	LEFT JOIN
	reg_student_image
	ON 
		reg_registerd_course_view.st_id = reg_student_image.st_code,
	reg_exam_kart_config
WHERE
	 exam_course_view.term_is_current = 1 ;

-- ----------------------------
-- View structure for last_registration_students
-- ----------------------------
DROP VIEW IF EXISTS `last_registration_students`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `last_registration_students` AS SELECT
Max(registration_view2.reg_term_id) AS last_term,
registration_view2.student_code AS student_code,
registration_view2.famili AS famili,
registration_view2.status_name AS status_name,
registration_view2.level_id AS level_id,
registration_view2.level_name AS level_name,
registration_view2.mobile AS mobile,
registration_view2.org_unit_id AS org_unit_id,
registration_view2.reg_term_is_current AS reg_term_is_current,
registration_view2.status_id AS status_id,
registration_view2.archive_code AS archive_code,
registration_view2.national_code AS national_code,
registration_view2.father_name AS father_name,
registration_view2.description AS description,
registration_view2.org_name AS org_name,
registration_view2.pish_madrak AS pish_madrak,
registration_view2.diplom_madrak AS diplom_madrak,
registration_view2.term_name AS term_name,
registration_view2.field_name AS field_name,
registration_view2.`name`,
registration_view2.date_of_birth,
registration_view2.phone,
registration_view2.st_org_id,
registration_view2.field_id
from `registration_view2`
group by `registration_view2`.`student_code`
order by `registration_view2`.`reg_term_id` desc ;

-- ----------------------------
-- View structure for last_registration_view
-- ----------------------------
DROP VIEW IF EXISTS `last_registration_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `last_registration_view` AS SELECT
last_registration_students.last_term,
last_registration_students.student_code,
registration_view.reg_date,
registration_view.theory_units,
registration_view.actional_units,
registration_view.fix_salary,
registration_view.theory_salary,
registration_view.actional_salary,
registration_view.other_salary_comment,
registration_view.other_salary_amount,
registration_view.total_salary,
registration_view.off_amount,
registration_view.off_comment,
registration_view.term_name,
registration_view.field_name,
registration_view.`name`,
registration_view.famili,
registration_view.national_code,
registration_view.identifier_code,
registration_view.identifier_serial,
registration_view.identifier_char,
registration_view.father_name,
registration_view.date_of_birth,
registration_view.description,
registration_view.address,
registration_view.mobile,
registration_view.phone,
registration_view.archive_code,
registration_view.org_name,
registration_view.id,
registration_view.status_name,
registration_view.status_id,
registration_view.st_org_id,
registration_view.field_id,
registration_view.reg_term_is_current,
registration_view.reg_term_id,
registration_view.org_unit_id,
registration_view.level_id,
registration_view.level_name,
registration_view.created_date,
registration_view.last_modified,
registration_view.from_date,
registration_view.pish_madrak,
registration_view.diplom_madrak,
pdate(last_registration_students.date_of_birth)
FROM
last_registration_students ,
registration_view
WHERE
last_registration_students.last_term = registration_view.reg_term_id AND
last_registration_students.student_code = registration_view.student_code ;

-- ----------------------------
-- View structure for receive_pay_factor
-- ----------------------------
DROP VIEW IF EXISTS `receive_pay_factor`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `receive_pay_factor` AS select `finance_factor`.`type_id` AS `type_id`,`finance_factor`.`id` AS `id`,`finance_factor`.`account_person_id` AS `account_person_id`,`finance_factor`.`create_date` AS `create_date` from (`finance_factor` join `finance_factor_type`) ;


-- ----------------------------
-- View structure for register_factor_view
-- ----------------------------
DROP VIEW IF EXISTS `register_factor_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `register_factor_view` AS select `reg_receivable`.`id` AS `id`,`reg_receivable`.`finance_factor_id` AS `finance_factor_id`,`reg_receivable`.`create_date` AS `create_date`,`reg_receivable`.`reg_id` AS `reg_id`,`reg_registration`.`st_id` AS `st_id`,`reg_registration`.`field_id` AS `field_id`,`reg_registration`.`term_id` AS `term_id`,`finance_factor`.`amount` AS `amount`,`finance_factor`.`type_id` AS `type_id`,`finance_factor`.`description` AS `description`,`finance_factor`.`account_person_id` AS `account_person_id` from ((`reg_receivable` join `reg_registration` on((`reg_receivable`.`reg_id` = `reg_registration`.`id`))) join `finance_factor` on((`reg_receivable`.`finance_factor_id` = `finance_factor`.`id`))) ;


-- ----------------------------
-- View structure for reg_all_pays
-- ----------------------------
DROP VIEW IF EXISTS `reg_all_pays`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_all_pays` AS (select reg_pay_rec_v.amount as amount_v , reg_pay_rec_v.create_date  as date_v ,reg_pay_rec_v.reg_id as reg_id_v , 'صندوق' as bank_v , null as check_status_name , reg_pay_rec_v.`code` as fish_number , null as check_date ,reg_pay_rec_v.rec_pay_type_name as pay_type_name from reg_pay_rec_v ) union (select reg_check_v.amount as amount_v , reg_check_v.create_date as date_v , reg_check_v.reg_id as reg_id_v , reg_check_v.bank_name as bank_v , reg_check_v.status_name as check_status_name , reg_check_v.number as fish_number , reg_check_v.check_date as check_date , 'چک' as pay_type_name from reg_check_v ) ;


-- ----------------------------
-- View structure for reg_not_registerd_course_view
-- ----------------------------
DROP VIEW IF EXISTS `reg_not_registerd_course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_not_registerd_course_view` AS select * from registration_view where student_code  
  not in (select reg_registerd_course_view.st_id from  reg_registerd_course_view )
and registration_view.reg_term_is_current = 1 
ORDER BY registration_view.famili ;

-- ----------------------------
-- View structure for reg_online_courses_sum_view
-- ----------------------------
DROP VIEW IF EXISTS `reg_online_courses_sum_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reg_online_courses_sum_view` AS SELECT DISTINCT
	reg_registration.st_id, 
	reg_student.`name`, 
	reg_student.famili, 
	GROUP_CONCAT(reg_course.display_name), 
	SUM(reg_course_field.unitCount) AS online_sum, 
	reg_registration.id AS reg_id
FROM
	reg_reg_course
	INNER JOIN
	reg_course
	ON 
		reg_reg_course.course_id = reg_course.ID
	INNER JOIN
	reg_registration
	ON 
		reg_reg_course.reg_id = reg_registration.id
	INNER JOIN
	reg_course_field
	ON 
		reg_course.ID = reg_course_field.course_id
	INNER JOIN
	reg_term
	ON 
		reg_registration.term_id = reg_term.id
	INNER JOIN
	reg_student
	ON 
		reg_registration.st_id = reg_student.student_code
WHERE
	reg_registration.field_id = reg_course_field.field_id AND
	reg_term.is_current = 1 AND
	reg_reg_course.course_id = reg_course.ID AND
	reg_course.has_online = 1
GROUP BY
	reg_registration.st_id ;




-- ----------------------------
-- View structure for students_in_courses_view
-- ----------------------------
DROP VIEW IF EXISTS `students_in_courses_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `students_in_courses_view` AS SELECT
	COUNT(reg_course.ID), 
	reg_course.`code`, 
	reg_course.display_name
FROM
	reg_course
	INNER JOIN
	reg_reg_course
	ON 
		reg_course.ID = reg_reg_course.course_id
		where reg_reg_course.reg_id in (select registration_view.id from registration_view where registration_view.reg_term_is_current = 1)
GROUP BY
	reg_reg_course.course_id ;

-- ----------------------------
-- View structure for student_view
-- ----------------------------
DROP VIEW IF EXISTS `student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `student_view` AS select `reg_student`.`name` AS `name`,`reg_student`.`famili` AS `famili`,`reg_student`.`student_code` AS `student_code`,`reg_student`.`status_id` AS `status_id`,`reg_student`.`org_unit_id` AS `org_unit_id`,`reg_student`.`level_id_last` AS `level_id_last`,`reg_student`.`field_id_last` AS `field_id_last`,`reg_field`.`name` AS `field_name`,`reg_level`.`name` AS `level_name`,`reg_organization`.`name` AS `org_name`,`reg_student_status`.`name` AS `status_name`,`reg_student`.`national_code` AS `national_code`,`reg_student`.`identifier_code` AS `identifier_code`,`reg_student`.`identifier_serial` AS `identifier_serial`,`reg_student`.`identifier_char` AS `identifier_char`,`reg_student`.`father_name` AS `father_name`,`reg_student`.`date_of_birth` AS `date_of_birth`,`reg_student`.`description` AS `description`,`reg_student`.`created_date` AS `created_date`,`reg_student`.`last_modified` AS `last_modified`,`reg_student`.`address` AS `address`,`reg_student`.`mobile` AS `mobile`,`reg_student`.`phone` AS `phone`,`reg_student`.`archive_code` AS `archive_code`,`reg_student`.`level_id_last` AS `level_id`,`reg_student`.`field_id_last` AS `field_id`,`reg_student`.`pish_madrak` AS `pish_madrak`,`reg_student`.`diplom_madrak` AS `diplom_madrak` from ((((`reg_student` left join `reg_field` on((`reg_student`.`field_id_last` = `reg_field`.`id`))) left join `reg_level` on((`reg_student`.`level_id_last` = `reg_level`.`id`))) join `reg_organization` on((`reg_student`.`org_unit_id` = `reg_organization`.`id`))) join `reg_student_status` on((`reg_student`.`status_id` = `reg_student_status`.`id`))) ;

-- ----------------------------
-- View structure for st_current_term_v
-- ----------------------------
DROP VIEW IF EXISTS `st_current_term_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `st_current_term_v` AS select `student_view`.`name` AS `name`,`student_view`.`famili` AS `famili`,`student_view`.`student_code` AS `student_code`,`student_view`.`status_id` AS `status_id`,`student_view`.`org_unit_id` AS `org_unit_id`,`student_view`.`level_id_last` AS `level_id_last`,`student_view`.`field_id_last` AS `field_id_last`,`student_view`.`field_name` AS `field_name`,`student_view`.`level_name` AS `level_name`,`student_view`.`org_name` AS `org_name`,`student_view`.`status_name` AS `status_name`,`student_view`.`national_code` AS `national_code`,`student_view`.`identifier_code` AS `identifier_code`,`student_view`.`identifier_serial` AS `identifier_serial`,`student_view`.`identifier_char` AS `identifier_char`,`student_view`.`father_name` AS `father_name`,`student_view`.`date_of_birth` AS `date_of_birth`,`student_view`.`description` AS `description`,`student_view`.`created_date` AS `created_date`,`student_view`.`last_modified` AS `last_modified`,`student_view`.`address` AS `address`,`student_view`.`mobile` AS `mobile`,`student_view`.`phone` AS `phone`,`student_view`.`archive_code` AS `archive_code` from `student_view` where `student_view`.`student_code` in (select `reg_registration`.`st_id` AS `st_id` from `reg_registration` where `reg_registration`.`term_id` in (select `reg_term`.`id` AS `id` from `reg_term` where (`reg_term`.`is_current` = 1))) ;

-- ----------------------------
-- View structure for st_not_current_t_v
-- ----------------------------
DROP VIEW IF EXISTS `st_not_current_t_v`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `st_not_current_t_v` AS select `student_view`.`name` AS `name`,`student_view`.`famili` AS `famili`,`student_view`.`student_code` AS `student_code`,`student_view`.`status_id` AS `status_id`,`student_view`.`org_unit_id` AS `org_unit_id`,`student_view`.`level_id_last` AS `level_id_last`,`student_view`.`field_id_last` AS `field_id_last`,`student_view`.`field_name` AS `field_name`,`student_view`.`level_name` AS `level_name`,`student_view`.`org_name` AS `org_name`,`student_view`.`status_name` AS `status_name`,`student_view`.`national_code` AS `national_code`,`student_view`.`identifier_code` AS `identifier_code`,`student_view`.`identifier_serial` AS `identifier_serial`,`student_view`.`identifier_char` AS `identifier_char`,`student_view`.`father_name` AS `father_name`,`student_view`.`date_of_birth` AS `date_of_birth`,`student_view`.`description` AS `description`,`student_view`.`created_date` AS `created_date`,`student_view`.`last_modified` AS `last_modified`,`student_view`.`address` AS `address`,`student_view`.`mobile` AS `mobile`,`student_view`.`phone` AS `phone`,`student_view`.`archive_code` AS `archive_code` from `student_view` where `student_view`.`student_code` in (select `reg_registration`.`st_id` AS `st_id` from `reg_registration` where (not(`reg_registration`.`term_id` in (select `reg_term`.`id` AS `id` from `reg_term` where (`reg_term`.`is_current` = 1))))) ;

-- ----------------------------
-- View structure for st_without_pic_view
-- ----------------------------
DROP VIEW IF EXISTS `st_without_pic_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `st_without_pic_view` AS SELECT
	
	registration_view.field_name, 
	registration_view.`name`, 
	registration_view.famili, 
	registration_view.national_code, 
	registration_view.mobile, 
	registration_view.archive_code, 
	registration_view.father_name
FROM
	registration_view
	LEFT JOIN
	reg_student_image
	ON 
		reg_student_image.st_code = registration_view.student_code
WHERE
	registration_view.reg_term_is_current = 1 AND
	reg_student_image.st_image IS NULL
ORDER BY
	registration_view.famili ;

