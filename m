Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52AC107BCD0
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 17:11:29 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21055.1773421886255269881
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 10:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=GIXYQY43;
 spf=pass (domain: list.ti.com, ip: 52.101.46.26, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWdLMXL+WtC5htMXnaibhHzQrGNgVL17ye4TBEMKQSBhZmD0LQkbDAOYsZIUQf6BM3ggF296oy/i9WIdtuhTAB/JLx+VV57w87QXZRoLBkOAVonopnCYWhMIoeFJx6CemWaJXb6MRbTpO2vHdckV+vxnxHNUsk5ssZIQmbMyPg1NZPN8YAPCczIyqRdtTBrMJ2s3smcMgXwYRzqUJA/nTWTs3XOVGdZdCWst+uUb02TxtasSCA9+PIId55xgLLKfZRX1XO4TAf6ukBlXQ1SxB1dvRZHji0KCSjkm0+ji19VTYyNlg9aHjj7EDK9NWc9mga83yrfBDTIOMum9hWOt1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ruwb61b7Ed8qdAwPIUqPKPGfjXFhFL8AKeI8fqkkWUI=;
 b=Fe63A44Q2lUR9B94GtwuB44mDsqSaQ/g0RCowr8Hvy85sjBEKVLp6TanMx7FOMa/A4nqrPzY0XciLudhj++1o62opCkc2mP8dtbSl28MrLJOdcJJZtgWIaV4QYhw6A5O6IZzwthpFvR4EqxTEHF8pu7APQR7LEGA0oeyax+uV11d1lhTbMkTFwsmdwZm0H9c1vynxqbjVVtdpnqk20zjnUhbOKx+q+IjiAhWS7J7ftmdpSrhepaew4SLnMfN+oYsaZ75qWTTANRfTfd5Na4zk/C31npb+D/KGqiVugN5bRLE76Goz8tgNq7bRcRScLY/LSRXH/AK7y/elfTfT3GhxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ruwb61b7Ed8qdAwPIUqPKPGfjXFhFL8AKeI8fqkkWUI=;
 b=GIXYQY43r08yHz3OZ8mtehPSgrV7Lgki+OzvKvbJw1yHXLNTwEW5/8AXEg0sbuHwzvfzo7fjxa2giBnXJQA7CkG8Lmc8OMnA0wDeki2OcRIVlikxABYODIWWW4pCMiOu6xUoHtqeiTtyLfCztTaBl6BD3xkzGNJWsY5t7aGHtpRHeBnSjbyOn+vZ0PyrpS9gxjmHkYL+jz4wfxrU2u4Qkzb/bE24bBTOaMQUsR8jRuB3N9vruNPkWUqYCJmbL7Xnno1+6V7b5FVj6AqK9E5M1CdxtmkuyMAOBh89FKb8pKvTWR6q44wh5cerh4gOsrkSGFXD3HkCdZ7Tadm0FnudNA==
Received: from BYAPR21CA0013.namprd21.prod.outlook.com (2603:10b6:a03:114::23)
 by DS7PR10MB4910.namprd10.prod.outlook.com (2603:10b6:5:3a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Fri, 13 Mar
 2026 17:11:24 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:114:cafe::7a) by BYAPR21CA0013.outlook.office365.com
 (2603:10b6:a03:114::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.7 via Frontend Transport; Fri,
 13 Mar 2026 17:11:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 17:11:22 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 12:11:09 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 12:11:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 12:11:09 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DHB9T3908294;
	Fri, 13 Mar 2026 12:11:09 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5BCEA2A54; Fri, 13 Mar 2026 12:11:09 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>,
	<b-brnich@ti.com>, <afd@ti.com>
Subject: Re: [meta-arago][master][PATCH v2] arago.conf: Enable OpenSSL support for HTTPS protocol on ffmpeg
Date: Fri, 13 Mar 2026 12:11:09 -0500
Message-ID: <20260313171109.161648-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260313163803.1352821-1-t-lannynd@ti.com>
References: <20260313163803.1352821-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|DS7PR10MB4910:EE_
X-MS-Office365-Filtering-Correlation-Id: d6cd2bac-8636-4570-5d98-08de81238d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	o87IOk6nGjeTyosxi1cBQYohaIqGiFLcmnIjDz3e3aCzVFMvnyV51fIQfqbO41hxmhTzBfNgYXsTvvmck+ZLPzr27cg7VwlYqr4hg0/bk1bpJCTvWh73kLwcXlh0a/PHLyPNUW3GD7sS3h8Q0aPxTlOyj+iKmJ8/CvJj5/I6gSiaOzFG51rltpg7SBo+fgZtCvNEbu+kejf7NZaNjwJA1tluvBCL7pwcnpPnSGckAmYGcePx8Y6JXUZhLfAjcO95uv2dvTwVce2WbkSUrCrQ7Mj+ZiwK226hoeg7IiO79UU47W9vzPk5UXOnBmQnCcnrdkWPY/dp9FgQbBE2X5RjWQR3Kh4Bk5xs4PUMxBkQTSuTnAyWzLb17yO/cQ0lirD0gvWBBAH3eMl2ZsmfJFVxULDiO8Z7j1R0mJvk/19jhA4qi6aTUyCAaoV9aRylclTSC9+FEkbFBgl0882iUU9SJDm2GJnk9KcQQDfAbC8hoGymDQqxLuxtRr53++vHjEPOjEsx/M1f/dJBPVHKs4wm1hSXAC4CIFNDGLJbsNYaEqgivtHKItBT2WLt7QtUi0zkgrVfqTd+EIFpMFCKS1HqxAbe+Che6JmTt2rsLAmFT+mcjuzWMAdCCiRibvKceDwEgoJljOmkEyX1r5j0HNX0uo3U5VfocD6/P5nSQIjflHbR0YDfvOXFzA+O/9DRf+Ew7kHRFHeD7dmSLlE8K7uLVv4ZZqf7Sw8xjGL5V6A5jtQhVPhbCi6lg/gcjy773TKgUOPdfP3o/y7td8wnbDc1YQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UdoHwot96Fucs26vpe1oIqNwRqOObvKc5+6tQw38kck749F/A+O8cjOZhYZlfhJyR1rNIE8HvVawZl6QDnItNmWORUFTfQ9bJBX3P92jIRUR+je9GjTND9QBy9ytIZ0iUVuyUOxUr0W3eQsBpRqfAiVaOH+JGUBBuNbJ8EJRdf5c+59ZbMnrsWkdRRBSMOVg0fyqXIf+E9uICUdwoKHuOKbU3NIIbb43/fcD76PSuZ9ITazTSgU0bPgS+325gLLIEStI9GT1giNJoGUVAc1xoYOIX0CjuRnmDAi7GIrd4GwPX+FKK2zXrscdYi7v4089mMhQOcWkmUZnZrhK4y8svhoMH5uzZITQ8sa6gC5q0AEKPlCP5xeA8HZN2EYYZXG2d5KZZsYAq1bO+HkH1nO808pm+alHZ5+mfHHb89vBum5krLrSaNY7HSCiv1pIaN7Y
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 17:11:22.6118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6cd2bac-8636-4570-5d98-08de81238d48
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4910
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 17:11:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17336

meta-arago / na / 20260313163803.1352821-1-t-lannynd

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH v2] arago.conf: Enable OpenSSL s=
upport for HTTPS protocol on ffmpeg
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Fri, 13 Mar 2026 11:38:03 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e989fd2037ac6ce5dcc302c77dc2d41c2=
3bedc5d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202603091800
- Commit SHA: 27f3d88f1cbc33e107604da7df01340b8a67620f

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing RPROVIDES 'weston-dev' (but <build-dir>/sources/meta-arago/m=
eta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk=
-target.bb RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
ERROR: Nothing RPROVIDES 'weston-init' (but <build-dir>/sources/meta-arago/=
meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics.bb=
 RDEPENDS on or otherwise requires it)




