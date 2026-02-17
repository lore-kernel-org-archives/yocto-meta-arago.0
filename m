Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF75EE9A032
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 18:22:48 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18968.1771352564002734902
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 10:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DRf2E4pK;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.27, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tyyokmbhn4t2mG/ZI+evhOIqA6SyzFAfB3Ioe9+Z71N49pJdLwWO5juit/mxn60YLoZ7wt1El4shfvfRDXGrswdooJQ80VpfMvFDIK6M2kX+RHD/LMluxHNb6Y2/tLJuxmexVoTh51EUfRAz4Xk61LuU32KhOVDsxdJbxQsEjnEbw4SJkevqBsPtqgDzQQ1MWvjSFVXKZRlIcFrm9lelHCI86yLRd6aVFxJNkcC+zO+m1KpJqm9gQGTmPMmgZVom8z40XdcOyVOLl4Z6ZIHlkpPbGO+z43CM9lj0LJoI4nkNBDIMWceTVl1iOEcSRC6ybyH8UBw/An3gWA3kj6DF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7P67bknoWfTm8JmuEmHBsVw2YUSSz8sZxV+hQAlgtw=;
 b=MoKERCAENOvv0O4GLJg9DiSiGLFY8rJ90Nz4QnBjAUUIRoTdklatQPVfj0w1xo6/nRuLNC/8xsKy+AOHrHwdEmpgq73plJdH1J9BM7iEltbPb1/ZSqtL0+7ld2stpoImyOm8NaKUTA38F+7SFzi2L4tJFw1dfH98E+gDzHrgpwUeflaHL2Xqg+o6SjXF4m3rA0biC2bh+t+vZHpyG9vxCrrbH/LC19xzWl9p1CDHvKaCGkf8AnEg1rxLW2PXlhNtn7ysVcMRysMB4CFU+fgCunsd3d71+4fp4m0gGtezpuNh2HdAU+3x7mYHO6hdm3UVB/O4EWw/3hpa7cnIkcyiiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7P67bknoWfTm8JmuEmHBsVw2YUSSz8sZxV+hQAlgtw=;
 b=DRf2E4pKsyuJ2V/KqPbm8yfAQDxS2vUc87oS5EiBqmfYNt58Gph5kOKLjRSAQmameZOPqPYycwlxf1e0CHPARj+wbCb4/wQKuqcEpTMH7XcUX5bnVvJnVE2O6C798Kyv6q84XqqzIHSlWqQsbUjpc/o8CBi6T7akFsmrhqTj5gw=
Received: from SA1P222CA0174.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::23)
 by LV8PR10MB7776.namprd10.prod.outlook.com (2603:10b6:408:1e7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 18:22:41 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:3c3:cafe::f3) by SA1P222CA0174.outlook.office365.com
 (2603:10b6:806:3c3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 18:22:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 18:22:40 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 12:22:40 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 12:22:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 12:22:39 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HIMdHW3295611;
	Tue, 17 Feb 2026 12:22:39 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vsPiZ-00000006rU1-2ubk;
	Tue, 17 Feb 2026 12:22:39 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] xdp-tools-arago: upgrade 1.5.4 -> 1.6.1
Date: Tue, 17 Feb 2026 12:22:39 -0600
Message-ID: <20260217182239.1635550-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|LV8PR10MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ffe91c-226c-4695-b9ac-08de6e518916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bbWm5AmIrgrrPFa5YaheApSg6JZeyFzVUnqSUFg1NKdQtJWMzuHtxIlf3vtw?=
 =?us-ascii?Q?jPOYDtgasHLNS2Gr974D1SC35A/LzO1Xp2o5sNlFhkOx8HzJa6a47H3ZwqH7?=
 =?us-ascii?Q?/ao7GVlEI6bkpzdmJRlRSiE7BiOQo6gwxb6LZj23SgydPQCetf/spW0XJcKR?=
 =?us-ascii?Q?QEtQQnqYeEeji/V5CHzDmIOOS/jWTLtQJ1H+wi6vzwnDv/YzEI+M6nMbh2ra?=
 =?us-ascii?Q?XS+c4atfhiYowv7st7ZacjsqgNg2nbPeNwjEoQc/Vlt1GfE2FelpXPge09zd?=
 =?us-ascii?Q?Ov3NpmslMTvB31XslxTmBGOkT7rnbcVdLmmfV7BRB34VoulyBwFRbMKK+Coa?=
 =?us-ascii?Q?htZ6269Nutj+b974vL6/xA6idD83p1dJd+Ht3GmtFXLTKMvn8cGJOSNld/t1?=
 =?us-ascii?Q?RZTkwW564dd8QQjEsTe++caZU7TyIhU0aDsw9TAyGgXcFKhAPfVyy1YcycZg?=
 =?us-ascii?Q?SkZJYjMwEEhl+pBTjhesBD+4ThbIxuMOBTvs2kkG0slGcqFthb9GiklIDVbU?=
 =?us-ascii?Q?feW+jGf3OS6CEKfun6cpLBI+WtsioCtFbM7SyYZqS540hDiZ8WGuKdZiP8U3?=
 =?us-ascii?Q?bN7XCSmu17iJJ7jQYti306qAg1T4bMxS28w7WnCe3oV7MNpaf1Kj+zuOylDr?=
 =?us-ascii?Q?mym+G7D9CWVUZTJjomKh/c9bL9QSuAPrCTB0RFWmXu5lENEUlrZ22GdEmEsa?=
 =?us-ascii?Q?Xbi/H7IIZ15h7zN91FL11/CjX/tNtyxythTv/lHB0lfbGZcW/4IncEtKU8ki?=
 =?us-ascii?Q?PXJ1MYMbluveLc+vjQiUgcnFAdbbeZ92cDSNJbfMdfvlYUiuZiYXES+Mkbo2?=
 =?us-ascii?Q?l6EEt2vGPeZ3DTG3meqam/b0B8wS6mcQw0tNCCDrBBzhpuO3Bhb7zH65g1DK?=
 =?us-ascii?Q?9AHKpyK3QuY2NXRNzy0LpjV8rKkkGB/VuoVRHYLa8T94FRStVq58agCpm4aY?=
 =?us-ascii?Q?Ra1lR9Ud5Fnmxbozt9y7Bnf0ykdPMub3IwneH6OmVj5S07xbFGWJLZOgki7m?=
 =?us-ascii?Q?1hv8kz1ISwyELRgg0MKA3kQIQ0xNBOlEommqTH01fYcpYbFUnhuafPkCgBDa?=
 =?us-ascii?Q?mCilGda3bUP5SisPD96gMSO7h+mO4hCTYfIXJ1ShfbgYwOWXSJ9aY1eKP9a5?=
 =?us-ascii?Q?Ce25zXrixntEihO6hRydMoVSqM1kemrhkyvgkXSDOE8ZakDelCPvT8m5HwFJ?=
 =?us-ascii?Q?5T4pqtNylqgLM/P43r4a8ZRru/vf3a9SK3V7pgTCT0jxG52yx79fwO3qBjXl?=
 =?us-ascii?Q?PO5TtG4VuW+bXgkVfx2o3JrLjZ0nxwNrqgpqgbyII35tPUqK9PUDJivoqZd9?=
 =?us-ascii?Q?wda1jxvSA9zLCaLUQ07Nj3+QVGRygCG1tTWtWl4ucPdXEuFLpc+xqQ5k9hb5?=
 =?us-ascii?Q?5izYpfRmxE837hwf5QaEiyX3MQXynUxgAR988VHIgMckRkc8ww46kB2pGL1A?=
 =?us-ascii?Q?Lc11AtB7i40RTF7KwHvfSiTTFpjE1QwBBJnHCZuFSInsm6YaY19tJqXhRHXA?=
 =?us-ascii?Q?g4N9HhuZMJ89d7SQse6F1HB0o0+HYLc4nHxOOleXaWWE9eggTQXgKQ8b8J+Y?=
 =?us-ascii?Q?UwEX2Eu10pYzckbjkDZEOgKhbXVEhx7vWeXcmCuOlAUGeQjK7a9pPFFMxsOm?=
 =?us-ascii?Q?7mLGDdh5kwCm9SnfORBdkE98oyocde+D/BvOWUl2ckXyGOdnvfWVygXSSVbE?=
 =?us-ascii?Q?SSfkBQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UDdiPslMrADfQJUFeCeF7fbxBwZK3zQjbOg8cQJvPdSLpVLFEIUnmQ+Z0LiLCJciJyNLx0dGUK7UJ3IF19y86OZVGjOdDEKZsf43yh05LO/BYIx53jskuGTVXSw4yNGQKpsYDBi85Jlo0+B2NfRmlyQrqdaNP+ljyKhaBlgnhxL1e0wKjHZjW6XQuTcCo8qmfGmk3BByFKD3lFkSdTcb3luK+J9fM5EZaeK15Xmxm/BImbWEDwOnFhTK/neUsbKLpMwNCu7sgVdhWAGH7NVLTZcCKyqGEmdcEYEZK7O1i3MBfg4kZIjUtqXDFCBah5uq70UlfbDr3GPoFaCNquMh/ujXpwlh7JeTelDiu7KtIjg6i3N3WxFrrZZu5CXaegIlCMOQnDxYhP9gqS7nlvMusmUYxZZDJmg0E+DAksW4vfHgds5lpLQXbV093Gf01Pxk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 18:22:40.3768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ffe91c-226c-4695-b9ac-08de6e518916
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7776
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Feb 2026 18:22:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17110

Changelogs:

v1.5.5: https://github.com/xdp-project/xdp-tools/releases/tag/v1.5.5
v1.5.6: https://github.com/xdp-project/xdp-tools/releases/tag/v1.5.6
v1.5.7: https://github.com/xdp-project/xdp-tools/releases/tag/v1.5.7
v1.5.8: https://github.com/xdp-project/xdp-tools/releases/tag/v1.5.8
v1.6.0: https://github.com/xdp-project/xdp-tools/releases/tag/v1.6.0
v1.6.1: https://github.com/xdp-project/xdp-tools/releases/tag/v1.6.1

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{xdp-tools-arago_1.5.4.bb =3D> xdp-tools-arago_1.6.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arago-test/recipes-support/xdp-tools/{xdp-tools-arago_1.5.4.bb=
 =3D> xdp-tools-arago_1.6.1.bb} (97%)

diff --git a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.=
4.bb b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.6.1.bb
similarity index 97%
rename from meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.4=
.bb
rename to meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.6.1.b=
b
index 12b42c90..dcd9da58 100644
--- a/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.5.4.bb
+++ b/meta-arago-test/recipes-support/xdp-tools/xdp-tools-arago_1.6.1.bb
@@ -17,7 +17,7 @@ SRC_URI =3D "git://github.com/xdp-project/xdp-tools.git;p=
rotocol=3Dhttps;branch=3Dmain
             file://0001-defines.mk-Add-missing-prefix-map-settings-for-OE-=
bu.patch \
           "
=20
-SRCREV =3D "e78d8d23bb80f221dd6b6970ff5a44aaf4717114"
+SRCREV =3D "84906a0fe98cbb5e5eaa2c888c50a1ab32d5d0b7"
=20
 inherit pkgconfig
=20
--=20
2.43.0


