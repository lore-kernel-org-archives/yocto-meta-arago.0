Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608A5F513FF
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 05:55:58 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63677.1772776548960154929
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 21:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=CA3ssV9m;
 spf=pass (domain: list.ti.com, ip: 40.107.208.40, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/Ktxqaco4xh9DbONW9SnbIIAmFVFxoxRP2P61zU9Ng1sCfhU2gV9hj0CAvs6gosbeABoSaaiiEIHZrqmhxia6BNwv6a+7YkG7IBl//RgU7M3rbcO/nsTS3i0CpLvjcF3qQ6MkfwJhmGrd61JjvRKKWTXQJeFXUh+J7VU+vIZY8+T9/fPH0mNs14bfWEC2Y2rY1P6CXXuZ2xIKHWedUkWZ291bvv6jrfwo7WLRs38MGlbNxmRv4p3AL1h+JRatkCZ9touIyMCVM5h4EEHSEvDaRSjg1gz6zBdHDvtD6pdxZNHaPoOqWdJF9tgmVr74cDs9mKyxrhj75NDjqk8Px7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8twu41yJJajACZJDYmTYBPSaD126RD9Ron7BSvJWnMM=;
 b=pxK2a7WvslIotIGIqPZxWpnQ9kCz+T9tNVt5QWP88xG7A+A67qq8n7O5KWro+ngXjatPw4ydDJn/RjJTL3yIFub4bGxFug0ZneO8YNRvcTmgDcGp77eLW0bhgErKS5bnWCUjfmwmTDUMDyOTrMmeURznTnpMRVEkoQs4c6tzbWMAMBxiCKD0a7lWMpdWQDAYc9pPdlgR8aKkb3aFuMw25e7KPA7Gajssd/sci5+07B82ehyl5ULaQDZdUeMU63i+RwM35KMysKEHOvYGbWrIa2qXeHEZJXOzJ8Lh/BfX0LnmspkR9mPsXPqyRlot+WZCMearChu6C6R3Jpie1LwQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8twu41yJJajACZJDYmTYBPSaD126RD9Ron7BSvJWnMM=;
 b=CA3ssV9mNYTz82Zix+8dR75pjtBcp3tnLhZhd3yAuJMnpeBKSBCoWTAEcvEopnsZk/kr0vM2UN70G5bQlT9fvKUfs8NbkZMCMTV9x0hK1Gk4d+E9S9yyBZfgUa+3NJGM38Kaej25A6SwBDSn7qEpEasteWNB5mahkcBDj/FukW4CZECS9mUZ1odnXBGT4QuCwyClzIP3PGSX7DPfFYIfoduHiPbwF9Yd+Lv6ZocUiI/FOL/Wm0Nj2/0tGdhzU3++r1c7fE9XvZ7/5z2J5rdRLL931cowVSax9B5Rpj8CkiUGE/mNG/i9moZrR45IXcOpjOVdav0pZGeOXPajgQoDSA==
Received: from MN2PR10CA0033.namprd10.prod.outlook.com (2603:10b6:208:120::46)
 by LV0PR10MB997639.namprd10.prod.outlook.com (2603:10b6:408:33d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 05:55:46 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:120:cafe::14) by MN2PR10CA0033.outlook.office365.com
 (2603:10b6:208:120::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 05:55:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 05:55:46 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 23:55:41 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 23:55:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 23:55:41 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6265tftt3248811;
	Thu, 5 Mar 2026 23:55:41 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 0939E142E22; Thu,  5 Mar 2026 23:55:41 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>,
	<b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master][PATCH] chromium: Upgrade to v142.0.7444.175
Date: Thu, 5 Mar 2026 23:55:41 -0600
Message-ID: <20260306055541.877957-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260306055348.1760322-1-t-lannynd@ti.com>
References: <20260306055348.1760322-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|LV0PR10MB997639:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c7d479d-a853-4512-5586-08de7b4502e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|82310400026|1800799024|376014|36860700016;
X-Microsoft-Antispam-Message-Info: 
	zagdWMtV2LkySzubyTz1qvNU3B5C6FnCzVOqbT0y1k8QNPGy4/AsSJe5DS2chZNvl1wnZlANxlz+fuwSI48fTeOGeR7uZB9GOz2ZaJjqfEQIJebPU6ZOGiN382kTSiRyHx6+OcNu1tkftkbSh0fcU7ww6b54ypDwMkQr05vVJ8VVJkUzQ2p47eL6R8XEpKFJsBRZQ4tLeMQIKCHerMr12CZyMHIxeKj8H+fmpS2fCluTyFcLXlE5AKBfz8Ba/WHb5Xa4YbSBR6OqHNHeEfMdCq5ELCYyrotmvlRhlNTHuaclaEv7QV3dLR3eBj8BzD/gpqN5EKMn1QpHT6oup51c15ut5oCyazUCOE/8uKL9EG4ykrgRpn6WXqdw4sB+hLR87SfIwJjyrfwdSDI+Gy5oTaeSSygqpS4sZoh7mMM5BzdAJyZwUcx2BjCvHLwA5FkK64GCcmEE15VIWWrPPEGMooD7UyTLzSyS1xPWGozhqxGrrFa1tWzIBMuaGAo+rhRgSSiSZxoj0TmlRwjSo3h5Tis0D2oNCMu2EwWKqTRXu5wQ2lxck+lBnSIdEDCgjAK6/zoKWHMAYTQuI5AIdglqWeVxSM1fA2Q3zX92Dbbs29DrbGY9dg0/jB641HJJXTstQhvVZxavR7RC7xi/Fsf+D0hZvRciMbH6GonvYYTj0ovU0FH5Nvysi2XHckXbDHUSY0kEv7QcRYbdY0y1FPRzYjNW/OsS/OtdR4139v82FoR46NU6Xap3n90KZm3m+R8nbqzjG+q4VoqvrrH2bq6ELQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(1800799024)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vU8AUZdnW/TGlvr1PoAys+wSxOPOq/6S+im6UG0Ku8GNnW+rXG2tAN/P370QO2LDu6A8rv3g4BvrtQvtUrj55UJJllKLPq1nG7WvDcg/saG0IK0SK+8WzUzcTMTS6DLi16NyK3yhXSq3qZAgOgXMAizyiCC9mlxG/i3uYfCivuQlxVoIvz3Neaw47j6I0+aE+Y628qSMcnJtFvH4KBg1B+M9bRD5irLtMcXY9W4sQyKPMsw75kvTJbh/upoJAwX8/yHEIMoRjy0J7V4SYGO97JUoIJmqlQav8DYvBBHIsWjZIEszAXmahre+2SIeHy6zdIiiIM8+OKbuedAkDJS/T17XxzOhK5MRJB1lQadJ0rcw3+CNXhKE9wHta+TtiJUXc+hzRISZqFIgO4aAPzkPwkCYR5upkcpwZW1M5kI3/MOHDr3IXlhcuP+Oolvss6bJ
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 05:55:46.3312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7d479d-a853-4512-5586-08de7b4502e1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997639
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Mar 2026 05:55:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17274

meta-arago / na / 20260306055348.1760322-1-t-lannynd

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
- Patch Series: [meta-arago][master][PATCH] chromium: Upgrade to v142.0.744=
4.175
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
-From: Darren Etheridge <a0867391@uda0393673-1.dhcp.ti.com>
+From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Thorsten Lannynd <t-lannynd@ti.com>
 From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
- Date: Date: Thu, 5 Mar 2026 23:53:48 -0600
-Date: Mon, 20 May 2024 15:48:36 -0500
+Date: Fri, 5 Dec 2025 12:40:27 -0600
-Date: Fri, 8 Aug 2025 23:05:18 -0500
+Date: Thu, 5 Mar 2026 12:02:31 -0600
 Date: Sat, 9 Aug 2025 01:46:14 -0500
 Date: Wed, 11 Jun 2025 11:07:05 +0300
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 42d3d0a522e81a7ab26073de6a5fd693b=
d4d8b12

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: emptty: add version 0.15.0
- Commit SHA: 7e07ca47e0a7bc77ef7ab8bc0a10061a0c57e10d

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
    WARN: Are you missing a PV =3D "...". (PV-1)
        meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb:10
            GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pam'=
, '', ',nopam', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb:11
            GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'x11'=
, '', ',noxlib', d)}"
   =20
    WARN: The use of :append with other overrides needs to be manually chec=
ked. (APPEND-1)
        meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb:68
            RPROVIDES:${PN}:append =3D " virtual-emptty-conf weston-init"
   =20
    WARN: Are you missing a PV =3D "...". (PV-1)
        meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




