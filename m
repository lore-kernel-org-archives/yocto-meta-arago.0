Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95A4EB3637
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 20:55:01 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2424.1772484894413153141
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 12:54:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=KPMglFER;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.28, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWZZVUiF6o6gjRY7qeg5MtqxgaF9S3EFhj5+zAWHpQJrFwlLIt4MzWl9U3AokvTk0Q6wwZ8L7zeBR+vrWucb+dy7xcQnrWTRwSW7vXuWmaBJmWyMS9r/9n0m4AmVF7QUEpUEfJKslZhABDisvGUo1SaE6bOeULDx5VY5LDrCFwTOtUEFJAOyHjLpGpyQe8TIb1BKUB3mKihjINBvaGF3+YOFB2fT+VBQeH/ZDUWhVDNPGj94du2CvNlJy5XMIUjyRCWqQZUsVfWgWBiabXzoR6hjPaDwFLGFdY6N6JKh1h2Tk6lSXS9KiUVj+vgiemkupiPmjidr6KXfp4U7M/lJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQJQQtEAOjRxcyEtikbmst77tsfny8fzu7MQAq4p3IU=;
 b=wcz7Qb5u3nOIUJn3zFXquYMEmgbZeJRa8BnnthiJeBPiLOTLD28fGAoEB4tUSX4yz/XnkCMIkBf4zDYfyVlKJLo1pwvsEvL0udjWAKSvs3vewDAQ6mA/BL2NrRUPlrbtKEvDp0+VO0ytoiYz8i/z/xOE9NNjjrwe3WT6K+d2fR6DMRjKh4SLEB8fc1mya1UxcPJq8AHMu7GcgHZJulklXw8c8pCdmzjNbvt0bpj4RS9d/6UoG2MPJsYD96xCrwbWE77QrUu9oKkCjGHEpqDWfi88rJxFZCkdPyGCjA7vwvW7mYJy5F13Auu/borAF5RI8ZoebPTADB0U/bRywSIn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQJQQtEAOjRxcyEtikbmst77tsfny8fzu7MQAq4p3IU=;
 b=KPMglFERGCyHT02fhRrr2Z43F3bt/qTj3+xYPizqE2hVAXG/tdoT4Ik/djstwG0s5zNA6SM33c2XqC1scKmnQh35k3F8yobiER3z00u/VfiYNEPws1RjdiOiZE8fIu07cxF3jlois8NUWDpJ7z2hL0Ftm+cqIxAOZnCoE2nfc34=
Received: from BY3PR05CA0015.namprd05.prod.outlook.com (2603:10b6:a03:254::20)
 by IA1PR10MB6218.namprd10.prod.outlook.com (2603:10b6:208:3a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 20:54:51 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::45) by BY3PR05CA0015.outlook.office365.com
 (2603:10b6:a03:254::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16 via Frontend Transport; Mon,
 2 Mar 2026 20:54:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 20:54:50 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:54:48 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:54:48 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 14:54:48 -0600
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.190])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622Kskwj921778;
	Mon, 2 Mar 2026 14:54:48 -0600
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH 2/4] meta-arago-test: Add yt-dlp recipe
Date: Mon, 2 Mar 2026 14:54:34 -0600
Message-ID: <20260302205436.1117890-2-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302205436.1117890-1-t-lannynd@ti.com>
References: <20260302205436.1117890-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|IA1PR10MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae53d3c-8619-439c-4111-08de789df2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	MaO5HV6CCuyd+G5qZZQeOkAsQi26ma1IAiPHKPZDVjs80HsWVO0HzjH9Lm+HPRYa0JE9M9Seit3XKHEyR3UBMt5vmoE8KbA0ACPAEp1C+wLPHa+u0zHVLadnrLD8NFbg9m1J+tsd7fydfqWfR9NFJH3ezkMHm4j/uI3FdXhXcfCBc+H5N5J30b1tMAVnhFC7/T/QL3ilmnyWVHBLnF1naNMBPtbzbbdmnOOhyXa58k2yICXl8KzuuOKWnAsCtDJG4rD2V8youFoGYvnR6FWyjj8mdAXP7+AQYMKIRzil8KhZ4pYEay9QbKBKx7ib0Fri2ZQoS9Va/eclrrMBxmHcJfzy07aFyuMo/t5rByl4BB6trGiRUIQgENWLIztFr6O7n4KVyiwxNT1aZ4FYw/YSA/lU/KSVWoRW3/fwCQs2opsq6EaaNsulCtOpqJoeNTiMpTn3Iq2gl/zhNgv08L2CbUs+rXnFNrdost1N7SiqN4n4eDZKGNaPF3BuYtAQNvKxAtFv+m7481tuMpI1lD07lOI9T1CJy9Y+G/TPJLblrylzgHwKR6jItsSq/VcmF2i57Uf1bJyPeCyrqSjZZbfxHXjepU6WJqsQHLZYTUl/4c22up9bZU156DVRiB9rtkMWWpfqvpWPxIsrQ37jiZpbjLmB9kcy385KgmWCT/5mDldsjV27HJWqz/Nz809l0dJHX3cT3CEVT5cuSVrWxNJXhy834SSKR4YsYMLRLU86FWjg0ksWk4oqdj+Zp6+TwfXkPTGPCUDixOm3cm2vozZ5BwUtTg4FdpWH6kcmsA0PzUAB5QhTNhXtmcRb2lUhkRoxCdR6gPSrACIkL1Wfi0ChBw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	frYcOInTNn8qOnuBhwX23n2xlnm8+/uaqxZGVm6VaJ4AzHFZn+J7opYRC4rrMk2ixjxg9CRMdcvDMOt9j/0zgm5c9Ml57ltKetHXEdK7vdTycAFl5RYfUctcNZCs3avUv73sZlRPAp6Kuvr4vh8XA1F71uUhzmAILtYzU3ZL9eZb1EELd2qGeHvn/wyfxloe0fpePHwdjvel+TDqzN0t32X/8onxxNz5C9r8z0Y3nFyuhaR9olzEQAjKjZ8O7gQEFoNJyIWCle38KIrmH/PLOIGqyj1iaKe6KpkCxt4ijfbnxCp/fhElFQ2t5Vl4BV6V2qefGwlQna27K4cPDVyjF2tixxB6pGD7LZbIfjjoYQIzmlgCrN7453eWMn+cvCv0zLbiWsoCPouC98GlKsqvEMd5xpxlr1pgg22PrV8jNlmyYice3sDjUtV7LFYjPY9e
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:54:50.8256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae53d3c-8619-439c-4111-08de789df2a8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6218
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 20:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17177

Add yt-dlp 2026.2.21, a youtube-dl fork with additional features and fixes.

yt-dlp is based on the now inactive youtube-dlc and focuses on adding new
features and patches while keeping up to date with the original project.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../python3-yt-dlp/yt-dlp_2026.2.21.bb         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/python3-yt-dlp/yt-dlp_=
2026.2.21.bb

diff --git a/meta-arago-test/recipes-graphics/python3-yt-dlp/yt-dlp_2026.2.=
21.bb b/meta-arago-test/recipes-graphics/python3-yt-dlp/yt-dlp_2026.2.21.bb
new file mode 100644
index 00000000..dbb8c01d
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/python3-yt-dlp/yt-dlp_2026.2.21.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "A youtube-dl fork with additional features and fixes"
+
+DESCRIPTION =3D "yt-dlp is a youtube-dl fork based on the now inactive you=
tube-dlc. The main focus of this project is adding new features and patches=
 while also keeping up to date with the original project."
+
+HOMEPAGE =3D "https://github.com/yt-dlp/yt-dlp"
+
+LICENSE =3D "Unlicense"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7246f848faa4e9c9fc0ea91122d6e68=
0"
+
+RDEPENDS:${PN}:append =3D " python3-brotli python3-certifi python3-urllib3=
 python3-requests python3-websocket-client"
+
+SRC_URI[sha256sum] =3D "4407dfc1a71fec0dee5ef916a8d4b66057812939b509ae4545=
1fa8fb4376b539"
+
+PYPI_PACKAGE =3D "yt_dlp"
+
+inherit pypi python_hatchling
+
+FILES:${PN} +=3D "${datadir}/bash-completion ${datadir}/fish ${datadir}/zs=
h"
--=20
2.34.1


