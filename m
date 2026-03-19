Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394181090231
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 14:06:41 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12032.1773929193019127804
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 07:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=XUmNZM8h;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.42, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvfLNxoZh3WJiqmV2oRTkMa83Lipl+Yz+xy04ahS3UNrNu+CikeoKjJ0QvosKuibvvLJMPxaex5KR03PhlNxwPGDTnpMzAQIj2PidJnJjnv2pf47nrKyDTwVIv25dZTARVqP6JO2qxiBXTXocelwalOcAjb8JbNl/ZGmidoMvPt6BJPgvQqfl5Jnq2Ncwp6zJbiqkIboox2AwTSBkLe39w/pl3owJ9+pibv8bNu0QUX8/cO8IygxLdgs6xGd5VBtYJcREGxzW2T2Z5SqaRLt5H32LeOGYwAdkJ3pGNxc+fnK01tkQFgIVck6qcNNYpItuDInCe+mbAm6KpN5/bo4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbdyiWG2LjRHC7+0PTtwtIcLBFRNEUeEPsF5E8iqA7Q=;
 b=R5sDsV9GfpNMNAZtjsfr9NJouw1nbayDPfHaLPtnlEltuJj2Kp51rN8uEagHzufYzl2v3dZWJHY0D5yMhER+QwKjGkaCjPkLO3EbROdexxNZ4KOvq9d5WQ/Q6ruQ3GOJwo9rFxXU0YBR0fC3QUod/HUXJhs3gKjFAnZrpqRcs7sFmAhGWQWYYEOCELuVFLFoSVuwqzMlmVU2Pckx5x7oNBLIXPVD19wDwByOwvvDMeW6qLuwW6ZVfCcgEV0aGVNLRyKMj1QNZaP6Zcv5KWbB6E3Tjn2Ndbhdi76pFkcOrqKexAIolmgpCaAcFfnuDner3hKdydR0NBSGoRVRjU9+Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbdyiWG2LjRHC7+0PTtwtIcLBFRNEUeEPsF5E8iqA7Q=;
 b=XUmNZM8hP1H7yqHUGXXVKLSnV893HdazU9lLCstUfhyRAuiRcMh+lqgw4mLUQTo3A1PKP+hShnBqpd/rHaOsHA346H/D7upVFS+XPdUAovrBJ4ZE/lpvkcpRPRGBhf5/dXuFJ3bexsC3aawdaXEKafRsSjZsPYdtz8RIV+yQjzw=
Received: from CH0PR03CA0392.namprd03.prod.outlook.com (2603:10b6:610:11b::31)
 by SJ2PR10MB7112.namprd10.prod.outlook.com (2603:10b6:a03:4c6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 14:06:28 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::e2) by CH0PR03CA0392.outlook.office365.com
 (2603:10b6:610:11b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 14:06:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 14:06:27 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 09:06:27 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 09:06:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 09:06:27 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JE6QU32664584;
	Thu, 19 Mar 2026 09:06:26 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w3E14-00000009gO1-3zPW;
	Thu, 19 Mar 2026 09:06:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 1/3] Revert "TEMP: arago-master: lock into specific commit for meta-arm"
Date: Thu, 19 Mar 2026 09:06:24 -0500
Message-ID: <20260319140626.2307869-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319140626.2307869-1-reatmon@ti.com>
References: <20260319140626.2307869-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|SJ2PR10MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 385b25e9-fc04-45b8-91a9-08de85c0b69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|22082099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	k2RqrEq3OeQlqaMM0kQXgdr38CYq0KflSerlrVENq2HPkslVqK476cZRFweNelVNYOqryCjO13BAFCSovHQZFqsKSGkwtvM9gqU7HAqAGVhRePm3mgVUAJf5MjOWDK2+EGbsMwBJ+PBT5UyNrzFHZXj/9OJHcbj4hkFB40rO3sB14vstBu33bInZj1E8fcfQITUF2OKXrwCCJKHV1TQwcVecXvux4u4qsIdiznywRePGavFLECrHffeeTdwoDGBL0tJPgPAjTO5NGAtMC07o8Di6Pgb8knA1/amYgF/TjOWitrTlInxFPPhJNgL+UTERoA3RoGIvZhKhbw2Yvlen6TeHBy9VCCqGBO3aZRvldeaayYYcsF6NOeopRuOJE2WfdKkZisFL6waQP0cDS6cSKuic2Mor/wsyLo379Qh7rvqbelnMuS2kWh+krrHM9H1pumr5abaicwoECTG5/WWbJFn1BodcvMxFUvBeIlq8ZXamSZgu7Mf6N6F1m/gphL0nFne//xDhavE38OjNm3pazqxxGpfMI0w0ifHVaiyq/E5+WosaVv2bJHn56AHQpXHK8poJ+Jm5LKLTHcfdDejLrc2Q/HOwSxCAb4Pdhq0ckF5A1GflIU3dmWeHieb2NZXW95cZwpPIL9sk3DyEojr163vZATIEr4xeVtQFYa/3E05tex0l+tRZaG4Nx6+YKhEKIEqOO3GthKBeCcwttG3s70bHwtkVsvjmB/G8JBxqX/Y=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mCMvWCUDOaIK2ZxBs7EqTOAHaSk6cbcnLs51ZdBdQm/kiztCi//g+9EpCgnvGT/jmNxnRp+ApLQ+qtp17C/xLo4hd99qlJxm33QShYkgg9TW71fqpb6IYvQdHPsmVU7op6xffd/iNiudW/OMb5qdv5n+GUPeQRW4aoxXlyFxJOaagLsdBXalJtkyJT5caYOM3q1uWj4gnRxmSxRA/tnbImhcS34x+TXqjQH26KnLzfz+vWqz1cZJvhLQsIUyuIabbp48ExOFRrBMFSPSc7/5iYYIZKM3oRAe6NSqkoIzx+KxII+l5vFOoq/JRHGWujjPPmr6PrngMSSCR2Kc4UQiTVvPs4QNH+7eU+HqBLLCHXv9iDvolfHab5w/vlWVqYz6VcYrF4x4ZgYnji5RoiRnsPMBS0WwaHk2ERZIhhISFTWpuyCLEIqqsrCStui/Q0Xk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:06:27.6365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 385b25e9-fc04-45b8-91a9-08de85c0b69f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7112
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Mar 2026 14:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17404

This reverts commit cb8eb5f27d234726f241005b4c755e9480f6be2d.
---
 configs/arago-master-chromium-config.txt     | 2 +-
 configs/arago-master-config.txt              | 2 +-
 configs/arago-master-flutter-config.txt      | 2 +-
 configs/arago-master-next-config.txt         | 2 +-
 configs/arago-master-selinux-config.txt      | 2 +-
 configs/arago-master-wip-config.txt          | 2 +-
 kas/arago-master-chromium-config.yml         | 1 -
 kas/arago-master-config.yml                  | 1 -
 kas/arago-master-flutter-config.yml          | 1 -
 kas/arago-master-next-config.yml             | 1 -
 kas/arago-master-selinux-config.yml          | 1 -
 kas/arago-master-wip-config.yml              | 1 -
 src/configs/arago-master-chromium-config.xml | 2 +-
 src/configs/arago-master-config.xml          | 2 +-
 src/configs/arago-master-flutter-config.xml  | 2 +-
 src/configs/arago-master-next-config.xml     | 2 +-
 src/configs/arago-master-selinux-config.xml  | 2 +-
 src/configs/arago-master-wip-config.xml      | 2 +-
 18 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-maste=
r-chromium-config.txt
index 33e7555..fb4a7f7 100644
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
-meta-arm,https://git.yoctoproject.org/meta-arm,master,f4118f9b86742faa9fb6=
49e58da3e00e45375645,layers=3Dmeta-arm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.=
txt
index 7eadeef..9125011 100644
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
-meta-arm,https://git.yoctoproject.org/meta-arm,master,f4118f9b86742faa9fb6=
49e58da3e00e45375645,layers=3Dmeta-arm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-flutter-config.txt b/configs/arago-master=
-flutter-config.txt
index 247bea7..2d97a6b 100644
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
-meta-arm,https://git.yoctoproject.org/meta-arm,master,f4118f9b86742faa9fb6=
49e58da3e00e45375645,layers=3Dmeta-arm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-ne=
xt-config.txt
index 8379a19..b7be31b 100644
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
-meta-arm,https://git.yoctoproject.org/meta-arm,master,f4118f9b86742faa9fb6=
49e58da3e00e45375645,layers=3Dmeta-arm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master=
-selinux-config.txt
index 52e6e3e..6c43b61 100644
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
-meta-arm,https://git.yoctoproject.org/meta-arm,master,f4118f9b86742faa9fb6=
49e58da3e00e45375645,layers=3Dmeta-arm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip=
-config.txt
index fa439c0..c6522b5 100644
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
-meta-arm,https://git.yoctoproject.org/meta-arm,master,f4118f9b86742faa9fb6=
49e58da3e00e45375645,layers=3Dmeta-arm:meta-arm-toolchain
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromi=
um-config.yml
index ce372b9..38ad83b 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -67,7 +67,6 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
-    commit: "f4118f9b86742faa9fb649e58da3e00e45375645"
     path: "sources/meta-arm"
     layers:
       meta-arm:
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index 570f5f5..fd87864 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -59,7 +59,6 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
-    commit: "f4118f9b86742faa9fb649e58da3e00e45375645"
     path: "sources/meta-arm"
     layers:
       meta-arm:
diff --git a/kas/arago-master-flutter-config.yml b/kas/arago-master-flutter=
-config.yml
index 904a4a1..8e40cd5 100644
--- a/kas/arago-master-flutter-config.yml
+++ b/kas/arago-master-flutter-config.yml
@@ -67,7 +67,6 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
-    commit: "f4118f9b86742faa9fb649e58da3e00e45375645"
     path: "sources/meta-arm"
     layers:
       meta-arm:
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-confi=
g.yml
index 91f97ff..0c93282 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -59,7 +59,6 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
-    commit: "f4118f9b86742faa9fb649e58da3e00e45375645"
     path: "sources/meta-arm"
     layers:
       meta-arm:
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux=
-config.yml
index dbf7d0f..2c580a8 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -64,7 +64,6 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
-    commit: "f4118f9b86742faa9fb649e58da3e00e45375645"
     path: "sources/meta-arm"
     layers:
       meta-arm:
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.=
yml
index 710c6c7..87001f5 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -59,7 +59,6 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
-    commit: "f4118f9b86742faa9fb649e58da3e00e45375645"
     path: "sources/meta-arm"
     layers:
       meta-arm:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/ara=
go-master-chromium-config.xml
index cbe29d7..79fd629 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -54,7 +54,7 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'f4118f9b86742faa9fb649e58da3e00e45375645'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master=
-config.xml
index 36f10ab..7a04b81 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -54,7 +54,7 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'f4118f9b86742faa9fb649e58da3e00e45375645'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
diff --git a/src/configs/arago-master-flutter-config.xml b/src/configs/arag=
o-master-flutter-config.xml
index 8745f6b..e077cee 100644
--- a/src/configs/arago-master-flutter-config.xml
+++ b/src/configs/arago-master-flutter-config.xml
@@ -49,7 +49,7 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'f4118f9b86742faa9fb649e58da3e00e45375645'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-m=
aster-next-config.xml
index 4d4e162..c450bf3 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -55,7 +55,7 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'f4118f9b86742faa9fb649e58da3e00e45375645'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arag=
o-master-selinux-config.xml
index 671b640..52e25c9 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -54,7 +54,7 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'f4118f9b86742faa9fb649e58da3e00e45375645'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-ma=
ster-wip-config.xml
index 507d9c2..1920dc4 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -54,7 +54,7 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'f4118f9b86742faa9fb649e58da3e00e45375645'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
--=20
2.43.0


