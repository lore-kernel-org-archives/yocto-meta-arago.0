Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B879CD6CFDA
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:04:15 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62451.1769148248089131964
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 22:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=MpNR1kr1;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.16, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqBapZMiAMXURvMjeZ9bYnsWwZE4d9j4VrjDUKBWIfDEcirCUcJUmMUqgrGJNcXHAmwmwOKQjm6PtKdz3EYN2k/Mr9LRYhfblGaRew90I+ZC3NL+v3B+TQzilDJwo81ZrakNWASMtkkNv5ZMtfuLERkCQFt7ktDjjcD3sz3oW2QczDlTSQSJC02fHVYJKWlmM30mzw/wYwOTWN30zdMhD3zWr07Xu7ZQwCx48mm0+/q9Y+hBrNrIetCFz1a+n/R6q45SW0Lsnob/yDBk8NWtn7Dcx+MLR7tykoCJtH/44hEpUZC+aE6gNgHnFL4pnLXtsXTKImxAd6hp86QFwDNO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7mQE0crWxKulRDZAR02ai6IemXElkc04fjDl+Z2T48=;
 b=GOsoxXGhdVUY88jH2uM6YAt8XrXjCqq+CYQ8utnM60xF5BX9JXo1sZexQtOHuGz6cbuTImSb4C7k0HWmdGlizfQlg5hjlpYlNNg+atRmFBfBfklpD6T8eSJgWoddGLUshahP7BhJkH3ug4wzyiMdRzlsXIli9R1q+NaR+11wUcLS+9eFS982oy0kPILIKlCfhalDX0bGkvPMYRJHL/fGlVKLnMZuFmS11eZmbE8vto1kEUx4azTDeLydbcPWvAQPGsRx4FyADhsuxNWEPHaRLMvPs3EfHSn5Kk238Rx99j/glMEwmfU86+Vcv55Tc+jqPBGBydwrc2LkGuoJen0hlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7mQE0crWxKulRDZAR02ai6IemXElkc04fjDl+Z2T48=;
 b=MpNR1kr1AeOXkCCP8+9SwNPdrKf5qTX+xbnXb6xCt5No8VDOEjoLt0IyCZsj983YF/V+R3wJm0sVsrZ2u51vvL54MXGfnhqssi8yGeVvd6vwTwwKlgcoXAnneNVj8DH5qXkPtM3L3twxm7nORVua6bH70UKXo18yNpMRFJcS+cg=
Received: from DSZP220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::10) by
 SJ0PR10MB5646.namprd10.prod.outlook.com (2603:10b6:a03:3d0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 06:04:05 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:280:cafe::5d) by DSZP220CA0012.outlook.office365.com
 (2603:10b6:5:280::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.12 via Frontend Transport; Fri,
 23 Jan 2026 06:04:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 06:04:03 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 00:04:02 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 00:04:02 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 00:04:02 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N641Oo1827067;
	Fri, 23 Jan 2026 00:04:02 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <afd@ti.com>,
	<devarsht@ti.com>
Subject: [scarthgap][RFC PATCH 1/3] recipes-multimedia: Add pipewire configuration files
Date: Fri, 23 Jan 2026 11:33:46 +0530
Message-ID: <20260123060348.2493115-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123060348.2493115-1-p-bhagat@ti.com>
References: <20260123060348.2493115-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SJ0PR10MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: 499d8f74-754d-4380-57b3-08de5a4535ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AOY0sgkqrplZkCaIatSJCxcPcFX7lRLAJWPnKbaazdflXqCLZiNcBwUJNlW5?=
 =?us-ascii?Q?GgWp3+0/n5+dJw+3aQVQrYQQG7vcSk14pdxLR692AvkXFdBDMJxB1urlaAZB?=
 =?us-ascii?Q?Bo3bPvRJjXSZvS3p0VfjCQclyouqYnVpDdJ8EaG767Ry3II1HRgXy2RL92dn?=
 =?us-ascii?Q?DI94IAL0WWIw0Z6K8yPnKnvYxfN6zI7Q4Syig8QKx5c6TRI+O2N8T1HF7MQ5?=
 =?us-ascii?Q?T+9Ruc2nRXApJQ3S8qDM2YKtFPtD8eplIkvWT2z54Xc6r9mn7YuZ+YU5vdXx?=
 =?us-ascii?Q?WlPiKkbBELyuWIOXkW3nMkTOdQjFvZNg5sQAjg67XedH7Hhy9bsOZ+8naOip?=
 =?us-ascii?Q?m4P/xKYQToDc8Oq1IPS4Sn+JVJp30EY7sWsPab7Kkknz3NLOgNSRTiobviGn?=
 =?us-ascii?Q?sjOa3upUHxyBK8nq1eTkDAqwX3IBf9I7+Ll+Lyx7d8oIpElG4doen+2SCgZB?=
 =?us-ascii?Q?s2kVI7MQSLlXJeD1jhGEhbnBlhrAwXEbpTn5Sj7LmgSOpI9M2btcWKvJd7Vq?=
 =?us-ascii?Q?wxp5BqzNQHbpmjQ70r+0jyX/HMPsby0XAeGkFizf7L+rjTpIu7XKuVjYcQOz?=
 =?us-ascii?Q?/o+j+ZX1uHfdeB2BgS5TRGoUYb6Qsvn+hD/epupFmyPoHKhRkIrlV+Y549SB?=
 =?us-ascii?Q?f2VWriuCLV/U+QHplAmuAPoIAmSHCaUvt3PVqaoHnFRaRT7ux9db9UeJNsZ2?=
 =?us-ascii?Q?9jm1H07ENHXND9btwx46ReMwwTfWcc/wDVjRrRRu0yEjKu1YFcxLRsy9wcaM?=
 =?us-ascii?Q?LO7XzxkdqNh3XE8Lpl2ayAqHSallhm7Lf4MMa2vEaA2oJp5WIfzZ0nGKXYT9?=
 =?us-ascii?Q?bOPWB3/hE3le6cb+xPbYnj9nTqtJa8DSzxaxIZuYUsl+bGre2XE72/Di37NM?=
 =?us-ascii?Q?dT3yWiIPeeo637edET65rYGmwVlp/oYVI2VFzFmP+3RW16Bgl2htXcLS0sx+?=
 =?us-ascii?Q?ukdRAzne/2KaPEoskGbh0CLS0g3S4DXqSlInjT37AxM8OutUAI5G31Svee/t?=
 =?us-ascii?Q?M9xlck8gO0ubfvycC+TjHxzCLiXzF1L1xILOPmgeMwQ5GbZ0ZdP5tu5id2dx?=
 =?us-ascii?Q?aqihAX3qJTj+gyEN85XWpC+PYxrF7SZ4XWUK1WvoSSA6bisYscKMbh/Z0m8f?=
 =?us-ascii?Q?HqC4JTrxe96ShS2DD1G21DZpr8rSTkEsOvD0zPGs15DNjKhbZI2T0gnZmDcU?=
 =?us-ascii?Q?SYc8U7r791ieNZvWGLEkftwZWYDT2gmBxzBQ3rgQAHM/ckNt5vrppNK2pEpT?=
 =?us-ascii?Q?zPeloRftdhnmBRG88sQM15TMv63GjCxz5Iq3O9YBeeeunIp5GKWwMg5AnoHK?=
 =?us-ascii?Q?sQhYYLwA4/czJfXM/e+pxNvGtG8JYW8JqmkFlqVWKEXScJoKoD0eY8MZDGLO?=
 =?us-ascii?Q?wuknsvX7E4wpz51jEgUn06QetiaBbhYfcG5bbyMM+mKkgmMmNm4fDbo5S+rv?=
 =?us-ascii?Q?CHXFOPb2vQn3lHxCW7dOEb70CEajaj/PYJPpY+trzG/tSweW93wxiSPqFUWT?=
 =?us-ascii?Q?2eWBbw2Ae8kO/sQZnTb530QpU7EKWOIcRWWn0Q7Oozn2kMYiwBT+QDsu45W3?=
 =?us-ascii?Q?h2XuUR4Wm2PfR7pHGzutpnS42jy6dLdCs9P9cxbXfOBRsn727B9fCReoiLg2?=
 =?us-ascii?Q?jz19QhwgeC6580aXS87sflFVw34O+52O62r4ufqwHTeNEwiOgeUvFHoEVmni?=
 =?us-ascii?Q?FsloxA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:04:03.2783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 499d8f74-754d-4380-57b3-08de5a4535ba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5646
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 06:04:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17022

- Add 92-capture.conf for capture configuration
- Add 90-multichannel.conf for multichannel setup
- Add pipewire_1.0.9.bbappend recipe extension

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../pipewire/pipewire/90-multichannel.conf      | 17 +++++++++++++++++
 .../pipewire/pipewire/92-capture.conf           | 17 +++++++++++++++++
 .../pipewire/pipewire_1.0.9.bbappend            | 14 ++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
90-multichannel.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
92-capture.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_=
1.0.9.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-mult=
ichannel.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-m=
ultichannel.conf
new file mode 100644
index 00000000..1dd926bc
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-multichanne=
l.conf
@@ -0,0 +1,17 @@
+context.objects =3D [
+    {
+        factory =3D adapter
+        args =3D {
+            factory.name     =3D api.alsa.pcm.sink
+            node.name        =3D "alsa_multidac_8ch"
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
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/92-capt=
ure.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/92-captur=
e.conf
new file mode 100644
index 00000000..b0871da2
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/92-capture.con=
f
@@ -0,0 +1,17 @@
+context.objects =3D [
+    {
+        factory =3D adapter
+        args =3D {
+            factory.name     =3D api.alsa.pcm.source
+            node.name        =3D "alsa_multidac_4ch_capture"
+            node.description =3D "ALSA 4ch Capture (L1 L2 R1 R2)"
+            media.class      =3D Audio/Source
+
+            api.alsa.path =3D "hw:0,0"
+            api.alsa.disable-mmap =3D true
+
+            audio.channels =3D 4
+            audio.position =3D [ FL FR SL SR ]
+        }
+    }
+]
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire_1.0.9.b=
bappend b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_1.0.9.bbap=
pend
new file mode 100644
index 00000000..29b17af3
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_1.0.9.bbappend
@@ -0,0 +1,14 @@
+SRC_URI +=3D " \
+    file://90-multichannel.conf \
+    file://92-capture.conf \
+"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+do_install:append() {
+    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
+    install -m 0644 ${WORKDIR}/90-multichannel.conf ${D}${sysconfdir}/pipe=
wire/pipewire.conf.d/
+    install -m 0644 ${WORKDIR}/92-capture.conf ${D}${sysconfdir}/pipewire/=
pipewire.conf.d/
+}
+
+FILES:${PN} +=3D " ${sysconfdir}"
--=20
2.34.1


