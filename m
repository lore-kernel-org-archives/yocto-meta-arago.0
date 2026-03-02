Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC0CE9B34D
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:55:44 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157248.1772445339616650631
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=SH5e4UP9;
 spf=pass (domain: list.ti.com, ip: 52.101.48.66, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrpaKCvIF6JF/1Me+AKvnnLzuO4Wp1n40viTLnc6pPXjcVxDwvUbxvAq/lEfv9XPzXSTZA4sRVHsyvM53kVh79zzzbHU/SHJ4Mf8bjImSJhtypY0PH203kvwt4RUj6HuJG8w7rD2SuMVtHEW4p3ALpBaohb8qPnowBdzQxchz2xDEQPUvzkJ/2TqICbHTDg8fITVWkJVFyZipmIxh+QCZhQnPGUu6aBsvwbhNHZ+NCG8c4AbGm4O0LWhHHV0TwypGiJ9zDhydsvw7IRgSxx4JBCRR2atJ33WVsVszqWv0Z39BgX8x8xCEQBtbDPJ8TADVFGtEGXeKiWCo5Fh9R9XGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xITUA9VOd5BcqqrCWoGDDgT4JQZ46Y2Tn4aLrYvwQL8=;
 b=pBWIVhDAk4hf8DWc/Sdyxg0x/cd+PAiDZZ8+kEEAddYF3bshqIB7AA/sfA/T4XQSyTJCNpEz4av6rajxWmHMfFUuzwLPcL348P51Brh/wXrNPi2xFzQUOaAUY9PwuM81PuEr+pZHeNhEE72IhNp1j+i2G4NRboQiX4W10Z2aZU1aGn+Atm+5cMnU3TA5/ibeHwT0O5alZIaHZCg+xFijoKNgCGSSLYTGkW5w2YDpVoPZO1L4QS+3PKm951UsQ9tCWP6gET5bv0OuZrJyK++ZbdyPFiG2y7O6WcQmEdO/zj57yLaa6aJGXqxTtn/OB91qssu/ku1Z+0W9yqx8mR9CwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xITUA9VOd5BcqqrCWoGDDgT4JQZ46Y2Tn4aLrYvwQL8=;
 b=SH5e4UP9kK5U5dUPX3ywv/oI10FvikBKMIKKVsso9BcbyaGJYtEAGo+fB8YQoGBWYUPJp2/XlsKHka3qqqDaxCGCJX/x4byOGOkIsQbK3wsgLn777eWWG9kAgOKT9Yl3gLUfyCI9ZFKue8hmwcJ1tis12bB3VKObk2aW0lA8Tl4u2iOqFKgfb3cTmzl8FYl5UdkuqYqLR/H/wXJsLsiOhnFG2VWbYyHM4lBid0ZTgTFE8CSHZyG3M4nqDMUXMxgCst/HcwHYzpdPOwanUcFJYlW+d2gLTewfB4LfVSgnU4jYCBOd6wqabVjf8YSkFp9gdsLJJuHVbwmHByk9iWppVg==
Received: from BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27)
 by DS4PPF9146A834F.namprd10.prod.outlook.com (2603:10b6:f:fc00::d31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 09:55:38 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::1c) by BL1PR13CA0142.outlook.office365.com
 (2603:10b6:208:2bb::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 09:55:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 09:55:37 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 03:55:36 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 03:55:36 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 03:55:36 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6229taR12234835;
	Mon, 2 Mar 2026 03:55:36 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id F1A189ACF4; Mon,  2 Mar 2026 03:55:35 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<denys@konsulko.com>, <c-shilwant@ti.com>
Subject: Re: [meta-arago][master][PATCH] linuxptp: Add support for HSR in Linux ptp
Date: Mon, 2 Mar 2026 03:55:35 -0600
Message-ID: <20260302095535.648960-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260302095430.140067-1-danishanwar@ti.com>
References: <20260302095430.140067-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|DS4PPF9146A834F:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cca8bdd-c16e-49a3-eb8d-08de7841db22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	e1ls7TPzsi43Fy0OlXaTZlbIh4JStg7c50hWn8quG6MSv7cwM88oLVi0WgTubsefHEyecFOYeJi8aKjy2Ku/X4Cto5qxGJJPQUImAMGo04V1T0vwTxU4XNMFoR8L/Fm1TEtkvdoCtezrLY7mk3zdJ7JQ7z/29rHKpiLLDr6Jr/g4oO7Mg1VA+l3tIeU0mtajPzVcRLX3WxMVJMjdA0CWpd0m4X1uaMKu25a8yrB1wnmCf5yvJ1UtXsn51mtqEO/F4GQlI5E1G9H7KEnlAxy1Z+KOUQ+/56Z54aRI8op8Bel97jI5Ceo/ILBCPoX0fKX74qhuQsnsaL2CWbGxJUXTwWFOweYS3Gi1qescO1W/DCOVtjvI2J4PmffPDSiumGXnEUdluaFfD8aJfwVZToIJ84cRleGuRUEy8ouNDboE6l+R+GNdw0rrirHQSSa9FfzqoD+eRa/CqimQMelvuYhSaKRMEp1cAEJbjjhvTqtioHZb66Y3GNEcZlDWlrIYP7QVJDCRXq8jNqptHjH1UUOp5hojOHxOHvmI+Gq9XrmD7vq+sFX4kmA6JPdpEMTlCq0Fk9jGUdv2sWkijJ5mcLp7U48JQCkYloYwYCxhHNJf2NGUsUZVe3U4ZrtQQZ4ub4e0aDRTbhLTrhw1hCQ+PdcRyCg0fm2ak9VzZ9bio6Xf1rtZtLWTlIA9zRBVqBh6jyMD6ry/R+MtsDz81KTz9ZCV7J1Gzf7sA7g/Hhrs8DUVKnimXk/ZiwazaC1dCnoxNH0BtcPP2snOsWWPYeJdoIn3gL9QgEhGE/WOfMyb8RRCqfhS3VjrF7HVChlGqlp8vL5ggHDLwC1qrZ7ovk4xmgVgsQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PWGOYQriZ6pc9QrOWg13Y8sA4O/vJaI2JVs8vLvKgkceECwNBpoXeY9BnqmLsI3Mz+F1t+fZvO3rRpsK0pRnLmAZ7RxHkf00vE3DIcZdYtgvQZQpMguJ8zJLblKH2tr1k+94ugqO/3SZ4cha6Ui4IFvH3ijG7FGbe2k2Wh3A9G1mbIhhaYRnDlxbnCohkafwzF65aRUXNVWEUZKpR0cpRgpODw1RVDF//d13NHlbDLkBqhGGVGK/K+9wgN5FiiN2RAy1YkU/i9NWtOqPXiyjwdbMcyJ/shY5TMpo9qb3gamixIkZEH4cOx9NnJoXYWoQ4aKmhp4v8S8TXA1nVyodlLEVghfn604vlFq3HdI3hmLBxJy6eaqEzabP6I5EzB/I5h4skl2XhNjcqYDCk3oqVMqbRIEeW0Rbv6Z7rv3Rl9vJ07JtTVhg9D2SIRZyRnls
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:55:37.6682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cca8bdd-c16e-49a3-eb8d-08de7841db22
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9146A834F
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:55:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17165

meta-arago / na / 20260302095430.140067-1-danishanwar

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] linuxptp: Add support for HSR i=
n Linux ptp
- Submitter: From: MD Danish Anwar <danishanwar@ti.com>
+From: Cliff Spradlin <cspradlin@google.com>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+From: MD Danish Anwar <danishanwar@ti.com>
- Date: Date: Mon, 2 Mar 2026 15:24:30 +0530
+Date: Thu, 2 Oct 2025 18:37:54 -0700
+Date: Thu, 18 Sep 2025 12:58:52 +0200
+Date: Thu, 2 Oct 2025 10:09:32 +0200
+Date: Wed, 22 Oct 2025 15:32:22 +0200
+Date: Thu, 2 Oct 2025 10:34:10 +0200
+Date: Thu, 2 Oct 2025 10:37:06 +0200
+Date: Thu, 2 Oct 2025 10:39:45 +0200
+Date: Thu, 2 Oct 2025 10:45:44 +0200
+Date: Thu, 2 Oct 2025 10:46:17 +0200
+Date: Thu, 2 Oct 2025 13:01:53 +0200
+Date: Wed, 22 Oct 2025 15:42:28 +0200
+Date: Thu, 2 Oct 2025 11:51:53 +0200
+Date: Wed, 18 Feb 2026 15:45:27 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c2ad80337e651a7c3bc3efd5ec7346dcd=
2513165

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Remove temporary hack for DEFAULTTUNE on armv=
7a
- Commit SHA: 58966cd5a2d433b4c915e652f21f2e2b2475ec21

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw-P=
revent-leakage-of-non-PTP-packets-during-socket.patch
   =20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0002-port-=
Add-dataset_comparison-type-IEC62439-3.patch
   =20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0003-Add-P=
ASSIVE_SLAVE-state.patch
   =20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0004-rtnl-=
Add-rtnl_get_hsr_devices.patch
   =20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0005-port-=
Add-paired_port-option.patch
   =20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0006-fsm-A=
dd-a-state-engine-for-redundant-master.patch
   =20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0007-p2p_h=
c-Add-a-double-attached-clock-hybrid-clock-HC.patch
   =20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0008-tc-Al=
low-to-forward-packets-both-ways-in-DAC-mode.patch
   =20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0009-port-=
Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch
   =20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0010-tc-Al=
low-to-forward-packets-in-LISTEN-state.patch
   =20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0011-raw-A=
dd-HSR-handling.patch
   =20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0012-confi=
gs-Add-sample-configs-for-the-HSR-setup.patch
   =20
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0013-confi=
gs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




