Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D675DFEDA0F
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 18:57:42 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83921.1773773853835674063
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 11:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=UzeBH4vC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.21, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZRP/btj5A9EjDOoYlsivYeALyrL7oln8ukLbtZF3YOPe+HApdONZVtWxMiI3CH7qd1QVkMKoJ/3zSQEI1qqCcv9GgmeU78kB1H8RPNvR1fYzIgqTV1vqeq20Zz10SMiPAS2/qhN04oqRwJleB7B1p+oVBxfViDCnRT9bXDEXTMkFgw4m+8mGjwmq+JUc42nY6+X/CpuS/Gyv380+Snq17jOHe8XomwlCm9IDHd6cZ6ZUWyqnLcavsQDNfStosO8EnAjTgT+L96uNqwdrGp5kMEmiGIVriCw6x4/8XpdUw59t0TTThkKdr0e3PX3otu1vsjOs/MdWvOJSIiDQnYE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dH/JbZN1A0+M6SS1sAW+PIcUH9X7loKWeGOIXk9b8BE=;
 b=Fa6AuPXy2rCU4CoOhqFhIbayz4Txzj1jeSwosVEgK2gJP/SUq30jSiHhvdMPAUIeQUb8l++Cyt8P8B8Y54QJnmetyPGQsZckXOKy4PR44wJatYwEIjeIsGnQn0hbnIYgsj6t0eZDGeBRdDbE4jr9VAIm4lyjevoNeSCf2mHhcyk1h0haxq52oJhsh0I3uf1gqnwSdi5EaT7ZpXrPbZVWhpMVTW+TA1EFRVpJ1ihgj9PE+owJv4dKk987Vz+vYtvJDA+fqQa7zy9sU05BLXML3wStFSJsve/OM6NJZLT5+29MJN12i5xpBgUgkCvuC3zBPTgE1McqOAuLmkvJrDxARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dH/JbZN1A0+M6SS1sAW+PIcUH9X7loKWeGOIXk9b8BE=;
 b=UzeBH4vCXfbZ2jr/a96Oh/5FCi9MyjlfBWppgWe2IFVcX8scFojbR64F54tzfjjWJOS3juTlrLZUogrXuJgMxIUyRTBRcH470ws6dZp05TF4cwXzPv0XBD6TujUuDwk+1Cmkv1P8WQ0LhaPficNBxGlWYrwgM31KeXVlT+56VJ8=
Received: from CH0PR13CA0027.namprd13.prod.outlook.com (2603:10b6:610:b1::32)
 by SJ5PPF6F34726D8.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 18:57:28 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::c4) by CH0PR13CA0027.outlook.office365.com
 (2603:10b6:610:b1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend
 Transport; Tue, 17 Mar 2026 18:57:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 18:57:25 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 13:57:24 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 13:57:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 13:57:24 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HIvOHk3199956;
	Tue, 17 Mar 2026 13:57:24 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/2] libsdl2: Add tests package
Date: Tue, 17 Mar 2026 13:57:23 -0500
Message-ID: <20260317185724.34717-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317185724.34717-1-a-christidis@ti.com>
References: <20260317185724.34717-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|SJ5PPF6F34726D8:EE_
X-MS-Office365-Filtering-Correlation-Id: 631ac762-1ee2-42b8-0323-08de845707b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	F5430czK4+d5oz9Xt8gKzHlXd+2wawNrRRSx/JCplCOhsHZV/6qMo0K5vh9rpBsxnHpFh25fHgd0Ie3bg8rt0N4PLZiOPwv6GS7YotEsNyEZePSoipd7+9PdtVomM4zKU9GZiVTYmcY0zqVaR8LD00KGUgRsRmJyGVYxd5i0ZhyHo2s9oTKJHxWC8E4uldUYWGy1T8RP+Fn0A0Wy2KyGuY0VHOcp6dzoEiaY7A914CNyB2jnL/FrrJmhNNa3SsHOGqo/QNrSpP8/y0WxysAhAGnRuSF+c+SraI3X+EfaqbLA/tz3iRf85AmDxgYAt3o8LTa0AOnzgfO36qB/rk1Wq96xcHWxkqB5MmKQQvdBDcH01LEq4pzxnOQ9A+XM1z2TPJUfZkTxIr/Eu7VvwbhygcOYbVHCX8onWkMW3MaX305HxlD7vS0C3v/whjKksF6r8zvkx4g+MF/tHLkrnZYqVNPLFxH8ULhwo0c6BAmvIPKPJS2CLOQjeMJIXU/ZQ7Cs1Qey9+0uM64/nows2gvfbJ/vlLkU9l6vsr3wZwHXj/yjSOvu/SbCmfBlftkfGRQKFTZDHcMdrcMcYzVYZwoWoaLQoDgSOE2Y7uX2kQSdBnvJ9+UiM65Eo8AiJaRfGAOfmjtam0Rw/89TDDb/nG0OTmvmzBL8sOKHE4Qison0XevKAcX3HDHjOcx0ue+vByUQKYn/+Zou9GbqJi7VA/bpeOhWQB0gppGwg9TvSDeYlJrdQgSexhnVdfumh7z/xMNIUBhHKJc2dfn/vx2PPK8zmw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AgQEUnXJAVO/gi9MoJyGJGRRE4U/fA1yZZ2TpgUr8I7oGDTJAuMLLqvnc3hS6MAJ4F89w0ua1nlM97KAEwtw5JdoFc5zaSTbrL8uAHzga5wPAyEYIyNxHkbNdA+fu0uCL0vamyIBDHzgd2TZQaAYJe1EDP6SnTB8IS8mJLkM877G9M+tZVuF1D6lcVNkvEaG5dZdJaM63mV8SRzojMpQ3lOcsdTydF+wq/Mr7u4sYw/Ax5kQ8wMmOqSdgdTIbUamTTvtV0j3ezQaFe3w1pnKGBJ8YzVUrcCJ4bLq2/I27M8sQdDq6L6kZZ8s3sfeMpuz9SKVMeVv8tdJlkKp784nnK99b+DwbWlLC2QHMmv5AE75t2GWyZvx1AY2X2djGkFbV4JcOvTqKe+iROtvJUUBZrN8Tr50Yni32zwVk0rn18wJCMTfrh9clrlXFwPxIkyB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:57:25.8537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 631ac762-1ee2-42b8-0323-08de845707b4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6F34726D8
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 18:57:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17367

From: Antonios Christidis <a-christidis@ti.com>

The software provides tests, configure cmake to build and install them.
Package the tests in -tests package.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 6 ++++++
 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbap=
pend

diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta=
-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
new file mode 100644
index 00000000..f33ff909
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
@@ -0,0 +1,6 @@
+EXTRA_OECMAKE:append =3D " -DSDL_TESTS=3DON \
+                         -DSDL_INSTALL_TESTS=3DON \
+                       "
+PACKAGE_BEFORE_PN =3D "${PN}-tests"
+FILES:${PN}-tests +=3D "${libexecdir} ${datadir}/installed-tests/SDL2"
+FILES:${PN}-tests:class-nativesdk +=3D "${libexecdir} ${datadir}/installed=
-tests/SDL2"
diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend b/=
meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
new file mode 100644
index 00000000..385aa801
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
@@ -0,0 +1,4 @@
+LIBSDL2_TI =3D ""
+LIBSDL2_TI:ti-soc =3D "libsdl2-ti.inc"
+
+require ${LIBSDL2_TI}
--=20
2.34.1


