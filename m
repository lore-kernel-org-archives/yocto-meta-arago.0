Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6308.1793912468486494755
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 13:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=X9wdICU2;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=meKDpDbG;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A5HghwG1414101;
	Thu, 5 Nov 2026 15:01:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=zxp07i3sa8nGm
	yWYXtbK6aYQv+l6OZUaZ4kmD5NN95s=; b=X9wdICU21VfgKL4sqNIrep26K+VnO
	F6nSFjuxrxYQYz3nQqDYIzdnHEUNdgFRMpLlDFa3kIxJZMkqkqWmio5Zqw16cSGQ
	2U3KlLuYNWdKziLo7BJqjVkq0x+GBV22koBnNJlRLUexOS2bPeU2lVIm0yXpIgu/
	zos8KwxYmC1QWfdT/vh2F5+JoHUQJ3v8qGojJx7bDleG9ctppK8GnvTdgE6ZN71S
	cU4iUvEGXpQgs17caAOXwW7uNoGTG0VANbXO6IIcfj9ecfWoQtZCpW9yxjSF97ka
	hj7p5O2xfFQVd9a88fKMJt+MyboOszeoFF0VTcHGrh4MtBFRTs7KjrRFQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012056.outbound.protection.outlook.com [40.93.195.56])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hrq6tm5vg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 15:01:06 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqGFNqSSKVqb6MNOLeKWYOUf4pK+JD8v4UsFcPGVpHJO+fqdLdG/EkltgZSX66b1QcA2nn7s8naBQmTan8XdfVvuapcN+XfDLQ1nueqpiuvYPdxkL2i63XxrDeII0edMc/pwytj1ea3rvydHFcmmBOBGH6o/+lYuNIgjbMZ3zXDuWyvfUc+1a77u6nWFA8XxQuP6nDgs9CTHDG4f35VoYr/TSVslAoc/dAs2fgycLgHVGUCBRkyLg52cakakOdgOrDb0MkMs5+p6pkaZINnmVcPmqRcGctK/2xxUvi6iFLSyC/cf05ldx8IW1ZLaFJDsTcNFsDW5HMtcyFw0EvxvJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxp07i3sa8nGmyWYXtbK6aYQv+l6OZUaZ4kmD5NN95s=;
 b=TJ3MkZupTruo4FZvs8ARgxZyCJzLcm/ma3eWsJFM0AXYeJkNwGmJpWbv5/qPqaQpAR1qOKixT2jCXjewy+LWMqpTARhSJJgwK9HW+hudoNeGuyST1Ti/s0DLBw5EH4L6RfC89sHYEEJayVrC5vADyuAdEmjXD6OErbac3YLG6ymG8WaZ7P/kjWIdoUUEZViQQH4mXt2i0fyAEnwS68rMcvOl4RVPQ3VqPj2JlstPkVYLnY3u2HdpW2q9DeIAx/RC8yXSZhDhlRgbj67Yv2Bnj6bmQxqiD9mQfypxw2l1w4SXEAfGd8JK8wK78auO6BAZGcXZx1ryX8Do+gyXxMYRiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxp07i3sa8nGmyWYXtbK6aYQv+l6OZUaZ4kmD5NN95s=;
 b=meKDpDbGFEd27O0pNECExZVoXnuDZf1NCUahHc8B+byyfT3BTzlFAqeEY61m3kJ/oBguwngj7Ub4zzzyTqexlFUgRZzp9I6F0Fj6Yi/PBj1teqcLXXrSPi1sGEfH8QY7CWwq4T0Z0Q6pasXfOAyghtdwgtv0WvCK0BtQYu/5Ef4=
Received: from MN0P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::15)
 by DM3PPF311E3C1FE.namprd10.prod.outlook.com (2603:10b6:f:fc00::c18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 21:01:04 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::45) by MN0P223CA0013.outlook.office365.com
 (2603:10b6:208:52b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 21:01:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 21:01:04 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:00:49 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:00:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 15:00:49 -0600
Received: from ula0226330.lan ([10.249.37.218])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5L0mOK4060372;
	Thu, 5 Nov 2026 15:00:48 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] wayland-protocols: Do not add wayland-drm protocol
Date: Thu, 5 Nov 2026 15:00:43 -0600
Message-ID: <20261105210048.1311709-1-afd@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|DM3PPF311E3C1FE:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d0611d4-981c-4b17-9bc3-08df3b7fe7e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|261021123027099003|261021121427099003|261028144727099003|261022115727099003|261026121527099003|261009223027099003|261022105027099003|261009221227099003|261026140227099003|261022113327099003|10067099003|261102123227099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: Hap6R9WLV8pR7XWidA9AbdCzB0fx3SH1+uPmuWRg4tdf8q7mXMsXvui2Fjm256SJ/c+z5+eujo1VtQjsHJ11gnJQobWU7kCCTCjm6a+9zOSCbnL79QY6lqw74/L3zP/vzd7H1BO4rgQfkHks9aRPgM8Xcb88IgEXGuGXzDW4dh9ySs5uOi1Cn/dNt0m0L7EnkwMH+e9vszHakmzEagjKXiwXs4156GFWtHlfLz7ofgT87hYtAQ/bQOh5lEtwim4LAAcVkqTSEDsi1wdWM1c7dHv2D+9IoErp2CKmu+qvgbfYpfC3X8ckG0Uc7V7AnBEeUQ/JQmz+7RKnY1lW4KSuDeXcJNWq2Ga9Zl0ml/lxsEMebDlepGbYc7/5bmya9RrZbWejdZZpdwlFKqPaFlqR193bKZiwtl+3lKlDkry49M9xaENYWPFTsv3Xdo9MMaeegmoeZqQCG3z0UZIYPuAj7DCwpLZjNkK064fURi4qBxue7MOCt8ApISJS2yR/3p2hYygHappvA4uLffq5R1zEQW9h4aXr62zSrA2X4cFoz6/O9xIN+DnPU74fkBQ9eU7LUpjL3ezkneVpHzKm19RDydo++GKZ1Q6LEPzQrdR2mjO+ivhwVyDXX44gSQe6YxOXyXcyKr+jPPjHmxRQ1pnO1QXNoscFWImerbgifQ9Ga02Z1e6Sx3OROhpnIq4YrYxK6ch8v+h5yMNjKAwFdzKh3Q==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(261021123027099003)(261021121427099003)(261028144727099003)(261022115727099003)(261026121527099003)(261009223027099003)(261022105027099003)(261009221227099003)(261026140227099003)(261022113327099003)(10067099003)(261102123227099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6UA3HRO1V5jFLti1PVcyMp0QfSo6ZMQjO14tOg5x8CMmtebPF/e7Rs8ckv83XvuHHCmyxDmFBHKT0j1Pu/i2Fefs18p2S+Ffm5Ps2/g0Bu/1HRVeKTWMFck30RzWWPqy2xsey9U6ZGZAhqDKEsAmFYmkf4xWmHVGPk5+cHBklQtiiXdwdyI5APgQhb8HWh/kpML6aCHSqoX26r/21H5XX+kcQF+HOfSZyAZb2z67AWZB+LkaIPTLpzgSWF3JNhMJvEFdJeXsEHqqxSu2jQk1PTs+NCX3J59gvgjxwE13jr/fQFIAuCawfYMwNDr+SATvdr6BqP/ak0+4DI4gowIiLPT3p0LgmLaklRtpyo0s5GLde48u7EQ2VuGVY18j2q2fWw977GX4+C2cuu71noUnE9WO6PrpbRxUUgYCm3bC4vCiZzDA7RjAWyoXSqJyqFCp
X-Exchange-RoutingPolicyChecked: DSDlmK8gtOF7McfeUBOx0eoJaQyi65l/ThAjIJmkuRAQS8TgJ2Etdf5ealEKlFFkFnOFOvv3KZjrHQDI1EoqSP/Em8cYSrk8nKty/BcWH3wi1C97m7V6M7Tv/5+a+7yjvjvbFQHebXXBbrwOPyjC+flt8F5Pn7hJI9Evfn8VxlLvCvfDZhFXTLDtgtUml1VaCrmdMSW8XbewXFcnmZyg0lKPmxF5GorwmSRR5T9RWr7bcyTHtMM1CwzwWt3rAiT/ncmL/iNQSjSny/1oVxtl5Jvz0JHtEETMakG3xTFj96r7WyXUj9TXNmq4DguZUvDPYC1cQbRfFCySqB4UDVaXzA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 21:01:04.5970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0611d4-981c-4b17-9bc3-08df3b7fe7e2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF311E3C1FE
X-Proofpoint-GUID: --2oCVLiIjkP7H8ecGjQ7n3uhmvUNptR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX7aKtJn449Ey3
 NwyF5oC1fdu2ULVoo9+I7FBYziJ2acaWFtD7jZ8XR7xo5ko0JbNRyg197EEPGypICJUq+VjZonN
 sGmM6o3qyOZ041T1rULhMPYYE/KOELE=
X-Proofpoint-ORIG-GUID: --2oCVLiIjkP7H8ecGjQ7n3uhmvUNptR
X-Authority-Analysis: v=2.4 cv=Q6xHcI2a c=1 sm=1 tr=0 ts=6aecee92 cx=c_pps
 a=3QgNZYwUpJBVNtkd9Eusrg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=SPBxMT96jqncTVZgFV4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX5Z4NV0OENtal
 Wjo5MPxelPgZ1m1qqyitUkSP59iR24MLysJyDznS5j7mVCGZcPgxL7d0twkYk+lluRliUdOiqgp
 uNFs6OkwWLqNEzZSxtsZ7Ca4B3NCWENm2K7aqTrZnGd+3GDhYhysAV5E6kv7Mc76sDzcTU0MA3o
 it72RbywK3yN6xpFM9pdSdUTmaOyVFAD0pqdvN0/XPyxol5N1J+gSXL8rMvvxSdixKy3Pe2OPCH
 RCqynHNuSZoUC0sHoH13SrBRQ6TziYMozt+CKymlav15xF/AATBn2H4EDG/1+956bkTa1VJyRPL
 8RiA38m6xpvaTfb1IEswaxvaBNWC17D8kqO+oeHWNI0zkti4yytoncz20/IQQvw+uRbaxIYS3AF
 lsG9Rfrih3BVKWkpzZ3SSIgg2Yc3/5QZydC8qAg8LWHPwWaq3dzC0Ly+8M19uzfIPqR9CzIcka3
 7wENOrO5Z4rmDN1df8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050083
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 6A5HghwG1414101
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 21:01:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17768

The wl_drm is a legacy protocol the has been completely superseded by the
standardized linux-dmabuf extension (zwp_linux_dmabuf_v1). Promoting this
deprecated protocol to stable as was done here was always just a hacky
way to get around properly updating some applications we had. Remove thes=
e
patches.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../wayland/wayland-protocols-arago.inc       |  13 --
 ...m-Add-wayland-drm-protocol-to-stable.patch | 181 ------------------
 ...0002-wayland-drm-Update-to-version-2.patch |  77 --------
 .../wayland/wayland-protocols_%.bbappend      |   4 -
 4 files changed, 275 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland-pr=
otocols-arago.inc
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland-pr=
otocols/0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland-pr=
otocols/0002-wayland-drm-Update-to-version-2.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland-pr=
otocols_%.bbappend

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols=
-arago.inc b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols=
-arago.inc
deleted file mode 100644
index b97b5edb..00000000
--- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols-arago.=
inc
+++ /dev/null
@@ -1,13 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/wayland-protocols:"
-
-PR:append =3D ".arago2"
-
-SRC_URI +=3D " \
-    file://0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch \
-    file://0002-wayland-drm-Update-to-version-2.patch \
-"
-
-do_install:append() {
-	install -d ${D}${datadir}/wayland-protocols/stable/wayland-drm
-	cp ${S}/stable/wayland-drm/wayland-drm.xml ${D}${datadir}/wayland-proto=
cols/stable/wayland-drm/
-}
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols=
/0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch b/meta-arago-e=
xtras/recipes-graphics/wayland/wayland-protocols/0001-wayland-drm-Add-way=
land-drm-protocol-to-stable.patch
deleted file mode 100644
index 8abbaaee..00000000
--- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-w=
ayland-drm-Add-wayland-drm-protocol-to-stable.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From aad79976f85fda12ade80a0bd760733a6ffb519e Mon Sep 17 00:00:00 2001
-From: Ramprasad N <x0038811@ti.com>
-Date: Mon, 26 Feb 2018 09:22:00 +0530
-Subject: [PATCH] wayland-drm: Add wayland-drm protocol to stable
-
-wayland-drm protocol is missing in the protocols list since this
-protocol is MESA specific. For waylandsink gstreamer support
-wayland-drm protocol is needed.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ramprasad N <x0038811@ti.com>
----
- stable/wayland-drm/wayland-drm.xml | 155 ++++++++++++++++++++++++++++++=
+++++++
- 1 file changed, 155 insertions(+)
- create mode 100644 stable/wayland-drm/wayland-drm.xml
-
-diff --git a/stable/wayland-drm/wayland-drm.xml b/stable/wayland-drm/way=
land-drm.xml
-new file mode 100644
-index 0000000..265d4f8
---- /dev/null
-+++ b/stable/wayland-drm/wayland-drm.xml
-@@ -0,0 +1,155 @@
-+<?xml version=3D"1.0" encoding=3D"UTF-8"?>
-+<protocol name=3D"drm">
-+
-+  <copyright>
-+    Copyright =C2=A9 2008-2011 Kristian H=C3=B8gsberg
-+    Copyright =C2=A9 2010-2011 Intel Corporation
-+
-+    Permission to use, copy, modify, distribute, and sell this
-+    software and its documentation for any purpose is hereby granted
-+    without fee, provided that\n the above copyright notice appear in
-+    all copies and that both that copyright notice and this permission
-+    notice appear in supporting documentation, and that the name of
-+    the copyright holders not be used in advertising or publicity
-+    pertaining to distribution of the software without specific,
-+    written prior permission.  The copyright holders make no
-+    representations about the suitability of this software for any
-+    purpose.  It is provided "as is" without express or implied
-+    warranty.
-+
-+    THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
-+    SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
-+    FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
-+    SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-+    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
-+    AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
-+    ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
-+    THIS SOFTWARE.
-+  </copyright>
-+
-+  <!-- drm support. This object is created by the server and published
-+       using the display's global event. -->
-+  <interface name=3D"wl_drm" version=3D"1">
-+    <enum name=3D"error">
-+      <entry name=3D"authenticate_fail" value=3D"0"/>
-+      <entry name=3D"invalid_format" value=3D"1"/>
-+      <entry name=3D"invalid_name" value=3D"2"/>
-+    </enum>
-+
-+    <enum name=3D"format">
-+      <!-- The drm format codes match the #defines in drm_fourcc.h.
-+           The formats actually supported by the compositor will be
-+           reported by the format event. -->
-+      <entry name=3D"c8" value=3D"0x20203843"/>
-+      <entry name=3D"rgb332" value=3D"0x38424752"/>
-+      <entry name=3D"bgr233" value=3D"0x38524742"/>
-+      <entry name=3D"xrgb4444" value=3D"0x32315258"/>
-+      <entry name=3D"xbgr4444" value=3D"0x32314258"/>
-+      <entry name=3D"rgbx4444" value=3D"0x32315852"/>
-+      <entry name=3D"bgrx4444" value=3D"0x32315842"/>
-+      <entry name=3D"argb4444" value=3D"0x32315241"/>
-+      <entry name=3D"abgr4444" value=3D"0x32314241"/>
-+      <entry name=3D"rgba4444" value=3D"0x32314152"/>
-+      <entry name=3D"bgra4444" value=3D"0x32314142"/>
-+      <entry name=3D"xrgb1555" value=3D"0x35315258"/>
-+      <entry name=3D"xbgr1555" value=3D"0x35314258"/>
-+      <entry name=3D"rgbx5551" value=3D"0x35315852"/>
-+      <entry name=3D"bgrx5551" value=3D"0x35315842"/>
-+      <entry name=3D"argb1555" value=3D"0x35315241"/>
-+      <entry name=3D"abgr1555" value=3D"0x35314241"/>
-+      <entry name=3D"rgba5551" value=3D"0x35314152"/>
-+      <entry name=3D"bgra5551" value=3D"0x35314142"/>
-+      <entry name=3D"rgb565" value=3D"0x36314752"/>
-+      <entry name=3D"bgr565" value=3D"0x36314742"/>
-+      <entry name=3D"rgb888" value=3D"0x34324752"/>
-+      <entry name=3D"bgr888" value=3D"0x34324742"/>
-+      <entry name=3D"xrgb8888" value=3D"0x34325258"/>
-+      <entry name=3D"xbgr8888" value=3D"0x34324258"/>
-+      <entry name=3D"rgbx8888" value=3D"0x34325852"/>
-+      <entry name=3D"bgrx8888" value=3D"0x34325842"/>
-+      <entry name=3D"argb8888" value=3D"0x34325241"/>
-+      <entry name=3D"abgr8888" value=3D"0x34324241"/>
-+      <entry name=3D"rgba8888" value=3D"0x34324152"/>
-+      <entry name=3D"bgra8888" value=3D"0x34324142"/>
-+      <entry name=3D"xrgb2101010" value=3D"0x30335258"/>
-+      <entry name=3D"xbgr2101010" value=3D"0x30334258"/>
-+      <entry name=3D"rgbx1010102" value=3D"0x30335852"/>
-+      <entry name=3D"bgrx1010102" value=3D"0x30335842"/>
-+      <entry name=3D"argb2101010" value=3D"0x30335241"/>
-+      <entry name=3D"abgr2101010" value=3D"0x30334241"/>
-+      <entry name=3D"rgba1010102" value=3D"0x30334152"/>
-+      <entry name=3D"bgra1010102" value=3D"0x30334142"/>
-+      <entry name=3D"yuyv" value=3D"0x56595559"/>
-+      <entry name=3D"yvyu" value=3D"0x55595659"/>
-+      <entry name=3D"uyvy" value=3D"0x59565955"/>
-+      <entry name=3D"vyuy" value=3D"0x59555956"/>
-+      <entry name=3D"ayuv" value=3D"0x56555941"/>
-+      <entry name=3D"nv12" value=3D"0x3231564e"/>
-+      <entry name=3D"nv21" value=3D"0x3132564e"/>
-+      <entry name=3D"nv16" value=3D"0x3631564e"/>
-+      <entry name=3D"nv61" value=3D"0x3136564e"/>
-+      <entry name=3D"yuv410" value=3D"0x39565559"/>
-+      <entry name=3D"yvu410" value=3D"0x39555659"/>
-+      <entry name=3D"yuv411" value=3D"0x31315559"/>
-+      <entry name=3D"yvu411" value=3D"0x31315659"/>
-+      <entry name=3D"yuv420" value=3D"0x32315559"/>
-+      <entry name=3D"yvu420" value=3D"0x32315659"/>
-+      <entry name=3D"yuv422" value=3D"0x36315559"/>
-+      <entry name=3D"yvu422" value=3D"0x36315659"/>
-+      <entry name=3D"yuv444" value=3D"0x34325559"/>
-+      <entry name=3D"yvu444" value=3D"0x34325659"/>
-+    </enum>
-+
-+    <!-- Call this request with the magic received from drmGetMagic().
-+         It will be passed on to the drmAuthMagic() or
-+         DRIAuthConnection() call.  This authentication must be
-+         completed before create_buffer could be used. -->
-+    <request name=3D"authenticate">
-+      <arg name=3D"id" type=3D"uint"/>
-+    </request>
-+
-+    <!-- Create a wayland buffer for the named DRM buffer.  The DRM
-+         surface must have a name using the flink ioctl -->
-+    <request name=3D"create_buffer">
-+      <arg name=3D"id" type=3D"new_id" interface=3D"wl_buffer"/>
-+      <arg name=3D"name" type=3D"uint"/>
-+      <arg name=3D"width" type=3D"int"/>
-+      <arg name=3D"height" type=3D"int"/>
-+      <arg name=3D"stride" type=3D"uint"/>
-+      <arg name=3D"format" type=3D"uint"/>
-+    </request>
-+
-+    <!-- Create a wayland buffer for the named DRM buffer.  The DRM
-+         surface must have a name using the flink ioctl -->
-+    <request name=3D"create_planar_buffer">
-+      <arg name=3D"id" type=3D"new_id" interface=3D"wl_buffer"/>
-+      <arg name=3D"name" type=3D"uint"/>
-+      <arg name=3D"width" type=3D"int"/>
-+      <arg name=3D"height" type=3D"int"/>
-+      <arg name=3D"format" type=3D"uint"/>
-+      <arg name=3D"offset0" type=3D"int"/>
-+      <arg name=3D"stride0" type=3D"int"/>
-+      <arg name=3D"offset1" type=3D"int"/>
-+      <arg name=3D"stride1" type=3D"int"/>
-+      <arg name=3D"offset2" type=3D"int"/>
-+      <arg name=3D"stride2" type=3D"int"/>
-+    </request>
-+
-+    <!-- Notification of the path of the drm device which is used by
-+         the server.  The client should use this device for creating
-+         local buffers.  Only buffers created from this device should
-+         be be passed to the server using this drm object's
-+         create_buffer request. -->
-+    <event name=3D"device">
-+      <arg name=3D"name" type=3D"string"/>
-+    </event>
-+
-+    <event name=3D"format">
-+      <arg name=3D"format" type=3D"uint"/>
-+    </event>
-+
-+    <!-- Raised if the authenticate request succeeded -->
-+    <event name=3D"authenticated"/>
-+  </interface>
-+
-+</protocol>
---=20
-1.9.1
-
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols=
/0002-wayland-drm-Update-to-version-2.patch b/meta-arago-extras/recipes-g=
raphics/wayland/wayland-protocols/0002-wayland-drm-Update-to-version-2.pa=
tch
deleted file mode 100644
index af0a29e3..00000000
--- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-w=
ayland-drm-Update-to-version-2.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 4bfbb6c8236c648f7fd8090a540e3590674dbd81 Mon Sep 17 00:00:00 2001
-From: Angela Stegmaier <angelabaker@ti.com>
-Date: Fri, 19 Jul 2019 15:19:17 -0500
-Subject: [PATCH 2/2] wayland-drm: Update to version 2
-
-Update the wayland-drm protocol to version 2
-
-Upstream-Status: Pending
-
-Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
----
- stable/wayland-drm/wayland-drm.xml | 35 +++++++++++++++++++++++++++++++=
++--
- 1 file changed, 33 insertions(+), 2 deletions(-)
-
-diff --git a/stable/wayland-drm/wayland-drm.xml b/stable/wayland-drm/way=
land-drm.xml
-index 265d4f8..83aa561 100644
---- a/stable/wayland-drm/wayland-drm.xml
-+++ b/stable/wayland-drm/wayland-drm.xml
-@@ -29,7 +29,7 @@
-=20
-   <!-- drm support. This object is created by the server and published
-        using the display's global event. -->
--  <interface name=3D"wl_drm" version=3D"1">
-+  <interface name=3D"wl_drm" version=3D"2">
-     <enum name=3D"error">
-       <entry name=3D"authenticate_fail" value=3D"0"/>
-       <entry name=3D"invalid_format" value=3D"1"/>
-@@ -39,7 +39,8 @@
-     <enum name=3D"format">
-       <!-- The drm format codes match the #defines in drm_fourcc.h.
-            The formats actually supported by the compositor will be
--           reported by the format event. -->
-+           reported by the format event. New codes must not be added,
-+           unless directly taken from drm_fourcc.h. -->
-       <entry name=3D"c8" value=3D"0x20203843"/>
-       <entry name=3D"rgb332" value=3D"0x38424752"/>
-       <entry name=3D"bgr233" value=3D"0x38524742"/>
-@@ -150,6 +151,36 @@
-=20
-     <!-- Raised if the authenticate request succeeded -->
-     <event name=3D"authenticated"/>
-+
-+    <enum name=3D"capability" since=3D"2">
-+      <description summary=3D"wl_drm capability bitmask">
-+        Bitmask of capabilities.
-+      </description>
-+      <entry name=3D"prime" value=3D"1" summary=3D"wl_drm prime availab=
le"/>
-+    </enum>
-+
-+    <event name=3D"capabilities">
-+      <arg name=3D"value" type=3D"uint"/>
-+    </event>
-+
-+    <!-- Version 2 additions -->
-+
-+    <!-- Create a wayland buffer for the prime fd.  Use for regular and=
 planar
-+         buffers.  Pass 0 for offset and stride for unused planes. -->
-+    <request name=3D"create_prime_buffer" since=3D"2">
-+      <arg name=3D"id" type=3D"new_id" interface=3D"wl_buffer"/>
-+      <arg name=3D"name" type=3D"fd"/>
-+      <arg name=3D"width" type=3D"int"/>
-+      <arg name=3D"height" type=3D"int"/>
-+      <arg name=3D"format" type=3D"uint"/>
-+      <arg name=3D"offset0" type=3D"int"/>
-+      <arg name=3D"stride0" type=3D"int"/>
-+      <arg name=3D"offset1" type=3D"int"/>
-+      <arg name=3D"stride1" type=3D"int"/>
-+      <arg name=3D"offset2" type=3D"int"/>
-+      <arg name=3D"stride2" type=3D"int"/>
-+    </request>
-+
-   </interface>
-=20
- </protocol>
---=20
-1.9.1
-
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols=
_%.bbappend b/meta-arago-extras/recipes-graphics/wayland/wayland-protocol=
s_%.bbappend
deleted file mode 100644
index 26dc8fd0..00000000
--- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbap=
pend
+++ /dev/null
@@ -1,4 +0,0 @@
-WAYLAND_PROTOCOLS_ARAGO =3D ""
-WAYLAND_PROTOCOLS_ARAGO:arago =3D "wayland-protocols-arago.inc"
-
-require ${WAYLAND_PROTOCOLS_ARAGO}
--=20
2.43.0

