Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2F7FCC07B
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 21:15:09 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5103.1772831706876230757
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 13:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZqJ7/W+0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.24, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5csFwC1Mxqf8l44WFFxGEHqgIQlVas2JsY4V8Vj+PWRm7I/0OVUewQFbO61zQmZ5odvl8gbcVomosptEXSFpaJvH8EQM+HpBndtqaprfpt39EaYP1dX1m2yEMCkwLj+AuGDL9as9mbw7/4GsTjBZI/1TNCR4pgbq3RSOB7WKQjjhkJzybcWxrf4acOK29zZCUplq7hpfpIL841P7yMirvpPVX1Kri3EEGzYzdpox0xLEZjDihG6FBuSseEXrQBdUZZiL+Fmfml1bFrKsH8tK4tUv2ZlaW0txviTMWLR7Z6IFGqmTWedX+yTLH/jWbfX4oEssJWbJ7MYg8++zC8S1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVzN8N9OxmkW9dygivtZJz/lIZ3Zlehk4uSePOcaK5s=;
 b=LLrBtkfCqV9xTuBD6pCwSxTGiBSpA9gFFcMytk2sQNiZ4MyTJOdiwQDn5cKvGue62qrF+SOd+2FWfTZl9M2fWWAye3iiUlv8Jm7yCkdX8fjec39WN1z9/y/LXWf+WlJqLuO5F4npkxiySZvWi4NxRctZbic3RCcfeu0ke6FI6zgYya0Hx33T30bkNd6wyGJBPHiS/GlMwFUnPPWcMrhNv8yeuafXaiQQfBiWu5x97ejQngdaOJnGF6LOp9gH+v2JaiADOVRgEHTMvwxZLIOc2x4ZOVVcpPWutOw9NfDUX1AJS/hBrVuwcAVq+g3aTTC2DS8u/W5+HnrSWs2YQ1ChCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVzN8N9OxmkW9dygivtZJz/lIZ3Zlehk4uSePOcaK5s=;
 b=ZqJ7/W+06qiWvphLzTKY+xk6D3ssC3JdfdcOtU5gram5n5SJEeSq1abcehjlyvTAWv7ksVd0mEJBoS/W0xw8Qg98r47BFWKRjRDln1Hf7mdE8B5oPNN8sJMnbtMC/fvF+yrHgKELtDks5/avK3zdjBt6wZ6YtOrUks3ajlh43YA=
Received: from SN7P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::27)
 by PH7PR10MB6481.namprd10.prod.outlook.com (2603:10b6:510:1ec::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 21:15:05 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:124:cafe::f2) by SN7P222CA0018.outlook.office365.com
 (2603:10b6:806:124::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 21:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 21:15:03 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:15:02 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:15:01 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 15:15:01 -0600
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626LF17P790991;
	Fri, 6 Mar 2026 15:15:01 -0600
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH v2] ti-test: Add request and websocket-client to packagegroup
Date: Fri, 6 Mar 2026 15:14:47 -0600
Message-ID: <20260306211447.882107-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|PH7PR10MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1eabd8-f50f-4158-7b62-08de7bc56efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|34020700016|36860700016;
X-Microsoft-Antispam-Message-Info: 
	o16Fas2LCfzrncgMgFLy6ouObbOnPnxEN1k1wVt3h+9XoaxQp0hXuHDPQeKQHdAmwityja28XSzBf39UUIqGHzmjBFUgGskqX15XVMPTs7V4stNvYg5sBKGV5HAe0xEiYoJ/9maFJ15F/n2bwa1n5nMlgxgF8FFV+dAxulDEpL1P251w9vFHOq0susmMLAnobQwV+JuQ2N0TKjIAE1Q8ZonPLzvs8JsXRLzPd5UdsIn/uHJZ9N9huQ5LSzO9U31hF+JiUUo56vcbH/9Godzus946TA22gDewYdzh9tBZS/HqvUKpvzd+hbNZ6PT497PWS/kW2xrG0Da9vemv37TsXMJinX3wOp5rxGvSSlUPW3P2rSB7cUUgUyZtl93jABpgtqjqvzRRJzbUtx5WV1/aGOUsDXfvfSY4D/v5LbOXtuF+bJOT6hUCHXkC+7e+bSDOn2w20OpD+FyyUPolWpXNdZBDzsy6+H+q0nL+s7FuVuqNWaCoZZN1o76oOkQMspvdOapyq1wu0n7OdVRm0YBHjZc1p/4pai/re0E01asJeVfkE1laE19RtIf86Y6byYJ6SFdLr2V9V5o8DMiWMDhvCaKP78MpyNY6Czh7/IvXEr9k8QH3YOOVfzBWwdwhSHLbV6eeZmOoiHmFmtnyDfnVXpsD8cX3cgYbby/mtTveLTzPvDUxTNVQUX8+HiyRUWVnGcS8FU5hiC8NK36P1ULMkaqfpAezHqdCGCQnwACpMYdBsAYQcggj7xSi3v9qwyPXw5r1gX7mJFfTGq05OoVRIQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(34020700016)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yei1bWI6en0ceU8+No//WEUKmTpL2GVCRf3JbVN8UQZNebtkiksV25pz6j04Z7Ee9YkUujgCoCGOs5Y1sNvCfXKjZ5tl8UF0oaasRPwWCamFqcRKuKqJLP42ZcMe4ia7u7GdF53Jl7fu+UdRsaHX2w9L/4AW3zywoPXSFfjAp6rm/inPhFhK/ewQ1eL/trI/hBbT61/8mbgnmk6TCnetaGVasLiY1iaIUADd9ZI4UeQ+U7zOyXVo8PJ462kuZ/XtF1z0IC/tnJvfEngugWPqASUvZQcQdZ1yVHveC+pfhbqzaPtRT9k+13TGrgkVg3Yez+ULBaFeePytJzXLZ5dwDmGwQK/U/VXczPKXqzLLzqiW7PxncxAKHBnp3yu8wfpaXiGKTJ5v7DNKmaVyPwxfxJy5kXJwNe6Ny+fOGb9ixVQAOTYOGgysZMrTIRAhDEQY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 21:15:03.3775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1eabd8-f50f-4158-7b62-08de7bc56efd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6481
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Mar 2026 21:15:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17278

Add Python packages required for automated Chromium video decode testing.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
v2:
-Rebased off latest master changes

 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index 65cf7f1e..b09ffcd9 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -72,6 +72,8 @@ TI_TEST_EXTRAS =3D " \
     python3-pillow \
     pytesseract \
     python3-numpy \
+    python3-requests \
+    python3-websocket-client \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', '${TI_TEST_EXTRAS_OP=
ENCL}', '', d)} \
 "
=20

