Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D10FFF6E76
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:34:26 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86518.1773779665323012426
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 13:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=tOJZOXdy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.22, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rm66w+/GvcMRcx4aj367JmGRQcreWpsUoUxNubB5u4GJsDNjYZD8IXTdqrykqebSFqpPjNohJCqzOrykhQ1oQUkPBpRKt7j09twSe63LoGS+HjLYM/fUubDNugpnxVQxTj7jwTXfruo2aK0NL/gfh8ezpuzWbybA9pUiraaZKUKAe8YjuTGIk1JHR4Fl57W33eKyg7ylcLDWCYD3BrBNbhN2CTD0cMgsumIQ79WlFDj03pafoEv4FoU0fMgMDvqJvSmKV/6ktWHFpCF+N17jaDCn0xcKCkg3o1jeyyPO2U6FjiXQNNpfeT0xhzsWHnFpdHa6Mh5mIWW7NkXIMHyHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4WT8PXGaQbtrBh6WMdaAZGGI3LBcVmHQZhkJpOdU0U=;
 b=FWTgrcDyUiKlCD5iPh7Lc6Ns4nGjsH1dI+6esh0XgIX83UiOsefJVNOS+LDNZpQ9FzXyqkpoe3UQknFaZaKL7r1jDGxiL40TH8hhR+tAw42eTakqu1UaU5ILDsN7tWyMes9YY8xZGGd1khHdoAVYYCehxlRZs4aoG2ZZvAhHhqDr5UAFFkVRhetpwZTJon2IP74Fv4Y44wXHeVBMO/xpanwWomZaAT2OOpWJoJLtu9bl34NPbXpr9jXNp88sD4i6NIxt4uOULkz6aAgjFRXyii/IB9922a9pdqKe02dpp2/7be9DrM+RX0WRRJwDG8Pl/nmzv+6EsSiH7uKIOLJOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4WT8PXGaQbtrBh6WMdaAZGGI3LBcVmHQZhkJpOdU0U=;
 b=tOJZOXdykxlZ2H2zobk/mvQy4kxCiNYscCYXeE7ZihQscWsmdIujhL+CXZUynoarfh5Qh30mFIaLrOfFvCHtEDuOqY5JPC4HZP97VrKRCDqoJqUiI8u0yL3p8v2P6DgciEahWhKaFNywfYhxxT8BspihCohtnwjreyREGbgdmyQ=
Received: from SN6PR05CA0031.namprd05.prod.outlook.com (2603:10b6:805:de::44)
 by SJ5PPF2C6461432.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::799) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Tue, 17 Mar
 2026 20:34:22 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:805:de:cafe::21) by SN6PR05CA0031.outlook.office365.com
 (2603:10b6:805:de::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 20:34:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 20:34:22 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 15:34:15 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 15:34:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 15:34:14 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HKYEl93802963;
	Tue, 17 Mar 2026 15:34:14 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 2/2] ti-test: Add libsdl2-tests to packagegroup
Date: Tue, 17 Mar 2026 15:34:14 -0500
Message-ID: <20260317203414.43798-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317203414.43798-1-a-christidis@ti.com>
References: <20260317203414.43798-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|SJ5PPF2C6461432:EE_
X-MS-Office365-Filtering-Correlation-Id: f7415478-5bb5-490c-33b5-08de84649265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	TNmO4XOF5DbWaV47C9EjhZ90EAy7x6z/61aP1dr+x8QPWQ9tGIhtWmoFnbRUvE4XCW5XuunyVc2DdaY74C6djLsDVZOB8x/aOUynek805yQiIIc+dEcjuqLUIgNSVo/J6w8j+A3HCSla7POwClYp9t2U1P1+IIOQXTXd1Pnifwk6wDWkGILvd9bysjmjlxEssIdaTaxNrVc6YENqWLLDZXolyv1nFHy/1LvzRrL1KlHaurAz6Mrjoodpqz0If+HwwsQr8YmHdI4nWpjPEfz2zpGpzU9QOwrWSvH688gXBvh8bkJO5KYZmg8isWfx+oFuIa8+oQAy0HJ20lJoVn6NmiLNSjpDF8w+3bzYJY6j9P3NLbGABl3UhvBIKqnDjlLU0fcsGafx4KKGwDleN8mds7JERUZWWop0FCE+wyjB/0qhupcX0h28O+OBGfSyQxp56QLGCJmbtva60i/Hl5wZKdLw2PvA8JfGWxxxV+YEwM6bQTUncnb4mUBmUw8LsW6y0wsEpMBKQvI10wbB0d8kIaoZq0MnwhsrkVe0G+rTVgrnk3+/8jMZchCBttyEujgch0IvUkNzpCZTEroVGnSzLY+A/uY/IKDTsSgVob1r1n4U48UizbHUjUFLI6w1Z0kMRA6BJ2uMCvCDtd/LqbnthwctdKJMsD0mO0vRlllaYqfmd37P8HBxSMHZzEC1NwZFV4Rhpv1afWzdmMf9W8H5d5CUIjoR/YaNEVAqTUYt0j5TrTQqkdMLZIapitfaiX8jF42+F7GTUsclrc1wQmF6ww==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	y4vKaNXH3HbeCASGF5nb0JWphTHmQSF0ePhrOsoGK76kWrdkJ0EIdGtRpLT156NzOevaWL1yyOrzWva+Tw6OEqGEr3F6kZVb/WpUB5DpBh4NzZDtkbly+3sPQNdOufFd6lNt/4wd/f5vaJRI0TPeg3vwllAnIGvT6V5e3deHNqkIRyFqSQLV+XwYx6rWaj0vbvImOmKi6eVjVcRbOFvJOaRrCq/R8dTP4OP6qd8Yf4ecZO++KKPXk8PbOszEGdSD0ydLRNpeQIgn+xjYw671SDYgHro8wfwQVIEgSNQ5wCRY/J3Z2hBPgF63RYCpGevpdPTyZ2PcMQQYTFA8NyedLAQ8tUhkolZ/GqIAS6raqkZoWrLbuRIbNLRV1+pGI9MAmJ9r0ZfmJ2zJRX4hsE7lft+KXRRmIiyiWfN/TrungjP8OZqetpYZzg2S+vh3najG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 20:34:22.0224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7415478-5bb5-490c-33b5-08de84649265
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2C6461432
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 20:34:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17382

From: Antonios Christidis <a-christidis@ti.com>

Add libsdl2-tests to the ti-test packagegroup.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index b09ffcd9..df8f1323 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -69,6 +69,7 @@ TI_TEST_EXTRAS_OPENCL =3D " \
 "
=20
 TI_TEST_EXTRAS =3D " \
+    libsdl2-tests \
     python3-pillow \
     pytesseract \
     python3-numpy \
--=20
2.34.1


