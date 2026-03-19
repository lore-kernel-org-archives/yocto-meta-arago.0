Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCAA1090227
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 14:06:40 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12031.1773929192119056765
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 07:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=s4vMZLv9;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.51, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5XdHNoZj6lhjv+/g2/RNtIDcGvtJZDVM6XPSfyj4XP1TeG6VvuqMjGwqgNLwGWK6/0OP8t35TOSWJiIcgh03X2XuXjxDsPvByZjz1mK2ex2Hw1e6a+fa6zJVNIWOhEKSatGjMVIzLvOZilSx7AeIN7pSeX+DaJi4q8hf4z7EjlapJJpMPq4wf14E5r4sAfI0562ReEFkJBh5Z83pHXwsyimDLYQPvmCfTnT1zqD4+H/YSKwMg7pTlH+xSXFmDWV8FvwilQFzp/Br4TqztnzcpgGaWz/dMmdiu5HHS4hcyrfCWf5M0T08t3Nl2q7HugFaIdBwAL5IQECfgGZnPqPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCZb+Hi8KlPO5aTX2J/vru3GdwpSS+AFuTQBk8Ttgsk=;
 b=rUA44we9CBm0cmHr1EvmSghkqxI3sH2SWsiYasF00PnFQfkl9RzlSPzWpEIGOr2qeROl9PUvMr4kfPcbPegBgU+sQKLVPH8CZPc/zd5hnjbR9iuM6tROkduud5NPl1hUg+Ru8lbMJyNBIWBceQT9lfOQJ4+zxQ/ZCL+CWFuHHynABT9yQiK4ZP2yz6BP8Q/TLD3XCL41WMT4ypTrerwJN/1W5HvPWQWipwVVBxIT0FEQmkU/ADcMbsnGt25TF4d1lkgFUGP7YxeCWN4SW1xd//ox4jqp5qBUC+QDlBmyB0VZqmfMHCRRsdVaa+3qk7hfZk53tybYvs8DyaY5PpDMEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCZb+Hi8KlPO5aTX2J/vru3GdwpSS+AFuTQBk8Ttgsk=;
 b=s4vMZLv9kbaoK3VCxmx3AvRKvetc/HegNmj63cD1sO219jRrZvI86JU19sbiQxnFAhg7xyFiNpYV/Ya6qGF5QYWCFtzbeaRR1EvR1sep86zNKoeNtjicNVVE9sr4jhQ39ELG0G6mZPGsfAc9n4vq+XwpN/DcuFv6Ds6kieBmAF4=
Received: from CH0PR03CA0394.namprd03.prod.outlook.com (2603:10b6:610:11b::28)
 by CH3PR10MB7139.namprd10.prod.outlook.com (2603:10b6:610:127::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 14:06:30 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::8f) by CH0PR03CA0394.outlook.office365.com
 (2603:10b6:610:11b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 14:06:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 14:06:29 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 09:06:27 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 09:06:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 09:06:26 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JE6QRT2664581;
	Thu, 19 Mar 2026 09:06:26 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w3E14-00000009gNy-3qEY;
	Thu, 19 Mar 2026 09:06:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 0/3] Revert TEMP patches
Date: Thu, 19 Mar 2026 09:06:23 -0500
Message-ID: <20260319140626.2307869-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|CH3PR10MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 92da43a7-28c0-49d3-1da1-08de85c0b7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	sV5JtpIAH013cW91wqv9F9wYAa1n8nxc+lH/N295jlmsRpehHB9M+aisxbB3HC9N/ArwDXUIgp8s9lMGQTPsMMWwd5nRrZuUGdz5f0MyoAMpfcF3W+bTHL/4zg5V5TN82XHKrW7rLtcKwv17NMuUVK78o/yzS806Qk7iLzvAkze+82mrmT7Qz3jcXak7+HhYpr+R1QP38vIMn1GIkrik9b7sOwzx/ObMlohUuQ3bJxMa2hm3WnRr09H947cpqQVkjkCLmfbYgffVYpq4DnibqcY4PibpoNXJ4oODpjxgxr58W2BKfB5mjtyS6/K39HsFug6b71DZFMQGKxBO/jMlxh8Fo7KCSsfDehiGlSzLntkWO4u9CL9j2RvtRZtqbm5FuxCXA1wQit4+YCM2v7Rv0GLVMHpeibIoNJwYO/PJxH63QNrMFBdaOJjKgWth5Yp2+IvxrLFrHZek0gobZ8nzewzIwljxv3zTKhxMBlzEor6QCLF8e1Hy9DgShYutuGaWLoNLCsQDUxoIQrEshalKB+DkFvRaAD5b9V9EaEdp968fFmzi0pzbX0U4hqP+cDg2XDmQvLWj5Qt9yPHtPZ9qA0ILDhQIx8oe1LVVybyd5MBG/xfBlc2J0Ur5a+wryXa8LRU02zkHWadXtP53AVL3GBtVqkTzr6alDUIeXr8IeVPhUrHOORsaq9umqZW7dLqRaxyEM1eM6F8MU4hIcGEaCDCael9QqqPf0qa/ExJr1qxa5MYPw7lqtWRCz4dEI5sU4yTA2G+ooJEX2EURLD8CdQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6XgjVj23KW17ARkHaiGp+VD4TGt5I9cngOeaXyhKl/m4ucfl5RQolMFcbUMhwRRbU4AfjK+xVvkQjQZoP7EhKdHQ3X1vckFxig7gk+9ALbJ9f/acTR+VDbXckTSPzBJU2BNWhp87VOc8bkTO4HYL39OJ3GhMZ2Ai4Lte1IXx3rx95VTOY1quKgDOyxLkteam7lnBf4dFm8gKgfNXy+i86Ztqt8GL/kJdYJkXS1BasaVkTomfxoh/vbeo3ph6hpqSFcyBeepdr4OdBcML3vPSrTMGVh+BclV0lSNUPV7VcVoKHX2VrHXrggIPZ1saBxkjyrmKRg/U6ea9mPQuBeaYleGc921fLqVzLTbk3XA2vTSQQ8jB7nRPB7SbNiDao61UzH1jhz5AxYia1s94riBSEdBx8yC+01w1hYRv73iYlDF/hPQ3QEnQsz972l1FzKi5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:06:29.7599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92da43a7-28c0-49d3-1da1-08de85c0b7e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7139
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Mar 2026 14:06:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17403

All of the needed layers have now added support for wrynose as the
supported layer so we can revert all of the temporary patches locking
into specific commits.

Ryan Eatmon (3):
  Revert "TEMP: arago-master: lock into specific commit for meta-arm"
  Revert "TEMP: arago-master: lock into specific commit for
    meta-virtualization"
  Revert "TEMP: arago-master: lock into specific commit for oe-core"

 configs/arago-master-chromium-config.txt     | 6 +++---
 configs/arago-master-config.txt              | 6 +++---
 configs/arago-master-flutter-config.txt      | 6 +++---
 configs/arago-master-next-config.txt         | 6 +++---
 configs/arago-master-selinux-config.txt      | 6 +++---
 configs/arago-master-wip-config.txt          | 6 +++---
 kas/arago-master-chromium-config.yml         | 3 ---
 kas/arago-master-config.yml                  | 3 ---
 kas/arago-master-flutter-config.yml          | 3 ---
 kas/arago-master-next-config.yml             | 3 ---
 kas/arago-master-selinux-config.yml          | 3 ---
 kas/arago-master-wip-config.yml              | 3 ---
 src/configs/arago-master-chromium-config.xml | 6 +++---
 src/configs/arago-master-config.xml          | 6 +++---
 src/configs/arago-master-flutter-config.xml  | 6 +++---
 src/configs/arago-master-next-config.xml     | 6 +++---
 src/configs/arago-master-selinux-config.xml  | 6 +++---
 src/configs/arago-master-wip-config.xml      | 6 +++---
 18 files changed, 36 insertions(+), 54 deletions(-)

--=20
2.43.0


