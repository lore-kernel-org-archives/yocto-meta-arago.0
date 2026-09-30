Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D6ECA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 22:23:34 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3082.1790807010897478104
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 15:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=nS8hxm64;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=ak5Z3XLr;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UKkAgt3825709;
	Wed, 30 Sep 2026 17:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=xdUJoVEBYRo95
	IrMAc1+jLN4dQFa8CPJcITljNant9g=; b=nS8hxm64j6DNfJYTF2c0YwRMaejm3
	xT+sP0Q5Ci0/dbyknoEWXR1iC2XTCTyG+CuKmevm0YBn2o9ZtpJUPqZ5MABYB+A1
	TIRjBgWl6XJD7YOrI6keNvGrggNfdc+SydqvtoKrUFLJE4OOfIlITMcnvwuctQRr
	kUPGmICvU2rlkagG11l/1lVT8N60g0RmNgABfjDCM3UKcheVrs2bMXvXk+QzYOW2
	DlOvM5dfIXQ5T18VNr+qLodEN6WMo9E2zTNhgFTkH0jUlUEH3Xi1xNR32ygTtJLu
	5cFCRaSf3GAErOylEVYSUFvtSIyHWsx5Sgv58deRTolF8HuEjZjmuwAMw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012043.outbound.protection.outlook.com [40.93.195.43])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17djs858-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:23:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGhGSscGd6irdDgo7atL69/uKAb+nUc+IkC9YKEm5qfbopWgcUlcsJ5KvrnnvQuOc9CSbj+EsHg5g2clnj/Rz8LDG2FwidOn02ViDlrsrlnZMaKWfSTzpTgamYAYXQRPRit+EUlhvQiUJP+WxZhte4Kza/VTkbjqDOMU/oDNW8eIyrjyDZFYZHWZrvayeiz6bbjInCrZ0Zzxqsn/9j3vSrtfNhn5SWiQqkefPab38ixyAwDiJIvbJRFJBfZBKGvTjdObNa1qPWJm+Yxc7iJqZ+quDav3+kMFYfXMQwESJyumgWZ1jgSNvPzG8gc1LMHFu0H8CVIMZ4nx88P9GpOqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdUJoVEBYRo95IrMAc1+jLN4dQFa8CPJcITljNant9g=;
 b=Yjn72gYQKE+VXHy2iuYbtET4ZqasCG0iBUe36AjFTA1xuHr/yFaYRmi1eupnbexBO3UZIP/7O90o7xg/VMj7GJgHOiexWvI6Y9P/I2bPVVd881kHf3AXsBRj+yKP1RWQ1I7u8Qtn6+D6PGjY+RIt4myhYl1yjnKgOqNu2z8+oxPIgr9I1EgNlKhdUMYplEuwQRdLR/GvrcGa3I7anAfuNB8Kt/WoPzBB/jNENmT9LA95HWHnUePZoTPL2gKPIoFzzbaW7AE4YWVvW5v1eB4SZKDJBDHoLUVxWUYC9Oh5txcZYz18MMOfFfgSzT/P8ZxyZCqM4+WpfudaAWjg2UN6KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdUJoVEBYRo95IrMAc1+jLN4dQFa8CPJcITljNant9g=;
 b=ak5Z3XLrFYG/7X0lRvRX2ypXwEAoMk5R7/q+pvESPXu4rOm9Io2oYkw7FJPRsMrl0UefeogiU/eyWUsJ/RgFJQQCFK3DePbTFNVgD4ziBB/o4naCDzuLJPFf5dTrJ4B08ac5trHAxJ5ZocCLOSqSF05FgcnBJe/ny+drTFogYy4=
Received: from BN1PR13CA0020.namprd13.prod.outlook.com (2603:10b6:408:e2::25)
 by CO6PR10MB5650.namprd10.prod.outlook.com (2603:10b6:303:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 22:23:25 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::15) by BN1PR13CA0020.outlook.office365.com
 (2603:10b6:408:e2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 22:23:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 22:23:23 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 17:22:41 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 17:22:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 17:22:41 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UMMf3C702328;
	Wed, 30 Sep 2026 17:22:41 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xC2hF-0000000EY96-32uB;
	Wed, 30 Sep 2026 17:22:41 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] mesa-demos: Update recipe to match oe-core
Date: Wed, 30 Sep 2026 17:22:41 -0500
Message-ID: <20260930222241.3467841-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|CO6PR10MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9c57c2-2991-49d2-dd9a-08df1f41711d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|18002099003|13003099007|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	HwCP783Eu/Oo2nLWLtT4ey69YTawljmNLBVwXPGprwluDVBcWpKeT1oBZIaCqmB0BWHAofoU2pV1XZ4JUCYy5OClY/gbZA3Ks/nk4DDeVK63udsCjhmHFDSgCvGVGexBfi2hDiZe9jfCZFfG8eYhiF1XuFIT1ambototRQmfmruaiMQEwAQEW4RWS1411gNliEvvzDrZFr2p2QQpez3+59FVIwm+6Q+I1IBJH1fxl5gxQ7dTDhNlqcsVTwthSqoMlswJvRvC+hEoyfEXq+TCYu+aADdGXlXL42Nb+OOy0civFMaNLMLlIu1uiSEBTlSokU5PHYPMZR0BOPZSzx6w+EvD8+Arg4n8yf0J7JeHsfjjtUkWyAEjVRNnKW5uwTREJKGM74BTB/DILxnGzmSPOwsDD6j1cjNjWp6y4+zGmzBjaTxfqaJpPWYxgESS+2yBjIXNwM0/WULVlBnOVNz1tlY6zpkbpqMyxsghhLI5ttoYorJ4lwXp9EovtWOq/3XG2K/M3NqwYWEsO9eFS33HvcmzWpCeq+0i/iJFVF2AFC+2UTs39Bn5QT/zB+PMfVbiLQcxvTbIq8l3QRwpTN7WNHSG3la4ABBr+ITJObs06bbFNt1mdAqkP2nNIK4tqUwBlaknZbJP/05lpzZVYkoOMw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(18002099003)(13003099007)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	30JmYYFilp/LhHFkFdM7TKLrhwHPVBWiu/xQ8033j7X8ez++hzNVMK6DJrt20Sl6b673gDNn5TYJiMwwkHAf55RPU/MTXANDhhRZw/3JtWIFTB1jIWjNxqXy0xaca3/fk30Ns502X6HOIplFN6YxbJlwZGMrj4g8AV1z34KFxgNZtdzO36KOu8DaMMsPF/ZOtjtvrIH1TbI6fAlX9PWP8+tEgIBwp6gJAPbALN9HwU/zMr99bl23STWg0SuKZmQDwLZ9C/LqNLsCLA/iECq9QqBHzvRltnRV+gFmV4N4m+osqvkeKPxyVxJh1wsaXt3vftAGQ5yTWICm3A7NE/r2685ygoZf2d5MiwSqr8zIgNGlFv74DqczudsXTFz56k9TlmihR/nccKmUI5MAZgSBOjIH8f4GEkZxKjrZmzSupECxVzn0PDLhWG7fKxLvzsj7
X-Exchange-RoutingPolicyChecked: 
	TcNnj86h/kk4u146KL6KcTw6U5+0EpGZFzhAyBN5LXNiJEeEA3PiJ8yOE3mJEHge5A2TpGjRH5qTObIZU070oG0d0SHCI8hmt7/XkOFEJQPrahxDCQq2sMEu+pYeiGp65KyarZIgLRj5doUvZYpYtBdpuwrgu5SpRUQML0yXK+vtKoJKNWhYo3vl0zaU9gOPN5Mf2cDAO23/RYiJhpb5fliZ+CDL42boh8MrDa3NCmKiMKCzqBu4XXd6+wtJLKnmJKorMCQehmilravCGaUNPBe439dqE0YAMMLU+wLJ+lAEQ1YCg4vAY4B0IsOOi7L448TmqL+dIu07Wj2PCl9NwQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 22:23:23.9895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9c57c2-2991-49d2-dd9a-08df1f41711d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5650
X-Proofpoint-GUID: 1Qpgm8hbQCT5DMG4YrHHIPBDTApCdAgp
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abd8be0 cx=c_pps
 a=EsAf7Oic3mfDXMJ3krB2BA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=ZpVaWaFtAAAA:8 a=e5mUnYsNAAAA:8 a=sozttTNsAAAA:8 a=pIcYUXes1q6KPKImKC8A:9
 a=5tn4MO8azEBWFjlAA-rn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 1Qpgm8hbQCT5DMG4YrHHIPBDTApCdAgp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA5MCBTYWx0ZWRfX3I8xoVyKTKXr
 J5DmLBpfMARq52lVFWeBr5b0IXlFdpQlXM7aWam+3jFWizQ3P8CTeYW1hrfuoiP3nCgooc+cv3i
 IpHT2KeQID1i8iWBlf44PG3o4kcl3uM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA5MCBTYWx0ZWRfX2vbOUMzQv2og
 Nf8g1eItxunSmog7u06IvyFIj0EeNsLqkt7IQfbGGp1ZxitY/uZYF/gQ/r6yT6/CDskhLhXMJbO
 RBWG5DT339ZG6tfJaGzgI6FxCuyoSqXrUv6m1hcvczoW/B+znDeexzJ/krRHjVbndOaf9zyR1O6
 0VUoX9YSxNQzFG8nGSat26yRg/IvLelR80+3Bg3SYHSqONBuut7juEUHZo+WMlS0z30Goxfs9QD
 noEWSnpATmQf4/Z/uvWHKDjlcul+LyG8egSuSdpYs2bOH2kJ/oMEgpwMaLYMceS+u/aw5BIR7yC
 1f36gzdnD9LIxD7cPU4hsH3mVaYS0ze6gUo7NDSpM67pvuL4QJNwyBuCleXnmVRfJAbdbgnBtzq
 c8rX2ZV2/90HZ8LBy7BQ3l2SoJytTlYRokghPHT8MmpM57b7YNdeFBD9GWgqwzN7Fu+JnYteTRE
 xCKjrvBNOxusJk5VwUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300090
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 22:23:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17725

oe-core has moved the version of mesa-demos beyond the SRCREV that we
were pointing to in our mesa-demos_get.bb recipe.  We can safely remove
our recipe in favor of the oe-core version... except there is one change
in our recipe that is needed that oe-core does not have.  Removing "x11"
as a REQUIRED_DISTRO_FEATURES.

We are working on a patch to oe-core to fix this, in the meantime we can
carry a simple bbappend to correctly adjust this.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../mesa/mesa-demos-arago.inc                 |  1 +
 .../mesa/mesa-demos_%.bbappend                |  4 ++
 .../recipes-graphics/mesa/mesa-demos_git.bb   | 41 -------------------
 3 files changed, 5 insertions(+), 41 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
 create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb

diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
new file mode 100644
index 00000000..ff3f2992
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
@@ -0,0 +1 @@
+REQUIRED_DISTRO_FEATURES:remove = "x11"
diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_%.bbappend b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_%.bbappend
new file mode 100644
index 00000000..3b26e342
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_%.bbappend
@@ -0,0 +1,4 @@
+MESA_DEMOS_ARAGO = ""
+MESA_DEMOS_ARAGO:arago = "mesa-demos-arago.inc"
+
+require ${MESA_DEMOS_ARAGO}
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


