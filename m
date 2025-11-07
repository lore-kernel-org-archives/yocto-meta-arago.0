Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B408ACCFA19
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 21:41:45 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10763.1762551698967011842
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 13:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=lSJasOcb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.37, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4fQgh2ziDBgrop4kmQH03p38Okv8L6bVao5+Q0pU44dOEQds7PQNM9bT0Al0oXUd8CGcaTy4yqn40kL18jSaq+CZfWmpk3vHYUXsxlRbSFuC/Scys7CTkhwq/iGNKxe4QgSbHz61/AmB6CyL8ceoPi3ILXiqamHfBCDDg26DVkaj8EXz7UxHgVr//cWOWxwe0hB6TlWG1KJFuDybcmE0b/8Efv95wZ5PdsqBC5ExaPHJIda8ECcH+ysCMLpPghQYbqRCNZHfLCtcd70eubfIMuALDYJgAMzy+tLGWkLyLq9Ear0yfb/bGPFOtUUCPvTe12eHYBsl/I5Q/3lzBTm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOGpsVGVc9WZQdjzCU6mKAVrabWcloBGqr/Bie0kUss=;
 b=dRanC2JoBB/tHkDmidEJ2redq2AL4XFoRhye5mX0bJP3adjGFENkWdkzXlaDb8GxuNNEjNNUhgw2xPaBjFh5XH/2WOYz1OVYn0nMn1+2pmGEmIgtV+qiGcLYqkjBPrjkqJDtap17hon0FCjgq+2UHgoio/wnhlQ1XodGKBGkEI79Uxn61InPVJ1DInF5xNGHTorakCZ01SMGyF84dXlHf6Hap6/UQRQ0VyEURKeIzJsEEHMRGQmX+dbn6e6ievpQVDpIm5d3Q4xfF+3rqOgLhjr0yX7bVJ96xZ6xuwqsyPD5puzwEoE4MkyH2+7mvHBrpP428U7fP5RNlXqVJGc+yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOGpsVGVc9WZQdjzCU6mKAVrabWcloBGqr/Bie0kUss=;
 b=lSJasOcbfr7cOKsdlGZlKUjo2PiHpMf52soZwLG7S4wbufAakxKOXOlbF95zuenUdhb9OsUzAsUcShEoOGgqp6VYRczRnpcoB/3n8rB2100u1WA2/DHvdgEs/fpLUdjm7EgIsm/EGBOEui0DVxnC0yWG7BwOkc5UYmhdw1WMAXk=
Received: from SJ0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:a03:2ef::10)
 by CY8PR10MB7291.namprd10.prod.outlook.com (2603:10b6:930:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 21:41:37 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::fb) by SJ0PR03CA0185.outlook.office365.com
 (2603:10b6:a03:2ef::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Fri, 7
 Nov 2025 21:41:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Fri, 7 Nov 2025 21:41:35 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:41:32 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:41:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 15:41:31 -0600
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7LfUT63713651;
	Fri, 7 Nov 2025 15:41:31 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 5/5] packagegroups: Substitute am57xx for remaining dra7xx uses
Date: Fri, 7 Nov 2025 15:41:28 -0600
Message-ID: <20251107214128.1491466-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251107214128.1491466-1-afd@ti.com>
References: <20251107214128.1491466-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|CY8PR10MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 607b07c4-ff80-43a4-b7c8-08de1e466ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0myOedZklAISX+bMMij2VdUyNexSHcpzoRqeoIdaF+zbPuKqd1LMvzCeBaLh?=
 =?us-ascii?Q?/QUhkBAUipQKcp7Tp3OVjiXZnEZ1mvrUsVVCVbWLKl/Izwg8h6WYpbCo1soZ?=
 =?us-ascii?Q?MCARd0+MYL1r1bBexq3kK1Kqiy6cnqHWtKTqeSOVojScQC1Y+EIV4sOyor0z?=
 =?us-ascii?Q?mAHNAVJQqyumTvO2YdyJzxOxN8iTNi4nq3sXu4HH94TeL51Qq0LnI5dyKFW4?=
 =?us-ascii?Q?ZoSyPSl8rFfBdx7Sk2i1euV/sLpxidyarloY4Jopf0WRItI5hkYRocVQb5gx?=
 =?us-ascii?Q?g9wOGX8ZTqETVtn2MQkBvsV0ffVV+I+z/ZK5bJ0G7afMIhjOUz7MA/iKtUqe?=
 =?us-ascii?Q?rF8bYDAY1wOa4dLc2+V3hqb6TBlY5o/79kdh7YXrDMccKDphUq7xCCLoBpxd?=
 =?us-ascii?Q?YoYVWGEqE1jRUX0EzBwyR4nz2/5HajjEPB8PXQgYfgMocKM36XpesgcxBTYo?=
 =?us-ascii?Q?tYJrgWDEcTqm0lgP/NfgT5vZ81KM1Sxs4Ofti0DfK5bV5LzJVUKbZrj3N828?=
 =?us-ascii?Q?wrR1WJep2smIEZpTShY1kDrF733BU5c5wQu19nwlRyOaJSRWPMeQBRFFUZJb?=
 =?us-ascii?Q?ZvJVll5kV+ADsFwBbtRsITUZKlet2rfAjIGoDW1dZZZ5HaexdeqeymbiEmpD?=
 =?us-ascii?Q?Gq1hDmWGnXOQmUAublLHkAhyqaCOu+UTdy3sQ315Foc4yL0EyVUTD4KQpUBj?=
 =?us-ascii?Q?VLfEbxb1/mcnfTZrqAiuq4q+Rm0KloS6unE1aD8GmTjYL99Zu9iKjEm2iWX/?=
 =?us-ascii?Q?ftkB9/vAGbbC2XRZvCmqW6IuegSbA+AYk8D6HiB/uKPECsFHA5fslSBSC82K?=
 =?us-ascii?Q?9YDP+C91D62C8C067szQ+yrMz9T82S8jagZ2BO6CkluO71XGM9lMt7erhdjb?=
 =?us-ascii?Q?X6hE3jlGa0pIfviT0r2gVA/WWCJ31XS583+q6+CZCfxrQYMk0jd0oR7pPfPR?=
 =?us-ascii?Q?FvcizL6wAT2ZNfUMwoa01D0nX5DmIcHEq8kfifhIX3tbOc5LFZLKcP/8M2Kz?=
 =?us-ascii?Q?F7YBePiLmhYTHc9ZlLq6kXZ2K9OArfBDvtHMcdi7CAmmQO1w4AmDpgBKC95I?=
 =?us-ascii?Q?DcpMwyAvTe+K0JRzFUvAjQq8G1jL3gGbrtSGi+dnfxwlfzj58SiPBAaELI6t?=
 =?us-ascii?Q?v7UqIWhjcnylE/B79fDhlt7OBv1eS/GbovSyUScMOeXjRyRFskMJmNWF7Q0n?=
 =?us-ascii?Q?CGyDYAL5EX9f+ri3jKpHVG6aeL2MmznauLvvu5jK/kpKnDY0Lt880tjt7KZq?=
 =?us-ascii?Q?r6NJTNuQwQ7s7/06BqOl3OuoDl3NR4dvuLTyN3jpSnWrNLXlzl7ADC+1Z9f2?=
 =?us-ascii?Q?JIKxVSe4UCR/1tBZb5pGxYoqmfQXNJpN8ks1gQOnc4CGNjHpqDrvN6CQWbv9?=
 =?us-ascii?Q?nOQUrlrUCpugbLXgd60PvR8EqYVZsSsBeawJw8F+YHwr7r2mEzp33gQvNYFl?=
 =?us-ascii?Q?azzowGajTnsBxCqdO4oqJhhytlaZE84ukOyT4GZI4Yq9IB/AvrC0HtRrKkBy?=
 =?us-ascii?Q?ABRaj8II7V8nbhiOr/MueRYdlqeUwCO9iZmp?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 21:41:35.4358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 607b07c4-ff80-43a4-b7c8-08de1e466ccd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7291
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Nov 2025 21:41:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16733

The AM57xx SoC family include dra7x.inc and so also have dra7xx set, this
means anything build for DRA7xx would also be built for AM57xx. DRA7x
support is being removed so set these to filter based on 'am57xx' so
that AM57xx board images will continue to contain these packages after
the dra7x.inc file is removed.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb      | 2 +-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb             | 4 ++--
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=
gst.bb
index f309dc4a..5240b459 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.b=
b
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.b=
b
@@ -20,7 +20,7 @@ GSTREAMER_DEPS:append:arago =3D " gstreamer1.0-libav"
=20
 GSTREAMER_ACCEL_MM =3D ""
 #GSTREAMER_ACCEL_MM:am57xx =3D "${@bb.utils.contains('MACHINE_FEATURES', '=
mmip', "gstreamer1.0-plugins-ducati", '', d)}"
-#GSTREAMER_ACCEL_MM:append:dra7xx =3D "${@bb.utils.contains('MACHINE_FEATU=
RES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
+#GSTREAMER_ACCEL_MM:append:am57xx =3D "${@bb.utils.contains('MACHINE_FEATU=
RES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
=20
 RDEPENDS:${PN} =3D "\
     ${GSTREAMER_DEPS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups=
/packagegroup-arago-tisdk-addons-sdk-target.bb
index 95be18ba..54c7c4c9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons-sdk-target.bb
@@ -15,7 +15,7 @@ UTILS =3D " \
=20
 UTILS:append:ti33x =3D " can-utils-dev"
 UTILS:append:ti43x =3D " can-utils-dev"
-UTILS:append:dra7xx =3D " can-utils-dev \
+UTILS:append:am57xx =3D " can-utils-dev \
                         elfutils-dev \
                         elfutils-staticdev \
 "
@@ -26,7 +26,7 @@ UTILS:append:k3 =3D "\
 "
=20
 EXTRA_LIBS =3D ""
-EXTRA_LIBS:append:dra7xx =3D " libulm-dev \
+EXTRA_LIBS:append:am57xx =3D " libulm-dev \
                              libulm-staticdev \
                              gdbserver-c6x-dev \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-multimedia.bb
index 54690317..b292502f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-multimedia.bb
@@ -20,7 +20,7 @@ MULTIMEDIA:append:arago =3D " ffmpeg mpv"
=20
 MULTIMEDIA:omapl138 =3D ""
=20
-MULTIMEDIA:append:dra7xx =3D " \
+MULTIMEDIA:append:am57xx =3D " \
     vis \
 "
=20
--=20
2.39.2


