Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D51BFCD0C4
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:30:49 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14085.1773840647979212171
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 06:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=cyq9LVzB;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.22, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3CWx8DIXx0ZIsagAaI5WCVYLPG7UOTYxI9jvigRrrBT8HPOerVfTsyPQh2c25Nv2Dtt4FLj5ypLxbbff2KdtmALQmKTXnMr5cXJCJG45bXOpUTFFtbAyigAT3nIN1x7nxRevhmioiizRm2lQMEFpan1sDUzapG/5MAaFHUcSeUG/L1Kcjb5trRi13pvtLdYDdj7En2nWOc/eeShxs4aGLJyBkjhXB4aLODm0na+MAGaI4xmSrI/jJSrIyzWygIvKqfNTjQSck5VqCLkivaOuuQcKBSidZwmPH1OmL22oj4AnkSim5pdwYFu/ewZufSxJFD1aJc129T3xEhJXmC+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ+vznox0kZlh/z5j8QSMxq2ChOMIa9AA4CT+kBNQuc=;
 b=mwHOHu6KvjYN/sArareX5vNgzL7j017pago9FJ2MwAs4hANd1nSQ0JQMSgE/bmJ8+qc30qDHiKd4nQDStJ/MnGTnB/hArH7ESpz6yUSCq5ppgdWfl54ezX0+UjFBtuPoyAoozJzKdGa7Vt585bHnzLG889pMbGx3nDrbQ6dh8E/V0H449asn1Boc5tIs9bpsnzVZnXwPPeqlRlycxINj4EBiGcsh/d8q4f7o1Qs9AVvPyyzkYJk/A1bC9sbZ4sGYzYTD1nU0763qqdN8sdvgRU5Qtz+b1SS72iTFtDa4I8PLN5yPRb3JhgjQlnMDXzQoYJG0IHmMhuTsAyURCdjd3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ+vznox0kZlh/z5j8QSMxq2ChOMIa9AA4CT+kBNQuc=;
 b=cyq9LVzBGuffGcbvtW0x43cdfa80OMm8jydqrJBBQP3ua7qbyNFlBq+RSLo+TmgOGtIibtsgwYYGTn+btEVQEYWx7BRz8ik55vZrJUlcMMtOXOOiZyTCUwV4HoHJvv5M2/vwtrYacZeflNxM9ntQka9fSXY6MvMSG/uhGnIkQbo=
Received: from SA1PR04CA0022.namprd04.prod.outlook.com (2603:10b6:806:2ce::17)
 by IA4PR10MB8256.namprd10.prod.outlook.com (2603:10b6:208:56c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Wed, 18 Mar
 2026 13:30:44 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:2ce:cafe::b6) by SA1PR04CA0022.outlook.office365.com
 (2603:10b6:806:2ce::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 13:30:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 13:30:43 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 08:30:43 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 08:30:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 08:30:42 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62IDUgQx411025;
	Wed, 18 Mar 2026 08:30:42 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w2qyw-00000008VUl-2xPg;
	Wed, 18 Mar 2026 08:30:42 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] TEMP: arago-master: lock into specific commit for meta-virtualization
Date: Wed, 18 Mar 2026 08:30:42 -0500
Message-ID: <20260318133042.2027684-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|IA4PR10MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: e0dd088a-4190-4aea-dcab-08de84f28e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	BbQAV+p94tDnR0IarfBbbm6yS9deGbvV2dtjPDuKYWk/DO9KDZmQP9//84WNIFUC/gN8YQkOBheENxAD8ldGfPU3rgv8xz66H0BgS9MHqtaZ32g1QvW0wlIQ+nI669/1HhLatGgkD3wmEfGOHhMXH+mN+x8WU1x1oq7+8zG3YkGciKaSISxWUF2HExfEi5kF7h+N/6lJjOcdOzUGuoSiRdaoLgLWXmorT9sPbEha+5l6uV7tVZgdwzgITJGojn3RqDQVGSe2PEz34CyfiP6O22auOeNzxrWtmslZcfdvzSY8NRti/cmvLZ91tGLhwdNQA5Tor4PvMXXvM6eDSPfmAmiL432gSlJ42KX7TjHAIk9N3CrpOM2pde9KenAxU7x7lruORTQLuE9Vrme/DpHbtGoGQOCIRZ3fT0y7sieJUkH23DqaUeKB3lwX3nTfscIz9sxPCLnqVxRhBxX3Yp/yIjKhIQ+2K0qgDfQwJX7QlHFPB2bTCrow30Ut+l85gILur+ssR0XmtV1D2wI2H5siXZsj5VnYqQ9F5dYMo9t6NluHMKQw/F3BaIDcLNpQOvkQYaaDAuEk55KC0Kh25U5yW1fsJyvx2s1rDPIdOK8Z6oZjOp3hbzhPxFaXteBMrErJ8GG+6MU7H7wkQRVM4PAAFx1hvwDS71oEIuDXCok44V6eBUs4joPdGjQEIowrTJuJpK3AJozwMHK8Ch8+iy2LeA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ReEGGUjhcuMY3RdzKKy0WuoEpTLYdMg1z1oz0JPNX2t6ApVMjKtDtrLY6C8I/omMlYATiWheubqd9bCwtRtS70XDOEBw+IARWz49Pw3Ne7UKSMSHCXjpgndshTFSSHkWhuOJbygmuzjLbal1m5/7y86hSoISFuVmPcU1Q17uBSRjS3o5HauISousaKzPPMMHBGio8ge60HQdT5LSMcsS3+DdQZKIm0iIfcICmpXUlXx5HuMc8oPoCDuWy8RXoGAQFTzqM+IRQ3xjKHnoi1MKXEsn1je9z1Ez6GAz0MzlgM1I66BdATmVMPexLHdDuDAElKtPpkXHPdJnSblaM1JR+znJUXF0nj3z/Lu1Ibnqx9nXt/q7Qemq3eDqGz2R3mBvWu3zS1tMyEn3T8TEn35Y9qw6ZfkIb3h0qfmFgfvhU8PKIVEBtoJw4Ng/9OKvuJfq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 13:30:43.3715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0dd088a-4190-4aea-dcab-08de84f28e1e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8256
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Mar 2026 13:30:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17399

meta-virtualization has bumped the supported layer to wrynose only.
Since we have also locked down oe-core, we need to lock down
meta-virtualization as well.

Temporarily lock into a commit before the offending one.

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
index d9bf7c9..fb4a7f7 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -7,7 +7,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,master,H=
EAD,layers=3Dmeta-arago
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862f=
261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.=
txt
index 4b11575..9125011 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -7,7 +7,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,master,H=
EAD,layers=3Dmeta-arago
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862=
f261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
diff --git a/configs/arago-master-flutter-config.txt b/configs/arago-master=
-flutter-config.txt
index da1ba5a..2d97a6b 100644
--- a/configs/arago-master-flutter-config.txt
+++ b/configs/arago-master-flutter-config.txt
@@ -6,7 +6,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,master,H=
EAD,layers=3Dmeta-arago
 meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,=
layers=3D.:meta-flutter-apps
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-ne=
xt-config.txt
index 4f94621..b7be31b 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -15,7 +15,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,master=
-next,HEAD,layers=3Dmeta-
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862=
f261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=3Dmet=
a-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master=
-selinux-config.txt
index c9b9aa7..6c43b61 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -7,7 +7,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,master,H=
EAD,layers=3Dmeta-arago
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862=
f261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip=
-config.txt
index 941dfdd..c6522b5 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -7,7 +7,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,master-w=
ip,HEAD,layers=3Dmeta-a
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862=
f261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta=
-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromi=
um-config.yml
index f092547..38ad83b 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -40,6 +40,7 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
+    commit: "f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index 36c5a8f..fd87864 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -32,6 +32,7 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
+    commit: "f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-master-flutter-config.yml b/kas/arago-master-flutter=
-config.yml
index 3a04874..8e40cd5 100644
--- a/kas/arago-master-flutter-config.yml
+++ b/kas/arago-master-flutter-config.yml
@@ -40,6 +40,7 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
+    commit: "f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-confi=
g.yml
index 8a4ffcc..0c93282 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -32,6 +32,7 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
+    commit: "f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux=
-config.yml
index 7c59570..2c580a8 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -37,6 +37,7 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
+    commit: "f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.=
yml
index 341d729..87001f5 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -32,6 +32,7 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
+    commit: "f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/ara=
go-master-chromium-config.xml
index efd794d..79fd629 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -34,7 +34,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'f505ae07df8d8350b715f=
e20bdacfe3bcf1bf8c6'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master=
-config.xml
index 251f5f0..7a04b81 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -34,7 +34,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'f505ae07df8d8350b715f=
e20bdacfe3bcf1bf8c6'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
diff --git a/src/configs/arago-master-flutter-config.xml b/src/configs/arag=
o-master-flutter-config.xml
index abc8665..e077cee 100644
--- a/src/configs/arago-master-flutter-config.xml
+++ b/src/configs/arago-master-flutter-config.xml
@@ -29,7 +29,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'f505ae07df8d8350b715f=
e20bdacfe3bcf1bf8c6'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-m=
aster-next-config.xml
index f49b885..c450bf3 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -35,7 +35,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'f505ae07df8d8350b715f=
e20bdacfe3bcf1bf8c6'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arag=
o-master-selinux-config.xml
index ba4bf57..52e25c9 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -34,7 +34,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'f505ae07df8d8350b715f=
e20bdacfe3bcf1bf8c6'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-ma=
ster-wip-config.xml
index e703e1c..1920dc4 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -34,7 +34,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'f505ae07df8d8350b715f=
e20bdacfe3bcf1bf8c6'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
--=20
2.43.0


