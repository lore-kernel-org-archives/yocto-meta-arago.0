Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEDECA5FE6
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 22:30:30 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.633.1790980224751397090
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 02 Oct 2026 15:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=O5Ryb3/m;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=A/OmpV+P;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: rs@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692KAUfH1368267;
	Fri, 2 Oct 2026 17:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Zar2zlyG21eGT
	X+dgDh6ykiZGO4h8KPAC/4fHS/at1w=; b=O5Ryb3/mXd8c+GEbqDjz4xYGNNn1y
	42hCEr1QaerJ9bfDcOEF3bpIopj5BoEC0Osa/A2muLUg8lGx3eC8pWNV8Oowcrxm
	D26aaMyG3Ks2cAJbYDjg9by4Bsx98/E6fvhbL7qy4VFqxslXGWaQPNnJq4JXc2/O
	R4CEnMUUSn3LDu8F/04QuBzfKESzR9Q7D0f/nCsp1XBZ92ry0Ez/NGfzq7ROTPwS
	PmCe2muuu8EGWswLBxVjjvtA0PDzIeUjiCNYtzuBduCtCPfjcPL7zzb+yckv1C5R
	QrjS+mYClCl9Nv44djArkkXQU0aAZA4f6XMrj4RnO5YG1cko0CcC28QRw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012005.outbound.protection.outlook.com [40.93.195.5])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h27nxn7eq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 17:30:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM9An/NsyB5OYWcWlEy4WlIJUBCL1+rEl2+sA64lKI/pqoHsUug0wLUU/GtgDQP2f0aWWPjq/cgeuMCk9kzZq3d2G4D6RiN89MU7MmSjtYA9MgznvRpjsCLjdQEZy7BkMVWgAMgDpD5znE9CtX5vX2DFoqFSDfXmTX0ZhbfCQ8Io2mJohOWBzAzHVGSB5PEZZxT4Kxg8PrwiEsGiD5gA2wVRsdoPILxk2Xej9/0A+QiZaGJ2QFoDdgL/xzV8aWoOgWS9hz2KJYpJuTTb1bwrYdXbxXsYfxRG2MUXTuUNMlaXVPcxCe327txajwNSZ/GTQKJrPWnNcNU49v/PR1QbkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zar2zlyG21eGTX+dgDh6ykiZGO4h8KPAC/4fHS/at1w=;
 b=o6IuxiD7rgLkH7YdqYW60KqZjAHyE4r3CAl44Q53SLL+oI3gIYshBHsy3K/Vs2aENjZ+IjeDkq4VIrGgRhTjcKKYgvLWVPhUKhPgK9nGP1hay3gpCs9OfvzTN9473frQQou+eVpm/EUmo9zG5k0cIA3/UlUPqxjpl4+wEdc0CrXJR+vDrr2IUabQx+iiNZwOkJjfUSsGmOaOLT0ww/MMueWT/P3X4hQCPzFZfUAlGqxhLtMj1aZQLzWXcVtTGSA7n7r82h0sUWJpgZi/BG2HBty1b03uQvrNZ70/R3SOzRXoV4X1kgFT7gIBwDQfsbC5z1Ru6hM8bguXT42jVgwk5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zar2zlyG21eGTX+dgDh6ykiZGO4h8KPAC/4fHS/at1w=;
 b=A/OmpV+P0ioDI53jVPy9P98fzx6cujD0OyUhn5X9k3X3ZTUibusIz9SVLQxgyZCj3KPY5CCIGZdivvwFs6dS8b5QOV7b+SuWAo/zbl4EtCpo1BtcXFUmv9W7Inx4gvoW/+LMzFKkuQbFuxIgRh6hCq06Hgo87AqZXlhFP8uxTz4=
Received: from BN9PR03CA0074.namprd03.prod.outlook.com (2603:10b6:408:fc::19)
 by IA3PR10MB8760.namprd10.prod.outlook.com (2603:10b6:208:581::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Fri, 2 Oct
 2026 22:30:14 +0000
Received: from BN7PEPF000000A9.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::c) by BN9PR03CA0074.outlook.office365.com
 (2603:10b6:408:fc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Fri, 2
 Oct 2026 22:30:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN7PEPF000000A9.mail.protection.outlook.com (10.167.245.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 22:30:13 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 17:30:04 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 17:30:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 2 Oct 2026 17:30:04 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.75.60])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 692MU4pL3896078;
	Fri, 2 Oct 2026 17:30:04 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/wrynose][PATCH 1/2] emptty: upgrade from v0.15.0 to v0.16.1+git
Date: Fri, 2 Oct 2026 17:29:53 -0500
Message-ID: <20261002222954.3580000-1-rs@ti.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A9:EE_|IA3PR10MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7995ca-06c6-4123-6c72-08df20d4ba33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|10067099003|56012099006|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Z/yUtXsB72LAeebipkbK6E2oIBtWLDw76luccLxY8NImwGoV4ncHlO2aSzC/co5twifjNSE/5MFM1h5Zln7IGvNJEe8bfBSY6i5J4rgSeI8VXE5besHZgvtbevLDujrG0zMynx7H4ABZHMZu7ZcS49q9GgR1RTpidnIIWQ/+xUL15s2mqGvuMKtBsfqjHZy8oxB4TbY3T3ajapRJ4pOhm8yZ6Z1H26vs/XFPNreaSgP8ZzWmiASKnMgDEl7MqcTQyuJ97gRhYZSOXV28O8CjiK1dVyDnpmGhyJJb/nfslN3L/qAPb2C7mQKoCGL6rVaM05i+60NdeCUcIZekxbxVZkHellV/0QBusPyyqZGWzTfrqgOcfYMGFD6cyocM1x/GppJ0Y9ogNk5PuFRxrkOhyBAWgQgyCypMFnn/I7sqxQzFPLvNUVV4HQLjj5C1S3IllCiccyvBOlrr9Y1TVRyfRKSshYmTWt3/rreyrkPnvQHWLv6b63anl3N3JTLeGYTuzLdvmm/N9BIm4yOFHBbtHmRZz/ckLH2sIcuxeUq1lF2MX1PXNGIi1+76zMSw0Wvyg+pPJrFC55fgnBfSwGIeLCEZdQCImyh1olUm5HrCjvX9PyyMU2gC8DE4Ii3mAiYhF7gpKXKGf4Nj39w/KvRL45ZyUqksdq2sMFLh9ySXqVPq/7gaQalS+i+HE2+2JdsFsR9BP+isJ1gNTZGllvDpwQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lACRJ9c1Ek4pqolyTPku1qhPHV3do4t7/0i8THQeCGz2w8qU3mV0dc7jjPnzZbM5elU9KcYQHBWrEC3gCinaELu09bDrJbQZCdV08w0YV5mKGEf+vy2DSduV98aLJ5eCc50CaIWbPPHt6SqVilI7CJgSnvU6fvV2U2y5rHzsfmwziAwZwhfCeyVLGtpmyULL4QxJeeMfU5Jh4JivkwIsvyoxEVN+MSkPerIBHOodk03iDJxg38eJlhGRJaysHdoZvj/j60bUts6Je5xFOdXx4hbUWKr+tlka0pjzBMywK7xVKfuN/MEnf05kdAS6jPzt/SbdgPYLazfVGFaWK/dj/YDbFMrTLImit89j8DXPEqQaBRwkVTxv+GbEXTtdf2jk8qzCW4VzvpR7z8gQVoq79F/dc1lOETeEIQMLPc+SnsOgQRAV2R2lC9a8LHu1FaRl
X-Exchange-RoutingPolicyChecked: 
	P+DmqhjmOQKoN32GJdA4HYiidbiVOaSVZ0s4ednMom38PSchEAdu6Tb5hDDLgFVGA0BzxpirWeCzyPC7udY1u7qAyph23M4ODbQyaZYFIP4gsC9WH6hZTyfSRha7zrNY17RNzFMYrFSggiO/6u/t6FOr5loovWSkjlxF9zdaAhgE9Ic57Ju0j0VCgjFNv16qmmdjVBA88H0Csim6Xcv9KjUdWgrykDTRF8Y7WGOPiZbKqN2RL16FXovCXMjUrOPZEQ1jzEQVSPhuD7lWoIXxm806Xgmra8HaHeX/xjH5z5MBRg6IgPfSKwD02poXSETiG15apy55ldEHK5Y1ftr2Gg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 22:30:13.7737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7995ca-06c6-4123-6c72-08df20d4ba33
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN7PEPF000000A9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8760
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA4OSBTYWx0ZWRfXzdKefqgH77OK
 tDppFQha3X6BGxhQUg0XmYZmGa+A8yaZYewVcMhwEJ8ySpX+yhcnsY2euYtpGlU+nnbE47NppiM
 WYOm5JDEbgi/nEM8pFpdvPRbf+1bb95BrEMgTUYltqJMjdYViK1cSWo9lywUUe7jGjT0V7F7nB8
 +es8+NdFaC23wwSUYTkmbH8SIZ3rHqy9WjnL8C8pd/e0sbvRxT6ZdGGFl214F+WKAOApXldyyuP
 mouYhunjZIc5XYlc/nuo7AlQrmPtuJQuSSAXmEQKo6Uts+WR7iEZQeh+VQVW+sshL/3WtQ6zIh0
 p0UkppLc1EUti8BCXUbuO4T1wlCK52gSEMvmBfxZQ2x4TwETHbEZH+o+q8fgy3/o//zo0jqOvAs
 z/FDZp+i/h+BStyUHwcuF7zUN34auRmsIiIk0mGac0ATiSFguLt43eVAgI4wvAt3tMA7srXhh0w
 rl3O6hy7JuNOoIaMrWg==
X-Proofpoint-GUID: bkswIg29lNedWvZlVTdcRm-ebY3py_7Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA4OSBTYWx0ZWRfX2ct2EQIPgSEE
 PX9+LSr9jSvSw3Uul+cQfj0rpZkmn+QZUBy+a359Nz5KDb1RhKh3ZlA2EJmjTQfVgln3VAAk3pG
 HFA033NbK5477eMprA9n+ykMvLfZBCI=
X-Proofpoint-ORIG-GUID: bkswIg29lNedWvZlVTdcRm-ebY3py_7Q
X-Authority-Analysis: v=2.4 cv=BZ5NQbt2 c=1 sm=1 tr=0 ts=6ac0307d cx=c_pps
 a=Wms0yhV2hyGqr6ZNmSx9tw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=eCjEg4qQnRVWD0SvVM8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_06,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020089
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 02 Oct 2026 22:30:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17729

From: Randolph Sapp <rs@ti.com>

This adds a new configuration option to wait for a particular number of
DRI devices to be present. This value will need to be tuned per-platform
unfortunately, but it will ensure all required devices are present
before attempting to start a session.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/emptty/{emptty_0.15.0.bb => emptty.bb}   | 0
 meta-arago-distro/recipes-graphics/emptty/emptty.inc          | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-graphics/emptty/{emptty_0.15.0.bb => emptty.bb} (100%)

diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb b/meta-arago-distro/recipes-graphics/emptty/emptty.bb
similarity index 100%
rename from meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
rename to meta-arago-distro/recipes-graphics/emptty/emptty.bb
diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty.inc b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
index d99c4d8c39ad..82238c0debd2 100644
--- a/meta-arago-distro/recipes-graphics/emptty/emptty.inc
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
@@ -19,9 +19,9 @@ SRC_URI = "\
     git://${GO_IMPORT_pam}.git;protocol=https;branch=master;name=pam;destsuffix=src/${GO_IMPORT_pam} \
     file://pamconf \
     "
-SRCREV = "bb203ad0a224731a7a2ff50deeb342ab79c4af09"
+SRCREV = "bc471001fdea13a6cece38d25cfb7d2f3ce08b06"
 SRCREV_pam = "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
 
 SRCREV_FORMAT .= "_pam"
 
-PR = "r1"
+PV = "0.16.1+git"
-- 
2.55.0


