--
-- Table structure for table `BATCH_JOB_EXECUTION`
--

DROP TABLE IF EXISTS `BATCH_JOB_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BATCH_JOB_EXECUTION` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `JOB_INSTANCE_ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime(6) NOT NULL,
  `START_TIME` datetime(6) DEFAULT NULL,
  `END_TIME` datetime(6) DEFAULT NULL,
  `STATUS` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIT_CODE` varchar(2500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_UPDATED` datetime(6) DEFAULT NULL,
  `JOB_CONFIGURATION_LOCATION` varchar(2500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  KEY `idx_batch_job_execution_1` (`JOB_INSTANCE_ID`),
  KEY `BATCH_JOB_EXECUTION_IDX` (`JOB_INSTANCE_ID`),
  CONSTRAINT `JOB_INST_EXEC_FK` FOREIGN KEY (`JOB_INSTANCE_ID`) REFERENCES `BATCH_JOB_INSTANCE` (`JOB_INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BATCH_JOB_EXECUTION_CONTEXT`
--

DROP TABLE IF EXISTS `BATCH_JOB_EXECUTION_CONTEXT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BATCH_JOB_EXECUTION_CONTEXT` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `SHORT_CONTEXT` varchar(2500) COLLATE utf8_unicode_ci NOT NULL,
  `SERIALIZED_CONTEXT` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_CTX_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BATCH_JOB_EXECUTION_PARAMS`
--

DROP TABLE IF EXISTS `BATCH_JOB_EXECUTION_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BATCH_JOB_EXECUTION_PARAMS` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `TYPE_CD` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `KEY_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `STRING_VAL` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_VAL` datetime(6) DEFAULT NULL,
  `LONG_VAL` bigint(20) DEFAULT NULL,
  `DOUBLE_VAL` double DEFAULT NULL,
  `IDENTIFYING` char(1) COLLATE utf8_unicode_ci NOT NULL,
  KEY `JOB_EXEC_PARAMS_FK` (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_PARAMS_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BATCH_JOB_EXECUTION_SEQ`
--

DROP TABLE IF EXISTS `BATCH_JOB_EXECUTION_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BATCH_JOB_EXECUTION_SEQ` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BATCH_JOB_INSTANCE`
--

DROP TABLE IF EXISTS `BATCH_JOB_INSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BATCH_JOB_INSTANCE` (
  `JOB_INSTANCE_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `JOB_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `JOB_KEY` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`JOB_INSTANCE_ID`),
  UNIQUE KEY `JOB_INST_UN` (`JOB_NAME`,`JOB_KEY`),
  KEY `idx_batch_job_instance_1` (`JOB_NAME`,`JOB_KEY`),
  KEY `BATCH_JOB_INSTANCE_IDX` (`JOB_NAME`,`JOB_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BATCH_JOB_SEQ`
--

DROP TABLE IF EXISTS `BATCH_JOB_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BATCH_JOB_SEQ` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BATCH_STEP_EXECUTION`
--

DROP TABLE IF EXISTS `BATCH_STEP_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BATCH_STEP_EXECUTION` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL,
  `STEP_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `START_TIME` datetime(6) NOT NULL,
  `END_TIME` datetime(6) DEFAULT NULL,
  `STATUS` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMIT_COUNT` bigint(20) DEFAULT NULL,
  `READ_COUNT` bigint(20) DEFAULT NULL,
  `FILTER_COUNT` bigint(20) DEFAULT NULL,
  `WRITE_COUNT` bigint(20) DEFAULT NULL,
  `READ_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `WRITE_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `PROCESS_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `ROLLBACK_COUNT` bigint(20) DEFAULT NULL,
  `EXIT_CODE` varchar(2500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_UPDATED` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  KEY `JOB_EXEC_STEP_FK` (`JOB_EXECUTION_ID`),
  KEY `idx_batch_step_execution_1` (`VERSION`),
  KEY `idx_batch_step_execution_2` (`STEP_NAME`,`JOB_EXECUTION_ID`),
  KEY `BATCH_STEP_EXECUTION_IDX` (`VERSION`),
  KEY `BATCH_STEP_EXECUTION_IDX_2` (`STEP_NAME`,`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_STEP_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BATCH_STEP_EXECUTION_CONTEXT`
--

DROP TABLE IF EXISTS `BATCH_STEP_EXECUTION_CONTEXT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BATCH_STEP_EXECUTION_CONTEXT` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL,
  `SHORT_CONTEXT` varchar(2500) COLLATE utf8_unicode_ci NOT NULL,
  `SERIALIZED_CONTEXT` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  CONSTRAINT `STEP_EXEC_CTX_FK` FOREIGN KEY (`STEP_EXECUTION_ID`) REFERENCES `BATCH_STEP_EXECUTION` (`STEP_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BATCH_STEP_EXECUTION_SEQ`
--

DROP TABLE IF EXISTS `BATCH_STEP_EXECUTION_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BATCH_STEP_EXECUTION_SEQ` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govhub_applications`
--

DROP TABLE IF EXISTS `govhub_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govhub_applications` (
  `id` bigint(20) NOT NULL,
  `application_id` varchar(255) NOT NULL,
  `deployed_uri` varchar(255) NOT NULL,
  `logo` text,
  `name` varchar(255) NOT NULL,
  `webapp_uri` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_j606qsc51du1pknq7js61xc37` (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govhub_assignable_roles`
--

DROP TABLE IF EXISTS `govhub_assignable_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govhub_assignable_roles` (
  `role_id` bigint(20) NOT NULL,
  `assignable_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`assignable_role_id`),
  KEY `GovhubAssRole_AssignedGovhubRole` (`assignable_role_id`),
  CONSTRAINT `GovhubAssRole_AssignedGovhubRole` FOREIGN KEY (`assignable_role_id`) REFERENCES `govhub_roles` (`id`),
  CONSTRAINT `GovhubAssRole_GovhubRole` FOREIGN KEY (`role_id`) REFERENCES `govhub_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govhub_auth_organizations`
--

DROP TABLE IF EXISTS `govhub_auth_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govhub_auth_organizations` (
  `id_govhub_authorization` bigint(20) NOT NULL,
  `id_govhub_organization` bigint(20) NOT NULL,
  PRIMARY KEY (`id_govhub_authorization`,`id_govhub_organization`),
  KEY `GovhubAuthOrganization_GovhubOrganization` (`id_govhub_organization`),
  CONSTRAINT `GovhubAuthOrganization_GovhubAuth` FOREIGN KEY (`id_govhub_authorization`) REFERENCES `govhub_authorizations` (`id`),
  CONSTRAINT `GovhubAuthOrganization_GovhubOrganization` FOREIGN KEY (`id_govhub_organization`) REFERENCES `govhub_organizations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govhub_auth_services`
--

DROP TABLE IF EXISTS `govhub_auth_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govhub_auth_services` (
  `id_govhub_authorization` bigint(20) NOT NULL,
  `id_govhub_service` bigint(20) NOT NULL,
  PRIMARY KEY (`id_govhub_authorization`,`id_govhub_service`),
  KEY `GovhubAuthOrganization_GovhubService` (`id_govhub_service`),
  CONSTRAINT `GovhubAuthOrganization_GovhubService` FOREIGN KEY (`id_govhub_service`) REFERENCES `govhub_services` (`id`),
  CONSTRAINT `GovhubAuthService_GovhubAuth` FOREIGN KEY (`id_govhub_authorization`) REFERENCES `govhub_authorizations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govhub_authorizations`
--

DROP TABLE IF EXISTS `govhub_authorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govhub_authorizations` (
  `id` bigint(20) NOT NULL,
  `expiration_date` timestamp NULL DEFAULT NULL,
  `id_govhub_role` bigint(20) NOT NULL,
  `id_govhub_user` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `GovhubAuth_GovhubRole` (`id_govhub_role`),
  KEY `GovhubAuth_GovhubUser` (`id_govhub_user`),
  CONSTRAINT `GovhubAuth_GovhubRole` FOREIGN KEY (`id_govhub_role`) REFERENCES `govhub_roles` (`id`),
  CONSTRAINT `GovhubAuth_GovhubUser` FOREIGN KEY (`id_govhub_user`) REFERENCES `govhub_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govhub_organizations`
--

DROP TABLE IF EXISTS `govhub_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govhub_organizations` (
  `id` bigint(20) NOT NULL,
  `legal_name` varchar(255) NOT NULL,
  `logo` longblob,
  `logo_media_type` varchar(255) DEFAULT NULL,
  `logo_miniature` longblob,
  `logo_miniature_media_type` varchar(255) DEFAULT NULL,
  `office_address` varchar(255) DEFAULT NULL,
  `office_address_details` varchar(255) DEFAULT NULL,
  `office_at` varchar(255) DEFAULT NULL,
  `office_email_address` varchar(255) DEFAULT NULL,
  `office_foreign_state` varchar(255) DEFAULT NULL,
  `office_municipality` varchar(255) DEFAULT NULL,
  `office_municipality_details` varchar(255) DEFAULT NULL,
  `office_pec_address` varchar(255) DEFAULT NULL,
  `office_phone_number` varchar(255) DEFAULT NULL,
  `office_province` varchar(255) DEFAULT NULL,
  `office_zip` varchar(255) DEFAULT NULL,
  `tax_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3tku2orbbyp0o0c8qq56cqbou` (`legal_name`),
  UNIQUE KEY `UK_r8n43m06apkfslppxa4yd5977` (`tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govhub_roles`
--

DROP TABLE IF EXISTS `govhub_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govhub_roles` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `id_govhub_application` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_lsmgbd03vdg496rorn3in2ntj` (`name`),
  KEY `GovhubRole_GovhubApplication` (`id_govhub_application`),
  CONSTRAINT `GovhubRole_GovhubApplication` FOREIGN KEY (`id_govhub_application`) REFERENCES `govhub_applications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govhub_services`
--

DROP TABLE IF EXISTS `govhub_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govhub_services` (
  `id` bigint(20) NOT NULL,
  `description` text,
  `logo` longblob,
  `logo_media_type` varchar(255) DEFAULT NULL,
  `logo_miniature` longblob,
  `logo_miniature_media_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q7urrhraos6kjlhg8hhdqxdoq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govhub_users`
--

DROP TABLE IF EXISTS `govhub_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govhub_users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `principal` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_flp48uw93dwjm43yjdbf8mppd` (`principal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govio_file_messages`
--

DROP TABLE IF EXISTS `govio_file_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govio_file_messages` (
  `id` bigint(20) NOT NULL,
  `error` text,
  `line_number` bigint(20) DEFAULT NULL,
  `line_record` text,
  `id_govio_file` bigint(20) NOT NULL,
  `id_govio_message` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueGovioFileLineNumber` (`id_govio_file`,`line_number`),
  KEY `GovioFileMessage_GovioMessage` (`id_govio_message`),
  CONSTRAINT `GovioFileMessage_GovioFile` FOREIGN KEY (`id_govio_file`) REFERENCES `govio_files` (`id`),
  CONSTRAINT `GovioFileMessage_GovioMessage` FOREIGN KEY (`id_govio_message`) REFERENCES `govio_messages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govio_file_messages_stats`
--

DROP TABLE IF EXISTS `govio_file_messages_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govio_file_messages_stats` (
  `id` bigint(20) NOT NULL,
  `count` bigint(20) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfnfpr5hdvdmlun32xw53jhyum` (`file_id`),
  CONSTRAINT `FKfnfpr5hdvdmlun32xw53jhyum` FOREIGN KEY (`file_id`) REFERENCES `govio_files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govio_files`
--

DROP TABLE IF EXISTS `govio_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govio_files` (
  `id` bigint(20) NOT NULL,
  `acquired_messages` bigint(20) DEFAULT NULL,
  `creation_date` datetime(6) NOT NULL,
  `error_messages` bigint(20) DEFAULT NULL,
  `id_govhub_user` bigint(20) NOT NULL,
  `location` varchar(1024) NOT NULL,
  `name` varchar(255) NOT NULL,
  `processing_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `status_detail` varchar(1024) DEFAULT NULL,
  `id_govio_service_instance` bigint(20) NOT NULL,
  `size` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `GovioFile_GovhubUser` (`id_govhub_user`),
  KEY `GovioFile_GovioServiceInstance` (`id_govio_service_instance`),
  CONSTRAINT `GovioFile_GovhubUser` FOREIGN KEY (`id_govhub_user`) REFERENCES `govhub_users` (`id`),
  CONSTRAINT `GovioFile_GovioServiceInstance` FOREIGN KEY (`id_govio_service_instance`) REFERENCES `govio_service_instances` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govio_messages`
--

DROP TABLE IF EXISTS `govio_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govio_messages` (
  `id` bigint(20) NOT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `appio_message_id` varchar(255) DEFAULT NULL,
  `creation_date` datetime(6) NOT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `expedition_date` datetime(6) DEFAULT NULL,
  `invalid_after_due_date` bit(1) DEFAULT NULL,
  `last_update_status` datetime(6) DEFAULT NULL,
  `markdown` text NOT NULL,
  `notice_number` varchar(255) DEFAULT NULL,
  `payee` varchar(255) DEFAULT NULL,
  `scheduled_expedition_date` datetime(6) NOT NULL,
  `status` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `taxcode` varchar(255) NOT NULL,
  `id_govio_service_instance` bigint(20) NOT NULL,
  `id_govhub_user` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `GovioMessage_GovioServiceInstance` (`id_govio_service_instance`),
  KEY `GovioMessage_GovhubUser` (`id_govhub_user`),
  CONSTRAINT `GovioMessage_GovhubUser` FOREIGN KEY (`id_govhub_user`) REFERENCES `govhub_users` (`id`),
  CONSTRAINT `GovioMessage_GovioServiceInstance` FOREIGN KEY (`id_govio_service_instance`) REFERENCES `govio_service_instances` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govio_messages_idempotency_keys`
--

DROP TABLE IF EXISTS `govio_messages_idempotency_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govio_messages_idempotency_keys` (
  `id_govio_message` bigint(20) NOT NULL,
  `bean_hashcode` bigint(20) DEFAULT NULL,
  `idempotency_key` varbinary(36) DEFAULT NULL,
  PRIMARY KEY (`id_govio_message`),
  UNIQUE KEY `UniqueIdempotencykeyHashcode` (`idempotency_key`,`bean_hashcode`),
  KEY `BeanHashcodeIdx` (`bean_hashcode`),
  CONSTRAINT `IdempotencyKey_GovioMessage` FOREIGN KEY (`id_govio_message`) REFERENCES `govio_messages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govio_placeholders`
--

DROP TABLE IF EXISTS `govio_placeholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govio_placeholders` (
  `id` bigint(20) NOT NULL,
  `description` text,
  `example` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pattern` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueGovioPlaceholderName` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govio_planner_exp_files`
--

DROP TABLE IF EXISTS `govio_planner_exp_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govio_planner_exp_files` (
  `id` bigint(20) NOT NULL,
  `creation_date` datetime NOT NULL,
  `location` varchar(2048) NOT NULL,
  `name` varchar(255) NOT NULL,
  `plan_id` varchar(512) NOT NULL,
  `processing_date` datetime DEFAULT NULL,
  `size` bigint(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  `id_govauth_user` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `GovioFile_GovhubUser` (`id_govauth_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govio_planner_ntfy_files`
--

DROP TABLE IF EXISTS `govio_planner_ntfy_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govio_planner_ntfy_files` (
  `id` bigint(20) NOT NULL,
  `creation_date` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
  `message_count` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `size` bigint(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  `id_govio_planner_file` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_lrb0pnqq64pk8jd0pd0ji6d6q` (`name`),
  KEY `GovioFileProducedEntity_GovioPlannerFile` (`id_govio_planner_file`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govio_service_instances`
--

DROP TABLE IF EXISTS `govio_service_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govio_service_instances` (
  `id` bigint(20) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `io_service_id` varchar(255) NOT NULL,
  `id_govhub_organization` bigint(20) NOT NULL,
  `id_govhub_service` bigint(20) NOT NULL,
  `id_govio_template` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueServiceOrganizationTemplate` (`id_govhub_service`,`id_govio_template`,`id_govhub_organization`),
  KEY `GovioServiceInstance_GovioTemplate` (`id_govio_template`),
  KEY `GovioServiceInstance_GovhubOrganization` (`id_govhub_organization`),
  CONSTRAINT `GovioServiceInstance_GovhubOrganization` FOREIGN KEY (`id_govhub_organization`) REFERENCES `govhub_organizations` (`id`),
  CONSTRAINT `GovioServiceInstance_GovhubService` FOREIGN KEY (`id_govhub_service`) REFERENCES `govhub_services` (`id`),
  CONSTRAINT `GovioServiceInstance_GovioTemplate` FOREIGN KEY (`id_govio_template`) REFERENCES `govio_templates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govio_template_placeholders`
--

DROP TABLE IF EXISTS `govio_template_placeholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govio_template_placeholders` (
  `id_govio_placeholder` bigint(20) NOT NULL,
  `id_govio_template` bigint(20) NOT NULL,
  `mandatory` bit(1) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id_govio_placeholder`,`id_govio_template`),
  UNIQUE KEY `UniqueTemplatePlaceholderPosition` (`id_govio_template`,`position`),
  CONSTRAINT `GovioTemplatePlaceholder_GovioPlaceholder` FOREIGN KEY (`id_govio_placeholder`) REFERENCES `govio_placeholders` (`id`),
  CONSTRAINT `GovioTemplatePlaceholder_GovioTemplate` FOREIGN KEY (`id_govio_template`) REFERENCES `govio_templates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `govio_templates`
--

DROP TABLE IF EXISTS `govio_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `govio_templates` (
  `id` bigint(20) NOT NULL,
  `description` text,
  `has_due_date` bit(1) NOT NULL,
  `has_payment` bit(1) NOT NULL,
  `message_body` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govhub_applications`
--

DROP TABLE IF EXISTS `seq_govhub_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govhub_applications` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govhub_authorizations`
--

DROP TABLE IF EXISTS `seq_govhub_authorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govhub_authorizations` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govhub_organizations`
--

DROP TABLE IF EXISTS `seq_govhub_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govhub_organizations` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govhub_roles`
--

DROP TABLE IF EXISTS `seq_govhub_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govhub_roles` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govhub_services`
--

DROP TABLE IF EXISTS `seq_govhub_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govhub_services` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govhub_users`
--

DROP TABLE IF EXISTS `seq_govhub_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govhub_users` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govio_file_messages`
--

DROP TABLE IF EXISTS `seq_govio_file_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govio_file_messages` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govio_file_messages_stats`
--

DROP TABLE IF EXISTS `seq_govio_file_messages_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govio_file_messages_stats` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govio_files`
--

DROP TABLE IF EXISTS `seq_govio_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govio_files` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govio_messages`
--

DROP TABLE IF EXISTS `seq_govio_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govio_messages` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govio_placeholders`
--

DROP TABLE IF EXISTS `seq_govio_placeholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govio_placeholders` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govio_planner_exp_files`
--

DROP TABLE IF EXISTS `seq_govio_planner_exp_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govio_planner_exp_files` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govio_planner_ntfy_files`
--

DROP TABLE IF EXISTS `seq_govio_planner_ntfy_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govio_planner_ntfy_files` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govio_service_instances`
--

DROP TABLE IF EXISTS `seq_govio_service_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govio_service_instances` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_govio_templates`
--

DROP TABLE IF EXISTS `seq_govio_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_govio_templates` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

