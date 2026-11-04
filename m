Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5196.1793782881463485024
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 01:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=kN4gK4Zb;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=aa8XHGLl;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A48Iw1m3486829
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Nov 2026 03:01:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=232wMpsCvKMSf
	cG5iwbIzFU3AbMBeOu+cz4N/Al9dqA=; b=kN4gK4Zb5ze2iJhJpEbsJ/dqpwqZM
	0uTA7+hQdwiotHWArR4x5IKgAIG9ept0KSDXSBboAYyv89Wtg0T9ZDW6X4A7o+aM
	1JruQ1SkWy9IfjcsXqn/Deg0B9g3ZNmez0MleQWwPHbLCc/3VPRd4Q+Ck7SRyxQd
	tTnhD/fk67deQUReXUun8ucAldN2s0c02hUeji2Yl1IKncpuf5f5clE43Lzqwzc9
	sks7wg6eP0CDXlTrcU87ipD3yUEuQGZ/pFogicd+rF2Tljis/8aOcwi65yJXDT5T
	uMKPpLOgd70gnrLBXYkT5ncmCi6HyT1zMQ145W+E3yNNFUgRCDsPhv2Kg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011031.outbound.protection.outlook.com [52.101.57.31])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hqnf540a4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 04 Nov 2026 03:01:20 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CldAdJuN8xUg1kgA0cf6oSaEB4HzErIRhwOHkIM3T0VUAeNe0FFBILxcWKVSuDTkScCIrHSw0NQB6G6DH7fN3J4uMYUfuco+LQswcspyrmuCQ1Z4xRDkTwukn33X9EBi4quSxQnxa+XS2MvxTH/zXZxJp5e9CiU6WGUdiJAVNCb44XKcKm8BYNUdmdi5TlzD3ApkBMCva2mOouRjVrp0akGttUbMS/kMyOqJNp8ULEFd9oc224T3JPf1Ct6skr0nq2EtxEVV98SHvzxWBbE5xrffUvTim/kKLTdWGI97xLU/Kg+hBVn4bMwW31BW0FzoRx7sgTjdlLCp2mfYC7KqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=232wMpsCvKMSfcG5iwbIzFU3AbMBeOu+cz4N/Al9dqA=;
 b=HfHti3bI+MBdzikRGew0lS7FqbUmTM/kumeA9lyxyhXFNFVv7eyPB3XqDPZywyLxIYOUZVDhu+B4QRCQlmU1onaHE82u0UykUnnJDWcfP8wjEcHibgxVnacIVZBPNjzF6UcC3U/a/mVW6vYZrC/S24JHskZz3NpwaHkgyvJnYWreSh6JZYJzkqkgV6bn9GvRR+IfXpV+lKAca+973y5USvtdWgClw/+7VNtd+ar1dHEBSpeBXxzP3DN6slb19KKpuO2s8tKp1rExSwNDQoPizelFZNzjvXS7pNUZcL5V0A4BGVrqEA8KKYwngDfNctu4o7CbaIcuKlXzNCODOEZJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=232wMpsCvKMSfcG5iwbIzFU3AbMBeOu+cz4N/Al9dqA=;
 b=aa8XHGLl4KY/ZdwRbvmF7aXo/wpu1Kvc+C1M6YSDYCUzy2hE1EQZKRWg9u1tYfdr19yw0SpNQQ+vSS75C2HPK7jd+JwDFb+1s7DK8m4WeYgwAXutvlvX/l105HS08Im1CRNWU8866t/0a3AZkaMxga1CYIVgZg2mHIb0yPLCRtc=
Received: from CH2PR15CA0024.namprd15.prod.outlook.com (2603:10b6:610:51::34)
 by IA3PR10MB8041.namprd10.prod.outlook.com (2603:10b6:208:514::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 09:01:18 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::99) by CH2PR15CA0024.outlook.office365.com
 (2603:10b6:610:51::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 09:01:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 09:01:18 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 03:00:59 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 03:00:59 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 4 Nov 2026 03:00:59 -0600
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A490wEN853806;
	Wed, 4 Nov 2026 03:00:59 -0600
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, <r-sharma3@ti.com>, <devarsht@ti.com>,
        Yogesh Hegde <y-hegde@ti.com>
Subject: [master/wrynose][PATCH] arago-image: remove splash for am62lx and am62px
Date: Wed, 4 Nov 2026 14:30:01 +0530
Message-ID: <20261104090001.2133882-1-y-hegde@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|IA3PR10MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: f8436111-3cd7-4bec-3d61-08df3a523044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|261102123227099003|56012099006|261022115727099003|261009223027099003|261021121427099003|261022075727099003|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: S+1p0n7IVKFhTcP8qHg5Ny2Ybn026FKv7+/YwnHbpP00m66/hooYiNO86bSWHFSbqBSsKlifnchoG3LIZPkxIu2OU+9qjbEtdy+3odqyzQN/IC1rYZNzUi1VJapMZdvP0zjGYrTxGcpgcv46pbiHkFfnLGnwncMBglF4rpTwLtf2o19r7Dmc8mw4FBDJ0VGSTus7ScRzrI/bTLff75d+8ZHW1Y91RCmLBd1m+TwkDrWLcImSj8eqO+PF0lfpHwbXUtnykP6Lh+dt33QUR0IagO0sHJgcTCpgBzvKw4fl4/ZmhX8QbDFgoLpIFsZHeAMVVrSGyYEyl/vGkGcZ/jwSwrGUQDWRlaG1iI3ETPLOLDadtChtB2Pp29R4kbv8PFKXdKpnpvsAhA6pzghzSjKT055AJV1D0ErpV7enGTygpwduMtelMIwkOSE/y1cMVdXO+rcpqSSm3DlodMmWeveEBj5pDrKzVM6lkouALNkXYhIgok6KVAx5rumtMUF7t8456IxvMH0rF6QQn2PNSRC25u+seQWT/xP9EYvCqlIMP/VxEst6XZrhTJucytv7ONCu5UYiN1SsUxQB0GMIFlVJ8Zpn1KLnMZYzVDIB5FmyL/HSu+XpQJQlOQ3y0a9jnFXhfamgB0v5zQyz1K2uGjNJ+g==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(261102123227099003)(56012099006)(261022115727099003)(261009223027099003)(261021121427099003)(261022075727099003)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1Rj+Ou7w9l/GqAj5Uv0p15Q4FZZ7aVa7Y5M+98wdFAxI8C492yZ+W3UUypA+uc3ffChSUW/kS13jOeq6UVtxCfZrYN3Ls4PVXWpj8bnEtPB/+gtf5nWd6PYlrFCuaaTUneSR+GHtDW5TDTAH6Jj1hkC9wbdZ98pJMHDQNEvAN4oKbyRjfILgaX7ThYuT9ObkYsFbHkAhyZwdTUT8fTXGVJZ3avE11nVXglkz2Gb2OFJerLbJbYhAc738OhTExB0d/yVGYpwrwW8TzYVNwsK8Kei1WDFhsZiGnKAt5GJIOLoJ9NAegM3utlqVJSuzLEvlHbqf2QFMYRNLg3vJbxn2vTtzUn0jFAPyDDCRg9HrQvAPGNaiNN0X/FXJnHg3RvcXuw7V2enW4cRAsnPVpS3VYePhWvGCsvNyiNipgKiuxH6sTd/+r5za8gURj8XKdDXc
X-Exchange-RoutingPolicyChecked: zcTLc7foiAdbyjdIuqZpY5aXSF4YjFNzEbqv+D+b3335WHUaJ3CLLaTG0t8AOlKDpd8IK0w/IQ+u5SY1fo0hKkYNUhuMNIESYMTpeJqc035SANwjmAePOlUuMVmveprLjMuzgUqB5jmUqvp9Uqx6DmvZkH7efraBwcAZRhFuATOOcTDKb4ZaLWUt9NMxuHIFolfLd4DDVaKb+I1N86+gZ0sisf6jd+qGq5pHhXldH/NUjgoMlFzmSdhMacaTPCtBfEutoPBIzMd/D7AjCQYec3dBb2izJZUmhUAbFcKABXe0Lj+mT0JVKt22ie7PQrAm2bDn20ngthlm1kr6JbuTMw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:01:18.0189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8436111-3cd7-4bec-3d61-08df3a523044
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8041
X-Proofpoint-GUID: ZEPzDlwJ3MxX84ZVUfMlOhbHnNE5zk-1
X-Authority-Analysis: v=2.4 cv=XcYcX455 c=1 sm=1 tr=0 ts=6aeaf460 cx=c_pps
 a=r1suf/lb2duQPz5POPReZg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=-Xy4pmVmuKh2U0-ST1kA:9
X-Proofpoint-ORIG-GUID: ZEPzDlwJ3MxX84ZVUfMlOhbHnNE5zk-1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfXxlsvgJ6V5RaJ
 IvIAZeMxzXngTumxLtgLACQWt5ULO5Pj9KaJz997rEB6J2KPG88+JhbvvB9TfNxBxk6KjzdO1Tf
 p6rnr/4Q+AhMZbB7YROI6zLLDx/Yfcc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX74i5Xvc7Rp9U
 yd79Q7sQh+iPIq+UmOKL0Ll/dbGkMqQKAkj236tBzBoooDyQsCSWhypPpQB4TjRIioEozKTgY1E
 GlHPY/xHfohs/DcWe5vvs/EPFA3h/isVMe3dtu//llftRqfD4c0F0I0XAZECJ69mBrxv2Cw7dp3
 fIZbeF1Fb7lizUa3g/YaT1kNBlivEcQv3sr+jhEauDH4usfeobpgtgrLond87zDYws+82h0uSlt
 uo5sHVTJEN2g/13/psl0xw0wx/NeXysqeKk00ZwA833wFkBdID1Q1KnPEL+lNwnr+TP7OKW2jaW
 YlQNeoBxSq2xlKLkVZOZQbYsn5EAlNeJjci1GGWxEPZsUo6hdHtJX59SEwONwo+yWZE4VWcsxBf
 l2+3Eoyi3LFifI2pfnSzLuSDtSGsQmT1RnUz9l58lOvpsO4ZxYgwfWVZT9DljjGz4sA5qobqxNO
 gtCJmOgsx0O7mJj+DSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040035
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Wed, 04 Nov 2026 09:01:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17753
Content-Type: text/plain; charset="utf-8"

Psplash causes a linux kernel crash[0] on am62lxx and am62pxx when
u-boot splash screen is enabled due to changes to u-boot[1]. psplash
first latches on to /dev/fb0 (simplefb driver) later when the linux drm
driver comes up it re-creates /dev/fb0 (tidssdrmfb) causing the psplash
to crash.
Patch disables the splash screen to avoid kernel crash.

0: https://gist.github.com/yogeshhegde/3918f6826a1ed56897566c34fd7718d1
1: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2026.01-next&id=02fbd509a868142e04005221a1f4838e7030a0b4
Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index e6739d2c..106ac2d6 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -23,3 +23,7 @@ BAD_RECOMMENDATIONS += " \
 BAD_RECOMMENDATIONS += "${@oe.utils.conditional("INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"
 
 inherit core-image
+
+# Disable the boot splash screen on AM62Lx and AM62Px family devices
+IMAGE_FEATURES:remove:am62lxx = "splash"
+IMAGE_FEATURES:remove:am62pxx = "splash"
-- 
2.34.1

