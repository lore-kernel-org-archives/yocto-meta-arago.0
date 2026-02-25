Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A32F5543A
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:11:38 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36939.1771985496364961101
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FHNmMyzU;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.43, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=halLgb/n/SX2k/kq9DQP+OZ/X/YhpCVwNKI+rPW6dbRLDC2nY1HKcDu5X/pg2KZ+RowHew4da5NI9bW+paxZodZeIgiFM44vflTBcWkkG9z/TuUwIIvct6BP/hfNzQDH9p4sVVq6roJbZj53PzGMQ0V98Hy0H7lBYCM7PefBboZxFqH9HxnfYrxtj5pgvRbKDqBk2bTbQ+fNPnwyhTCIU9ZFPveGtfjyDjX9pRgRmdy3VBlSSoiRA0mD1kD8Q8UGvjQ7W4gSnediH36AeViAqoPF/+Q1sUdhfHpgWGtpWxd6cM1lUiCj4eTJiaJknj9VdnQ7UKAtf0e6LJ41HjwjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ju+4+bl1gP7yvfZApBE8FgTi51HWZUZ5jKxuL4v33M=;
 b=TeglIWqvIR5+W67dEXaknpI2vgxJ8zHSvvJoPxJbbdKy4Cgh68rWfo8UeGxV8vHQha1P4bavmuDBfK+cNiTF5pDuJPPTi9DLY5fO27+6wAj66cQ3LLk+NZ9mweOwTTky0BbnZRn6Ek3ShTBeOVGzXs4QVJKu76WxW1KX+Emfl9jozQJSnZIyLXJkyXO9u1am+Tr6K6+diPBv29pqBHzhkrGvqg69UJ3fInC3RMdHPFhAi3Flv2Y4Ypi1HV/TugHp0nFc79rMRlmv0xzgMVZXwJlMn+rvRqo4W7p8hbBnNsVpYx0zWOoRxQB7Qoe5+B1NFLPIBPf27+JCRMhAbqlNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ju+4+bl1gP7yvfZApBE8FgTi51HWZUZ5jKxuL4v33M=;
 b=FHNmMyzUJBrCezdLV6Nwt2rkWRd0V++3PGbmCxlkotPdcDpV8jz7ARXvs2ERrh4cl7d7KtT9Sv0xjq1v2dYJdRS0GcJBKOqlfupKVRrCXZJohpWxzTCQ+fu20aVDJvKRxDypWOe/GZ48zAORBnX3w0dxFU8SnmYUGJUF7FSOD44=
Received: from BN9PR03CA0945.namprd03.prod.outlook.com (2603:10b6:408:108::20)
 by PH7PR10MB6130.namprd10.prod.outlook.com (2603:10b6:510:1f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 02:11:32 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:108:cafe::ca) by BN9PR03CA0945.outlook.office365.com
 (2603:10b6:408:108::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 02:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Wed, 25 Feb 2026 02:11:30 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:10:57 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:10:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:10:57 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2AvKl3787185;
	Tue, 24 Feb 2026 20:10:57 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vv4Mb-0000000Aip4-0ofM;
	Tue, 24 Feb 2026 20:10:57 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] arago.conf: Tweak a couple of settings following oe-core changes
Date: Tue, 24 Feb 2026 20:10:57 -0600
Message-ID: <20260225021057.2555571-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|PH7PR10MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: fb84229b-f3b4-47db-c178-08de74133114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|34070700014|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3W7tYvv66BSTG9SY/nmofJm42YkM4Ky8+cRF2Qph9SOLdQL+a3kqrvjKjpnv?=
 =?us-ascii?Q?UuDUePZqu1/+Pfs01zpXut/vf0J/zePu7XKNFDW9BaKAnTQum4w1hGSehzyO?=
 =?us-ascii?Q?+RNR0roD43r7/kxNQcTNzwpd5FSBcsRtLwJFA2+fDh4OFU5PNqgWoyViiWia?=
 =?us-ascii?Q?+ZDbBuQrwI0o1kgW/mF266W16i/uj+SKGCTKJiXo6fzhA69nqSIEsbr3U6ke?=
 =?us-ascii?Q?Re0eCDB6jxjcXEWg4h0ijdyNND/ucsPuupmVmef21EXkcuJ7WhOLtPcvSdKc?=
 =?us-ascii?Q?GHgLqy5qKMLSzk7egYySiMAi0Byh6YEJhMNrBZU0BgVLAQnWxmAtFD44h+Ez?=
 =?us-ascii?Q?CGLaGIVYjISKvyl1qyW9WeAbJMPvoFcQdmlUmFazkuXXzUloK9wvBUOxYImC?=
 =?us-ascii?Q?6Qg/hHtrgXE1vYygNht1XaOL/5WZswwUCIRmdyz5A+geo3Hf93bu4FLdK9ak?=
 =?us-ascii?Q?9w43N5Ms3IDpzSIR2LX1h2cFz0oa1BMCMb87tS3XarRBHBFlA7ENTZxmvufW?=
 =?us-ascii?Q?0rWfLjt3LxAfioSDVzh2R5XSuPHjxM5nkaScV9SAZGfBSgtCvmgKJCg1gcAy?=
 =?us-ascii?Q?Gyk9cvDHVW4CZq0CoRtECw/fB+jZ+Zs8ZEFXQdfY13LdyrAOOt8zlCuFojdV?=
 =?us-ascii?Q?rfqSCzWk3MycIIxBd00WEfNXixSr4NqsbvdHSLfsggtMHGL6VF9NxJMw6rGF?=
 =?us-ascii?Q?aNm+/Og5XeDRDxCIE7hHVLJQrXQ+CBqGBbUiVdRe7m/7PA8DZ39F7/coo+pq?=
 =?us-ascii?Q?pZrRuAzVpjteomHN7G/Bhz9ynQUxQaPzYFA/WPrcK3K0lKsU9aigq4EZ5bqF?=
 =?us-ascii?Q?qC3GSGwIMV69rAlfdzYyqSzoqQXIxRop8ncraQ1r32dO+hDQgWWf5FrSkd7x?=
 =?us-ascii?Q?0lDcPyVVHxWaWr1zTSmCOqxNAUsMUuvIFbyXCRSNZUdPd+m6OSGTwWJEQhn7?=
 =?us-ascii?Q?Eft1b2fJrbmFy7YMhz7vLHaE6D7FiyeTWXHM0A2R6qBE6I+rNzdSRuMmCAt8?=
 =?us-ascii?Q?7oi9xCU4rZb2aDBwMY4+8z4OQJm71HgeIR59x8UgnHE1WSdravT/mx3oLy90?=
 =?us-ascii?Q?Sf0fMlRkH3+uJ1q7+duhibjecHbwI9JqWmUTmjXNlqYac1Fd/of+CqL5nvuU?=
 =?us-ascii?Q?HYwqdOeCVeANjaOcdExKw1zJQnFTEO7iYDu2ExETYMu+spNsPBJSbltljLt+?=
 =?us-ascii?Q?R5KNc4qC7i+QtYxGUvv1kaF7xHnUDHYScEu1gZnsvOaMNeiVLB2sqzQZSSzB?=
 =?us-ascii?Q?yq6cSXQgp69nMwkZ9V9Hn0r1oi82Ho/rid2oYb7krdZ1hA7qC3leUaZnCkWq?=
 =?us-ascii?Q?UBlBNWbJe/xR8+ZSUKyFI0AYqlpUxB+vLwdKP7RVGCHHPPj0vHQnIjGh6SnS?=
 =?us-ascii?Q?c5+2y12MouYL1+QomOAag1rbpAgpIvy0ldNiWYOFa0e7JyXUZFL7bIxJxeCi?=
 =?us-ascii?Q?PW4b4goTyRxq2FICS/pgoagkJLY7hH+By6piHYv6aX5w9dIjNrUhdB5MvLIB?=
 =?us-ascii?Q?jAQK0qx0s0PpKXSlfeJrWIF4+mCEQ0Qbx7mwkPKHn1jilKbp2/l+FM5NOdrO?=
 =?us-ascii?Q?LmIB7HTLTUKvSMqX0j1HCsbz6aDP/s/IAzMSvkLHPlxb6lmiGID5yYsH5fOQ?=
 =?us-ascii?Q?Lf+acbvlOWb9Kbsq8jZNtatI8zfhIUs77elb0/KWM8KWYPMlNMUpZ14IMRN0?=
 =?us-ascii?Q?I3bXvQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(34070700014)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	q3VlLEYQdgTj6TsIpNbhUJik6UWVYKz/VJNmmVmGJEZBgyGyUQaLiqpILYab1Axu7l+oAtvLqA7lY1pp2E81D7vH1OuQ9fAJ97iSI27AsYj1vLqh/GfkL6H0xahuBUnD+noc9zEvHemgr4YITHxmYaalji+X5T1S9N6DUY1I/M2Pj7TEljknN/bH4rt1HN18cDzCOjn2RM1qF+QP+wLoIcY73Qidfp5QpP7Cu2/VAqdz+SUki2pxbfxAzCCj8pZOL4m8Gt0GVWjmEMmzXico05fwNlxxEHvpz1/FERRl0hQZw0H4A6lAC59dP4ivtqbBu6ZR2hS1qonyuitKN1nrFIxsKMqvP9AQiok5fhJV+pKcolanGvdDBMGoZBAXHLKoZbYjn6IZGMgd8GaUtJ6247MA6HbrKlh/PK9+KHJGios7lI9DOpFqPj0qROBRAzF5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:11:30.8284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb84229b-f3b4-47db-c178-08de74133114
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6130
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:11:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17142

oe-core has made some changes to default values for all distros [1] [2].
Target a few specific packages at the Arago level to back out those
defaults and allow packages to build.  The changes fall into two types:

- Disable static libraries
[1] https://git.openembedded.org/openembedded-core/commit/?id=3D03fc931bfe9=
ea3fa9f33553e6020cbc067b24291

- Enable tighter compile time security
[2] https://git.openembedded.org/openembedded-core/commit/?id=3D4c2d64c10a5=
b0437ab1ea04df22386f0f95124d1

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index 17c6fed8..691f9068 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -153,3 +153,13 @@ LICENSE_FLAGS_ACCEPTED =3D "commercial_ffmpeg commerci=
al_gstreamer1.0-libav"
 # We are working to reproduce this error and submit bug reports for this
 # issue.
 DEFAULTTUNE:armv7a =3D "armv7athf"
+
+# Some packages ship static libraries which are disabled by default.
+# Add support back in for these packages.
+DISABLE_STATIC:pn-ti-ipc =3D ""
+DISABLE_STATIC:pn-ti-rpmsg-char =3D ""
+
+# oe-core enabled tighter security checks at the distro level by default,
+# but a couple of packages in meta-ti cannot compile with those.
+SECURITY_STRINGFORMAT:pn-dsptop =3D ""
+lcl_maybe_fortify:pn-gdbc6x =3D ""
--=20
2.43.0


