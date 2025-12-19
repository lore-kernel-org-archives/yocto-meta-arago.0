Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42669E668A5
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 22:43:13 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28247.1766184186757341697
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 14:43:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=SV6uaE2m;
 spf=pass (domain: list.ti.com, ip: 52.101.201.17, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCcnB96Ys2JS1FKGx3FVWPuLlmqPljJz2rpD5VffMLEZ9skOFUxAMAuHqtLPWXkTcjYCSsxvFjCsGR1mNU//FLEAGwzaSlOU8SHumCYEwoootvc/DmRMj7Ci6JsRBBlyiaEa1BcUERJS7tLNisbXe+nGVtAT1okPY2VCjUMs2fcMveQZi2OHEEJ9YTFs6DyXZifkUuu93ixSonmppXXRQ0Ex2M+jOybh2UMMiXmExF73kBnfw5UwJ/XWSAPQtVP9WinPK0PoccavPYRMXPsOoMSuInhRdHW0WfEeR4DxnUOeYINOCRbt40gMw5ycAYoe0EV8hd3C9u0EuXnZB72hPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3Q/lkg7WeBu6b6dszfL7JXQhJiw7TuWO6PfxJTUSNo=;
 b=chGZr/Oz1WrlAilDfhCrLtI3pt/465ySr9xVj7CTiCxbVovQXvdd6N8xeQCc4kxxADrC/fNFYGhSO+yYoKmgJdoP21GklFhoaMZTHwjR4uIStzQwQhWa6UBuqTpYK4d2L1IXhzcW6Fo9+O5h9EKQcTx3w7/K56//A8CrBn+nn0rS3rUElRvu+SPtDfTWjI7EL6dkTQ47/jV2SYapQ4Sp4rHBcKrQR3d0SUVvwAW8upeYGakkw2ArTvqBHUKIWikT5+GvLYEcdp+hQTu6MVLwVnKSb6MPetWF3woH77s4OIhsgxAuwnJR2wfPD/zNcfxb+czhy9q3pV+XRSTmzVI+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3Q/lkg7WeBu6b6dszfL7JXQhJiw7TuWO6PfxJTUSNo=;
 b=SV6uaE2m5W0fEzm4Q103LT2+FpS8rYuBXen3zEPPha2jJFCsyh2jQeFVQePtUrRQgz+iSVmWpguSp84haMw3YJsyrRPafSNLtZ9m+pyqT02rtalOe4JzCYJtUYDRN4R2Ujyh1hjwaz4lmGZzAE4FakNCcMyJirWgF6Kcj4ili+0IBK4mFdndLVLd/mc9EHcQcGft+VXnI6RZnYV3IUuXOl0TAyLgY2wa6/soMFmAkaY1gFAuDf9NBl/8tjkSfvtO5jqIM+YpfdOjagsCbSO2PYTfbFZHOkEebQVVk90jISEGBK++WoxFxx/rzv7TFcwbFWDOhMkI1swPBQ5DPOcsxQ==
Received: from BYAPR07CA0057.namprd07.prod.outlook.com (2603:10b6:a03:60::34)
 by SJ0PR10MB4591.namprd10.prod.outlook.com (2603:10b6:a03:2af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 22:43:04 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:60:cafe::66) by BYAPR07CA0057.outlook.office365.com
 (2603:10b6:a03:60::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 22:43:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 22:43:02 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 16:42:58 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 16:42:58 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 16:42:58 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJMgwwn2543181;
	Fri, 19 Dec 2025 16:42:58 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 5D6F22A61; Fri, 19 Dec 2025 16:42:58 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202512191404
Date: Fri, 19 Dec 2025 16:42:58 -0600
Message-ID: <20251219224258.3145180-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SJ0PR10MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e80140a-c316-4dbf-1338-08de3f4ff7b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BAmsDrSRtuGC9+mS67NfALipQs4clAHrEpghoVXVIZEJbL5k+I2oHKqryDXz?=
 =?us-ascii?Q?IWunRdyIyVXZCNcLM5jbQMyKcSl+MnADNXJba9FElD+i8QUGHBj4CZcid9GX?=
 =?us-ascii?Q?fYZvr+Tq9U2X2cEKKoToq6S9smB9TbyH6FqyrL9Y3PysM2V3EdczjjrRAz1E?=
 =?us-ascii?Q?5ddShTfhIYCIlxJLpaiHeY9DTvwpJRPZ2/Xck5gz3I72ZygKb49MyCjz/DIe?=
 =?us-ascii?Q?ma4bfuwgb++XMH++cOYXB2+/8XkCk6pYFlSZ6CGOmLjlQhdnwjVmKLL6AKM/?=
 =?us-ascii?Q?houl07iDNSH+CepveB30TNYniCzCXWTGQFlNvBdUtjZDy1mYSdFF/TQbA8Qs?=
 =?us-ascii?Q?95IPISm75J8Ip6Xf/r1Ylq0k8S83xgxOtNlaW8PJ0HyzkNCPKPWPzF2FakYJ?=
 =?us-ascii?Q?Hk0TPahcjHBLXaBYyGt3VcRDixgQAt4py9lypwmGh9hFk1aGXtSSwGZQWzDO?=
 =?us-ascii?Q?OtbiseyNME04KeEiEkIyqLHNYUtdnuX+5plveAPpIoVB5r4LA+wJQoaRW3u6?=
 =?us-ascii?Q?PyTIdR6ipPc0zsQz8QqKMIEOwP0cXWRy0AdtaPGpb6Ii99n/903kjxDnSnNA?=
 =?us-ascii?Q?ctpotb2H8tvPIciLbDjBZsaNmrq+5MHNYG2EvlzsQcEicx+RKLTbrkVmRnLp?=
 =?us-ascii?Q?LaLYY9L45qX487lHSUty6jAWrerxYmQqIkVu4K5nOAvnCGSKepvZldZAisre?=
 =?us-ascii?Q?U8O7ACn6aYiXBcgFdXdk5VcB2MFq5g2vMzE58DD9hcasxjB1IriAiHBqLvW2?=
 =?us-ascii?Q?bMg2TWhqrpAatKUk+rSGGvln/b6VP+Nle87U62VSIMNUaYZYcLtZPyiCSOqO?=
 =?us-ascii?Q?KQKYAFFUYH7SXH4Z8pYBeOm4p0KmRlnqSF4jpAENyUvmTWxVCz3AZnkmZu5N?=
 =?us-ascii?Q?0aaU46/6b0L6Z3OUUj3KW9F4G8f0SJqSVfRpzqsyBOxTrbnCDovXnUsbHj8e?=
 =?us-ascii?Q?+yp8zEFKcKRgOTzrJyRxRwjui5O2sj1OpDNqw6/6hxYNBEdN1mxU+KIqb5t7?=
 =?us-ascii?Q?/sYFIm9Avb+VApO47e1sn+39PX4zUrvqaXXUG60ou732QQivwPcXlIWoCWOO?=
 =?us-ascii?Q?8zJRC/Rv4hwHZq7FPwlv6ZcCeGVZMRAW8wsGi8fE7OSwf3xDxC5Xfz88Wvh4?=
 =?us-ascii?Q?bzB4FdE3z2lYBNWUxMZIqqkx7ftmXpS0Eq22JlL2BYJ4QHv1+yDQlSFTJqLv?=
 =?us-ascii?Q?buCe02I1Mk1dp/DZOdQsCZfqwnVj7XUcfpGcnLpafpcYpxOcx+6oN4hfLweX?=
 =?us-ascii?Q?pHVMd1hbDu2Au919+sllUOMFXQi0tEaE5VPnnuG5g+dIooe2wpQQcBIU4aaq?=
 =?us-ascii?Q?GE49YiPkcvLoBeIBHdd6iiXxXhIeWvlq4RtuV1BfIHrz6AqbUoS/ullrArK0?=
 =?us-ascii?Q?/K7dJoYH2aV6DkcMeD95EVtgP28UwwPC1QpHSurm5oKVfusOV6KdyW3/F5Nj?=
 =?us-ascii?Q?j9eqv12MsgPQ4CkEfNvIIPia/2+nNKhp6JNGBC1CVR4BCptFKwO4E74yV7oV?=
 =?us-ascii?Q?Cr+bAdTb7SDo/xl+x2vzzp8H0sWbpVrpYJ7GvAZQU+ePjTdG9bJ8KDW0Bslk?=
 =?us-ascii?Q?0QZ+fWDD/vgB5ggj0YY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 22:43:02.3052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e80140a-c316-4dbf-1338-08de3f4ff7b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4591
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Dec 2025 22:43:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16901

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3Ded7695d077a74c374a38bd1e605453c731ed31ca..d23395da4e67855a7d7ce476e44f7=
9b8e604998e

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index fe16e12e..d92bfb9b 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -9,7 +9,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "ed7695d077a74c374a38bd1e605453c731ed31ca"
+SRCREV =3D "d23395da4e67855a7d7ce476e44f79b8e604998e"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


