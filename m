Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126.1792702317468114775
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 13:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=pod/U8M+;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=pqZeR7nK;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHsti71029251;
	Thu, 22 Oct 2026 15:51:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=1Kp25eoYnbe1uNXw89oUdaUKqj2UOGfBMRgOJnv6P
	6M=; b=pod/U8M+u22XuD+2AwiYEna7uWFCPG2OIXDcP8BcxZzjwVYdrB1pNU2Mv
	VxpJemGRb+qd169ZI234w3mjvVrWf8TJ8C4e0Aq2i6HgFvFuXGA/TLJ50c2nTwIV
	3U3+oit8FrdRsA6akH1Ip8I0pDkpKpMBhp+gYGGyOQT+3M9DhRp3uFw9rVr8wMu2
	NG7ABIINmzwaWkLHSwr3Sng3AYUKhx1boyW4COsmu94z0d/pv/c61QGRsKmdOoHU
	hbk9fh5P5MZ8MApoERX/Y8vjG/nUQiFp5wECQWSFckS9vXhWQBDCPqXRiwg8y54x
	XsTgFNWPDtjWSnuC/Xb/m3I29BNpw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hfmg02b2c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 15:51:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1IXLkxoXvy4GJU3RhktCn4x9n6nXE0t+TRt6FQ+eNZEjTHN79aB+5c16HR1i8uB8eN6raT6YneU1WIetjsRmvctQvkeUcLVXehmWPaDaMY4zadTJCUTr4WzItIPJuHKfMYbTeROvBKg0h2OqvuuFRtKnJNcRj22x7xUixJevJ3E3QWCabTqDUMsaf7Xa6mb5vEpOTgs234DxIrNBn8tkgGV0GKxl+TaN886AffVCm0F/XF6V+kaDj6tnpWK5A1XfaZC3czHG8BG9JZX3DhqnzWRf+xlMKYayFq8OpoVLxY4JO8sg+ygbHhApo7Hc1QbMBB234Dn7YUSdu/E8+/FzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Kp25eoYnbe1uNXw89oUdaUKqj2UOGfBMRgOJnv6P6M=;
 b=dfpupyCDdMuKACzMK2fqUpSHQuiPxsqOP+yxETyXayKQn8pMVTxLRPKkXFu/nuBgwD5VsfzTjLQu2OsTtUwL7GTRqhxxhz4hrQa/hCmFXEtnK1YMjiH1m7QZFcpV2RbKRiaCEyuTiiYF+aj2XYLd4KeBwrRhQxdGThM64mf4SSEpm6vyhIo6bIDPGU7agGO4IHrQq2L1akVMl/Il+MXnBZka8FDebmOYPt03hDcdeXYuWqISak9tXWTvU8sv27AByZFk1FJ2ThpGE3zzWMTNMvYyNGJEkSyXYYEiGUMSXDcS0frvfmg47qD+eyvOQ/2yOii4aX6lXkzLVafLAbNhsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Kp25eoYnbe1uNXw89oUdaUKqj2UOGfBMRgOJnv6P6M=;
 b=pqZeR7nKgDcPVto7PJbeCIN5jMbyqU+l+MfDsoO5BNjvJVp1xgp2gI+O/WTKuEF5oPQYyItJLAFVIYS+RkN+XBpTGvy72LeR0Z0l09QweNh1O0NewzbbY/FjmAkrzKngj2SnfFheFI1PWu5FO1CR3QP/Ka04biYV74fdOcPj9M4=
Received: from SJ0PR05CA0093.namprd05.prod.outlook.com (2603:10b6:a03:334::8)
 by BN0PR10MB4902.namprd10.prod.outlook.com (2603:10b6:408:12a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Thu, 22 Oct
 2026 20:51:45 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::88) by SJ0PR05CA0093.outlook.office365.com
 (2603:10b6:a03:334::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 20:51:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 20:51:43 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 15:51:10 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 15:51:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 15:51:10 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69MKpA5p2076765;
	Thu, 22 Oct 2026 15:51:10 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xJzkk-0000000FVnY-0ks7;
	Thu, 22 Oct 2026 15:51:10 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] tisdk-bundle: Remove unneeded ; from *_COMMAND variables
Date: Thu, 22 Oct 2026 15:51:10 -0500
Message-ID: <20261022205110.3697140-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022205110.3697140-1-reatmon@ti.com>
References: <20261022205110.3697140-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|BN0PR10MB4902:EE_
X-MS-Office365-Filtering-Correlation-Id: c85b8160-b8b1-46bf-8258-08df307e47f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|261021121427099003|10067099003|3023799007|56012099006|261021123027099003|261022075727099003|22082099003|261009223027099003|18002099003|13003099007|261022115727099002;
X-Microsoft-Antispam-Message-Info: fKo9v6X8hMyhU5rPlWkCoyZbkLWPwmLylwdaRdf/8xVd5YcA/l7enZqDZG9xJOw4hRLLqL5KmrLivbUBIvGhj/il4PxS39I3LzOaSYKinVGTMmjetrPXJarq1bdoNyE3lGT8YIGWQEZRur76JkPvbFgQi3GRxmuCsN7CdN7Zv2e52VbKWJmtzjXWpJfZ/wWeKO/04vualdXHVFzBquAmjxbHT3SxRb5VADX/03sGskkuf7SIzEfC6P1Vb1zLfbVbReHfLt3EF3xMwJKKnD9ZB4moRTfDbUD0YvNVet/Q+a4Cgg7ya2QOaUEZwIP6TsXd0uwmluT/fE7ljJ84mfRbSWCM+4G2gOv1937XjKVjkBxpIwrHHurtjQw2fqqejzuIlsmFiMAxo/7e+Nsw+NZQwi9CvQs2/GoFiuESRozFKIlPsPXzXHv+XduyvVRS4wLZq2JTAuUzjsCBsprmCfgjDPmOeyeIBxgW5LAGtubxT+jbRLh2BNaTWVwEJ7If7b5/1fOaCbVKJbdzj1U7PSWOdTKkDeg+O+GGoY2VEKVWZN5yeb1bP30uHxLUWS/ql7VxXnxuOE1XkMC7RWNUn+nRTqTnYDy2l6B8TknsjHbOZQIeSAUiA6AkSSnrAEnuxE2Iqz1lyMFFbdihPUGqTAQrFCGrKwdD5aLHUg0ZMSLowKQ=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(261021121427099003)(10067099003)(3023799007)(56012099006)(261021123027099003)(261022075727099003)(22082099003)(261009223027099003)(18002099003)(13003099007)(261022115727099002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZXtD/E14G9nTqy7t2k5KUEs+fJ4EKNIEVZ7fzJZfIA/6YgzZG6DHj3WMS1jfn5n6GoQEiVft9NmYJfZvMHXetuzyJx5bk7P2j6fF4/i45moY3Icxi+dF2ruOPope6kVyxOcU5IRWjTuNI+56/XUTZuWocWKh0yh1BLQ+qN+jFPI46pfGVy7yKPlX9lgrl/uESBEhtfog7K/gFTW34KuyylkgU9SVLtNIOhrDHU7ta4uyUmlQpVvixEFWQVvhLQOjzdBQV+MZz/cbRMY8I4Z+344xg89r4caR6n4R1VvOS4ImPXYQo6G9xNCJcSxOOqNpuzptBw1gY47pmna2q0oLOdBd7S9q5kuGXEC535Y5zDdgd7Q5DOJSbwy5BwpY+Lzup2oD1hvV7HCnrmtq2QqQUDjv7a7DJSLW9ltANL2m26a3I3RaerF8H10trasSHBWd
X-Exchange-RoutingPolicyChecked: bHx+PFTZKOjh0sCsMJcGjFL0ZJmDKxswY+EPXJZZFzAGErwDBKc3Ljul6d6aNRFjHapbPd+BM3p3XcQ33/a2Bs2/hpVvVukZL7w1VSoS09xVDajJK8hQqyh9zh9RzkPT+64sJP5bnFAVwPP7MGqWFTjd9xWSTx7Y4vLaYcDIrULESUDJjNMK1bQs8ORTtE8lDDPcB0pJyt1ZLCchx8+X9BXdG30w5L1d50CXueK0aCUzEn4BhsgkC3rJgNW+Jyt4nRTv5bqnTyIUnjM4WudMFqih1+74+WL/RIxvOYmijkGv6Af+yR/hK07JY2aH4vVC/alBxyWQDgZSMaTMmdB8TA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:51:43.9597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c85b8160-b8b1-46bf-8258-08df307e47f1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4902
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4MiBTYWx0ZWRfXzY3fZBy/pROw
 oa7gjRE9xoK5XLJJTOyaAOhJvjWB7ya+5MMJT+Ph5UiPUuhcAaAxLke6ji4lFGW42tYx/Re/Jlm
 +BzS0K0Q88Mgz+Huzg2eWPTB5xCxniCHWPavlAR+iAfH/CG9Wgyp1xIhiHQD2bjhZh65Kzy8gaT
 gXc3MhXNs38gIyxuJPWL6/0nG+zmx5iDhGa7sjlZtenSVTU5WeGdpqc2OUGawaC0Wl0md8hmPjI
 Cq4bEI1KUIgrs5sFvM58jXrCUyWHqVMZBOuWco1z1XuL7F5N90GsUUX8xG40OdwUwoXBaYRxnvL
 3OIJbsFbZCCfWKtLSyK4QYJ5SaPGuQOaHSrinxU4cWMQ4KqGgOECaF/V+wgDMHKTHUUN63/wa+e
 KDN9noP8TK9cUOABzW5wW6ZGSwwK7LsIY4qX+IbUibLPZ1mQx+LLu1mLQ1KFQHyDeIDVz1Gzw/K
 0Y449se8iWkh05zjL+w==
X-Authority-Analysis: v=2.4 cv=QIL91QLL c=1 sm=1 tr=0 ts=6ada776b cx=c_pps
 a=BToDjy1G2hQwEUS1Uhc31g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=MpwPInoirbCLXGR-ApsA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: lJUv09B4h5xBpKhyM8U1uEgiLvZgQ8St
X-Proofpoint-GUID: lJUv09B4h5xBpKhyM8U1uEgiLvZgQ8St
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4MiBTYWx0ZWRfX7KW+r75CC7qx
 UBaM8Nhrl1bnNBTNknYgDAOMYHShehAC0lgLqr5dtEIpdEonABJjKeEAq6cfPaZ9kPsHQ9LMUt6
 smQKVJ6Nai4krNJehINoUv+BZINYvqQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220082
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 22 Oct 2026 20:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17750
Content-Type: text/plain; charset="utf-8"

Two changes in oe-core [1] and [2] made the ; no longer needed and then
added a warning if a ; is still seen in the variable.  Remove the ;.

[1] https://git.openembedded.org/openembedded-core/commit/?id=c3365dfd9ddd7fbe70b62e0f11166e57a8ca6f73
[2] https://git.openembedded.org/openembedded-core/commit/?id=581816d6ce0a27608f7444b97aa8b52596d25d37

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index 28df766a..0d18f846 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -91,7 +91,7 @@ do_rootfs[mcdepends] += "${@string_set('%s:do_populate_sdk' % pn for pn in (d.ge
 
 # Call the cleanup_host_packages to remove packages that should be removed from
 # the host for various reasons.  This may include licensing issues as well.
-OPKG_POSTPROCESS_COMMANDS = "cleanup_host_packages; "
+OPKG_POSTPROCESS_COMMANDS = "cleanup_host_packages "
 
 # List of packages to remove from the SDK host package set
 HOST_CLEANUP_PACKAGES ?= ""
@@ -105,9 +105,9 @@ cleanup_host_packages() {
     fi
 }
 
-ROOTFS_PREPROCESS_COMMAND += "tisdk_image_setup; "
-ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build; add_emptty_inittab; "
-IMAGE_PREPROCESS_COMMAND:append = "tisdk_image_cleanup; "
+ROOTFS_PREPROCESS_COMMAND += "tisdk_image_setup "
+ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build add_emptty_inittab "
+IMAGE_PREPROCESS_COMMAND:append = "tisdk_image_cleanup "
 
 # Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs functionality
 # to install a given list of packages using opkg.
-- 
2.43.0

