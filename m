Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4BBFEDA07
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 18:39:52 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83461.1773772790820107201
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 11:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FQ+qxX5/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.18, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sggU6OvGK/odK+jcgvZbA0DXG19gED7sOpW2W0M3ifQ1s9obUdD5XqxtzKJINC6GsGRSmHRqoiA3WzpNF4X3BzEzYXqw4Bd4d7y7za4L6Z5o36ytFryMwQ45kdykavygTFJQqWujrNm7lTUd2gY+qFi9X9xNwtu0xt08s/UdV9NrqNWWcIRhZPgV0iKqfsLg0aYPQo9poWrfg3ajHKYFBxwzgG8rXtJvB2J9Zf+haxZLU9CN+JMp0O/VvrwXBlqvROHOCKzYyxJUa5aUMfj5OsLG+SfXyJazUvEnPfYqqojm6GJec9DAiZAdpUFcw5kEBS0rYSjRIODQntreUhgnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SQONblLjt2OQJfL242MdT0wCLa71PnIwgCQqPNTafM=;
 b=jQzTgGNhilMwR3G5grm0hSXSRkDHUm36g8D0ElsY0m9gPe0v0nz70VzShmsOK+2vNETVBuc/oh2mr17SiHitEf91Ky3mPOxk+QTyGn80r6jiDwZTNigdsFY1aY07oA9Ja0b6Y/DLy4oeoIjyCICs+PNLAAXbpwDzKHb8W1jx9qsTRwl/n2UwFpl6jVJgiwYJ+jzq4fSR6xEVbHpq1g4GueMP52SeOcjA6JMXpCxFGYlrcdT0bDU1wLlf0gUr2qW+IL6DMEL9P+XFAdHF2DBIzqYJGJjbXybpwtjzIbnksUzD9BukylmG8zsH5Xr0rVx3eO51hLsytiPafNvEtJMlTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SQONblLjt2OQJfL242MdT0wCLa71PnIwgCQqPNTafM=;
 b=FQ+qxX5/G/5VGjcOYptQP2VDALPtLTDDmPX1PXlymHFyDp3GAnuaA+W2LqqS8YFnwRL4heiP3c7E6Hele0M9DAs/aNzR1RnyWuIsVgYcpSPYOq44jI4wOIii3tdHMZNSTggMedXULT2wpsPOSeO4ZuJqv9RzqW5C21Q8WKcl274=
Received: from DM6PR07CA0078.namprd07.prod.outlook.com (2603:10b6:5:337::11)
 by SJ0PR10MB4591.namprd10.prod.outlook.com (2603:10b6:a03:2af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 18:39:48 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::2b) by DM6PR07CA0078.outlook.office365.com
 (2603:10b6:5:337::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 18:39:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 18:39:48 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 13:39:39 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 13:39:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 13:39:39 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HIdbXd3662660;
	Tue, 17 Mar 2026 13:39:38 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH] arm-benchmarks: Disable security hardening for accurate performance measurement
Date: Wed, 18 Mar 2026 00:09:32 +0530
Message-ID: <20260317183932.327935-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SJ0PR10MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ccda57f-a583-4d75-c05d-08de84549141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2c5NgjAWNxze/vJMMV0nJVBu/ezVV6EgRZQtIlfnf6vA4JGwU8lPOKv9VMtM1HhVL63hoS7FSN97wvfviGa75vn8bpeYEi3zVBokWKSaxjEFFowhjv2BDctZ0q4YRcv5lTlVyoKffCWsSHAkL5FnjV0llxdOp1tM1SjIihLEs9/58vCzaEufmGOVJBJMnbQM1M2hfPcED8kjMbietyR7xeZwJjopbQWLDGFHMjqjgwuFNSyhF2XS3kqICaFZRPhijSQoJZ/e7/oOfvdyN8xBTtoNZ/NeEl61P0mcuL9mwsK8ZR0ObX6fGyWEOffAI57/RHajTQfryqDNcfmd8v72DErdfEXSEvYWCb8H/j4GrjkaC7wLoB8t1ZpvDnlyGRAYcwTk4bWuwneleu9rQElCbpWnzAnaJbIytN1oc7HTl9C1zM2jIdGkcnByCM0ZgODjvebmDNLswaejcnvNOZjRMDeXBnm7fnLoSY3DWzqN08UUt7j09mSddZ0YRy7Z82hokJ3K63c5eIf0lML2LgocJVrYC83eHjMKnvn1QZdfo7VkENUvCkD6A8uDFTWXECWzlwEl3mh/sloO8QhiZ+aVsiTNyqwMyikfC2LI26Qkwk07bDMaEJsNyYqmaH4uBYoSAK3EWhpwsToGxZzkjwn3Ess9LIuHnmCbltAhhe4rpke2H3abldTflMGRh/V+Fgw+KNQGe+EvHVmPVXwLAnamhP1So7p9ATz+fvuGlETKdHHn/iOJoAacSmyTg7wcIll7A/K6hnLCmK051saCxDpalA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Fcw5RnzHJzeC0Vbk3w0NAMdLa2e7YH6NrWFZwIkl1+r3OWdVdbx8OX1w4y2sBCnzfRZeLipDkqQjSvfSeppEmVFUezUTioNqebLIB04SBlExSvyi9M/aXXldvgDqjtvw4vcQbC/XIz9sL39KlTmSZvlT4FWCmxoVJ4zP0gMzec3o2TARwNnve8jr+mKuDXrlNuXHNVlpZM0bdIhJeY/v2kMbIajxV4TwZLhH1sYgCny/0Nkwg6SWcgDwakCRndT9cQgmCC1DPioBmn1i85xeEaHjfuyFUF49kw/iX5rs2/TG1JE9tw5ZS2D5kfwDrT1PtDDZKvaLgZwRcqq/7Dk8GcWR2sofvkyI/VosFmLCiaPy+y+LPB2XYq7wLhJ2f/hHeOoAs8PqhHBe5AgxJSczeqfR0UVWuDP1st1dD2lbG+OkqrXmyMNV1UFlQIzM9ASk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:39:48.1428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccda57f-a583-4d75-c05d-08de84549141
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4591
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 18:39:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17363

In oe-core scarthgap, security_flags.inc[0] was NOT loaded by default
in defaultsetup.conf, allowing benchmarks to run with minimal overhead.

In oe-core master, security_flags.inc is NOW loaded by default[1], enabling
all security hardening flags during arm-benchmarks compilation, causing
significant performance degradation.

Add distro-level override to disable security flags for arm-benchmarks,
restoring benchmark accuracy for industry-standard fair comparison while
maintaining full security hardening for all production binaries

[0]: https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/i=
nclude/security_flags.inc
[1]: https://git.openembedded.org/openembedded-core/commit/meta/conf/distro=
/defaultsetup.conf?id=3D4c2d64c10a5b0437ab1ea04df22386f0f95124d1

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                 | 1 +
 meta-arago-distro/conf/distro/include/arago-security.inc | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/arago-security.in=
c

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index 43d4db53..6987d0dd 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -137,6 +137,7 @@ ARAGO_IMAGE_SUFFIX:append =3D "${@oe.utils.conditional(=
"ARAGO_RT_ENABLE", "1", "-r
=20
 # Load default preferences
 require conf/distro/include/arago-prefs.inc
+require conf/distro/include/arago-security.inc
=20
 # Allow branding on top of Arago Distro and Core TI-SDK
 # If ARAGO_BRAND is not set in local.conf, default to core
diff --git a/meta-arago-distro/conf/distro/include/arago-security.inc b/met=
a-arago-distro/conf/distro/include/arago-security.inc
new file mode 100644
index 00000000..65107430
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/arago-security.inc
@@ -0,0 +1,3 @@
+# Override security hardening for performance benchmarks
+SECURITY_CFLAGS:pn-arm-benchmarks =3D ""
+SECURITY_STACK_PROTECTOR:pn-arm-benchmarks =3D ""
--=20
2.34.1


