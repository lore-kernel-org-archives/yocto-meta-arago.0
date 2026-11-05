Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28456.1793860112298381598
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 22:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=J8YHSTKG;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=RGlzkThh;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56I0bN4018080
	for <meta-arago@lists.yoctoproject.org>; Thu, 5 Nov 2026 00:28:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=dhdYUbd9fZr06
	Y/17aqzjVvoTUILwiCOnJysuMcnAqk=; b=J8YHSTKGGN8/lhE8Z2RqaBrfcLeOE
	WQkQnr2Vv1wR2pgREZJiyHasEnrP8jbZeQZxVOucFeBHNbtmcXbU8jBYuDhPmxRw
	Eq4zM+pkKIfGFORuFbcRQtGG55+YWUsWngry/ijUlw9kV0dseKO1iE34T19Nz/MS
	bFRIMXTlO8RqZjz+ujYoK+Q9VQplGrkSmyc5Vg8dCneEbkCF7pWkuJX4CNwogdt5
	dUDaQ9tWk87BbR2JyVM2y4zwEd811D0/5jYar4ObCcgwrueG5K4Ymyn9W6z/EGJ/
	GyQy30PQV+Efw9aQEOBJ8qIc0DLpBqS6oHUf9pBQTRjx5NtX5J8O3EziA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010016.outbound.protection.outlook.com [52.101.201.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hrgp4hewm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 00:28:30 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uROI0FGeUS9t5g/V3kCvd8Y4jYLzB4B8tkW7TnhGovN1U7OxQ3cL41MvErDsjlfwL8JpVyCIKu/dFT3G6GLz+PLXxf14Bg2i5sT6D5Ep6Ej3Z5OpjLpEtZu0Aicsj7Oc4bYmotaSPaT6mykJxAuqdPHUEniK5yPaaCLa3cXbGh7JjQalRXBwdERVeRRQu/BqvgIbwbOzlru9d1JXF42V4UgloJEuP7RUcTYpVb2LU+x5wEvfdMfmNWsNyTKdkTMiLJdLdLXHhiARwhOxQKbellDoTz+f7MoPQJWCVOgh6rwH4Ed5xfMOAm6qYAUNueBr+VkSecr0AqwLAfP+Jl2Z3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhdYUbd9fZr06Y/17aqzjVvoTUILwiCOnJysuMcnAqk=;
 b=MGuCiJM/JUXEzmNuz/FEesNk5FSz10cwLbaX4z0Q/lA9OAGd1+68+9+7gVQhbLenEm2Cy6WC7qP1TK29Pzk5eFUdUUQHClUUfUickPluF6H+S6lhtO+RCrTtTwZODwGFctLSYbTvv4sDj3/3InlF4aRYt3l+nVKuTjkEwtRuzfm89yU+XbbdQwqEkjZ3qGqI8yutPQPrYL9oQ6nemSajAUCj8j1/W/mOnc0RrwdrSNRdESLQIuazWELmBEzY9v73JY92s537k/YT/0GyN8FAEB+17QMl37n7pXHm7X6WyPlXGkidU1+31CBJsIFRS28mxjEcCx6Hg8B2cPu0S83BvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhdYUbd9fZr06Y/17aqzjVvoTUILwiCOnJysuMcnAqk=;
 b=RGlzkThh7V54CQCWxJMTwVwNtnxWIy65M31nIkcB/y560YcMVAgXIqkiRciKuzaXYk+kNij092etCZFyiSFSIKAO6M9Ozf2gfAaGN/el3zSQ9LC1Cugf+bi70RLusSJADWGI1n8f0H69ShUzX8YW6klnMXAkxloC34G7QDwYKO4=
Received: from BN0PR08CA0026.namprd08.prod.outlook.com (2603:10b6:408:142::28)
 by CH4PR10MB8100.namprd10.prod.outlook.com (2603:10b6:610:23b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 06:28:26 +0000
Received: from BN3PEPF00022BBB.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::63) by BN0PR08CA0026.outlook.office365.com
 (2603:10b6:408:142::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 06:28:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF00022BBB.mail.protection.outlook.com (10.167.248.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 06:28:25 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 00:28:16 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 00:28:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 00:28:16 -0600
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A56SFHH3731569;
	Thu, 5 Nov 2026 00:28:15 -0600
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, <r-sharma3@ti.com>, <devarsht@ti.com>,
        Yogesh Hegde <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v2] arago-image: remove splash for am62lx and am62px
Date: Thu, 5 Nov 2026 11:57:38 +0530
Message-ID: <20261105062738.2899847-1-y-hegde@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBB:EE_|CH4PR10MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b463d0c-91be-41ff-da8b-08df3b05ff9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|10067099003|13003099007|56012099006|261022115727099003|261009223027099003|261022075727099003|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: ARkw8OZ/Ua6n1GamYG6sel6NQVv+RrKpYFryJcZvOkMlJ2lTSZlEJA3Qh0GmnGq+benqm0/RppeyW13/y/9YDFntacUA+X2oUvQxTUh/HOAYkdANa46P7Kg9SCkJu87iSMB0WKn98a3911iazAkgnmmQZut67GRcDfDegl6UrGeq+BAy4D0FxDiNFr/oAb8jExp+QXvHSc1fL4E1aJfsvhdjYT64vFD9sbZfO5JDy1wEYnSnZi18e92N7+Dh3MIdNhrGOgSStrsGUMls7ufUrOIjHgke4zfm+v0aBwzsNsdcjiVkIaki75qn1SN+JK1zvHGjysBDFrT2Jo+IFDN/fjbsarUigSEHlP09KOV4zofnPa88Whb4Ml7tNzarLiXkJ9xuqHFTVLcJyTZNx3hV9lhOWWWVLMYX8Afh1qD1rlLxTu0K1w4VYlxvap28W1e5chvzkfeixRAUo0Zm1/pumUY8CYa+uXK0iFLNx5e/HgGiOSa31REOi+Ah71ZrhdowKQVfYDFQPwz2PxN65GaABPAsh0jsDZloUXChJr25mUAS+mMYzUOavIQ7ISgwdoJ2f15xH/qr0v8INsumWXyKgjiyaIca3KLHj7A5b4KkZEY9ErUR8C422ivb6i/ReNOfl4YajEpFJ2nlBQ0aGmFxbg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(10067099003)(13003099007)(56012099006)(261022115727099003)(261009223027099003)(261022075727099003)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FegEFM9dT+cGyXIC0dwp+RUzClemZ6rZBDIr4yaxVz0B7n7zjApsLSU5KtCcGl7dLHpXAcN/lENUOgHoRLVgXKAX3N7G/cPx8rWtRYhHQXGFnKkTQzXOJj1OxQW3GU/0bTFaYPqjD1DOATIo6LU4PsNmpJins0FbADocEJ9rD9XZVD7JpMO9ONFWvjUWEmFxVNWvUxh8qtv+CN9z9n5MIezZ6QVZ/3M4qqQVyxcSHwG86xIqvclCQfGv3vDA4BwkrOtbrizPUxrmfjrfbTGgzU4IbgOCpv1irXQ1m/e9UhlNPsArnnOZ/h5iWzph2nAYnTJVR1y4q0SK9G6mcKO0aKWw2e/TztR913pxg6T8ElfJR+P5kfMMvasJB+nWhbTWT16475mnt+7sZOtw3rip63AfBXtCQgJqZ6VWS44n0S1CVuX+qeR0wOfmOBNbMtjD
X-Exchange-RoutingPolicyChecked: w/So5TjGKHtkG2Ef1NyPd5KcGLN7MP/dQ0FcdijUAy9jPl0C90FtjEQmgX3hTUJvR286fcS9I8g3HIL36RIERanVZ5IEsVajDijaqG7yguJ+lniNIoXknb+0R+F/GVjrNPmsOP/5LsJYi4NkkPPAWWAMQPX2HIcG0M0JhdvQ+IYrQRfES0XTIFdUUSWsdLYz7niC3ddbvzV72DfuvK3mHE0yXVBc0LU+ltrklvPqhDfRynoNbp63Qw6TFmQfkWRpa8yAXmObazrHhlsHVHXp4qRZoEfdO91GyNePEh3bC1EIXNikLkbb5xMkQ4rbSIKYWpEYmjtuT2v5un4uJAzDkA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 06:28:25.8148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b463d0c-91be-41ff-da8b-08df3b05ff9e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8100
X-Proofpoint-ORIG-GUID: _9kifgMzkb2UKaGG6mjtKmO_Erx-9pqH
X-Proofpoint-GUID: _9kifgMzkb2UKaGG6mjtKmO_Erx-9pqH
X-Authority-Analysis: v=2.4 cv=AeskjHXG c=1 sm=1 tr=0 ts=6aec220e cx=c_pps
 a=3r3V3iWCG03xnAr+XYP7tA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=-Xy4pmVmuKh2U0-ST1kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyNSBTYWx0ZWRfXy1cQBDDaKSs7
 LxsjywUZpUmYhr9C1EJmajIPj6sHhiCKiBUe2O9YsG2PnvtOS0QDHerzjJNvlopncHZg5a5REEt
 47OnM2kEFSn3H8Q40gpGq0eqkMBe969oHtrO/d9Xkx3k98hIk7GRSXblBOrNQU4xIenRU38Ihby
 KjNtVYNlUHInk7L2fXqWf1F6l9WXDODBP0lpB3iJ55LC8ZmcR97wug6ddsoL/vGXHQyrHYt0pfr
 HUVrLIKY2Qg+zs4wkD919UWXlZXJZ9QcjmTcU8QaDLV5H+9xhjU5ADPNCJjbvmVYuQXnK6sdgSJ
 pkSC+IWSeM4H4MgLd/xCAPWFwrCfb8+n2iFVpCnN/PlqWtUnb+hwMYFErW3HgB3EBLLqIT4SZQX
 5BFZgK5ixfID+mVC7UNwvzO9kKHw6UkivGzwFIFsa3nhzvVKdJnEUoTPjAVvjxt6go2WVrLyRRM
 WvGVxzant5K+k8QB0CQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyNSBTYWx0ZWRfX8Un0W4Ry81oK
 OONBupLVXrMEdQfrvrJyVhjDq/jwccVMV+VPbIJ1LQIUmrVkc0ipb+WOUw0X21ZpT/0XMiCOzWF
 U5M76deKGS5urXrdmEV9KSFRN2PGXRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050025
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 06:28:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17759
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
 meta-arago-distro/recipes-core/images/arago-image.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index e6739d2c..391cacda 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -23,3 +23,8 @@ BAD_RECOMMENDATIONS += " \
 BAD_RECOMMENDATIONS += "${@oe.utils.conditional("INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"
 
 inherit core-image
+
+# Disable the boot splash screen on AM62x, AM62Lx and AM62Px family devices
+IMAGE_FEATURES:remove:am62lxx = "splash"
+IMAGE_FEATURES:remove:am62pxx = "splash"
+IMAGE_FEATURES:remove:am62xx = "splash"
-- 
2.34.1

