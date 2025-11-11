Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1DFCCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 18:58:50 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25268.1762887521435610388
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 10:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Gwy0tNse;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.63, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tpzym+NfmWuMApFEvKi/9Y9bTzDcDLiHUN6VsdfsA7Ei81OXwEvAQD/bXuLCCl9Gi6Bgh+BPbETsFKf4DTp/9HqXCiYU6KlWJme/jMs6fUoO3e4K13U3UjmTA8xtg++GR2O5USOp9vJyJgFPjrxDu0EuPBVhjVTZp8SAOUB3FodozNIXbOi9B0zSTI+WDcSW0pK0N5Hw6EBoqn+KvEWdDk7j4H4rKaMEF0ZIZApnIGGbfG2X4obzYu3ZChZJEP7cRg5n6dQI8ljDQJ29l/lj0sG8Ujo67QU3SDFJeyrRW5J1wzfTMgDC3+ylyVQNr7DSKs34RuSmkJSStkU+sqYQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rekkcf0JbL8saoiVnlHyI1FpQ8BdpK7AYDTlcRCXqCg=;
 b=kIGJ2Pt3/BpdCTKh2aQBMcLWlKjEPzvDp7M1LeallMDuzKbLg0z2pYzE/TzoLPaP+CnTLY3UVVK6eOCAedMXoDqj48m5+h9oBTIZK+yWgnI4Pr/vD0c6QtmB5Mn3ucXLJ+/6sh/ez9ICJixsFAeaSvxaciD6lpxCAj+zqcRBUFoTMescH+f7v1tBb3RKX+DGnwnLCUOrt6qW0ESmwTPHsmhPTspscuywLYagOblsoqVNzS9ZBYxB/UFENxlWeXzC4xYA733MObFM2aq6nlLWBjlVr3IKj9bVItcB/Uu+RADGOVjjTZF3yaWgBaIxFcV0yFB7zfQteJMN3Rq93FkXQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rekkcf0JbL8saoiVnlHyI1FpQ8BdpK7AYDTlcRCXqCg=;
 b=Gwy0tNsetZn0ROzw7kHJ0D3NrSQUQV/bL9QR8yrdtIDzaZ2STnLoTgeHQerpl0kx+CfcVprN87DkJ6kTI0LoTlicZ/3Zn1dY2OjDoCfyxsuytWjxLDoJuY7J0wZhmqhaxwYMpc+cTjLxoVWotJabXmjYuu7uBP+rjo4eTyPTtp0=
Received: from SJ0PR13CA0202.namprd13.prod.outlook.com (2603:10b6:a03:2c3::27)
 by SN7PR10MB6305.namprd10.prod.outlook.com (2603:10b6:806:273::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 18:58:37 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::dd) by SJ0PR13CA0202.outlook.office365.com
 (2603:10b6:a03:2c3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 18:58:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 18:58:36 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 12:58:33 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 12:58:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 12:58:33 -0600
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ABIwW7h1382799;
	Tue, 11 Nov 2025 12:58:32 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] syslog-ng: Remove this recipe
Date: Tue, 11 Nov 2025 12:58:32 -0600
Message-ID: <20251111185832.2351798-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|SN7PR10MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e53a5b-d756-4c67-f32d-08de2154519b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eNe5DUJ46NqFwtdw8ew6SXVVWMfqbh0ad0rdXXMPiF8g2t7pW9Ytkjb33Zu9?=
 =?us-ascii?Q?ViFcfWk7ikOatYm9dOTMqjqKFK2i7ycg4Gtpc3wOXoXt5ipceEh8NnA3gAyb?=
 =?us-ascii?Q?M/vtrCWhiX0feqBdB7tIFuweWLZM0kDbVeP3QV5ncWfSAjzr8dlrJ7vBDKRn?=
 =?us-ascii?Q?uiW18udAyeH90spj4wqrelztoplqOwmre9iSTnlEIKqQGFWCI2ob+d21fdHo?=
 =?us-ascii?Q?lp0A3cY2x4L2V5u07a3dSFqNPSOhaUqQrOPipHo51SJhcLWiYHzeVRcj+am3?=
 =?us-ascii?Q?P1NNxzmRkLBB2a8yab0P9olcDyG39KLmzaw1JGFrT3Oh/GVzqtXSVRUlrFeF?=
 =?us-ascii?Q?yWufS3CquI5G66W6m16ZHKaXYiL+HRFcFiPRfcpbfQpHvW9RfCQyUHYyw+wp?=
 =?us-ascii?Q?+ESML8NSTFLTk0oHLA20Fx4NFbnWG5wiEvy3lRh3bU3sTzQtJk7Phhun4pa1?=
 =?us-ascii?Q?6ByQu2AXpl7GqEltPnhers0IN7RnUmpWmEV+ylF76e3XABG7CknniSzjB5fv?=
 =?us-ascii?Q?Tvgl6gMshwaeysjSTRKb1SjAxmeRQjDifmiuAmmfW1NtKuxLwBferSSKNHP+?=
 =?us-ascii?Q?b8m0fUspjZ39iBv6jcA+xyeWr2t+ntfrYqUay8xAKOvLXTuCvLG9MIXm8nxH?=
 =?us-ascii?Q?xG5RjONmwl+fiV94dLJTvky1juAw/P783JGT2Ckw/hVyhMpEhYCaHf8j361U?=
 =?us-ascii?Q?OyEukJrh1+97f7Duv2DyFkTZZ4MdTVBW9XS6aKtK1gMZQoJkCly+yhE4tWFr?=
 =?us-ascii?Q?bh/l/GNYRjMZS+v8yiiiPdDPG5bbOo1u58wSWshUgONrzBV/maViPHnpXTy9?=
 =?us-ascii?Q?+BWjsWi+HqXsmhCONgsWsOc90Hrmo2g75DafhIsZmxF47/xTczrLJhmaBoG1?=
 =?us-ascii?Q?Emdk9MXZY8bPd8kSXOcKj5VxAz+rYNaKFN9eTUHaskg5/1KFssjVAYhE7/ce?=
 =?us-ascii?Q?U6iw1sWSwzy+8FNW7vE6UldPffIShecwvo8duY5OA4OK96fw2pR1bqmULjg9?=
 =?us-ascii?Q?CgkTToiyaG1HvTEv7Qae0Havo5wX+U7FOvWY31gzLH7tBNdc23jkSKlMpYBy?=
 =?us-ascii?Q?i1QPhwABQ1rV5bwhLzvuki3d9YOqan5O8h0pA+2+VN0eLKX+FwIlkWedLtiG?=
 =?us-ascii?Q?aUTWnFciPlA/uLi1Aa3VfZ3kWWzHOx38Ngq+d7+6Wh68yn7xEU1Sq4t7aKu1?=
 =?us-ascii?Q?Gh1Dt3TNm6qmWiw+4qQvp4094hySgffZt4GC0r+4Hw4BPJZaA7XDhiImfiae?=
 =?us-ascii?Q?8XW/KAGHMhLve98DaLJ+ezrgJFVcyGZrDZlMi4TjWfyjrZJfbgMQ7F/agj+r?=
 =?us-ascii?Q?6tZvtolP8X+uCWnzODmyaZGLt7hMz7+wrxnrxXH8Pfs42zMeurlJv24ZVraX?=
 =?us-ascii?Q?F68u9WdZFHOok7Hp0/i0FygnmA/H6dmo3S6o92QKaZOPntNVLjNzxYC4O3Z+?=
 =?us-ascii?Q?5uzZ/1sF6T6+Bm30M3WI1uCGQVmDr4UFDTIS0rKLfNi/4ZrlKCIxielXBOzi?=
 =?us-ascii?Q?8KUysTqNyfT8p85FmDJlnUbX/3e3bjqlPDW+zbPGT+0MCFg0kcclQaG9aWym?=
 =?us-ascii?Q?C6X1BfDTxcgQOOPlKPo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 18:58:36.2723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e53a5b-d756-4c67-f32d-08de2154519b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6305
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Nov 2025 18:58:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16744

The only thing this recipe did was add a custom config for syslog-ng. This
config was nearly identical to the one in meta-oe other than one line for
better systemd compat. Since 2018 that same change was made to meta-oe and
this file was no longer named correctly to be pulled in anyway. It has
been unused since then, remove it.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../syslog-ng/files/syslog-ng.conf            | 155 ------------------
 .../syslog-ng/syslog-ng-arago.inc             |   2 -
 .../syslog-ng/syslog-ng_%.bbappend            |   4 -
 3 files changed, 161 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/syslog-ng/files/syslo=
g-ng.conf
 delete mode 100644 meta-arago-distro/recipes-support/syslog-ng/syslog-ng-a=
rago.inc
 delete mode 100644 meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%=
.bbappend

diff --git a/meta-arago-distro/recipes-support/syslog-ng/files/syslog-ng.co=
nf b/meta-arago-distro/recipes-support/syslog-ng/files/syslog-ng.conf
deleted file mode 100644
index 25124af6..00000000
--- a/meta-arago-distro/recipes-support/syslog-ng/files/syslog-ng.conf
+++ /dev/null
@@ -1,155 +0,0 @@
-@version: 3.5
-#
-# Syslog-ng configuration file, compatible with default Debian syslogd
-# installation. Originally written by anonymous (I can't find his name)
-# Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
-
-# First, set some global options.
-options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
-	  owner("root"); group("adm"); perm(0640); stats_freq(0);
-	  bad_hostname("^gconfd$");
-};
-
-########################
-# Sources
-########################
-# This is the default behavior of sysklogd package
-# Logs may come from unix stream, but not from another machine.
-#
-source s_src { unix-dgram("/dev/log"); internal();
-       	     file("/proc/kmsg" program_override("kernel"));
-};
-
-# If you wish to get logs from remote machine you should uncomment
-# this and comment the above source line.
-#
-#source s_net { tcp(ip(127.0.0.1) port(1000) authentication(required) encr=
ypt(allow)); };
-
-########################
-# Destinations
-########################
-# First some standard logfile
-#
-destination d_auth { file("/var/log/auth.log"); };
-destination d_cron { file("/var/log/cron.log"); };
-destination d_daemon { file("/var/log/daemon.log"); };
-destination d_kern { file("/var/log/kern.log"); };
-destination d_lpr { file("/var/log/lpr.log"); };
-destination d_mail { file("/var/log/mail.log"); };
-destination d_syslog { file("/var/log/syslog"); };
-destination d_user { file("/var/log/user.log"); };
-destination d_uucp { file("/var/log/uucp.log"); };
-
-# This files are the log come from the mail subsystem.
-#
-destination d_mailinfo { file("/var/log/mail/mail.info"); };
-destination d_mailwarn { file("/var/log/mail/mail.warn"); };
-destination d_mailerr { file("/var/log/mail/mail.err"); };
-
-# Logging for INN news system
-#
-destination d_newscrit { file("/var/log/news/news.crit"); };
-destination d_newserr { file("/var/log/news/news.err"); };
-destination d_newsnotice { file("/var/log/news/news.notice"); };
-
-# Some catch-all logfiles.
-#
-destination d_debug { file("/var/log/debug"); };
-destination d_error { file("/var/log/error"); };
-destination d_messages { file("/var/log/messages"); };
-
-# The root's console.
-#
-destination d_console { usertty("root"); };
-
-# Virtual console.
-#
-destination d_console_all { file("/dev/tty10"); };
-
-# The named pipe /dev/xconsole is for the nsole' utility.  To use it,
-# you must invoke nsole' with the -file' option:
-#
-#    $ xconsole -file /dev/xconsole [...]
-#
-destination d_xconsole { pipe("/dev/xconsole"); };
-
-# Send the messages to an other host
-#
-#destination d_net { tcp("127.0.0.1" port(1000) authentication(on) encrypt=
(on) log_fifo_size(1000)); };
-
-# Debian only
-destination d_ppp { file("/var/log/ppp.log"); };
-
-########################
-# Filters
-########################
-# Here's come the filter options. With this rules, we can set which
-# message go where.
-
-filter f_dbg { level(debug); };
-filter f_info { level(info); };
-filter f_notice { level(notice); };
-filter f_warn { level(warn); };
-filter f_err { level(err); };
-filter f_crit { level(crit .. emerg); };
-
-filter f_debug { level(debug) and not facility(auth, authpriv, news, mail)=
; };
-filter f_error { level(err .. emerg) ; };
-filter f_messages { level(info,notice,warn) and
-                    not facility(auth,authpriv,cron,daemon,mail,news); };
-
-filter f_auth { facility(auth, authpriv) and not filter(f_debug); };
-filter f_cron { facility(cron) and not filter(f_debug); };
-filter f_daemon { facility(daemon) and not filter(f_debug); };
-filter f_kern { facility(kern) and not filter(f_debug); };
-filter f_lpr { facility(lpr) and not filter(f_debug); };
-filter f_local { facility(local0, local1, local3, local4, local5,
-                        local6, local7) and not filter(f_debug); };
-filter f_mail { facility(mail) and not filter(f_debug); };
-filter f_news { facility(news) and not filter(f_debug); };
-filter f_syslog3 { not facility(auth, authpriv, mail) and not filter(f_deb=
ug); };
-filter f_user { facility(user) and not filter(f_debug); };
-filter f_uucp { facility(uucp) and not filter(f_debug); };
-
-filter f_cnews { level(notice, err, crit) and facility(news); };
-filter f_cother { level(debug, info, notice, warn) or facility(daemon, mai=
l); };
-
-filter f_ppp { facility(local2) and not filter(f_debug); };
-filter f_console { level(warn .. emerg); };
-
-########################
-# Log paths
-########################
-log { source(s_src); filter(f_auth); destination(d_auth); };
-log { source(s_src); filter(f_cron); destination(d_cron); };
-log { source(s_src); filter(f_daemon); destination(d_daemon); };
-log { source(s_src); filter(f_kern); destination(d_kern); };
-log { source(s_src); filter(f_lpr); destination(d_lpr); };
-log { source(s_src); filter(f_syslog3); destination(d_syslog); };
-log { source(s_src); filter(f_user); destination(d_user); };
-log { source(s_src); filter(f_uucp); destination(d_uucp); };
-
-log { source(s_src); filter(f_mail); destination(d_mail); };
-#log { source(s_src); filter(f_mail); filter(f_info); destination(d_mailin=
fo); };
-#log { source(s_src); filter(f_mail); filter(f_warn); destination(d_mailwa=
rn); };
-#log { source(s_src); filter(f_mail); filter(f_err); destination(d_mailerr=
); };
-
-log { source(s_src); filter(f_news); filter(f_crit); destination(d_newscri=
t); };
-log { source(s_src); filter(f_news); filter(f_err); destination(d_newserr)=
; };
-log { source(s_src); filter(f_news); filter(f_notice); destination(d_newsn=
otice); };
-#log { source(s_src); filter(f_cnews); destination(d_console_all); };
-#log { source(s_src); filter(f_cother); destination(d_console_all); };
-
-#log { source(s_src); filter(f_ppp); destination(d_ppp); };
-
-log { source(s_src); filter(f_debug); destination(d_debug); };
-log { source(s_src); filter(f_error); destination(d_error); };
-log { source(s_src); filter(f_messages); destination(d_messages); };
-
-log { source(s_src); filter(f_console); destination(d_console_all);
-				    destination(d_xconsole); };
-log { source(s_src); filter(f_crit); destination(d_console); };
-
-# All messages send to a remote site
-#
-#log { source(s_src); destination(d_net); };
diff --git a/meta-arago-distro/recipes-support/syslog-ng/syslog-ng-arago.in=
c b/meta-arago-distro/recipes-support/syslog-ng/syslog-ng-arago.inc
deleted file mode 100644
index 6c6a8ff0..00000000
--- a/meta-arago-distro/recipes-support/syslog-ng/syslog-ng-arago.inc
+++ /dev/null
@@ -1,2 +0,0 @@
-PR:append =3D ".arago0"
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
diff --git a/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappe=
nd b/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend
deleted file mode 100644
index 0dbc6349..00000000
--- a/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-SYSLOG_NG_ARAGO =3D ""
-SYSLOG_NG_ARAGO:arago =3D "syslog-ng-arago.inc"
-
-require ${SYSLOG_NG_ARAGO}
--=20
2.39.2


