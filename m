Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEED4109022E
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 14:06:40 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12035.1773929199787173908
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 07:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ue4xVwd5;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.13, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsLJtsD5bHXz6l4PRaPYFhVaOg5vwj7lBlAwBszwd9tURAo+De5VijiImFnSPV6B7202EZwRkqLYQg2FyytX+m4nzUV/YiIoS+wZpNOiZ8e4NLL+IqwA4kuskXCorKlLfLSlaiam1kk487uxx5fPGVx/DkxwpJdzMNsaMgGmMAmm3XVlJfKmXZwQsQblyI8o57wYrSuuBOwJqem6rVygEz4z5fVzNBCxIKvTGKmVWG/C/3yxUb3/BFEJ/IweHIKpNOMiReG+0tNxovxYz5Lx6M1DwzMm5gQhYTNPiXS89lLRilplJA31q/75DeYJ38axrIMjSLa5enHPTUSDrP2ieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bab4vTIZyVB2Se0xoY9Tr6e0UL174bD4kQ/r3NKGQnE=;
 b=K4oF73i5bB5jmzYGZy5TKFbz14dQv6qX++Tq6G7inq4slatrK4DlLhgtIWgOttHMKMxdss10D3f+5iZblhjTy/R9P1e2CCCl43l8gSouChe/ka+3bICMhkyZUPzk+69IQijPMmm7B3jm5gkegoaOHYYsHZ8aPllmn+q8C2iSnbdJL4VEO3gSeyX7GanfE55FUortvSuzx6IY2NBdlHNrJQX3R8ZnXwFMGZDxKl52ki0dCLbv9aze/Ho49eo0uzPkbfEpkgOU5Ndb3aoEDIafxCzpwwrsU8xDLc+DWKIm8BWP1BXSldIKNTMtFBhXES3yx+TDHYMk96nWrZUI61/thQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bab4vTIZyVB2Se0xoY9Tr6e0UL174bD4kQ/r3NKGQnE=;
 b=ue4xVwd5aP/9Zk3pgJuNhjGI0YWa3DlkeN8UwltosUOr0JTDsJrsx75fdPOH7E9CRkcTZN+aTDj3fZTMPqc1j7PutK8IQfdsNhVmB24MJFuumAhlgFT1vrSSh6yhyoFhjaqAKDfs9QTLYrxdO4rsak6hdnwnO024dMTVCW4cH/k=
Received: from CH0PR03CA0418.namprd03.prod.outlook.com (2603:10b6:610:11b::19)
 by DM4PR10MB6040.namprd10.prod.outlook.com (2603:10b6:8:b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 14:06:29 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::bd) by CH0PR03CA0418.outlook.office365.com
 (2603:10b6:610:11b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 14:06:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 14:06:28 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 09:06:27 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 09:06:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 09:06:27 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JE6QCx2179347;
	Thu, 19 Mar 2026 09:06:26 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w3E14-00000009gO5-44LX;
	Thu, 19 Mar 2026 09:06:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 2/3] Revert "TEMP: arago-master: lock into specific commit for meta-virtualization"
Date: Thu, 19 Mar 2026 09:06:25 -0500
Message-ID: <20260319140626.2307869-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319140626.2307869-1-reatmon@ti.com>
References: <20260319140626.2307869-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|DM4PR10MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 764608e2-29fe-438e-7914-08de85c0b761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	nEWgFMnbpFaaR5GhZlGOadMXQ16NDTapDLN6CKD8Kbtg6XtOerDnyBiZEpKjgeJdiUTLFB86AhrUzH6//uIPZqlgYlLhUTnTVZ0ELDMgdlQY2wxfjqaa/0otGFpUabvA4eZepY38ddcs/uuN8k9mDgxirSUUnazlrZ+DBOsC9lSnZMMz/E6eiIxQPliWCZBkNBfGfUl27Ce2tgT6XwaqCdea7UU9N6r0iovbTBTCUJfV1atZjXRNhcs5C6OqiYeVTYz0aHF7mGPmVDv0DHHiHd0KcbiwuQl3QaWKtzBch/f8w8WNaO4F0LGI9Pz50HLQgz7/4tY0lMqAy0uKbg0MsGyhFAW8PJu04eS8yu5nd9CMUpBujnm/7er7lx57mOPprB6zicf88Ud8a4jinhIO3iXsEITY+9BOC3JW2e68vFoErdyWCxuWP9q4uCkIKtSlkYLsZQd1nyPxF+0wVSqMYcCjek4SOHq+u0pxuh9NzeGMX0Qo4sMSjohZeb8I4OqjQe0tqTP9Mueqbt0CFgFGcnWcxcN+2MTJGFOxPQpPp/wUQnoYxoWLBlsEcvXvcGTW3PhIpW/Vb8rtQPNWSNk6ANR6nVXUg+plIFY9dL/dUTGVZJ7D6I9qpRleUB3WPFkdJcTEoLCbDV6KQXTY3kKyWzQuZobwsraZXt2J4GCrW0YGChyetdmEhizgWdXm6lV5BL4Yhox7TZsd5iwBgDJlKUvNwUEa/jfYIoi7AHuPeEw=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Oc9YgV5SN54Raw5g7VbcAzCa5TdnBcGmk0LHs15Ki3clpAKN9Jw3K+nSdjSruf2s/QwxfMLOoxXqu4mBTLRtUDoAwzXZtnPdPXPIVfrrKq7ytSxCG9809Ixp08qWN/aOjAkvOVVLZ62BhYFlULqsMeVbp3nPJSibNh/bX0saXwMQNi2aACXNH8rfCZ9kCt77+VRqpZK0X1l7fJpx261NqJXQlzRQjNA4YXsA30fikfQR02JgIKQ8ieTs7Decx5CPKt9v7dnXGJqyRLnVkADvd+XiyopVT+D52UHs1mqvDPdzbE9j5jTDtwfEUmDuffdzBmbDwrxIUxPSAaUetrJZ+heddSdsA5EvzDYn0iEy4ggE2k6AdYWqJiRoDmKxpeiHCfFePm2LAZ8YJD0X35QS6HmzAswjZahLPbasieY+1Nig0qWh8eANVxnT4EPDNV5q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:06:28.9013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 764608e2-29fe-438e-7914-08de85c0b761
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6040
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Mar 2026 14:06:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17406

This reverts commit 77accf38de315e8cff24b03b13600572e361e490.
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
index fb4a7f7..d9bf7c9 100644
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
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.=
txt
index 9125011..4b11575 100644
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
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
diff --git a/configs/arago-master-flutter-config.txt b/configs/arago-master=
-flutter-config.txt
index 2d97a6b..da1ba5a 100644
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
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-ne=
xt-config.txt
index b7be31b..4f94621 100644
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
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=3Dmet=
a-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master=
-selinux-config.txt
index 6c43b61..c9b9aa7 100644
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
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip=
-config.txt
index c6522b5..941dfdd 100644
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
r,f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta=
-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromi=
um-config.yml
index 38ad83b..f092547 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -40,7 +40,6 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
-    commit: "f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index fd87864..36c5a8f 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -32,7 +32,6 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
-    commit: "f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-master-flutter-config.yml b/kas/arago-master-flutter=
-config.yml
index 8e40cd5..3a04874 100644
--- a/kas/arago-master-flutter-config.yml
+++ b/kas/arago-master-flutter-config.yml
@@ -40,7 +40,6 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
-    commit: "f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-confi=
g.yml
index 0c93282..8a4ffcc 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -32,7 +32,6 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
-    commit: "f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux=
-config.yml
index 2c580a8..7c59570 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -37,7 +37,6 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
-    commit: "f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.=
yml
index 87001f5..341d729 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -32,7 +32,6 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
-    commit: "f505ae07df8d8350b715fe20bdacfe3bcf1bf8c6"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/ara=
go-master-chromium-config.xml
index 79fd629..efd794d 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -34,7 +34,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'f505ae07df8d8350b715f=
e20bdacfe3bcf1bf8c6'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master=
-config.xml
index 7a04b81..251f5f0 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -34,7 +34,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'f505ae07df8d8350b715f=
e20bdacfe3bcf1bf8c6'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
diff --git a/src/configs/arago-master-flutter-config.xml b/src/configs/arag=
o-master-flutter-config.xml
index e077cee..abc8665 100644
--- a/src/configs/arago-master-flutter-config.xml
+++ b/src/configs/arago-master-flutter-config.xml
@@ -29,7 +29,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'f505ae07df8d8350b715f=
e20bdacfe3bcf1bf8c6'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-m=
aster-next-config.xml
index c450bf3..f49b885 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -35,7 +35,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'f505ae07df8d8350b715f=
e20bdacfe3bcf1bf8c6'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arag=
o-master-selinux-config.xml
index 52e25c9..ba4bf57 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -34,7 +34,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'f505ae07df8d8350b715f=
e20bdacfe3bcf1bf8c6'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-ma=
ster-wip-config.xml
index 1920dc4..e703e1c 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -34,7 +34,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'f505ae07df8d8350b715f=
e20bdacfe3bcf1bf8c6'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
--=20
2.43.0


