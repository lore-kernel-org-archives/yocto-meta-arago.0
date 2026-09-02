Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64018C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:43:59 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13277.1788356630981336348
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 06:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=OJPNvEOw;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=lFPoO81M;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682CV41e974149;
	Wed, 2 Sep 2026 08:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=02HYlxGynEl9+
	cTygOOkRctjxM+pRT4GfFW3ATr1K+w=; b=OJPNvEOw6SKeU2VHwHlMbpvn4BbO1
	jL/nBih6zd1k1y4TW6sSSd+1zYOEfa6+7MudBJ+ox+aPucn3XlXHf3vrnb/dcLhI
	M1I1qD6wcCUQ6CLZ6gTrY+3cLimPrlLVLqdzf6vq7LbcZp7iX781NcuWnrbjs3Tn
	v1EsdDodTkXswjTZuLm57WCnYEWi9xBDDPzOD5+rqs7X+q/Qr0HAi5JOvM7kL8nz
	qXgOD4XwUGs7o04KNmkHC05pcSpdy+0dXgKFdruQ+oN0JJc9yHeYhPOT93M3HfDJ
	5Vsp3N3EJt8i0VN90uZVdzZtVCG0bNiMxRuePs2zltVDyaDlZDMGUaEQQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011047.outbound.protection.outlook.com [52.101.62.47])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ge7cgcdh6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 08:43:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2n3RzEKpuaG2NOYPndEcUbz3H34E32lHydNcJ7D7A0bTgyw4z5ZLO+/VR2i1wQ8Vy24EzH8RYN/tNo778+K9Wgaatb7g6yUxjfO6bTg9KY6f993wFunSXqLFFUWK0s11UNcOH0VB8BMSLiwJURn3KkimqklsLKqMhW2DCy6TJ6XU00udi5ci1nWMCuQzH4gWnb/Wn5s+EV29lfiwGC5dZCkJT1VHvhmPlYOijKrlEdRKCTQJ7BJ0VXL327Pg8CDYKkop0iRv9GwJXC56d2xrsXKUgcuZseO+K68y2Iez4Cz2zJP77jvIS7aUPDfcoP/5BQ++knCKxTefEd5arW9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02HYlxGynEl9+cTygOOkRctjxM+pRT4GfFW3ATr1K+w=;
 b=gMyyn8g+/eo2Oj16ZM0N19fxoyEsX+GqxUhhAmfE0ChLkQwU+MbUpSoMpOtFEOme4gjKpQm6XO+TegY2FDTpPDSxCwBZsaAxcxAmgmrcFLhwIut2WeLat6oGSVvEXLSVic2hxZybDnbDv8cNWEH/00f2jGOJb3zEpEGYhd2KgQvV/IgkKm+ehgeSpdNVP5QuY6TPDeZ/ZvONLzKsIq74XGeZf3Dczlcju06hRvWfLrF1kQDSQQur/uxkId2ryiTUY4gq9MlG8G9QxazG0ilCqo4dZMWPENB+AU7R5vUUxIxYzcx1gFDRa9dvePUN0HhVh+Kj+LsqHvc7kFrAKEGk9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02HYlxGynEl9+cTygOOkRctjxM+pRT4GfFW3ATr1K+w=;
 b=lFPoO81M0azGK0UUOIWbVOu5ZSYyeg9bKQxkxsdborBqZIyGOg2zku+HyVDq3nfreWnjs8JkaOmqpFRz/5/p2bWBoROM4OmLNO6xWbzOl9YbFqJElAi67DT4wS4T+ENL8+E6AW6mI8cXA63Mlq/J8ntD4GKOquFOkvTfa+mYqqU=
Received: from CH2PR14CA0027.namprd14.prod.outlook.com (2603:10b6:610:60::37)
 by DS7PR10MB5951.namprd10.prod.outlook.com (2603:10b6:8:84::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 13:43:43 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::a) by CH2PR14CA0027.outlook.office365.com
 (2603:10b6:610:60::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:43:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:43:41 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:42:59 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:42:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 08:42:59 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682DgufB700786;
	Wed, 2 Sep 2026 08:42:56 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-arago][scarthgap][PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
Date: Wed, 2 Sep 2026 19:12:55 +0530
Message-ID: <20260902134255.2136663-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|DS7PR10MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: c46351a9-1f13-4625-3d59-08df08f83379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|13003099007|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	TS6o68Ya714Q7tG/lNj0IC0DGiBjlHKf32heC5oxp+T/Do6VG92fKb5CcJDfwlIwreWZKHCUGjYNSmDcm3gxWpXMcoi1TQnYCN+yUdHd3r9VGKoWDJr8+eSWrGxsdy6F4CohyxmivF4SAcw9sqVxSLNmIapZNw/fzBNxpgD0HWPQA2nEDHtNpKuE3YI2zMMP6MHXSrfEeCc7VnSLiLmtjuLPHAjX1MjIfmeA5oBCrynMp/aZJOxn1cpmTgtA6tD79z4at4XpXHIYEVv+ZI3LvmPV0ZLLPhxWIbQa11LkDzvi2vcr34e01faFJ935T5B9R5r5uZ+63yDNttINkeVPQ4sDwdrD4HnrJr4vG2864YgFopJqjb0DCvchFT/dLR7teyP5P+odeqHXpmfo1OmpoFIZW4ZvlY3x3oDEgHb6Dssho3O4bnY+8QIr+oPr76+FAnkc8R7tnwZrL2UbvV+MfX+0uRsoCj9SH08T3lTCPGpFRSNM7TaPFvUpVZeHts1NVDQ2uOLcUsNT3nVbzX3O+9wkF+Bi61GCp7J3PcnxnaxczEXsMPvkIKWVKZO65PmbFQHbRYm31bb0dpg189vi/LqNqyXnZ+Dsr+28ApSueAX3+FjTFVoyr6OBQteeKFFTv6hffAeizqFxQucdEJdRUw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(13003099007)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wRCEw0jlSKNVeTp1RlKURpm7imgk6MsN3Og6wfiVnkYiGHAnZM96NDZNeBYV6si0HGfYVK3wKIfCmP/V6Tn6cIpVN21Z8f9CHbVbpQM+37nITXspqStRiWx9TkaP+lqt348ielxLD6yc+wxu6F+oxuBCTTy4a7NA+hYUmPDyvaM3VK1eHRF3/aQssBXk4vz7lKp4hQHFqHblKvJdTHPN8Fxez4tYWE0ETNa+NYBCrWDCyMRnfSpCPeLqaO2lkA2loUlMC/n3oCJ+qo3IQ31h22MMdzbVRXLmkAvbIlTkoFOdCpxyi6f+WyKyzNL9REaUR2TWtb45tXmPZImFO1CgcmWFVoQ1sDD1qGtGaKg0y0kkP9NE4Rps3++pWqH/8+5GKzVHDNj6ZN+i4gbWaY1ISVs9Ph22PkzKrXdXwwffg1Y+aVkgAQ3Y+IruCOB7HIMj
X-Exchange-RoutingPolicyChecked: 
	Zh4sO6/og537jHIJWz1g7NiSTccXfZcqOwBkCyJPARMfKmaoFD4JN+Uo5JbLom8PcGOo0KqOVO3bZwoYSKtXUgwILi/6PnJb0ZtBUHWPoiVoIg3gxrEPaqzsT1yGvYCKCALAXatTFzO3G7hII27BL8nHON14QjFBZDqYAR+C6NrwQ/v+ZSAJ603OshCBOn3Xv1gQ6LB4XEVC4CA7i5O9gJ5Gk5gVjN2ChU7M0VRgVOT/O/syBfbYnyG9OejN5iQq28mEMZtxlpbLOSn1267ZdEZ2/0zUuzXJNxsrNKvBKYUinOnEQaxvs/IRHGyyMrUe+o4EfhtAmGPWBvFl3ePTXA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:43:41.7453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c46351a9-1f13-4625-3d59-08df08f83379
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5951
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMSBTYWx0ZWRfX306x9U5nHkIA
 n1hMJ+kRCw4KA+AtCQKqnrn1hF1wiTBnfOu2YsbU9Bc1E278lgAc07cyJEMljtK606lIj+wLIzP
 t3WyQiVaw4iFzw2D5bbY73v4DiSgCjo=
X-Authority-Analysis: v=2.4 cv=Ka3idwYD c=1 sm=1 tr=0 ts=6a982815 cx=c_pps
 a=U8qasQFE1QqC7dgCSsktzg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=sZx6Jh3yVY5d41XZOmgA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: XVpoM5XGGOWol4gz_hw9h1eXXRnSc5cm
X-Proofpoint-GUID: XVpoM5XGGOWol4gz_hw9h1eXXRnSc5cm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMSBTYWx0ZWRfX6uEGK/Q/FSGY
 CRIAckc3S8KQKJt3pKF5ay0jIC7T6lApHs0uzZyTGM8cvSWXGXRKIaTlzu1385npLqS7nWAgNKH
 saDcgCp/Ll61y+rGfNiSDbt+7zEwMNeKh6mS9VCpf+9JVdY1xBfWgXMhwpVNtNKnft2VsWNnUMA
 fBVo29fXKZpajBlK+etUhU6Jt2LCYNRlv1pZGQK3nphBLWDt1ox+6KLD/uB3rGvy2b/uXAWFyxt
 BPvMp8BoQ4eNyRVhaHphrIC/W4us6H5Oln3dFK6W1o5ogqgyypPjQVCfHLtuRwmekKW4SVP5gV0
 gOxUijs8takVkOdBnk5c7G9Gq2LiXhrict0/MrF0qG4ntG0s4zrs08bP8+5aCB9aAcwMk/+4WIs
 ++fApm86/Xj/fvaE6CSPH8hW1dzYhoRU4OSsQkIrOJbHhK5Jb9mVofDJWs0x/fGbaBib8oz2uhB
 CX7j+SD+fdrb7ynVqQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020121
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 02 Sep 2026 13:43:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17646

Neither image sets TI_CORE_INITRAMFS_KERNEL_MODULES or
TI_CORE_INITRAMFS_EXTRA_INSTALL for j722s, so the machine-wide
TI_CORE_INITRAMFS_ENABLED gate in meta-ti-bsp stays off by default for
this machine. Force ti-core-initramfs to build via an explicit
do_build dependency in arago-image.inc, the common include every
tisdk-*-image recipe require.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
This patch has a dependency on the following series: 
https://lists.yoctoproject.org/g/meta-ti/message/20235

 meta-arago-distro/recipes-core/images/arago-image.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 37b20850..398e299f 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -30,3 +30,7 @@ BAD_RECOMMENDATIONS += " \
 BAD_RECOMMENDATIONS += "${@oe.utils.conditional("INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"
 
 inherit core-image remove-net-rules
+
+# Force ti-core-initramfs to build alongside every image based on this common include.
+
+do_build[depends] += "ti-core-initramfs:do_image_complete"
-- 
2.34.1


