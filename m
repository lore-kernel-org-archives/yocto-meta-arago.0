Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143DACA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 19:49:46 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5225.1790711379463754312
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Sep 2026 12:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Z2OQdynV;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=aQ/oFp1s;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFsVOt807512
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=yzxht1ayMN85a
	GzqZUQWjQViF/I7S9elS/t+51j2L3g=; b=Z2OQdynVOs9Twq1DLsV4xUZf4n2rq
	0Lg499Q4//FhR12jxKmG2D16n2m9bz8x5zy6ejSQUjXAkuDEfKOi6YuQDrkvL8Ux
	N8VODGIJqgvekQ1qcU5ts73gcA+R/e4vJUNFNO1XZG28ZW9vRM5Tw6+dbLERK7Rk
	Moh0AjCNGdD4HfhwxR9W69uSPqPuQv2EoATYn824sLwtlWoZtw+b1QZQsr1Kbz2z
	iB8NXOFBWOq+7SnK1HIK9Un8L3P+pO9IHiMhYESdfmBoN+Uz39FvczT7PNAgmuIS
	REmhF1djunH3CjPA8r42EIei1JdEu3010BT+pIVYxkSzIRvGbYdJ1QZFw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h02j6eckc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:49:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9r08kxFRNhmu0NflPf4pfOa9El4stszXNWwQ1757jxBxY3wQx1FpzIYjhOtGzU2bYU4C8+OYDX484lQnwHuhw3Y4BAIbdpY2/LeTR8hVXkLQAWAX/mYDiS8L1qrlXPFs0M/tlvn4TxVpa70N9pJR4+TlhPiMs+6FsB/SG96+hJrriO15KimyVGWsqGGhW+MmXcNi4hb6hOKPBv91kcWWz+x6itx1JWXgOozi0E8T6INRpNVMz1GoYtZskXanX5t3A1u+W1CdBgc5/C6un7BK9NbCLXDQYaG6q+KTXpEBLu2LeY400bGyrTBec87YHvvmN4Jk+pOdF3oqAJoEuoNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzxht1ayMN85aGzqZUQWjQViF/I7S9elS/t+51j2L3g=;
 b=j7IGkVNVYUI7wF/gxT2+kj3LiWTJdDCzQnxaCznmsm/al59o/hTjWXszD6j7J3nhZpPrdFwjhwpykHqqA7P4VpfxcngzYmj6WMFClQvZ4kVft8jke15JSs6wQ5c4Hrgsa4qgZIjs6Bf3h5E2b9BIifCpDRrRDmCte0H6tY6wtSsubm4WOxg+FijFXNZ1oa5LD7m9TlmzIvpiP3dJ/iGTY+bgN1HrK9M+F/hu9HYY4DMfYqYDfy4cPd6MLjV138FvmyNPjZ4XFYLY+uO4+nNrBdMx/+nAoBkD/0xPqe4USCqLcehOYQcf6LV9NQ/3Wys/A+WdD442oXg8KqdDp35rJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzxht1ayMN85aGzqZUQWjQViF/I7S9elS/t+51j2L3g=;
 b=aQ/oFp1snPkVFzEu4CiLfRjQGAeRdNo2LjagEYPB4gCSt3Pbv9Dzr7TlgaOGTGU2BdVy9+wLmDJel93H5uX9L2tVuC2Msc8j6Yd5I3eg1kHsrFMF0YBkOESSWvAP0OlM3JcqTgXj6CDKtPTFmqeGGmiBPAIR4pGUUs2HCr6ml40=
Received: from PH8P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::24)
 by SA3PR10MB7044.namprd10.prod.outlook.com (2603:10b6:806:31c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 19:49:35 +0000
Received: from BY1PEPF0002696B.namprd05.prod.outlook.com
 (2603:10b6:510:2db:cafe::3d) by PH8P223CA0019.outlook.office365.com
 (2603:10b6:510:2db::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 19:49:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0002696B.mail.protection.outlook.com (10.167.244.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 19:49:34 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 14:49:08 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 14:49:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 14:49:08 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.75.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TJn87G2575364;
	Tue, 29 Sep 2026 14:49:08 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][master/wrynose][PATCH v6] chromium: restrict force-h264-youtube extension to supported boards
Date: Tue, 29 Sep 2026 14:48:55 -0500
Message-ID: <20260929194855.2797852-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696B:EE_|SA3PR10MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ba6798-7e8d-4664-a5e7-08df1e62c94f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Hh8YfDYv3biGRI8hJXIT0+kAr1uNGkuPYdvt29Eln5XGPJ/4CpdWF783zm43DP2i5xwAoi3Gn/bjjJqS8P1lsxCsKpGkUhIlNdvmD6JhLaZu4h5tibxkuTxZEnoPPLA01/Mo6trIuxF++8YKVM1Ml1rsqEIW6VHYRYBhH3641q+QuWJRvl4JPyq8GPNxPjMVli3FEHSC1hw/sAXW7qqe5O4NVQE6fTZ4LxhAznp00mxs7Z16wrPXP8lIiAb3eblm7nw3KfQ0oycYU//2nfLMMStlNkJeFJU5ESW8Q0pAgo19HRk7+RisHvgPz6WL0JQ7YYfF4iQoAUU8YD9NJv7QFL/MIUxVbf5ZxZt9sm2XbfeTIiY/nFS1+WNlFJvaFo8KAaUspqVsKYBjhIwwh+59uWOPczMVTGx2xhr89SvowtT4HIAXXRjqSFw8BMn0yHWTl7DOxAmadqVGv35qP7MrmCE4QaUJfbo6FmZKnfi/AQNWpuuhb+E5tMbGXUjQnUPG1shOs6eiB+x2xg0nbaqP40vkIiTrHQtxtJ+gD58FmNydjUT5RTrds50WZpMNqqkqnsWp03obeul4b+64Fw1lsDaU5DC2hA9Vh2FPIHXwcQ4jIx9HFmYI433WkeUCefdQGtvz0tB40BxjA+poh/7JWVoQ5ML6xoOODs2YBosv45BgnIYqieUc6gyGapcd/ZHxt+YOUd2KUqt0QnGa7dqQFw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Rc24vdb4LGEWbY6kAXSqmf5VNLoTVdV20UPUTtjTiFyF+bBAhW3gbN/xeyWchQHzZpT5AnsxlsKl+tDqrjYr9inEji0DLUE6xHo59LHjl9KafWYesUy/H+Ga2+O6JHLCpiT3dRcXmkK1d1K6zVnpTN9ViSoWJHzqkvOJ0vMk9qZWdf1mje2T2ZmP09PIYEkc/YkSidgRfyXh4s4rsjoPsx+cIDJtNxG8D/905VBBgwWop5mdNEOhCbTGGGXj31diZ9ia7S2qADWgn96SEBfSrByTzFTmRkclWQDnJ/559nvxQf1qt2Mbgmk+0KdhsYqkG+6+KPibUnxEgO7ijMOjbVapJpRAdk/r4fL8ImRKU88b2VkJRVMtg/1b3uvGaXiRA/HRdr2lqADAIYvsX5oreoh3tII+wbqoGjPFH4pa8v9sshyNgt+UMMHcLgmUzA7m
X-Exchange-RoutingPolicyChecked: 
	3WdXKfu3/aQLQO38YErOl2f/wysbK6+QvKz4qcpKchBWJBfG+D2IpviXUCZ5mEO3FE6uscG0UMEnpVxKw8rk7JRX21gDNjcwq4blfv9j8ikqG3Dn+pzmyw8KORPG5KelpIEmRZF2kZGlIPiZLxGNpc1VWR50L0oAiwDE0x+m0oxvqtuWgeIK6X2lkg9nGqvKHa5d2AI3Od7gXjXeE4Ird4W8OvHwIf6tgjwkelprPaJx6LtKlZy7gv9+mna7ysc5GpcNobBL3xa+PUo14Qw1oXCjntsLF/FZXSEtTj4mmdOUM26G3xpClkakiH6J16Pp+QLFYc+vU05XkSybMh8gww==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:49:34.1692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ba6798-7e8d-4664-a5e7-08df1e62c94f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0002696B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7044
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA3OCBTYWx0ZWRfX6omd8ba+zj7h
 CNm05poZ75Cd/FbTsXedmvY6IvF3oJc95d167HODkyLlCCKChTR23uup11aSGrbllPyopPUWghv
 6WdlhwdG+m43Ke4kMLEL8EeQxgoFv4k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA3OCBTYWx0ZWRfX5fwIGYUKI1mc
 dJarzNXfDoccYfoJK+k6300BHClGRrOA1NIVgGTtczJCb2BUdPDAVfTMLBQtDFAPJVXrCp14jpz
 GlJAurTjj/TDHY7oE7NvwLgD976n6vHQFBhLX+Q8ueZBVT32Ry9/iSel8XNZ0dG1bO0xBncW3ej
 DZ9UqnDJKYL6vMDEMQ2HDgO5D84prPiz9pymAJmN88opsdRCD/mB2GkhsSQmUt59YF/KVfVPqFT
 AiPD2AiK7sDC/BdGWoWGc5nj3Kr4OrW+b3tCPrKfUqEaxZFukK9oPvoyUTwYvG2UVlaaObFcZll
 aZ8CvhrGTzKuPjAKpvefTyLwg8JeHFBhvc1Nwv2x6SdZzEAvMXqzi61zAp8zuB6vQc1djK5TDpb
 XsNmhVaNBo0pa3WI/njYeACN9t6FSDqL/y1aDpddM+amGmib8L6HJtIWmKp4kM/6XJm4PC2Us9b
 zYJwWdvc1PgwnmCkU7g==
X-Authority-Analysis: v=2.4 cv=Z4p5j3RA c=1 sm=1 tr=0 ts=6abc1652 cx=c_pps
 a=4s+CrTYCAhIFSJe2+GBd1A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=ca3eXa3e90v1pi6MnjgA:9
X-Proofpoint-GUID: NcjEwrpDedSGp6Pka44jrpi2wyhkgAOI
X-Proofpoint-ORIG-GUID: NcjEwrpDedSGp6Pka44jrpi2wyhkgAOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290078
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 19:49:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17713

Split force-h264-youtube into its own package, enabled only on boards that
support H264 YouTube hardware accelerated playback.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
v6:
- Shorten commit message title

v5:
- Use generic approach to loading extensions by creating arago subdirectory
  and loading all extensions that live in the subdirectory

v4:
- Add branch and layer to subject line

v3:
- Separate the extension into its own package and install on boards with
  Wave5 firmware
- Enable extension if extension directory exists

v2:
- Shorten commit message title

 .../force_h264.js                             |  0
 .../manifest.json                             |  0
 ...mium-extension-force-h264-youtube_1.0.0.bb | 24 +++++++++++++
 .../chromium/chromium-ozone-wayland-arago.inc | 14 +-------
 ...-Auto-load-arago-extensions-at-runti.patch | 34 +++++++++++++++++++
 5 files changed, 59 insertions(+), 13 deletions(-)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/{chromium/chromium-ozone-wayland/force-h264-youtube => chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube}/force_h264.js (100%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/{chromium/chromium-ozone-wayland/force-h264-youtube => chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube}/manifest.json (100%)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/force_h264.js
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/force_h264.js
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/manifest.json
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/manifest.json
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
new file mode 100644
index 00000000..bdc3d223
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Chromium extension that forces YouTube to use H.264 codec"
+LICENSE = "CLOSED"
+
+python () {
+    if not bb.utils.contains("MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS", "cnm-wave-fw", True, False, d):
+        raise bb.parse.SkipRecipe("cnm-wave-fw not in MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS")
+}
+
+RDEPENDS:${PN} = "chromium-ozone-wayland"
+
+SRC_URI = "file://force_h264.js \
+           file://manifest.json \
+           "
+
+EXTENSION_DIR = "${libdir}/chromium/extensions/arago/force-h264-youtube"
+
+do_install() {
+    install -d ${D}${EXTENSION_DIR}
+    install -m 0644 ${WORKDIR}/force_h264.js \
+                    ${WORKDIR}/manifest.json \
+                    ${D}${EXTENSION_DIR}/
+}
+
+FILES:${PN} = "${EXTENSION_DIR}"
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
index d8eb0204..40b74c18 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
@@ -1,7 +1,5 @@
 PR:append = ".arago0"
 
-EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
-
 FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
 
 PACKAGECONFIG:append = " proprietary-codecs"
@@ -11,15 +9,5 @@ SRC_URI:append = " \
                   file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
                   file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch \
-                  file://force-h264-youtube/force_h264.js \
-                  file://force-h264-youtube/manifest.json \
+                  file://0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch \
                   "
-
-do_install:append() {
-    install -d ${D}${EXTENSION_DIR}
-    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
-                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
-                    ${D}${EXTENSION_DIR}/
-}
-
-FILES:${PN}:append = " ${EXTENSION_DIR}"
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch
new file mode 100644
index 00000000..90323537
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch
@@ -0,0 +1,34 @@
+From 5bcdc4db88d908abdeba11270740864a13bafad1 Mon Sep 17 00:00:00 2001
+From: Thorsten Lannynd <t-lannynd@ti.com>
+Date: Mon, 28 Sep 2026 13:22:56 -0500
+Subject: [PATCH] chromium: wrapper: Auto-load arago extensions at runtime
+
+Upstream-Status: Inappropriate [TI-specific extension directory]
+
+Scan $HERE/extensions/arago/ at runtime and pass any installed
+subdirectories through --load-extension, allowing all TI extensions to be
+enabled by default.
+
+Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
+---
+ chrome/installer/linux/common/wrapper | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/chrome/installer/linux/common/wrapper b/chrome/installer/linux/common/wrapper
+index 3547069c2a..76588abda8 100755
+--- a/chrome/installer/linux/common/wrapper
++++ b/chrome/installer/linux/common/wrapper
+@@ -28,5 +28,11 @@ exec 2> >(exec cat >&2)
+ 
+ CHROME_EXTRA_ARGS=""
+ 
++# Auto-load arago extensions at runtime
++for _ext in "$HERE/extensions/arago"/*/; do
++    [ -d "$_ext" ] && _ext_list="${_ext_list:+$_ext_list,}${_ext%/}"
++done
++[ -n "$_ext_list" ] && CHROME_EXTRA_ARGS="$CHROME_EXTRA_ARGS --load-extension=$_ext_list"
++
+ # Note: exec -a below is a bashism.
+ exec -a "$0" "$HERE/@@PROGNAME@@" ${CHROME_EXTRA_ARGS} "$@"
+-- 
+2.34.1
-- 
2.34.1

