Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2C5CA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 15:13:57 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22305.1791213229557282821
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 08:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ER8aSWN4;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=C1vr/YrY;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 695ERkZl105567;
	Mon, 5 Oct 2026 10:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=JK8hM0rcJk8QP
	hITVlHfQY1ca7rGObR5SCYdOQfCiEo=; b=ER8aSWN4InsiM7iT6O67NKkWcudsQ
	BYmbAIFfIj4WxL5ZokeA/xDRZfbIMbNgC5Lg3CdtzpV2KNw72FRIhqqFikx6bVne
	tLuSV/jtvl+M5nrBjDFSAxrP3d7GiRKXlmW7UWKYo5+RLUTMdTbxXnhG8IdqMUrQ
	fzFni0RC0RANo/68ZLnttUhdCHonRjT65TznF59IkowCLysae0XtXR49sbartxsC
	j02T3yzXat0JejLM30xCAj7nlSN6RX6xcH5cSCnz6216jpodwtMrtdZWkJicVE/K
	esvh0SFJo/0hneSrszdZuSOEJpxfjMxJDxRE6kbsP6I8mAjjRoF1QRYug==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010009.outbound.protection.outlook.com [40.93.198.9])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h3knnnx9n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 10:13:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xD1FVXm3+BLmcWwobvqbmS5GRXYBvxm9//jlgtqj2EFkB91Lpn+8AJGBetfRK/LyqnYBQgps80lmzdtWYQl4SaxhOsrubySiuejbVSOhrK3kCgxGp5WAb4j8FKfG0sgeERI0ucu+hZu0NRt3adX6FGJKMaF6YEVCz53EKkSs001EzgjcAs0ONGUEBmQEpRwrQIn7M3+5vUvJ7D9JOSat/CVJS4fgch20gYygYwpF8iiOdk3E9aPkGsmuPuT0PTxhIrLWg5BZes88SG48IuCHqpIE7giODKuNeDDnKB/FfiV5vHNrbuFEkDy0gsij5s0dBTkr6hqFC+xT5kZ5taQxvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JK8hM0rcJk8QPhITVlHfQY1ca7rGObR5SCYdOQfCiEo=;
 b=jDJrToP912khRr0V2rsHc9GtZAGNigYcmxUHjuu3o4+xMtAetj1UbsdZEFhpQbPeTyIul1BY6hu1kJ+U5iFlTNuAwusLLi+DWLoTcxop1bHF+JV9vMbkGtNDTq4In4puR5r1iI22wlwzCT7VQhatvBsrggawGkklqG0JT7n/LbQiBYGdaj+pFPmYGbxiGUyeHMV82hkxAJ/Mh6LyjJkb3MJlsO3YySPITYDJzvGuV224WTiUmxtqfU+7XZheUO93oIDaJM7UixeemY6cA58RYkaqW/y8/jdz6w9w6mQWrwY+63oep9iMV8m/U+KpIhpwV7o/KWAdIWsTycNPilfUUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JK8hM0rcJk8QPhITVlHfQY1ca7rGObR5SCYdOQfCiEo=;
 b=C1vr/YrYO9O+cCZSvLQgIBG3LPUu+sIWOrt9BshktedZFqt861vi/Dr7O+fehHSMdB64j4Exe6FeKuJ1Fv84ky8pcEUouKQW3+7+9bD0F5fZjpxDSBkASW1+UEIoZCwc8PxfDxiSAtcQb8zQX5H/qeSmkYAv9yTrEmBh4+S/KsU=
Received: from BL1PR13CA0220.namprd13.prod.outlook.com (2603:10b6:208:2bf::15)
 by PH0PR10MB5564.namprd10.prod.outlook.com (2603:10b6:510:f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 15:13:43 +0000
Received: from BN3PEPF00022BCD.namprd03.prod.outlook.com
 (2603:10b6:208:2bf:cafe::63) by BL1PR13CA0220.outlook.office365.com
 (2603:10b6:208:2bf::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 5
 Oct 2026 15:13:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BCD.mail.protection.outlook.com (10.167.248.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 15:13:43 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 10:13:13 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 10:13:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 10:13:13 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695FDDnP416302;
	Mon, 5 Oct 2026 10:13:13 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xDkNN-0000000FbpL-2pek;
	Mon, 05 Oct 2026 10:13:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 1/2] mesa-demos: Remove uneeded recipe
Date: Mon, 5 Oct 2026 10:13:12 -0500
Message-ID: <20261005151313.3720270-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCD:EE_|PH0PR10MB5564:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d46435d-d02e-4dc6-38a3-08df22f33e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|56012099006|10067099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 
	0mYBZD7FgHoxao9eMqkTxrxTs/7C0TFgYRVGeDktezeRveJz2LiOI9uHkpIZ4oGzJ4mFz6kxXkzjD0s5ryLkhI+Jk1SKXK9Mlr2mQEFat3UPrgeg9IulVtTQRQNGpwbP8skSCqsyeSz7KZc3qMNEXcaNFi35SpDOjsNiH5n//lCwKyK+AP6UUGm93w+KzwKWhDRDS0NNCrTXIiJDVPSkQno7hir7jNN99202hhTqHt20pPLMN+K6E7W5AofHZp5/9MclQhnvOlnu53JRuWQkqokNZzUfwM+o1G5GJsq9MnnKbVfnQ88nm8ZwSHbMdO/R1Rbb07QX4EIBVjhqIQv8ccfhJ0RCuzmNERpI/lp008wS8IHIcL9mC/cz6QALtYXNEEAVv5ZaVEb4znWa556byUUxyPbXOgy3cZ2stSAsawXS/2YIfQeNQKEKkPuJhxT48hmOcVbj7YDi/5/HKWQRKsFo7AOv4UXFiovb2OKx1Go7xD8EuxScUUCJQt9F6vFE69WZ504dcxq7cE5wngzEy54T+V7uUIEJzjKVCpht01zBv5VrbOgoLJC+qXlgqNtWUg0BPCbXGF27j7Bkbs/kcOhHSY8RZqGSZOIw5yVNgJyuKprtNr36thOUvtTqWc6k2I0HufXnh82Y14hkR+eT6w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(10067099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Dm745BiyhkqrPjfMKG4WuyEAbKbzgzxsmEc7OEeIDYQNrtTFnfU50hTRg+7egN0JKyJI/vc0y++uEIqqSQojRCSTWK6+FR39Ha7ps3JDSNs2XW5yFYU5xxPk0gClKXyeDx+xMXBXGSIohIKMxD7XlX5zy3rlYcroOi5F6wnwA0CjF4Mrc2ClBUnXv8cSgloAUHdq+kQQdzTDXkK/g/a9dejWlWj4jzEWpVzSQFUVCmLlh1p0In6smJkhkpWIpQe9NiLZXdhqikn0GOTDy0vmHb8JickShBuMd6JWXt9jFpfrdF3N/fAPMKjbWDtU5HL7VPYEcXMprWf5wZ2D/KTN1ASzR83qn6E9oY9hRCZYktID6/R/EkJ+ZWtZO314hAmxNiJfX93Lis9tl6bdaY69lQVYMej7g1akFMIUGKbiyZPW0QdA4MztJnXU3ethW0mT
X-Exchange-RoutingPolicyChecked: 
	WA60KNsKqHdC32s5LGm2AvOcQt2N7x8qzaXFxKaYlNdTfYrcBtFs8fF++QR9v8OHlAp6+ATjZWNHomWFtN9MXyNebbPi9on9lDLMvybtXMAVY1gCBoMXn8LczM5paJOWZCKPPCamfutUTMe9/6jHRNuKPevMWVEOC/UG2xr+3ard2ALMDgQ1RjQYvOHRtmOtJArzPK0kG2zjo9WZw6uiC6X2BqB30rNzu6qQI2C53vP1blNgtkJxsiZwDRCZKyrFydObvtj6k0T2fsmj1NK8WW8oheW9df4gUUQPc0WelbxQFOgKO9OZbwy16JGEp4BZUOQShFvg/0CHtS9mA8SqXQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 15:13:43.0260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d46435d-d02e-4dc6-38a3-08df22f33e81
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BCD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5564
X-Authority-Analysis: v=2.4 cv=I/7w19gg c=1 sm=1 tr=0 ts=6ac3beac cx=c_pps
 a=MYJxclL+TLfs1lE1Gew55Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=ZpVaWaFtAAAA:8 a=e5mUnYsNAAAA:8 a=sozttTNsAAAA:8
 a=gvvA7wtH9QWhinaSYl4A:9 a=5tn4MO8azEBWFjlAA-rn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: yde6fv10JJtkc6WgqZJkyY1oLw3DHKgC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX+FbxZ+ekiJyx
 lcKHEyUxmpaEsESgW/b+i0KhXvgumze2vvhc+Wx04/LeKYce9tkCNfsk3OSfvRtc/OXxsNny/VI
 FQQirlsIWVH6MOSH/Y60oFkkBvy1fbqrRLmdC8s1spVsjRmXxPxvQ39mpr/AK14FAZKVa0nfRTv
 Z6FgHxESr7wMHJWx6YgyL9pV53Yr5s9xMufE1pAVRDwvaDagjY5g8boQA77+9d8D+towMvtUKxz
 nKEWo6teUlj1vfQ7uuuIBjVXSsAE44tBcz0wId/goRiGME3GNIoJ4xJVq5zRP9AMADu1SUfKPV4
 uEiURjYTbrcNLgiz7Uxd4Bk1NTTZ1NzMoX+s9Hz0qkBQPXzM2VNgLZDnAkGD8Wc9mJ/buuFjgq3
 NrBs9soZcAXVCuylQ3mK/1UHVT7MIkiRxpXNTSFFyZh5YwLkr8pGA30QMGAAV7fUesqQITFSXPS
 AsGlmvHqPcKCtBmW/Dg==
X-Proofpoint-ORIG-GUID: yde6fv10JJtkc6WgqZJkyY1oLw3DHKgC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX6d8LL7Mz10an
 K2nP5YcVS7heT5a8sK/DaD5Cep2Rz4YsjGhShiC+EERMRCDcGm8Rg9euXJ9l3EOB6gqMawdWFpg
 Xa6EiwANB3kXlBzbTg35Axq7qWheg8Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050059
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Oct 2026 15:13:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17735

oe-core has moved the version of mesa-demos beyond the SRCREV that we
were pointing to in our mesa-demos_get.bb recipe.  We can safely remove
our recipe in favor of the oe-core version... except there is one change
in our recipe that is needed that oe-core does not have.  Removing "x11"
as a REQUIRED_DISTRO_FEATURES.

We are working on a patch to oe-core to fix this, in the meantime we
will carry a change in arago.conf to disable it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Just remove the recipe and move the single change to arago.conf.

 .../recipes-graphics/mesa/mesa-demos_git.bb   | 41 -------------------
 1 file changed, 41 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb

diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
deleted file mode 100644
index 8dab581b..00000000
--- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Mesa demo applications"
-DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
-These applications can be used for Mesa validation and benchmarking."
-HOMEPAGE = "http://mesa3d.org"
-BUGTRACKER = "https://bugs.freedesktop.org"
-
-LICENSE = "MIT AND LicenseRef-PD"
-LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae \
-                    file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
-
-SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
-SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
-
-PV = "9.0.0+git"
-
-inherit meson pkgconfig features_check
-REQUIRED_DISTRO_FEATURES = "opengl"
-
-EXTRA_OEMESON = "-Dwith-system-data-files=true"
-
-PACKAGECONFIG ?= "drm egl gles1 gles2 \
-                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11 wayland', d)}"
-
-PACKAGECONFIG[drm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
-PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
-PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
-PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
-PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},-Dglut=disabled,freeglut"
-PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
-PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader glslang-native"
-PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
-PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu libxkbcommon libxcb"
-
-do_install:append() {
-	# it can be completely empty when all PACKAGECONFIG options are disabled
-	rmdir --ignore-fail-on-non-empty ${D}${bindir}
-
-	if [ -f ${D}${bindir}/clear ]; then
-		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
-	fi
-}
-- 
2.43.0


