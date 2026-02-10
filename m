Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE78EA813A
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 15:52:35 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22911.1770738753718821501
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 07:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Y2ZKeglc;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.54, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ap/k8gJClAdumynhEGkMJfiH6LLHxXIZk6Zh959DPd0G64MraDyeQffuFyI8hubhOjoKYoN40us68XVEOFZ7tEVP/Eyb3r/zMXozcYFvwsYGr8mvVYIO8pixgj5aHTwEKMcN2SHggVsKN1IRtUSiI/iSLZrUGk0DJdp3cto5wWTTjEIcbX7y2tjY0r5mjT8t46tj+xNglgJo+INxm1x5kgceC1XAFcGC1FDF2GQh+3FdfdGvfXpN/NvFvF/LmLAcpPXmUu7laURgxzKDkuTLzK0Yjxj0eKs6lG+pHbxuw+hX65HpJAmjxvH0OmikFn+zVpxuUts6p0spEseKaykNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewI7Dq3y8Yr1spIwPQIATbLnAqzu3IulJkdPbhkjOAk=;
 b=kB3n42V5Z0F7kOpqd+PV+pM1fQopbmKR5ZlkZqfPkxuCrR+3sECSjgRAzppU/Gdh5NzBjnqUGY93nh3eFD7dvQWOLruWayXfCf6t7+0X0rW0JV7++bKJHjNy4Xse+MB3z55HPoA30zwgm9bJrJX2DvWkyGgyOuwqv1H1UwMc9X940AP5acVGcmOx8cFfF5sRE6Zrm3SNpVfsvcZZQ6mtB4OgRLb4iueGHg7UgcslZm6WQe1ookwKWMdls2ulp85pgbB+hSAXB//TGllYs43ZICJ8vqc1Yd3EAmVdSCJiiMX5zC4DWtOqR+Sfv32f5BXYgAvdBQcKdkOuC1ozR8uwTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewI7Dq3y8Yr1spIwPQIATbLnAqzu3IulJkdPbhkjOAk=;
 b=Y2ZKeglcHBmIE2w9Jem5wRsS9dmNbRNgHaHPFA/kuEHnt9o+u8hcwYYAlurT6oHjoNvgaggp09bxgKX4MTv4SlLCZadFOncU9YxT3q7Qj3WgrfWJCv1biO09uBFdzf8e8zDbj2EeEY8yeH0x+/25/R0j9d2tvFJwNJwQdypOJds=
Received: from SN6PR04CA0100.namprd04.prod.outlook.com (2603:10b6:805:f2::41)
 by MW4PR10MB5678.namprd10.prod.outlook.com (2603:10b6:303:18c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 15:52:31 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:805:f2:cafe::35) by SN6PR04CA0100.outlook.office365.com
 (2603:10b6:805:f2::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 15:52:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 15:52:29 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 09:52:26 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 09:52:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Feb 2026 09:52:26 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61AFqP5D3797243;
	Tue, 10 Feb 2026 09:52:25 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <y-hegde@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
Subject: [master][RFC PATCH v2 1/3] recipes-multimedia: Add pipewire configuration files
Date: Tue, 10 Feb 2026 21:21:59 +0530
Message-ID: <20260210155201.3029549-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210155201.3029549-1-p-bhagat@ti.com>
References: <20260210155201.3029549-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|MW4PR10MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: acf43abc-cc8b-4abf-dd1c-08de68bc655a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vs5EDAUEpGN9zw2n+FJUf+XLtGvTriOZ5eftpy9/x7+k2UwsKBAa6+j1YJ1X?=
 =?us-ascii?Q?C073YrNO9wE+utzEBULnTke04kuNa/uKIzyEWARUJoOpCgOLMOuHH4u2WUmB?=
 =?us-ascii?Q?SFnOJWDk/pZRGvAFNzpy1wbmFOdBUpOQqeWj3RBaUlaybjUADp1PWuFecM8P?=
 =?us-ascii?Q?v0dsLdZ0D4T65A3PNVwioVKCQX+9YLBF2zT9aWf2R+0ycmgnQmSnUAbssrPQ?=
 =?us-ascii?Q?rD4enTd3VvQg1OItpaXgsHQM9Ly7fdcICNZa5zqLHHgVF34wHhwHBVrDfQlw?=
 =?us-ascii?Q?AMwyW8QqNI7RFOwbmWZhw7h0zhtIMwqns/l/IteyRKR9J0rXJxLY8ed6SQ0q?=
 =?us-ascii?Q?jruWP/ETOAzgPRHzMa14RbKeZm9GVnGCuPGJ3Ea/RXXDtQlWn50dcEYPC2+o?=
 =?us-ascii?Q?Q2TWgnajQg0a9qDU5zqUydgJK0KLiK2wnD3ks9IfuL4cV75FuaOAUSSJ6wzp?=
 =?us-ascii?Q?Tl19uA9roT4viC1vClHmgfANcpXdcdyTxKgP35+IiBAqc/HuR/ipXqQhscKT?=
 =?us-ascii?Q?GBEAEAFJPJ7dQbOTbcPkpxeDCDuM/JxToaNbq+GZ0ZcfbhRO053vrCqmjXO+?=
 =?us-ascii?Q?gTjSQWUqEOJJdHed0nGHwFb32z3omLaNJMhwrExC3w+qFFMt+AVkUpqLhjde?=
 =?us-ascii?Q?tsWrGY3DN5pynn/rDjNplIb3uVpOrjceFQQIBSAUxlGfFNvamJImmXwHzjal?=
 =?us-ascii?Q?QsFC2LSa/gHiVF9iZlp+Xnj67B7rUT0fdv0GaScCTIGh+6Sc/RXZftqWClww?=
 =?us-ascii?Q?yk+6ft9VkNQBKCFeEEm+mPOtXdHrWjCo3hN0b5DfqMxxcp8qGh3DFazOIEmc?=
 =?us-ascii?Q?dIpLpkJ2E29CgOQFuHUkwlehJcr19mMDosdicygf7pzNhKDJV8/z0rOl10mU?=
 =?us-ascii?Q?bScpq+jMQueT2Vh1Ve7bRCSOSH+ayrP5Wkmo+lWOZLvwbskbUtehljO8xrt+?=
 =?us-ascii?Q?GfJfSAm1FWkbO1hCo2lgZt0XNlZjsz5eHuUwezctNNNpD43YLQG0eO7v99f+?=
 =?us-ascii?Q?/BAiUN1P6AFEFKqNEQ4ySOWN/sDB4MPEKw8wfgeO2+a+gzYyky+MbDBhwKBx?=
 =?us-ascii?Q?hOSLP3yWjGxWuPJPDqm9yM9XwpIU6dtPQyug/hdr2nhKSHjdw3NCXY8VUs3e?=
 =?us-ascii?Q?n1sRhL6hQ9zH2tRjeHF+8+lunwMU7wfrGXSxXxfiCtwkbJ6qpzoXLt9wgBpF?=
 =?us-ascii?Q?BggE6qy1g6jxCI0cYfPWkz12qInmJN0OSrWKPpu3fjyv3Li8AIIoiABoYU1P?=
 =?us-ascii?Q?NWbqNze3O6pXyNhJc7MXtH/qkJaM5oOMDLSSH08ZGFQnq2+O+4Afs+tvxZgt?=
 =?us-ascii?Q?5dVE7Y8gDcu6311078SMf6YH+9yrDOUg1Vqi9hZbK9+LLwfSbEgfR9q8BQym?=
 =?us-ascii?Q?wiuPIFxNNrXOHtYqyk3yqi7DwhzZC6XhZ98xfH/xRIP5tp7WbXx3bvNVPJdE?=
 =?us-ascii?Q?IovTkOmc59EyNDbUWbV3SZzdjDFfq5CL3I0gE5IsrCrkljTUp9dZk6It/8/N?=
 =?us-ascii?Q?JhgiO+iVTldBgPlYGFscDUJWGjG329gTY4cjbriaSSQU+KRlUlQuik3J8gv4?=
 =?us-ascii?Q?4LEULXbV72b5Ts2ZD4BgvmkRVgZ2B40+rYwVp7U846B+VhWFHbu88WZlC9dp?=
 =?us-ascii?Q?IPQZib2omQ8TG4c1qKfQbDzbONE2yRKsjCT/DJGj4iPR?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	e2lGqUUdmErCtuj2x1iqUHOKZkw1YHOs5dXztFGufFepRYLZvM37JecbtPQc8Xcv0zCnCQL+9vh2mdyZEn6bFgK2mLyzu9HTf1Y1/dwLz7vRmjyWznaWcTm4FEb/2rWHwFpP3H9JB+PkRpWA0hLlGRhzH/8d6yWW9xU7pa56EzzATCyBGv+dmidj4qDPB1C1OPv73tJG7qMnyMKXN+zWsW3JQSrc7ySAstexvZ1fucoXNdgMMF18LDeX0D75xU7/NRSMDpKZd8oP3lGzEAYanfIiHnxU5SXlDoULTSEl43zyoQecduUrnnOdxUe8Ny9HQVqIKGB5xH2G5TFDeXTPmg7lBoyfG+kMLxPQCWSnSeRIctlJBY8RQZgcbUuHXNiFqujtUos8Hpcck+Air5SpJuIY6cQi+YcOK8ThUtASyWrwx012fW6mBdZYiKqauPAm
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:52:29.6402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acf43abc-cc8b-4abf-dd1c-08de68bc655a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5678
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 Feb 2026 15:52:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17096

- Add 90-pipewire-sink.conf and 91-pipewire-source.conf for stereo AM62*
  audio playback and capture.
- Add 90-pipewire-sink.conf and 91-pipewire-source.conf for 8 channel
  audio playback and capture.
- Add pipewire_%.bbappend recipe extension

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../pipewire/pipewire/90-pipewire-sink.conf   | 19 +++++++++++++++++++
 .../pipewire/pipewire/91-pipewire-source.conf | 19 +++++++++++++++++++
 .../am62dxx-evm/90-pipewire-sink.conf         | 19 +++++++++++++++++++
 .../am62dxx-evm/91-pipewire-source.conf       | 19 +++++++++++++++++++
 .../pipewire/pipewire_%.bbappend              | 17 +++++++++++++++++
 5 files changed, 93 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
90-pipewire-sink.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
91-pipewire-source.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
am62dxx-evm/90-pipewire-sink.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
am62dxx-evm/91-pipewire-source.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_=
%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipe=
wire-sink.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-=
pipewire-sink.conf
new file mode 100644
index 00000000..72562018
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-si=
nk.conf
@@ -0,0 +1,19 @@
+# Pipeeire sink configuration for AM62x, AM62A, AM62P and other AM62 varia=
nts (excluding AM62D).
+
+context.objects =3D [
+    {
+        factory =3D adapter
+        args =3D {
+            factory.name     =3D api.alsa.pcm.sink
+            node.name        =3D "alsa_audio_sink"
+            node.description =3D "Generic Audio Output"
+            media.class      =3D "Audio/Sink"
+
+            api.alsa.path =3D "hw:0,0"
+            api.alsa.disable-mmap =3D true
+
+            audio.channels =3D 2
+            audio.position =3D [ FL FR ]
+        }
+    }
+]
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/91-pipe=
wire-source.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/9=
1-pipewire-source.conf
new file mode 100644
index 00000000..2079746e
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/91-pipewire-so=
urce.conf
@@ -0,0 +1,19 @@
+# Pipewire source configuration for AM62x, AM62A, AM62P and other AM62 var=
iants (excluding AM62D).
+
+context.objects =3D [
+    {
+        factory =3D adapter
+        args =3D {
+            factory.name     =3D api.alsa.pcm.source
+            node.name        =3D "alsa_audio_source"
+            node.description =3D "Generic Audio Capture"
+            media.class      =3D "Audio/Source"
+
+            api.alsa.path =3D "hw:0,0"
+            api.alsa.disable-mmap =3D true
+
+            audio.channels =3D 2
+            audio.position =3D [ FL FR ]
+        }
+    }
+]
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx=
-evm/90-pipewire-sink.conf b/meta-arago-distro/recipes-multimedia/pipewire/=
pipewire/am62dxx-evm/90-pipewire-sink.conf
new file mode 100644
index 00000000..9251a2d3
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90=
-pipewire-sink.conf
@@ -0,0 +1,19 @@
+# Pipewire source configuration for AM62D.
+
+context.objects =3D [
+    {
+        factory =3D adapter
+        args =3D {
+            factory.name     =3D api.alsa.pcm.sink
+            node.name        =3D "alsa_audio_sink"
+            node.description =3D "Multi-DAC 8ch Output"
+            media.class      =3D "Audio/Sink"
+
+            api.alsa.path =3D "hw:0,0"
+            api.alsa.disable-mmap =3D true
+
+            audio.channels =3D 8
+            audio.position =3D [ FL FR FC LFE RL RR SL SR ]
+        }
+    }
+]
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx=
-evm/91-pipewire-source.conf b/meta-arago-distro/recipes-multimedia/pipewir=
e/pipewire/am62dxx-evm/91-pipewire-source.conf
new file mode 100644
index 00000000..36112dc5
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91=
-pipewire-source.conf
@@ -0,0 +1,19 @@
+# Pipewire source configuration for AM62D.
+
+context.objects =3D [
+    {
+        factory =3D adapter
+        args =3D {
+            factory.name     =3D api.alsa.pcm.source
+            node.name        =3D "alsa_audio_source"
+            node.description =3D "ALSA 8ch Capture"
+            media.class      =3D "Audio/Source"
+
+            api.alsa.path =3D "hw:0,0"
+            api.alsa.disable-mmap =3D true
+
+            audio.channels =3D 8
+            audio.position =3D [ FL FR FC LFE RL RR SL SR ]
+        }
+    }
+]
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbapp=
end b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
new file mode 100644
index 00000000..fdce686c
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
@@ -0,0 +1,17 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+SRC_URI:append =3D " \
+    file://90-pipewire-sink.conf \
+    file://91-pipewire-source.conf \
+"
+
+do_install:append() {
+    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
+    install -m 0644 ${WORKDIR}/sources/90-pipewire-sink.conf ${D}${sysconf=
dir}/pipewire/pipewire.conf.d/
+    install -m 0644 ${WORKDIR}/sources/91-pipewire-source.conf ${D}${sysco=
nfdir}/pipewire/pipewire.conf.d/
+}
+
+FILES:${PN} +=3D " ${sysconfdir}"
+
+PACKAGECONFIG:append:pn-pipewire =3D " pipewire-jack"
+PACKAGECONFIG:remove:pn-pipewire =3D "jack"
--=20
2.34.1


