Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5213.1793909199401008986
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 12:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=TFium8Gk;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=fn1D7afJ;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A5HglKi3092954;
	Thu, 5 Nov 2026 14:06:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=06ENTg1KVmz15
	Xl+3ZvllIeUBrZd8vgqiltw4uQisN0=; b=TFium8GkqsB9X9huMwxVFrUrOH/jB
	IlvLS9T3j0N9djyIjUHgx8Cy67IljWvSRrXOwoO4kfMbR6V8Y3ds2bHK40oFNR/E
	kLeiNfOmZth5RknIkcIJMLDqdxItwGHLvTsRSeMJzDNDVVwHjQcUU+hfyJNV63yP
	B3sxxaBLgcrXb8FEEt/jhii9OoQOtBNPUhxah9cY62IVu0ShWRLeQvKmS+b5n+LH
	L5IWRiJRodrgxyVxUfV+GVc40DoFncResbCMYKHVzlRr/JWebXSbFelNpWicMrJZ
	9vW4K2B1TTwnpannq5jtilSgC+ZqxDBBLp/KjdQrwcF/cMT7zaU3iygMg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hrgp9pdyn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 14:06:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqZH2YRyg3W2kZSsdrDkAPDTEylmnv7OdMyhY97vFPds8H60yJfI+9wAFpDWDszWEaRJaDRoLPeIvCWHjaypV2yW4stZ10E4jdHC0D7IOQXFBNB/WqJ3s+Uqw78AzouigM6u2IZnVTziEPzGW289hfUAwq8Ad+MC9QvzigtB3BA93XC5VWOGkKdZcA/3hvajsuXs2zIS20ImX1geHMBIo89JxN1G1TGR5GGy99yTyLkXvIvwmHMejfY6E5lrx4MxHc7UlVQ6XAD4W2dEefCUnDeZMZXUF1v1dSmBtRTHvz2sYudRmNMKZDT3N1hRK8Yo9VxK0itvcJJIdlMpePCXDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06ENTg1KVmz15Xl+3ZvllIeUBrZd8vgqiltw4uQisN0=;
 b=ipc291dzKuP37IwRMUj01Cd3VKKX5D2+YRYLSC1sk8/y/cAnIxzhCnZDE0ET/fjQI5Td3ec91GUWciLOrtX2GPw6HWBJAQUOX9iN1mX/gS5Sn6ep38K2tniot0WPFYDu1JLUP916RMFI/C3Qez4qdLqMRU1nlS5/H9suAiGBI/39/O8v/Ca4kZdnVfnbgYCYmRd0rQdKB90wclXL6nc6XUtn0K4eZ9jYdomBURN6Rbbk4ObyO34z2HP9JnsZT2lb5Elzw1Wt3O4K8bIdD/UcZEBT4+poDCEsiwKvTty5hZIzqH9nCBaXK56S4T1vD2YInpEBC0GMobm269GxnKn6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06ENTg1KVmz15Xl+3ZvllIeUBrZd8vgqiltw4uQisN0=;
 b=fn1D7afJAOGAfBNa5idNZBfGdDm0paAxIA2cox9ISOTq+zMp/k61ZASreXr5Ks4bW1TgkTb4fBLK3Ilyogn4osbKnMF0ePsMKbdVwKeHFTIemoNAcUBQ1MOiJ5hTp2V8CMBl01w9e6PiiYdScGFSwq1ZljG82LSG/rxylBQqplo=
Received: from CH0PR03CA0301.namprd03.prod.outlook.com (2603:10b6:610:118::11)
 by BL3PR10MB6140.namprd10.prod.outlook.com (2603:10b6:208:3bb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 20:06:28 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::41) by CH0PR03CA0301.outlook.office365.com
 (2603:10b6:610:118::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 20:06:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 20:06:26 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:06:07 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:06:07 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 14:06:07 -0600
Received: from ula0226330.lan ([10.249.37.218])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5K66403980598;
	Thu, 5 Nov 2026 14:06:06 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] glfw: Remove upstreamed bbappends for wayland support
Date: Thu, 5 Nov 2026 14:06:06 -0600
Message-ID: <20261105200606.1301901-1-afd@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|BL3PR10MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: d623a158-f9c0-46cf-3d35-08df3b784639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|6133799003|10067099003|3023799007|56012099006|261028144727099003|261009223027099003|261021121427099003|261022105027099003|261021123027099003|261102123227099003|261026140227099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: 4HWanW0PhMZJfYlxyasTnkyXfcSVYwSrS1SFjG4IIngI26jxK6QHvo6ILUfuD7OgrtZLDIkGDgyGAdfM1dcsIeSsVhzkfgYqBT6/3iyw1IAHreRwVqYnczdtNnSyn1i4HoJTqfP5UlwFPubxa/4N7T4Z/0jjzRZ6l1x7H1+B/rUSsIDmrqWxSt/6xsR8LitjOmCfoxXdmkyY+UkPUJR3VUHa2qL0LocRcUP9F6yHupmGIS0uLeXbJEUPidiak7nrtKHQ6uorFpmqEgd/eUn+Z1XqbYfJXp5WgIfR50I+95bN5TIuDONIOadGp1tdc+n9PE9Ak+NmTg56HR1SluIrMzR/iqPT59s8fLx1yPQLSzIwoI+z8/MYn+W3TMadOTsnvy7rBkfIbYh5ZTNwQPtNavrqQm8/sIiRa8xMxxLJSgZ2hLeo55eL15k/w5teORutxZ6To70/ogwc/QjSMDte0QUbYSWQQKu2KlZ5D4FBcV4oL5pR2cBsV1H4eYgQo8dux3Q/UfbBPIDrdiZhUL7/3DQ/w02kWXdXO1G7prmaDtjO7AvSIqMC8wwW66b6dIOHqPc052isOSFV7QeOR8irJjYoUwlyBceuEBUdnAu0zPyIaQ/VXQiwdKivWud0evWbqkVrbTvUe+5FOUvaRFH5dyKUqocxrAzMh2I/G8xryQgY/dIn6BLkuXSt4/Ly0CAkAprxzVm5WexGBIOI8sSX9A==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(6133799003)(10067099003)(3023799007)(56012099006)(261028144727099003)(261009223027099003)(261021121427099003)(261022105027099003)(261021123027099003)(261102123227099003)(261026140227099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Cd9Iz+ZaXgQHFvaG9m3od/d+LFg8XyCzKpvAoR+18Z9mxXyyHeSQyKUS46QIRkoBhRcgtZsOCWg5Rsu6vYz06TnFd6vcB/rGgQGpTP0uU5G1Qxwp+KYNvDgdCm9K8bcY7sPoYbbrKeKg5YvuwwJzQGNQixIf4hpWuuTZeDfYeFhL6QFR3ZT3lib6x2wHVwnas53pRd80myicgd2IMGWCOGayVq0pih5ciSldpL99B2xqJuc8HjPn/nwvT5lFHdSrWkBBjAdGvrFRJy2W6ATEV0thEypp7ECTgKzoHSZDT9tfp8Q1I52omdodWNy8OIFnZiMVedyJq1f69KifF5qN4hnta9fYD+ifd1EBSJ205dc6+9EII2l+bBaB3KofLV/DX3AzQl33CauXZblUN7u9jpRrReMQddlj/4p1Zt3PJ5MkOZQmLPGJhsBeYyHMN038
X-Exchange-RoutingPolicyChecked: NlPbQaBvHZiLTWb+gb9KE2U28pnIImSBpUOZ+xdd4tJRQYrjMLlDDoatWYbwmT+0JMMaSL6RrL3hwLAgJpA3byPoLFZ8N5NhPKF2NidRwADjhPGnqDw8sSbuX5cxkeczlmrWhk3XvJnGjK+qGSwD2mUukkb+MKFerO7SzGt7iCIvpRBFwOQvLUQ4Wyiw0iVTI8x1G40sSjkvEEC7xytkR6R3V5Hkg0Ir+pnd0groKdC4A0h3eirLqJivXmU6VTgj31nMhe7BV6PKVyaOkNiV+tG0uFUy9zwLAODdjVNfoTimE/dfX8AnVxQjWs0SFCEytUL+3WkPjPiW2aOG/bn+lA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:06:26.9235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d623a158-f9c0-46cf-3d35-08df3b784639
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6140
X-Proofpoint-ORIG-GUID: uteqFcmco_xLoDDYsM7HTZ3V3vvjPmyU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OSBTYWx0ZWRfXwcRMDUMfFXhe
 LSHcl15AXDNOB+3JQ875T0LMCCkD54i7iv5YLddISm50lqcfvd6QZAb+SP31xciGSqeWb2EY+ak
 4wrDuspis3CEhjzqPzyRjOYSJ7hwtuY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OSBTYWx0ZWRfX1jlYtmPfWivh
 O8vj/X0TBhsEd+mO5h6Xm+Sf32sPgp9CYVYUaRoM1MDFqV+Sn1ZOtTt3OoimelAg6IprQMo8/aQ
 wKpu69EpeM5X0IWfYcf9U0UC3EguX0LlT3u7XCTzJ6snPqOsB/WhMayLciVZHRfKrruTn6QBtM8
 shaJch/pjUCv2ocgc1HbBft6uovLb5GpSVy7xGY6dUO9Ev3zx8wvZ3mPX7OKpWO70u7p7bacwvl
 B1Ym9zF7owwMpNOgOHUQCmYITch7xBcHqy+y6tRqhdTDr1rGsw/Em4C6JBCYqc5KwS4oMHJPzYM
 gxg/fdrLE2ixjY18QqtaYkKsV0O3+bKMtmVBTScslsk6MNUms99wFnLh8TvGrBxbgb9i1P4fr5c
 jwrGTIAKpcnfxdFjZgW2L5CiTv5ewOIxscAAffLnZvkLtVv0bvJphH58jkCI36KS/OhbiSQlMMY
 O9rHTU+eyN55EGPgc1g==
X-Authority-Analysis: v=2.4 cv=D+jSufRj c=1 sm=1 tr=0 ts=6aece1cd cx=c_pps
 a=lrInUZDIVE0OTqvzw4499w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=xLXKa9sQK6mhXKxWNyoA:9
X-Proofpoint-GUID: uteqFcmco_xLoDDYsM7HTZ3V3vvjPmyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1011 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050079
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 20:06:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17762
Content-Type: text/plain; charset="utf-8"

The PACKAGECONFIG added by the .bbappend is now in upstream OE.
Remove this .bbappend and set the PACKAGECONFIG in our default config.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                | 3 +++
 meta-arago-extras/recipes-graphics/glfw/glfw-arago.inc  | 8 --------
 meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend | 4 ----
 3 files changed, 3 insertions(+), 12 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw-arago.inc
 delete mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 4624d957..a5a906cd 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -107,6 +107,9 @@ PACKAGECONFIG:append:pn-libcamera = " gst"
 # Enable gstreamer based video for kmscube
 PACKAGECONFIG:append:pn-kmscube = " gstreamer"
 
+# Enable wayland backend for glfw
+PACKAGECONFIG:append:pn-glfw = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "", d)}"
+
 # Disable opengl for opencl-cts by default
 PACKAGECONFIG:remove:pn-opencl-cts = "opengl gles vulkan"
 
diff --git a/meta-arago-extras/recipes-graphics/glfw/glfw-arago.inc b/meta-arago-extras/recipes-graphics/glfw/glfw-arago.inc
deleted file mode 100644
index 8352a866..00000000
--- a/meta-arago-extras/recipes-graphics/glfw/glfw-arago.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-# Add some wayland configuration options until meta-oe adds some good
-# PACKAGECONFIGS
-
-PR:append = ".arago1"
-
-PACKAGECONFIG[wayland] = "-DGLFW_USE_WAYLAND=ON,,wayland wayland-native wayland-protocols extra-cmake-modules libxkbcommon"
-
-PACKAGECONFIG += " wayland"
diff --git a/meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend b/meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend
deleted file mode 100644
index 8aa73700..00000000
--- a/meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-GLFW_ARAGO = ""
-GLFW_ARAGO:arago = "glfw-arago.inc"
-
-require ${GLFW_ARAGO}
-- 
2.43.0

