Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D92E9A04B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 05:57:39 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6348.1771394255259036098
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 21:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=c3PZ5b6P;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.37, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD8brxZAbhPIY4o0L6JhQprH3qrkJT5zAO+MW7k3s5grJoSDCyju2mZ6QaMsNSV6RfV1vK3DF6WbtwTm4gy/A8iJc2XZuXP5kB0o4BgU9NpIK9R4AdIOmhM+ijwCsFty0cDU0OXq9vp2/Y/gNF7T2r4eToy5MrfLtrlNG8eelYAsTAI3t0351Kgju8+az6CsSTGllFPQJuHuBEbBqOM0qES3J8HF/izwxqyohYAUq5/EC51BGDggmLmSsPbEGaNbLOVLLvVUgvnb/tBhcYVAV4BH458V1GJkLx3ns2S17yEN4VvRpoJsiRKpNALqyUxUWumQeQGAao8oW/Y4xVAv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8DWTdcFNpFjfvzLyr2Rew7Fct4bvsxkO9CF7Hr9gQ4=;
 b=MkHytWqtii8sKgOj7QrypJJV4WFQl+BjVbVNlmPEDMd7QngBnnpOckSeQkrKNtuarWsnA5YF3gxJdaYwshBMxkGi4toqqn3Mqde+50WLjqlYzW39JahGpJhS/PhZVRooaZrfHLVjEyaM+bQ3lwE1RJSjRVnvsTNyZNYYyAZieaSduSt2ol9EYu5HPx8jaKtENBkaSksbwlpUo2Oj/Lmn4mKJHeOxeC3AitzwaAxpmWDtCiGGI14y6XkciHLZQAvADMpb+ADSonFxsikda+pULO3ETpq7GAXhOyOEbNUyu+t3OycL5+SeyCSM1etuChCwYtLrcwk7GYITnvCqH4B1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8DWTdcFNpFjfvzLyr2Rew7Fct4bvsxkO9CF7Hr9gQ4=;
 b=c3PZ5b6PfshT6dsD75VG39q94x64qrgo8z5XpdqBuvB2pHXT0tyy+SeIwc+jTd92SFI45p4ZJnn2h5PpDMSHKkxY9cNAbz3IIGs80OyTMWJDVrdQtGsQ475tVOEkb6aAHJ4RQBORQWgn41OYlee2uS9giTdVEAfKEUy3v9ZxfGo=
Received: from DS7PR06CA0043.namprd06.prod.outlook.com (2603:10b6:8:54::25) by
 DS0PR10MB997603.namprd10.prod.outlook.com (2603:10b6:8:314::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 05:57:33 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:8:54:cafe::42) by DS7PR06CA0043.outlook.office365.com
 (2603:10b6:8:54::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 05:57:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 05:57:31 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 23:57:31 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 23:57:30 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 23:57:30 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I5vTFC361183;
	Tue, 17 Feb 2026 23:57:30 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <v-singh1@ti.com>,
	<y-hegde@ti.com>, <j-sahu@ti.com>, <khasim@ti.com>
Subject: [master][RFC PATCH v3 1/3] recipes-multimedia: Add pipewire configuration files
Date: Wed, 18 Feb 2026 11:27:13 +0530
Message-ID: <20260218055715.219075-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218055715.219075-1-p-bhagat@ti.com>
References: <20260218055715.219075-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|DS0PR10MB997603:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b13aa48-7b64-4f3d-7aa7-08de6eb29adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3b5xdRX1v1hOTs8paQNgVlOnNI6eVBQp15GwqRmIQml9aC5VfLjZgmZkG8C8?=
 =?us-ascii?Q?qGX8hY72xutH8VsOGszrkJf/VPs9KQpjn4fdauF9hEr4Jfv96YN6lxH1JMRS?=
 =?us-ascii?Q?qTzz5IoqpnaZf7fNX9dhyjn5xDq29gB+tAXhQU9VpTF14fHReLge/LCghvvm?=
 =?us-ascii?Q?+fPCwSDJXRxlj0ES3cv+c723QA5cSjSKA+glexia6Ep7JoitEX80babCLcWM?=
 =?us-ascii?Q?6AUJcZTjMAqZxJ2Z7IO2xz4QTMgwqJoctSOEq8QVpJaEkrxcbE94oQdOGUWn?=
 =?us-ascii?Q?G7lUVzFuRlAslXbuLoKLnvuiEuG4yhEkq29vNg/8CPg0TeIRpVNsmuk2//8j?=
 =?us-ascii?Q?GDjlVqmTBUNCN6/gbC5cXl3lhmju1TqhCCqva7TbMHgytHXodL7zcM/tcbaF?=
 =?us-ascii?Q?B8UUyhcFNQ5/7qF3FSe2WZQCyspze2mL9Os64EPeVdpD0tfpUMoogt0RVcQ6?=
 =?us-ascii?Q?uyvL2LoKvPygZkbVYI1umtbtfCi3MVXca1ormN7NyUASozv1T4l2kjRdZOhg?=
 =?us-ascii?Q?tRrkzCTUI31lpjHkMkpk1YAj1i3YQIB664JhtabS6CSCKXbPGBCMs2PwxjkX?=
 =?us-ascii?Q?I/RTnc2Xz8luIGCKlvMxTwzabiWghQ1fZigKRgVlGpz1swweL0sG3ZOlEG4p?=
 =?us-ascii?Q?YVA0lc1vRiXPIs5n0SGr1gDMrP9Lz2qe9brPIqD+7AbD9Gkw+iimciyUe+aR?=
 =?us-ascii?Q?ozTUWdjHNL5f4iYy+mreHS21ub4+MD1Mf67VDJkjG0qyR1uCCVXaRPDfboaG?=
 =?us-ascii?Q?M7fgfCh0nD49hCN62OvWVNA7qT9D22Dw53QY+wot2hYgE7EbheRDyO4VmOpt?=
 =?us-ascii?Q?oUYFJGIP4IukKbMERrWXV7e/qda7fJ6legPDAUlG1mt5yDSOoVlQA7niDKSd?=
 =?us-ascii?Q?kUw/isRWE8mRMU/idHO6Wk+3E8X1sdjtRltKAgaABldkeGxtMkO8XGYBjaPK?=
 =?us-ascii?Q?uStYHG/pPR23k45V12mCqK+3geDOhso2nzkHPkKH8Dlp4g6WwN+osA0P1xh6?=
 =?us-ascii?Q?+dsucprlEXpI17pza/msJxvvSf26g5keUfLha75Tsx/MBoQuGLnDOJI4Jxal?=
 =?us-ascii?Q?O5DXPoclwlO/Jar/Kk2IpygqQ3yC0+7Ab9y2ExyQQX/3kIqVkDmboOX9VoYR?=
 =?us-ascii?Q?37vPXujQE+vrKy+y0c8gaNaZ7QLhKY3CqSZiK2uaEnBEiQeXXno6WKmUx80x?=
 =?us-ascii?Q?zkDwjq+ARQJjFkBTjjAZGJO/DaQP5Z8qvSy4Pt3pcbOapcUpj8g6ebcAw7HL?=
 =?us-ascii?Q?/4XAd250nmLIOsgKC4ggz9iNCBNnW9eW9ew968FazV8BsByvk+8L26Lzzypa?=
 =?us-ascii?Q?8yRrJlBPOneY+BzaTz3t15ckzIXCW0PrYbvgS0RYCpfVwa0IzqcGJG6zy4/4?=
 =?us-ascii?Q?SCWsnXzpnl7j/Quu7UWzX9Jbmq8jbWqKTiSgQwaFsf8RyE2NPsKOZLDOhJX2?=
 =?us-ascii?Q?xDHpBRlsZqjJhSIfJQftJLTmnMKmBor+sDrI1EzEKc+Iaq9u2UO2d6LIHZRD?=
 =?us-ascii?Q?BWaNcXua2o/KOvnbCok7MfeXOiKQ+5DwPXUf/NUtdA9JZ/XG9i9MPR8Lm4GM?=
 =?us-ascii?Q?5+BkBy27WgCx36lxW28PLyqfBwJGzSQLm7ldN4hqjtszazCz0osP04HeYaUW?=
 =?us-ascii?Q?n1uUuu/JNchBHzJmxUvZ1O1ZnaYvfxBCzEDJKuoTaGjb?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XRiKLn+awxk/uCqZ1A5xUxNsvuwYqdD8wo2B774AZUPmUvZKzkAzu8knTUdj5dfLZj5bJ9z41djwu1vH9EiO9mI0mDJSva+XsyM/b09E1hL4Qj/k5kXOr89ik2kfBDUsh4xBveZ1HBRBY9KrFoA8CDbeTWpFwvJymgUs35RT+OB75CIOZSdFpEmPSpUesuvnBwCoJAfL0xwdamvCwatWsC78Is7emmY8BBPiIgUJ0zdPlx6+eKKnptZ/tYXcUOlNPXsjuoyYE6kHuvOeaxF8y3KvPtg0pNddCPmhj/Kg66MyOxZevEPIwDn56QBNOsBO//kXoPFdVreHf2LTYrcU1z54YEx5tEBlNRRNr7GNMm3mmXbRfTSL6CvRAHBTNcd4mBUFlWsV7SWnKQqc3lt8POUTJhJ8HDYZCdD7hxjF397ytDxZkq4BQrVojXQPamMZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 05:57:31.3705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b13aa48-7b64-4f3d-7aa7-08de6eb29adc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997603
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Feb 2026 05:57:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17116

- Add 90-pipewire-sink.conf and 91-pipewire-source.conf for stereo AM62*
  audio playback and capture.
- Add 90-pipewire-sink.conf and 91-pipewire-source.conf for 8 channel
  audio playback and capture.
- Add pipewire_%.bbappend recipe extension

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../pipewire/pipewire-arago.inc               | 19 +++++++++++++++++++
 .../pipewire/pipewire/90-pipewire-sink.conf   | 19 +++++++++++++++++++
 .../pipewire/pipewire/91-pipewire-source.conf | 19 +++++++++++++++++++
 .../pipewire/am62dxx/90-pipewire-sink.conf    | 19 +++++++++++++++++++
 .../pipewire/am62dxx/91-pipewire-source.conf  | 19 +++++++++++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 ++++
 6 files changed, 99 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-=
arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
90-pipewire-sink.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
91-pipewire-source.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
am62dxx/90-pipewire-sink.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
am62dxx/91-pipewire-source.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_=
%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.i=
nc b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
new file mode 100644
index 00000000..4aa17166
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
@@ -0,0 +1,19 @@
+PR:append =3D ".arago1"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/pipewire:"
+
+SRC_URI:append =3D " \
+    file://90-pipewire-sink.conf \
+    file://91-pipewire-source.conf \
+"
+
+do_install:append() {
+    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
+    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/p=
ipewire/pipewire.conf.d/
+    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}=
/pipewire/pipewire.conf.d/
+}
+
+FILES:${PN} +=3D " ${sysconfdir}"
+
+PACKAGECONFIG:append =3D " pipewire-jack"
+PACKAGECONFIG:remove =3D "jack"
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
/90-pipewire-sink.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipe=
wire/am62dxx/90-pipewire-sink.conf
new file mode 100644
index 00000000..9251a2d3
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx/90-pip=
ewire-sink.conf
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
/91-pipewire-source.conf b/meta-arago-distro/recipes-multimedia/pipewire/pi=
pewire/am62dxx/91-pipewire-source.conf
new file mode 100644
index 00000000..36112dc5
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx/91-pip=
ewire-source.conf
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
index 00000000..dc32422b
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
@@ -0,0 +1,4 @@
+PIPEWIRE_ARAGO =3D ""
+PIPEWIRE_ARAGO:arago =3D "pipewire-arago.inc"
+
+require ${PIPEWIRE_ARAGO}
--=20
2.34.1


