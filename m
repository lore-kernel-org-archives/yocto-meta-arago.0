Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C71EFF6E98
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:46:43 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1835.1773787595306480530
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=p8udy0bt;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.38, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLWnMHgKXaWQo5ZXkX92vuNsAUU+WaZXvmEmg2lSdiOwYu/WSX1y/jkXMCP6cAndexMLYraZpafezyrxppMMcMn4N2JsK2e5CUV0vOCA3fyX2lIaoXZM/YnAWS92DFv4D0XNM7tTyg4HhRhwBX/Zszni2lFlA6oFdHWMaXndFiVVaQvH3HM5HQHxEfKGWGmtDHcJmSp1cxAsdkv4xBZwqt/wrfHSWzVGDs6mHIiHPPmJmOuYpTaJdjkje+Zvg5Yj5fgneMnE1LdQZJZtL42o5LupZN3wmivih96fIOL+y1AnLDGqbh49Wqc/BnzNVKG9O2JvZqshs6eCEc6BZHHhTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6O1hzeP99UREj1+9CB3AItP+CAphKYeaOfwxplZhQYA=;
 b=gnZf/M0WENWSty2WfllmnIeLtOCc7NDxc1ZKiF/0SOEqjDLu5PWyFR4xXJNIjHyfmMl7cQ4ITW+ChdNlitmk5PFAg4k+cjKLeskkNE5BdJAC54p8+uAEAIhg2I60ngbwB7l8n8Zzqcmq7e32813s4jPE5QGN1/3W8DO1wyEnbfVw7xJa7ajFCso/Zs1gO6YTXEeApjayB3Ci/fAaO7e1WM4Kvc6n7nuXgOYb3Jdm++1pmSh0drNJgXX20CD3KLZ02yXjvtSQz3E7d7PTo8sUAFTzoDnAgc4Om0BqXzJG7TzN0n+yPLQ+o/asLNCiqJ2SzW31zDRirNHUCS1I5TcouQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6O1hzeP99UREj1+9CB3AItP+CAphKYeaOfwxplZhQYA=;
 b=p8udy0btplAYA1T3LkTdjv9YZ4ip/97xg6dmkaTG0R11pCWxPx4d5kUgYfVINVRUKTRWO+EWPVC1vyp9HkEAtoWOLfyKshIZCfSPTxC/3IQuR1TT3pRcg9wOYOT6QCh8hTchNDvooEabRbf7WKbJA58tm8au5lhqfXw4BMB7O8Y=
Received: from BYAPR05CA0066.namprd05.prod.outlook.com (2603:10b6:a03:74::43)
 by CH3PR10MB7459.namprd10.prod.outlook.com (2603:10b6:610:160::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 22:46:31 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::22) by BYAPR05CA0066.outlook.office365.com
 (2603:10b6:a03:74::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 22:46:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 22:46:31 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:46:30 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:46:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 17:46:29 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HMkTLT3960598;
	Tue, 17 Mar 2026 17:46:29 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w2dBF-00000008JB2-3PKo;
	Tue, 17 Mar 2026 17:46:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] TEMP: arago-master: lock into specific commit for oe-core
Date: Tue, 17 Mar 2026 17:46:29 -0500
Message-ID: <20260317224629.1980333-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|CH3PR10MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 514e2f67-660f-4890-1b52-08de8477088e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	8R6dbvsHmCBpHCePAyQXCTC2YtUzIhqBRxS3C5bwXfRZTzClr818ly/9NWWteUQiIcSR62EUikLLRsj+XX7e1hbWRuMXruWXH9q8kb293vIyxb76ORRy0SunlUFTSfXIc580+sE4nRjYiRrGha6ocmz4aUKJMVvRCVMvL53AsXkxvqjDUNkSv2ChUsSGZViN5sYi0Hv1COtatIdM4dboFqHk+d+DCzjWnCYUbETqQ3g35JdXeQS+EB9jOKqOItY1ftMRvTgdbArHeHATlfXNuIaEUBPj8p1Asb1U+6sfshgix3NpH5GAw3105JmyvD8FYp214Hn4BoU3rpJarzhv5lWehqFgkykeYI3N6eRg3c2w5+gjULpb+1SK/gGk1c4nFkFn/P1jS17+YgwcXIjFEIzCScb1EhaOoJ8z0xC94Vy/kHLGp3R4L25wjO4+EDh+QueZqfj+9Io+fhftxNx/wc7V9E1H8f9nKqiyNscw2SrzyBfEDY4TA78Qk4F5Zz/oLy/9flGBGmbtGnkkdQ7JW2/NuSM07W/7TvQQbhHc9v6S0pY1MiG/+oO2QI6Ay2U4GwCSQKnMhlU6zS6IdW0FqYJteXYNv5YYhkGaE8axcs1WMiVVitsVGVUsXfjzygAK01RPjHoFargIZcuPJZsh/mJXsfg4BqemOEjXfEDISuARCPnHqyEkdcefdRV7Sh8xOMTxbXtckdZDSCJko46c4Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zItzzzDAO5Ar585L97RHAkLemCKnDuGdPpGhL/H8vVr8jYTt6e12qQfPNvtTEcg5mQbVPw+CcIqVxMhHPYEhiAG8P508CHJQ6zs9s3Gc8ZCvc6crxUJ792hSHQkExGfZfOTFUqoUKa5oJnzV3FUehN9s6I/cV+LtvRPu4q8zZHwJS/XJoVmsk3w4Le89DbhMj1YNT4ab4iTB2mLHzwOQAmMuYbZ/wJw0LahqXlPKkUiTSsYCHrhD62nAOWVRHjvEqYtt6JvjOoOFXW94J5grxQbLnB/uNc1/HcJ+uoVeXkEOUl6vj6m0kyj6d5XIJ0lE51dgkmOvd095ZGOtcRDBcR+Dvll6SyMNM5XdOLdaPNxf0/z1jYfR0dH652dRYXhsBM/WZPqSxtJa6Wf8+k0hPQ4VMslYsjUDcWu1NTGiKy6RaTZbqY7ODJuCpAgUZ2WH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:46:31.1437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 514e2f67-660f-4890-1b52-08de8477088e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7459
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:46:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17394

oe-core has bumped the supported layer to wrynose, but none of the other
layers have caught up yet.  Temporarily lock into a commit before the
offending one.

We will revert this change once the other layers have synced up.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/arago-master-chromium-config.txt     | 2 +-
 configs/arago-master-config.txt              | 2 +-
 configs/arago-master-flutter-config.txt      | 2 +-
 configs/arago-master-next-config.txt         | 2 +-
 configs/arago-master-selinux-config.txt      | 2 +-
 configs/arago-master-wip-config.txt          | 2 +-
 kas/arago-master-chromium-config.yml         | 1 +
 kas/arago-master-config.yml                  | 1 +
 kas/arago-master-flutter-config.yml          | 1 +
 kas/arago-master-next-config.yml             | 1 +
 kas/arago-master-selinux-config.yml          | 1 +
 kas/arago-master-wip-config.yml              | 1 +
 src/configs/arago-master-chromium-config.xml | 2 +-
 src/configs/arago-master-config.xml          | 2 +-
 src/configs/arago-master-flutter-config.xml  | 2 +-
 src/configs/arago-master-next-config.xml     | 2 +-
 src/configs/arago-master-selinux-config.xml  | 2 +-
 src/configs/arago-master-wip-config.xml      | 2 +-
 18 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-maste=
r-chromium-config.txt
index e1fda52..d9bf7c9 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -11,7 +11,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-vir=
tualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.=
txt
index 53262bb..4b11575 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -11,7 +11,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-vir=
tualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/configs/arago-master-flutter-config.txt b/configs/arago-master=
-flutter-config.txt
index 37be2a0..da1ba5a 100644
--- a/configs/arago-master-flutter-config.txt
+++ b/configs/arago-master-flutter-config.txt
@@ -10,7 +10,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-vir=
tualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-ne=
xt-config.txt
index 0644138..4f94621 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -19,7 +19,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-vir=
tualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=3Dmet=
a-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master=
-selinux-config.txt
index cd0ca0e..c9b9aa7 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -11,7 +11,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-vir=
tualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip=
-config.txt
index 1ad6f58..941dfdd 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -11,7 +11,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-vir=
tualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta=
-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromi=
um-config.yml
index b114247..f092547 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -74,6 +74,7 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    commit: "2dc4d2f8b5c7a6e87291385fb860436593767199"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index 6b3be87..36c5a8f 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -66,6 +66,7 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    commit: "2dc4d2f8b5c7a6e87291385fb860436593767199"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-flutter-config.yml b/kas/arago-master-flutter=
-config.yml
index 4607b49..3a04874 100644
--- a/kas/arago-master-flutter-config.yml
+++ b/kas/arago-master-flutter-config.yml
@@ -74,6 +74,7 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    commit: "2dc4d2f8b5c7a6e87291385fb860436593767199"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-confi=
g.yml
index 34ca419..8a4ffcc 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -66,6 +66,7 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    commit: "2dc4d2f8b5c7a6e87291385fb860436593767199"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux=
-config.yml
index 65a1925..7c59570 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -71,6 +71,7 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    commit: "2dc4d2f8b5c7a6e87291385fb860436593767199"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.=
yml
index c35df05..341d729 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -66,6 +66,7 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    commit: "2dc4d2f8b5c7a6e87291385fb860436593767199"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/ara=
go-master-chromium-config.xml
index c242124..efd794d 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -60,7 +60,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'2dc4d2f8b5c7a6e87291385fb8604365937=
67199'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master=
-config.xml
index 28cd760..251f5f0 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -60,7 +60,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'2dc4d2f8b5c7a6e87291385fb8604365937=
67199'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-flutter-config.xml b/src/configs/arag=
o-master-flutter-config.xml
index 26e9335..abc8665 100644
--- a/src/configs/arago-master-flutter-config.xml
+++ b/src/configs/arago-master-flutter-config.xml
@@ -55,7 +55,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'2dc4d2f8b5c7a6e87291385fb8604365937=
67199'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-m=
aster-next-config.xml
index 8a7e009..f49b885 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -61,7 +61,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'2dc4d2f8b5c7a6e87291385fb8604365937=
67199'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arag=
o-master-selinux-config.xml
index b09a45c..ba4bf57 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -60,7 +60,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'2dc4d2f8b5c7a6e87291385fb8604365937=
67199'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-ma=
ster-wip-config.xml
index 497f431..e703e1c 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -60,7 +60,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'2dc4d2f8b5c7a6e87291385fb8604365937=
67199'>
             <layers>
                 <layer>meta</layer>
             </layers>
--=20
2.43.0


