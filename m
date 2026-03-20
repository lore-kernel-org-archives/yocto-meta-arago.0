Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD65F1099B3B
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:12 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.963.1774044848951438305
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 15:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=mMw3tDE3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.6, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acWQ5DW5IPzE7vMp+rDJLsN3tmBf7fZf6XWn2b7oMM81hvaqQknKxQ+julEmVW9Fw7a+me2zjT4KZ+4p1xrIQWwa9m8/X91P/B7vgI5/Rtd9vLh9Bh4r6sN9uLC4w3Hb4g/dMQJ2yzPKywsqvLL+1xzRr6bNuYR4EZZzswqwToPd/W4ArcTT5JqkfpdX689isaKZD3j5PLZthO7a6Zm0fQOeY1YBO0A2lvsCuYlioY2FDmZAl+WyyyITWJpStJE1oC/HRMULfYg57LqIVgDOzyBd6RmismSJ3ylWl3HSl1ny8hs8t7DvHaynwqtMK8+rNEL20R27rT1uR6BDMmxspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKnERtuGZmTJzi7pky5PZmbgWuVZhBj0d0f4J7VOkfA=;
 b=gwx6fgylusj4DdwBTKM0g+IJ3h9v9cOrce4Jg7J8j7DDzEpxHyGKBe39WHwOROri1J3/r8SMKuXSDcI14CzXwQX7yR5Xl5gur3d8XXZLlHamtjFYiqNZTbQ50gVys4EUtOpUhF501IKYe60CeTAcOLBKfU+7kljh9jvV5jdkJhsAni7nvEg+C10kUO3ptNKA9f5WHkgOaReyHD+IV9XkJavg5bjO7do15vQewVPa461FsvcKBXdZPl4pupgKxggFC+OXkw/bOTqe24Yu1snPQmZVcbTEh9MTiK9LW0UTkKzf9ocBP8Lriir6knI690F+RQLOeyKSwBqq3Sq7eQXkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKnERtuGZmTJzi7pky5PZmbgWuVZhBj0d0f4J7VOkfA=;
 b=mMw3tDE3UPMa3K9olP8lemm/yPD6LLkkJjmtlJa7M06IcujNe2OlA94wIz3diO4cUuIWLKWQZthvftAdu+a7GKLRTzut+1arWfWpWlu206MvWzwuJ5hFuEl07RNbRNlL6bwxWdaHfBKxbnVPISwU9u9Adu/kaEArvZwZp94rEwA=
Received: from SA9PR13CA0040.namprd13.prod.outlook.com (2603:10b6:806:22::15)
 by MW4PR10MB6322.namprd10.prod.outlook.com (2603:10b6:303:1e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Fri, 20 Mar
 2026 22:14:06 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::97) by SA9PR13CA0040.outlook.office365.com
 (2603:10b6:806:22::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 22:14:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 22:14:05 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:14:05 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:14:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 17:14:04 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KME4US795322;
	Fri, 20 Mar 2026 17:14:04 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w3i6W-0000000GkR6-345s;
	Fri, 20 Mar 2026 17:14:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/4] ti-test: Move libsdl2-tests inclusion behind guard
Date: Fri, 20 Mar 2026 17:14:01 -0500
Message-ID: <20260320221404.3991734-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|MW4PR10MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 3079bd34-fd8e-4a35-d5ca-08de86cdffef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	OpZSmT5FwLqPAiaHtULoIPMN9UlOvld17tNuY4f1v1FkHcYfuPRk4mrjnzMuSvnFMoRWx7VXu9vjBaMBejO/tB4OKf8JkXB1qXXWwHzxNOej+eZKIRH7wnIP4fO5DW203z1H87VCXy8H8o5XP4oizhfQwrDjeE5WXOYdAmBhMYa9NSn10/6q4a4zOfyJ4+WbcQCLCREtF+CWAK+jVw5kWyTV+IbqsOKLNh3meNPdZT/oStzIDd0cbKptx4XFVZdnrtMQMVNWK4WJr5oyfqtpigKbl17TnMRWGa318Sl2S4/Vz1MT/I70HDTIZ54tND29V33QmXcQhjnD1SuKM16uSBk1EFpusm0ym3+O7dglc5mZ+TLa7AOvER9N26+L4ATz7PPJBVBsartlrsilJA57HkKQ7ThJwKy75dOyMld1WgRi2Z5m20YkuLpPnsc9daFZmERJ/GsYNsSM0UEUQSyu4+6tJOScDgveJby4oRaAEbsSTexAhAhtXM66+4Swjng1CA+bpLpT54VU+kWDZd3lq1znnIlveCudybIm0MTqsJWtdTQ5nXRUycWxSbQco2e1t6FKQu74OojgGlmsHk1D60A7km3d5/qbUc8dXUpkxrvaK87Y6WfcRwzIiiv30MnVzRd/IppFmCfJ96ctYaKbeTkoOHQwBTxxGJ+lppHgpyug+D9USsgjl1gWH5dml7s16DT6+HR56kG47Fr/vRh6aPe332UyAo0x0iVjtKzJLD2LBXfBBzgsjS2oykTpGW6Rr5tT8b0kmFxR9WFkWM6MRg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5/ZUDW0olg3aVLp7009IwI5hhswMsv1Wy8C7/1DAW+j5LdXbvkhX26Mm9ZLHJsN3yiVmM9f5IC0nkQSxGYi6x019HwTO1v0Qao0MP091vq+adlWV0FWkEXwu11JFGphSrX4TVSt9OMUuiUlrGAa/lCHFjCa0PE1Pq//T66sQHiHPThB740Z9TCIdGHFOuTeeWEf6jvaTOD4tUShg4nKbU0kbHTbu48MV+yFOTIueufMna7PztYqCIDTrGRoFsZNGTDD2mUwE9P+n/rQTEguwMkVZmAwTCH2W9Lng82GDogH0lyJnbFVz1jz5VLckwXaI/uJsut4HfYk5KD4h71Ezm7nTrNFyBZC0evrpstJuDUX6t+zZppC0BNpkqtDGlf1QUMnHuRbflGEiMAR7XkG9jGnyFvQQByg3TObFCe9iwRC3kbIw3OElbgHzV3PcaPHG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 22:14:05.2866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3079bd34-fd8e-4a35-d5ca-08de86cdffef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6322
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Mar 2026 22:14:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17407

Cleanup for check layers error.  The libsdl2-tests package is gated
behind a ti-soc guard, but the inclusion in ti-test is not.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index 064e3bb7..8125c3fa 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -71,7 +71,6 @@ TI_TEST_EXTRAS_OPENCL =3D " \
 "
=20
 TI_TEST_EXTRAS =3D " \
-    libsdl2-tests \
     python3-pillow \
     pytesseract \
     python3-numpy \
@@ -80,6 +79,10 @@ TI_TEST_EXTRAS =3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', '${TI_TEST_EXTRAS_OP=
ENCL}', '', d)} \
 "
=20
+TI_TEST_EXTRAS:append:ti-soc =3D " \
+    libsdl2-tests \
+"
+
 TI_TEST_GRAPHICS_OPENGL =3D " \
     piglit \
     offscreendemo \
--=20
2.43.0


