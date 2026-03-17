Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E329FF6E74
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:34:26 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86156.1773779661442229412
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 13:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=kjIiOTqe;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.46, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7hOEWmaY3ybe0sZPHSAce45SLWY64+cYpkR1reQJfIo1jB1cZV2CR07hjYL/iy6AxYBmVrq95in6oIBJF1vLc4EuXvzhuhp//7sImwfv8t0bWt2hCXVHYEhTLXk1xALi2sjhDTALfPFIUV61IZH7tRp7DDmJxVPJMsN2nKeXgFMbqO2PI7V4lXTwEFR2TFZXDNPt28CyrbPaNQxvnSG0Ow8++z0g0YutqyI4YMA123TlMClHwF6m9PNiP+B7EIG1jMNpeSPID+nWcBzyeokJBQPN3oDqsXy5KUNPQ0NvTfBnCqNz2h3TT2z2yklstPqNuc8K54LFWea4C+h/+kB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Upw5oa4ZJe9j+1IIqqdV6FCGt5AFEw6+HiC2d4DuDEs=;
 b=XyUi8J4GU9azcCar/JpHz3EejunXZYyA4G0RmzbtN13mrS6ro8LPffQwlbjmqiC9tChnVH5AEmgc7WBBnLu5dIOoOZeNWg8fQnmcBU5tnVuyB9mh5JWKdZ3RPBgCe9qWMu+J16co+vwUWQ7g81wVW1Z6JrxLZSUM51aEfF+GNc7/aTe1bXt9Qpm4JuvQ5DBzvCyTjEfSZeWJQ+5C6Wm5Qvd8+Ww2LNNeKGvwzlodYZyx+PZM3W0YURdYmlf5laGQY5zFpP17juaErcqvSjqFgjOerL7YTJTgnYOP0dV1Q12d8FkqlmDR+tw3SLGq6/+V/PS7C7Vl7i6GfgVos+eD5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Upw5oa4ZJe9j+1IIqqdV6FCGt5AFEw6+HiC2d4DuDEs=;
 b=kjIiOTqeE7I4DpjhPNbEIbjjsDzHN4AhftveEKLUV7iJfGfjnBxhQMGkEUdisovJKGVpRpwITQknyxQ59ihy/H1R8lbYPtJ/cxY6+lLUZgxwkmpV/1U0bZpTvrsAlnHkQgPI7Kw7tMKMRDKc6th9UVuI9XV+7MajUP1StQeGWNU=
Received: from BN9PR03CA0698.namprd03.prod.outlook.com (2603:10b6:408:ef::13)
 by SA1PR10MB6613.namprd10.prod.outlook.com (2603:10b6:806:2be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 20:34:18 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:ef:cafe::6e) by BN9PR03CA0698.outlook.office365.com
 (2603:10b6:408:ef::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 20:34:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 20:34:17 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 15:34:14 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 15:34:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 15:34:14 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HKYEl83802963;
	Tue, 17 Mar 2026 15:34:14 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 1/2] libsdl2: Add tests package
Date: Tue, 17 Mar 2026 15:34:13 -0500
Message-ID: <20260317203414.43798-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317203414.43798-1-a-christidis@ti.com>
References: <20260317203414.43798-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|SA1PR10MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e867f3e-b492-4408-6437-08de84648f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	vbQgEKNbE2o65c+UqRF8mSrPa1HTttgPHqKXd3U4Xdd2g0aayWDK0pP+9Ta6tP8EoYifrc/+yC3U1t64H3wNFN93EK1/WOQJFdwdJUq0z25XkPlOm/0VpLetPMeb59iUuoxs12gLbqLpfOH1QXZp4qwlFtsrKG3pBjjBl4qF2Zp24r+5v3kmQjDchFatk2LY19RCrTRDR8/yS4J6MwIVAWqrPXWK0b7pWwx4g5xD9xWWPTpuCzZGV/8r+LolSe5S65dGjKWgYHY21eY6w7n7I9jjq4YjpGP54YQI1PTzEywZaIEe6ARR88XGLIbuZylirFM+kS2UedDU3VRgS8evcoMBvRPZkJfoX/U/EUtnO+esCiihG1DNRrTDP2uDf75HW/jdw/2yr4IKjCNvBpvW8zufT5363UthCvnsGZaw/KcjbQ8o+rGg1oEeyI0w4f3gnCf6f7KkLEBNCsKmk6FX/jBoWKcpbzXTB07i734hNLzl89QvNNJvqENvTEbBiswKT6R3cI41hjdM0cO3unOqZmfr0zjiUcixXOs5uNLIpRfUJwXUnueEMDao0iTeIbZU4LJui9g32paLteCQlwIguhRbCyo6a755JuF2GQb8Tqdfj7Vts4l/c5XhYiZBY8BCf4vt/iDVojJN3Ybr0KKnLAmE/kNFsj/edOmLPI5MMyy1UymTe4oQpVm5Lg1kRkjbPC6Pz8nOLKt51CR9cBpv1x7xzxQeqmtCZ8el9Od+G0/luEngFvj4r6A+wmYthwH+lKRc16MFr3zpIV6AL3RU7Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PkJ18jJbdAoBxUSabQrN9+he6Ae3BWASebSn/dBDJiB3nzgipm7s9BQMqL5j/75M0MaRpV5g8FKNLMx4BOlsizOI9PX/oi4dlUrrWq90vZ+BgNbVw2XMOITF1TUE7h6W6CU9gUiK+SCCstMQ1T98bEIvJrPh8UoFpkyPpMlsUCDXPb3YXdo8C/ommifOS3LZeQexMHROkVHKTn7lB4cJHtggcjmwlPv8SHurR0CnYGnNQIXwio8CQYtOVTEi3RldqXLcwZKBaFfl0qdW0HkG9YH6H3MWFWp9gspqI5f92rhrm/eqa4gKirFzbgGRj65pfkrkx8hqbkqeARAQs7G9033KDGDDZ5adCk9PPu6bSYMrlAl9EJ1VnUTmuUY3MgHBIv5SYdHOOd0Va/eFyIvER/z8HPa21Gfi5nIF4G1pQqhY7oPxI255tJ2k9/68XsgH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 20:34:17.0095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e867f3e-b492-4408-6437-08de84648f6f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6613
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 20:34:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17381

From: Antonios Christidis <a-christidis@ti.com>

The software provides tests, configure cmake to build and install them.
Package the tests in -tests package.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v2:
- Use "+=3D" instead of ":append" for EXTRA_OECMAKE

 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 6 ++++++
 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbap=
pend

diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta=
-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
new file mode 100644
index 00000000..e28f42b5
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
@@ -0,0 +1,6 @@
+EXTRA_OECMAKE +=3D "-DSDL_TESTS=3DON \
+                  -DSDL_INSTALL_TESTS=3DON \
+                 "
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


