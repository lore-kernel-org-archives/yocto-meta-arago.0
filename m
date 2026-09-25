Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFE5C9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 21:02:59 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7988.1790370178549339929
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 25 Sep 2026 14:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BSEyTRlW;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=wSSxjbXX;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PIosD73281753;
	Fri, 25 Sep 2026 16:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=laUYouZQuVdBN
	1hIMiaiMRXX0HWxLU+Gr5jpVe/5QQA=; b=BSEyTRlW9UYwf2eDUhPs/mE3rWQ57
	eZb43tgSoSskTDxmX404J+y0/fCOQaSNZ7KOp/KWGGuIbRZioJ7alMdfIS+Fo0A6
	C0CWYUZZ74B23XSQmmF7UzIFrGShgy67EdASrRSRhILNfJAsr35wbxeSW17WfV94
	q2RLy1KzZ76/N8Tm9Ec/22Fg6dbci3KUG4SJsRjI8kdNoRKRSYI5Oi2F5PSVQaAm
	6S1JTKsMbGsNvQvwWDXiK1FfK3j7Id2+M8Wv3bYk/XblyDsG7hzTTE9uaT2ICM2x
	7EcrKQHBx04E5WpyuqK+3z0C0xTVfMVhq2PxPcMtFQBXPFMeyvHvLOUHQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012019.outbound.protection.outlook.com [40.107.209.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gwkhrchsc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 16:02:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJ2LdO6kEOoPFmOO+1HNpclKDIygXHljVn+jzfgy44D8vvKsKI/O7VQBCpLb5xMDAhC0jeOeN+POQNTFKqN2NecIXQdlx/6JWm8EvD9Y5MrTmK5rH3T4vKsg8E4b159hcCDy8tQOP1+/lcr3YFEh1L0KV9cYD/iXzdguPD3ycSXXE42MKekzZfOVhfWVmoxt4qARuVDwOcCUO14saDf+Q7fSoHPQeE4KCXzxZsVRLYQMniHgyDSykqjehd5MHEw+YrSe/pQucIEJyXQiFlw6c/6nUPXf7b1hfSfE+3ac+YB1jonHRXLPF9hPBBKCkRSWEX6DvMp8qerOpmpwTDAYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laUYouZQuVdBN1hIMiaiMRXX0HWxLU+Gr5jpVe/5QQA=;
 b=b3qsUkj0HPYZTYDV3yM277ny2LICy8PeO5QdaAHm68GVXC9tL+g8C98sddeoC6X9RFM1p2hosB2eGQTa0QvM6uDb+U8QGNlq49hsddvUAT6sNaGMUlgy2alNeb6pLsDe5Y0y+nn3eVwwfAVCu4s1GkIlbfl1Y9Xn6dgBhq8uaFeZjHeb68zGa0H0/FGC9swH9Y3jhE/cqLK99ixZYnB4gySf/F4CgSVlHuUcs+gjIfSlmSFNBtSDam4qTF0wpETtrGWV9RSRtS0jHkGpvHd+LZ/44lYApwuWoA8ZGmlkcXT7KtEQlOM7PDCKL208nOFH0iy1o/WdvQDYPJ5/JezbrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laUYouZQuVdBN1hIMiaiMRXX0HWxLU+Gr5jpVe/5QQA=;
 b=wSSxjbXXfBWgmXW8MDKsfzhl/QZ92dr0boxu6mnDJXSMf75Qa7KmZgpgN/xCqE/ZZgmqTN8Nkf5uvWb4dCvmkApJiwxFLcDAC49i5C7iEEkzFiKBhQYPUXiI6xkn21IYBQjZd5C4GgyimRKjJXq6bFYdU/9RBlpl5hN0ADTlorE=
Received: from CH2PR07CA0060.namprd07.prod.outlook.com (2603:10b6:610:5b::34)
 by CHAPR10MB997723.namprd10.prod.outlook.com (2603:10b6:610:2f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Fri, 25 Sep
 2026 21:02:51 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::6d) by CH2PR07CA0060.outlook.office365.com
 (2603:10b6:610:5b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 21:02:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 21:02:50 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 16:02:25 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 16:02:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 16:02:25 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PL2Phf2539180;
	Fri, 25 Sep 2026 16:02:25 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xAD3p-000000093cp-1fuG;
	Fri, 25 Sep 2026 16:02:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ti-world: Clean up chromium inclusion
Date: Fri, 25 Sep 2026 16:02:25 -0500
Message-ID: <20260925210225.2158880-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|CHAPR10MB997723:EE_
X-MS-Office365-Filtering-Correlation-Id: dc0e3bb8-b18e-404a-962c-08df1b485c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|6133799003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	6p6rQcV7N4YNmcflJPDhh+rfzIlWzaY7WyBDhvZB/3J6VpJX+GDOh2ApLZxGxqvP/qMeisvriJV0svmUz4wrJMQznHEW0WPVvBMf5cvhG/4LaZuGVCOrST0HRE8zlXDk4iofHT/e/f1odlEHE0tofMvzGfEBmxKNlLUyr28QqIc8V2LrSyG0XkOWOmht1iTThYn/JIQNqTU4mbRAxRfKvdbHGBCZdQO9CC3jIoiA+MQfm5FRRtgut27F+zfgLxsfQPE9ICOZgl/8CSbgWixmmvKISFN2+zrPjT+e9UQlp5Jta5ys4PevLBzu5FZ+vmAekAfeFCMp/MkuXh31gYgaC4HoSOzhDj29OwavrugQA56hBbKr4oVnRMGODkzPcPYi8nZxvG4NevD9FfbJ+QkY+TDx3u2DOoo+aXUbvHQWIqLwf6hvqM4IJ7QMVXsHN612PmiZptS1laNZ4epE2N4OldoJ0+VASluXHlW4sq5yXgWQRRyOKkCy60sQLDMwLclZH4pGI7GzdJns0qw2TRWOHL/UVnWMriTPjRVHNI88Nyul8UxjjKWBWVMWzqKq5AgZxj1aWrKRz09DzqD6rm3h6rbxR5f9tf7siWWlPqBnNCm0o4vZshqUXl42+XXwHL5hGr+mAfBHdvkTKCZDSWpI/mPIczO6rJn76HP6JhBovgTND3ZlQvCt+7kQ8vAhoJfPuST0RJV1dfc9vJbHZO77bQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(6133799003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m+YPImtbSxWeCkF8zBg85xsjmMvdmUKMi3zKolw6DOLAWwD45q24UBcF9X4Up983DLiPo8gq6/r69RQ4dRsrK6Wox5/M5orh9MUcNMLdEjwRSEd0MtJNYskZ1Hy7d9Iru9C7s/9OArSq3DlLq9qUqHUJq63KZDY998gCu8r28AsZgNMIleIL6s/I7iKn3VO42DHMFabdcnZLOf9EmBhJ8/RsNSjjznXctY2f50KeM+WQvXqg9q2EsoJ8qecQizLPFGwi89gBxAq2DK/PtvdAe5iSlAzETkq3flr4Vx7b/HdbXr6J92/RMktaZJQ3jfaAHDKpXJm0OMVK4/4698auSsmibxCHhawrjgkUNwuZ8/yVX/lb4A82heTe5W78DTWt8eIc13HfgNxQ08D53QKEWNVpJSpma56IH7rKA2qGK33H4vFx0h9dJIMywHQqR004
X-Exchange-RoutingPolicyChecked: 
	tefI9cbAyTtOvFZJLKeq1XZW0XtdO8lQHIBN6aA7xJpjcAxxo5PXK9QMqntar05bSELzx4OmZFFUt4IVKwDGe3VOuAAjhn39zNQyjYi6G53Rke0Ji91KsErTlDmn11ZRYGKO4CR2o8BF5UNG6Hrq5T9YiFB3JLfZvneTP7FF/5skf5DQ0jozPlIYyeDpzb9uIVtmbkzT6VPqyHcnKIGnd6j9oyVFyHGrxm1waBSmXilQKMmmJnZR/bp0EstASLtBGHo5OWuK8ZzbGGEDYjxOS94HhHRCieh7Tbz9tOKuK/m8JvsCMZNEop8wlf0UcUvgoAn7bttT8ehXs/VLIVIyrw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 21:02:50.9392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0e3bb8-b18e-404a-962c-08df1b485c55
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR10MB997723
X-Authority-Analysis: v=2.4 cv=Fv+QbGrq c=1 sm=1 tr=0 ts=6ab6e180 cx=c_pps
 a=fNyNANDL+C7JeK/y+7sGAg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=3L0Tk6syt0TZnHxmTwAA:9
X-Proofpoint-GUID: kNKZ7lRd9jR-ruT7cCejjNWg5NdawWqT
X-Proofpoint-ORIG-GUID: kNKZ7lRd9jR-ruT7cCejjNWg5NdawWqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4MyBTYWx0ZWRfX+Yj04paklsB5
 kekRWMJLFiAdOVPGNFss+wnVKb04XnO6sEtPhMzc9PY1XC0LOj4/qxDhTIGlUj35R5DlrC3QJPI
 4hNX0N1lcyqMB3JhjNv5wVOgJ9sj5zzrBwIqLxY+SG8LPPD/j0V0mj21bJgwVFTyeg7z8bf/aX3
 7sGb1AauXuQalLaX9wzF8cBJLjIDNBLAFksPXJW7vevGoWYVzvAGHAW7ck2pDeGwQjJGLsmjv8z
 RJt0D5Fhl7QjWts9I8bwwCAlwrtMDWQC4/0OWZlgTAHspvBk6e2VXhoZW0H58yCkp78PbJ/larK
 z4044WfMrg4SY1vuuNCX8p+Xk18+E5xmaHNLGkeNCIyRREa5zwNRgn46E3g+qtHQsc/DvQrGAxw
 +K0cljUUGqNG8lop2/iUzZgWdRJPoP+jeL/e/1K7whunfINusb5366uHn7OS0f9UqE/yJ57Z5vg
 9kyxcXmWbqt244N3/fQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4MyBTYWx0ZWRfX9USwrZnYT/WS
 CC98nOdVUXwWc45FGySEwJ9N1qVM+IwDWJMs2mxoXepsqJitmkFDOtRcGhGzCx0pGt2WLCA+DCF
 ywiH0slHOS25eO2QzY7ST4b8FSS04kI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250083
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 25 Sep 2026 21:02:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17708

It looks we had some multi-level inclusion of chromium in ti-world if
meta-browser and meta-python2 were both included in the build.
meta-python2 was removed as supported quite a while back so let's clean
up the logic and variable names to just check if meta-browser is in the
build.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/ti-world.bb         | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 6b6315ed..2cdb364a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -7,17 +7,7 @@ inherit packagegroup
 
 INSANE_SKIP:${PN} += "dev-deps"
 
-CHROMIUM = ""
-CHROMIUM:append:am57xx = "\
-    chromium-ozone-wayland \
-"
-CHROMIUM:append:k3 = "\
-    chromium-ozone-wayland \
-"
-
-PYTHON2APPS = " \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS","browser-layer",bb.utils.contains('DISTRO_FEATURES','wayland',"${CHROMIUM}",'',d),'',d)} \
-"
+CHROMIUM_TOOLS = "chromium-ozone-wayland"
 
 DEVTOOLS = " \
     linux-libc-headers-dev \
@@ -39,7 +29,7 @@ RDEPENDS:${PN} = "\
     packagegroup-arago-addons \
     packagegroup-arago-addons-extra \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago-base-server-extra',d)} \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS","browser-layer",bb.utils.contains('DISTRO_FEATURES','wayland',"${CHROMIUM_TOOLS}",'',d),'',d)} \
     ${DEVTOOLS} \
     packagegroup-arago-misc \
     ${PREFERRED_PROVIDER_virtual/docker} \
-- 
2.43.0


