Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A26107760E
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 20:22:40 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23871.1773865357926985584
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 13:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=AcjW8eYd;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.18, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQt3hbFXgK40+6IRsh6rkiG2U56MO8h9YfHM+Mu6uVpcLXb4UTcmJjhoiFzCYQNxxL2NQJu1PAFomLyPGu81udiNfyj664nOC7rLL+vcLd5lqtr6iusl5HLoL8cOn48FgRoXr1OK6O9C8/Qchgc/i2rugLR9K4HnbqrRdLNC+YYIMJlGjmOhSGwNDzel5AEgcKRRqVxZj6Mv4BvyDN3cUcLfgypDIxyyGxBDYn27uF03zRqEJQbE9l/gjOoEUbHX5n6TnXk4uV7rSMqRNIoi4Lovc7YSCVMZt9KO9a3oZSFzBfuE7aH8YEsMrx2LVKpQBtZv+oR8VHXs0gUS8oYHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNY0Q5gWPBXmXYgoBdmTbTsF0OhMyV+QK0DwJdMgAo0=;
 b=QywNLmaxlzb2UVjq0ot8h45fBZYE5f7rkhyetxP2PBq0jpEzh65UJLOaNdGsNJNr/V2Z7OhH40xCI9B8H0SzifMmQfg5XmOqWIYmr/9evse92D7HaJ3WxxqEed7yqmiSXxzeHkTDBtIzkrHFceetKP1qSHM6ojB/d9sPzyD4V4MScwb9gfWQUaJ+WRVuSdhfDgKRmGhl6jPSkoVInVWWkf7mLG30/Tlrg3ERq+xbWypb3OhgIfyxhLc9QC4IPtE/S1dRh/8Bwl3ajR4Eln16LhwJSJBq84e+3oyxZEcZ4B1pMexDVKyhEqXirDpAETCC8HFtu0iyrYcahePxCeE/CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNY0Q5gWPBXmXYgoBdmTbTsF0OhMyV+QK0DwJdMgAo0=;
 b=AcjW8eYdnOJ1OWZycG1aoOCavUImc2tSySFAP6etEkUXhqWW7/WzPj3blIw6qCADq2YsmTWWVxx/Fv7E9uW2ArftVDeYDnyUeJErl870rI3Oumh4cFbrMNzpi+XxwFS4wEz4jts8heYPs3EmHE05BEhewViu04QLHU8gw/Fsko0=
Received: from BYAPR02CA0057.namprd02.prod.outlook.com (2603:10b6:a03:54::34)
 by MN6PR10MB8119.namprd10.prod.outlook.com (2603:10b6:208:4f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 20:22:35 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:54:cafe::92) by BYAPR02CA0057.outlook.office365.com
 (2603:10b6:a03:54::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 20:22:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 20:22:34 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 15:22:31 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 15:22:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 15:22:30 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62IKMUX1932412;
	Wed, 18 Mar 2026 15:22:30 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w2xPS-00000009MJA-33O8;
	Wed, 18 Mar 2026 15:22:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] TEMP: arago-master: lock into specific commit for meta-arm
Date: Wed, 18 Mar 2026 15:22:30 -0500
Message-ID: <20260318202230.2230697-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|MN6PR10MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b07316-8c34-4866-90ba-08de852c172f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6b+uPNKD++pK0/jnIP+MVvS5QzE5kOzzZsKg2GGtB6v016I8iJ+kZsBQXWfTtYuARnNvK02NmY9SQlNcLzaPe4PhwQ8EbTwbrGu+RZ4pkEEARQD8/zLKCgygeSSXu2k5x8nPvGrv4+JiwK5zaBeO1i3wdtGI9oXpkbceEImoTvNo5+XigiMHRo5UasYL72BZixaUkKt4ZbsJ3Vdv4geVmBBArP2Una6u0De77/+kVISD3Lx2J0K3e4ButwVbLNV5q1C26belekdNuzHVC7TyjGXAZOMIkGTdl1FYRZ/jEJfD5euVE9YHUhPeUP+LZEE+CO1T71Ka4KA7UyXryuy++4ChABtS7EIFLaxaLKsDppX+Ou3uDWvsFPrjky9OjtSFVXB5fw0rq1HmC0J2eNsV73YsSIZoXHv5x4Pdwu2iC5kTnqagaGcOLVemq6+31yxbCMsiiSdjWyWVqbauAKfPT9hJEl3AgQefSZY4CTp4bnItF8K+uM1Mb7gCDnSNTqtx9OErNMQPavPfG8RjUzt32atwuMz9eEJmccvdWt66xPNgB+VIaTLOVB7vlylyigXBkhVFFqjLBATGWdQbKcNXWlnpY+VlwmMHUdYncJ1S4WSMPnGzd5r9Qek3oNeOG5uwZwF3kYn6opBlh55/nW/iMfXTekMvo4Hx777okdRmxBhddJbuYoNZcsZkZwdO5ecwLea6jDWN9aWhRues6JJzVg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	grqL59xocDI7CJ7VaqSq8symtzbynuxNZTGixjVEleygEXWsxtf+14ejcdGdQ3SpyfYi2s0WXuuJJq3F2/6/ESUtmVlWZDbv21dvTUTW5wtcyQG4M+qXkwLbfuRavRzf8GWS4gR4s3wWf3e98MPzTr6eRRiHzXv7tHVNOHb4f9xebo2u7bPF3tOke6IUY4pvchkO6eJG+XF1RQtn+EhRHoW/QO71/vRA7yF4Zju5DqMDia51YbDAKluju5SqbcpPy43mpYhFU2VGkxoJVIny30gqf8yGoUXxpsvt5+rXaRf5CNSjzGAfqEjdK4rvnJOSvI+cPb/H2yEmkJtkdmgIA/FSDjDM/mD79hr04IswiGuwNbFbew9kFe0fyEu785xatOY8hDHbRrfaQfoBNGIOE4y4iDvVbp06QBJ21Ld313uYjPdDxa8A3tbax8wIxDXp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 20:22:34.5990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b07316-8c34-4866-90ba-08de852c172f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8119
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Mar 2026 20:22:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17402

meta-arm has bumped the supported layer to wrynose only.
Since we have also locked down oe-core, we need to lock down
meta-arm as well.

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
index fb4a7f7..33e7555 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -10,7 +10,7 @@ meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,l=
ayers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
-meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,master,f4118f9b86742faa9fb6=
49e58da3e00e45375645,layers=3Dmeta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.=
txt
index 9125011..7eadeef 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -10,7 +10,7 @@ meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,l=
ayers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
-meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,master,f4118f9b86742faa9fb6=
49e58da3e00e45375645,layers=3Dmeta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-flutter-config.txt b/configs/arago-master=
-flutter-config.txt
index 2d97a6b..247bea7 100644
--- a/configs/arago-master-flutter-config.txt
+++ b/configs/arago-master-flutter-config.txt
@@ -9,7 +9,7 @@ meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,lay=
ers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
-meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,master,f4118f9b86742faa9fb6=
49e58da3e00e45375645,layers=3Dmeta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-ne=
xt-config.txt
index b7be31b..8379a19 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -18,7 +18,7 @@ meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,l=
ayers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=3Dmet=
a-ti-extras:meta-beagle:meta-ti-bsp
-meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,master,f4118f9b86742faa9fb6=
49e58da3e00e45375645,layers=3Dmeta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master=
-selinux-config.txt
index 6c43b61..52e6e3e 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -10,7 +10,7 @@ meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,l=
ayers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
-meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,master,f4118f9b86742faa9fb6=
49e58da3e00e45375645,layers=3Dmeta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip=
-config.txt
index c6522b5..fa439c0 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -10,7 +10,7 @@ meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,l=
ayers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta=
-ti-extras:meta-beagle:meta-ti-bsp
-meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,master,f4118f9b86742faa9fb6=
49e58da3e00e45375645,layers=3Dmeta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromi=
um-config.yml
index 38ad83b..ce372b9 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -67,6 +67,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    commit: "f4118f9b86742faa9fb649e58da3e00e45375645"
     path: "sources/meta-arm"
     layers:
       meta-arm:
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index fd87864..570f5f5 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -59,6 +59,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    commit: "f4118f9b86742faa9fb649e58da3e00e45375645"
     path: "sources/meta-arm"
     layers:
       meta-arm:
diff --git a/kas/arago-master-flutter-config.yml b/kas/arago-master-flutter=
-config.yml
index 8e40cd5..904a4a1 100644
--- a/kas/arago-master-flutter-config.yml
+++ b/kas/arago-master-flutter-config.yml
@@ -67,6 +67,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    commit: "f4118f9b86742faa9fb649e58da3e00e45375645"
     path: "sources/meta-arm"
     layers:
       meta-arm:
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-confi=
g.yml
index 0c93282..91f97ff 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -59,6 +59,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    commit: "f4118f9b86742faa9fb649e58da3e00e45375645"
     path: "sources/meta-arm"
     layers:
       meta-arm:
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux=
-config.yml
index 2c580a8..dbf7d0f 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -64,6 +64,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    commit: "f4118f9b86742faa9fb649e58da3e00e45375645"
     path: "sources/meta-arm"
     layers:
       meta-arm:
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.=
yml
index 87001f5..710c6c7 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -59,6 +59,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    commit: "f4118f9b86742faa9fb649e58da3e00e45375645"
     path: "sources/meta-arm"
     layers:
       meta-arm:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/ara=
go-master-chromium-config.xml
index 79fd629..cbe29d7 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -54,7 +54,7 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'f4118f9b86742faa9fb649e58da3e00e45375645'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master=
-config.xml
index 7a04b81..36f10ab 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -54,7 +54,7 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'f4118f9b86742faa9fb649e58da3e00e45375645'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
diff --git a/src/configs/arago-master-flutter-config.xml b/src/configs/arag=
o-master-flutter-config.xml
index e077cee..8745f6b 100644
--- a/src/configs/arago-master-flutter-config.xml
+++ b/src/configs/arago-master-flutter-config.xml
@@ -49,7 +49,7 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'f4118f9b86742faa9fb649e58da3e00e45375645'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-m=
aster-next-config.xml
index c450bf3..4d4e162 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -55,7 +55,7 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'f4118f9b86742faa9fb649e58da3e00e45375645'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arag=
o-master-selinux-config.xml
index 52e25c9..671b640 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -54,7 +54,7 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'f4118f9b86742faa9fb649e58da3e00e45375645'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-ma=
ster-wip-config.xml
index 1920dc4..507d9c2 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -54,7 +54,7 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'f4118f9b86742faa9fb649e58da3e00e45375645'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
--=20
2.43.0


