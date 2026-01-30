Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54113E6BF31
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 17:01:01 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15449.1769792456122992574
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 09:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=OYn2KD8e;
 spf=pass (domain: list.ti.com, ip: 52.101.46.62, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlS+jUtVdSlsPoUVhc+T2ECYWJ7sBY5+JwzCfdDdpY8Pu7tOxIbjASFnLeZqAw/nUBGB/23tKAWIVWSOcZrlzCBpndYEUU3jNGe/M9LIMmISmnVig3RwgBPKpqTXDWbXKThaB/5NjcUcUc7voxjlEdVviNebFnKelCt9tJ9r2FTRxdFS02V2rBQlNI98WgG1eE3J5kFD4Dgle7e6TIs9hjGgVXZBEMGNqJgYEMuv+CB0Saiyw8BfB3JdH03QZbXqsuRyb5r8dQFMneWrGH+jU8Vui1m8kvai+TBnLKYG1sVXadMdCrVf2iN+n2TtCUETP/3tTHBxKUPNLy1iVea/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVNBWOj/6RVuJnL9Wpnsesa9UVzW9KViBTcAfWxTf5Q=;
 b=UcSsmLx0mM2n8qbyqeMp8RKsO+Qrv9QHONZiFWltcUaHsdLsH7kZPX2SZcWtb0+qvYpcHoMKg0jXwbrs6wSo/pyF/HkT0L39PonWGhH0hp9cm6vtwmth0fu+0vp9WLfEHMAMDSqmxonqdqeX1NqrOTqKeRAmXPht3a0ao2jy8bee8pff6CqFIUMOGWMcA5QjefQ8WQvkLEufEI+zp1bwSsmu2LaQfa6SqBTPCys5NTZ9i+h1BzVdJJ9kVRx6SsH/wAyQ8MZ8yf4aN6zsNiqAbluhV6vjv+RByLovH3WqaXtwBZFg9g/phtuEF3qtDuV56kYtqjgij/awwdcF2//WhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVNBWOj/6RVuJnL9Wpnsesa9UVzW9KViBTcAfWxTf5Q=;
 b=OYn2KD8el2in3f9Bi7Y/eFmsROIi/4Tyecekgidr14K/hGCJCrypQ0qYARxjkV8vRsJvJiMCY34jUlbiL2XVYoucV6ZwflHvVpTTScNbEQfd9DCZe2Nni2hixhuujwmzr75sMsD5unJAo/q8bY417MucAdlhZvKpsg01nGUmbksxSWYbQjpY88wEbgHWRxxy8yyXUzhYCKc8GVpqnzOctGbQfRMWPtcUjDWUZeguUvlpwdD/L8ZK3aZuJzTjIHfzsDdMVqGW4bPxcsTzXYJujiVofZG1half3ZwvboPjOwvkU+YpRkGKat1Vrno/y52C/y9vmjHUtGcCW26nvWWW+w==
Received: from CH2PR14CA0051.namprd14.prod.outlook.com (2603:10b6:610:56::31)
 by DS0PR10MB6824.namprd10.prod.outlook.com (2603:10b6:8:11f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 17:00:53 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::6e) by CH2PR14CA0051.outlook.office365.com
 (2603:10b6:610:56::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.13 via Frontend Transport; Fri,
 30 Jan 2026 17:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 17:00:51 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 11:00:32 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 11:00:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 11:00:32 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UH0W4M1631421;
	Fri, 30 Jan 2026 11:00:32 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9032D9ACF4; Fri, 30 Jan 2026 11:00:32 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 0/2] Arago image names
Date: Fri, 30 Jan 2026 11:00:32 -0600
Message-ID: <20260130170032.3292136-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260130164253.1601744-1-afd@ti.com>
References: <20260130164253.1601744-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|DS0PR10MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e9bb9d-b546-44e5-e749-08de60211fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C/y8ptBibBCLhc4LR99P5BYC9BsONSpddTGP0j4vv5KletsfvwykwTn1IFtx?=
 =?us-ascii?Q?I+utM6f23UU20w8uRRiAUfg0ERNcoTrdYLWBZ2Q2Y19YKQiHnfYEo5jFWUjq?=
 =?us-ascii?Q?qF0aOByAxoQtJJVYoS0mX1jslIWm3txFnHs2pXVWTgw/WCnyg/3SiCoPjF2f?=
 =?us-ascii?Q?qyVKF7MU1c3YoHQxS+8su+mi0nOM8RtuCVPvtovyz0B0TWnPxAGHRYZFxQf7?=
 =?us-ascii?Q?SVRtw4sPlFomNmCwItjTqEvF/m1gF8/JXH2HxAIS4ZrnKpV/BC7jedpuhame?=
 =?us-ascii?Q?2UnSttD0kNj4ddMrcu3e9ar+yOIhJkyjGqIJT/xk/XHzTaP0d2m/FSemz37U?=
 =?us-ascii?Q?dLUhRYkyf09Da1QCUnTFDIZ4zftfxDDp18KCRbQSo2GmLjEldYMqRj8N/xC9?=
 =?us-ascii?Q?AnK/vMlRy3MvLoUcM5vzOTTNATdOpd8TwDqAk3GzME0Cu57aYmmDg8vl8eFi?=
 =?us-ascii?Q?D9vgp5YpliTnSZP4c87jlndP3x1FdynJkjU9Yj1JiudTb6CSWfvMGDkchnS0?=
 =?us-ascii?Q?7jP06/5uT+KRBpe03xS3JMbjmFFOjKypS6K5dlx+OXjwDekP/EC4dgJXizq5?=
 =?us-ascii?Q?nMUxap7EKUtFRch+ueB9dURsy8aQrBPwu+9pznlvp3N5jIeg1S0pRPCiaBBd?=
 =?us-ascii?Q?dT70ZYOkTFNg/eKUFnXdBOtFfmYuQ+GDGf+uw3pkTnJtLadLnFPY+Ol6Uu+H?=
 =?us-ascii?Q?3B2Ze+x4NZe55Kn/RAfBX2n2GLrJu235EZOfKgKgaHXKPFXtK3Nq0J25b709?=
 =?us-ascii?Q?jldPbbbggWNm8Wjigu/dLInpJmB/7uO6gJUoxzrzqQRgh+jYvicT5/EBE/jg?=
 =?us-ascii?Q?2AeJ0FChviWDTH6b+fCh8zNgJ91Gzsimmcd4Y5J6X6TgWNYbEfyHBPdYrzna?=
 =?us-ascii?Q?1FBXKoSccQzTtZQpi93gRc7zljeTdk5fNOZC4BNz1ve2yvH4Iuws8vdT6bkC?=
 =?us-ascii?Q?YGQfGJgBIs7poMWceYdBu9vF5iX7izvQIro9TQC9iHknmBZVdc9nGAR5H7Pq?=
 =?us-ascii?Q?0v34N10IPIscBF06YLIeoEYzqE5k5WpcQUxo6/T6FBjbIF0Synbv4b3xKDn1?=
 =?us-ascii?Q?klDbljnCocM7J+UVhRoGElOSiLxaQnSuHhcqswDd8M/smtXLjYjGtoI/VqgU?=
 =?us-ascii?Q?iQ/GXsT9qSo6WRkRyFZKLZNRwVEEhHxI2KHfLCi716Ld83LAeIpGig+Z3Kuy?=
 =?us-ascii?Q?AGHAp/d+f0dS1WI0/vTfmKia3ux2Sq/sSU+bKFmPkXjtOm8h/nvT3VaKa6gG?=
 =?us-ascii?Q?/6Rtpurti7NkqbN0VXHJqHCLguZC/4vfaDRpr4uieeEiXH7QA1nqfiNSsevd?=
 =?us-ascii?Q?F7lnSqAqS7q+VATuKSIxqsp7E7p7VpSu7ppJ6SjEHAi69nUkhm4t/6Kqn+4N?=
 =?us-ascii?Q?YjKXEP+9ttHzWNX/vInXjnmkOmHlHLNYkjnx6YpkTO9rBkoO8yCRURwEdxGe?=
 =?us-ascii?Q?vYWnhqu82/k7Ux2skk5vSPPe4uBJeDN5eLhwBc+lOCYnVzzRhBGU7XkcaaJO?=
 =?us-ascii?Q?rJmDiWAv6pR2Mcal9EaFC0uU3hc8xq4bqp3yQXdpqQq61m1JhPkD+dqKP3Jx?=
 =?us-ascii?Q?89k+PW7Pf/4CMca6gQzvW3AHk/fsQyhRwiFBF8bAqcU9nkPuO1TkJ0g2Cklo?=
 =?us-ascii?Q?n67dj6bmDX0qfwd2alL6fH9GMIIyI5AnoCCa4htCVYWt3lqqp0UbytT2CBJq?=
 =?us-ascii?Q?KQw7ew=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	95NhqmnHtZhzt3Am21undjCXEOBf6EiRVhcsI51UA7vKyW6HfKRqOVC/jcC2uikrPTh6X8CoNkRLOAWJOaOWVDk0g1h2y2kWkivE/MRhDuMqU5U9mkD6ra4MQdcInTRlG5W96MJ6Ru01hLs41SUJDCb/sVvDRFRQXtvV6rXjc2B1anXfI3ZgEU2ajCV8Hu2h21rSR3Cv6cEyvdhD5kKaQ6lU5cmPc/yD6owJimT2Osqaq87Tp8r6Re44F6+bQzaxFmMZEmwQI/qsnl3iNjPQtVtt64bqUFul41djW/YjPWxo3FARElds8jwMLPCRBIqL9mnxEwj2hr0wzcVPqZLLwW4dnMbr7rUA5R37dq4HVthdh62v7RsLwZYud0kLvHpM6mMViEC11FIKu6GwU37LtFvlt4+LkZGFj23DQM1sRHx6XQmApuGZd9xYrI55WvH2
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:00:51.4682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e9bb9d-b546-44e5-e749-08de60211fb9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6824
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 17:01:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17054

meta-arago / na / 20260130164253.1601744-1-afd

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
WARN - [meta-arago][master][PATCH 1/2] meta-arago-distro: Remove TI SDK bra=
nding from Arago images
    WARN: Commit message should not include directory path to recipe: meta-=
arago-distro: Remove TI SDK branding from Arago images.
              meta-arago-distro (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH 2/2] meta-arago-distro: Remove tisdk name=
 from Arago packagegroups
    WARN: Commit message should not include directory path to recipe: meta-=
arago-distro: Remove tisdk name from Arago packagegroups.
              meta-arago-distro (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][master][PATCH 0/2] Arago image names
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Fri, 30 Jan 2026 10:42:51 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 1123982f1b47c3e7f29a6fe13eff4414e=
13c82c8

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: shadow-securetty: Remove unneeded recipe
- Commit SHA: ec59a3b33249af3f91b45428a35bca8cd1141fc6

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
ERROR: Nothing RPROVIDES 'packagegroup-arago-base-server-extra' (but <build=
-dir>/sources/meta-arago/meta-arago-distro/recipes-core/packagegroups/ti-wo=
rld.bb RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




