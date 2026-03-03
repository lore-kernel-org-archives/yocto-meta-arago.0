Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8458FEDEBE4
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 18:24:34 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1063.1772562264186351094
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 10:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Yw3pEnRe;
 spf=pass (domain: list.ti.com, ip: 40.107.209.63, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plf+I9CH02mDc4nH8eNPpWRmsiFgiYK3UxpviH4GwqRmHQPyktNVBNcAM84VZqX/MEFtZQIVC45Xc0Io/L5iVKD1IkFP8f0qUDyNsdsNw+3ncgdDK4Kdf+yicYx8FDgLpzBeQd/1GqkaYSW7dDFN0lM2FiZ84G/otOCqlEyYjpdUtoGlS4qm+RCJVifKrU45WJD7OFYyU3aQAwuZ1GvJxdTwqxU9IbSnX2tpHUhLDTSRkngNC4RTGx7UbprnP5uw+aJ+8Qfwc/vdEPzIVMZjOU4Or3iA89Q6/JXzVxXmPxh49ZuXPDv3nbjQF31wXoBQ7O5NYEVN5UelaoWUwNJTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pcOSoJAhAeiVhfyoomAvz0S5fB0S46fPpxSpz2ujHE=;
 b=mxwACBras34Nku3ZWnXH54JZGdBvmDfb/mqRxPZ7E4IwobdZKzMypA3mIl+9lYz63s9jZJ8FP8D1rfnSkMARBhd8Z0DhznA9U+ZQUv9oJjCAgINzx9ZeyGdkqlOL+4LJvagEp66+9wsw4RBg3O7FGjh0KQeqeoWIrdFW8fvmseqrHrX2xc49faXGcnPMlOeG2zwRoQDwIRYo1dtz1CfgBNQs38uMZA7tOA4kc9X+yNzZCU3+rK6+AvYKwJn4IdwL+v43tBx2ugxSuUSavirJzsAp434GKRvIuSumXVeKomblpHD9Mh7DX7ogRIWPtEkEbxLxJacFKPLkgK3W6Mpj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pcOSoJAhAeiVhfyoomAvz0S5fB0S46fPpxSpz2ujHE=;
 b=Yw3pEnRekRabrMPluTyGXlBFwk9O0qaNAEc58qOOyvatl3Yr7tSmm5ACWiJMlU32pOtK+B6HOcZeiQwnLv3wc10Lnv70tDHhvPKh+SDsW17Py4qBl50Ds3wmvwH3zw3p1bd3MOAZvBFxqMC+ggGCTD3onmNkkcG328/vSt4CrPY7tV5z+EUC2A3OXqUlTrayYRl30w0kE9tl7ui3dGWupuTXiT3HCrpsDcrZc0XO1727LpHBq7ZxCTNLWXUMPO1CypCTB/F5e94EMB++I+MwjkCYFXEwurLIIvCpX97mci/QPW3Xo6iU+bv9pNTNogfMAtycz/Twcxj88+wuMFmLBQ==
Received: from DS7P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::20) by
 CYXPR10MB7973.namprd10.prod.outlook.com (2603:10b6:930:dd::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 18:24:21 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:8:223:cafe::6) by DS7P220CA0030.outlook.office365.com
 (2603:10b6:8:223::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 18:24:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 18:24:21 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 12:24:20 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 12:24:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 12:24:20 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623IOKN83095421;
	Tue, 3 Mar 2026 12:24:20 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2ED279ACF4; Tue,  3 Mar 2026 12:24:20 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v3 1/2] ti-test: Break into multiple packagegroups
Date: Tue, 3 Mar 2026 12:24:20 -0600
Message-ID: <20260303182420.1177758-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260303180607.396737-1-reatmon@ti.com>
References: <20260303180607.396737-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|CYXPR10MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd3d83f-5e1a-4d73-a063-08de79521702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	Aofx6rC371Q/Lpn7LpKAv6wn5+mdeoSj3f011RYve5xBorJ93qFHtyK2yJvRsfUMJMGL9GsAcvtEAj8ZMfz3gtgWwpL4iwjaeS8IvRGfB3cIajGMUa26s0Gpyf+Gav7ojdvsFmCLKMe00cnysATCq9Wl78POrwGesFco/5kx+8qVtlKpvlr/NR2VctVKuSCQwUWMtf3jXmjlpSmyLqQAAK+o1ajayVbgWmRsbZW62qFrziIiIZwWDiPHwdcZwqk3VaPd3fUSLJfVN2Q5bSVcUc5+VcuT/E3ToWZB7RvHSWK4zPiBP3w0WOtYcb436Rd66JluQQQscLRAj8IRITbc2IZIL2/DPJtxgRPgZPWlazEqU14pq9Fo1+AiZjDr5g/YIutrcaOe+vWOM6+F5aacOWrFqAzqQ0pAQjxiceB/yZMuimqNfAjHgdsU4H4PlJR0WT9Ct2EUxKkkYq//Mr38oqfHhgF3X3itiO2P49Io48w8B8IGLpyhRPFzbfJ46E8Gsca8rr5+GKTUA87RgvllBa5LQbejszWStfDHf3VyyalRb6VA5077UOTSOIgs/iID0R7m3Yd8KsnGGIAgzanx2SyW1vZ/7AiZhM7CJKloW1OEBMqCmMRnkjr75CU1gzS89y3lBXYJnloM8Z0h77vZxtdpAJ8/a5P040bYjOaaK7N0NGMBMVV0qw8mncIk+os/q7qsHo2LxIH4MTPspo3tgP46nDGdMyZru1cRJX4H+Pyzv71eJPptFUe/p5wIBj29FD1bVIqElG7n8axmj/Ab+DAjhb3ZR3wp6Sc3VbGF76fCJMHGgDOPpTDZUmSdytcU
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Plphh4ULhsRIroXoIWStbgiQZwTJxShNJyrY6SRMM16FfJkD3CSAwwQaCXR6Z0oj6crgmBp8IJb/p0wX819UbXv5hX/27nJtvEs8ab/DoZ43YS+46mkZOuAm1Oxgbw+Wei1OIXiRNzbNvk3WqLYhOZE8ZBj7JRGDiRMDk10rl/UQE80klpnK+g9pY6oCsM7lCV07dZhZkU4q97tQ3udq5vNfTo1TWhp7nJTnvlk2lHdAST5v+yHq05/aGB/IncPtN8YZXlSlM6vTen4Ur13ksHHlCeazhRGMlyiwN+dRTxOCt9u337XhFSoKsBpr+SEciD5Fg1NmNO1c/StsA9+ZAvCCGH88X0MA2fY9ub4nMNnx5CbqzoMElJvyvYtj+XyWp86J9VrfNAKhMR/X8V4nRm57aRmk+zWce2efU55+3YjQ9v39oDPfav/K15luQmPl
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 18:24:21.2577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd3d83f-5e1a-4d73-a063-08de79521702
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7973
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 18:24:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17210

meta-arago / na / 20260303180607.396737-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH v3 1/2] ti-test: Break into mult=
iple packagegroups
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 3 Mar 2026 12:06:06 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: de69557393fc8f0fd7388765190e733f4=
acde828

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
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
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing PROVIDES 'xen-guest-image-minimal'
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




