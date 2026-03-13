Return-Path: <danishanwar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4ED105F79C
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 11:37:12 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13805.1773401826719968977
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 04:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=iw40Us1j;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.4, mailfrom: danishanwar@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6GsbtmYWyWv1PhFA3kM+NWtITWXhFx+hBgwAtNkHRnO3RPAyf1+gS+Qtt0axA5M0AZdKnJ1bFrzhPx7J3D+Iy3zqyeQQeHKwdDlNJ8iWz7bpJjmSyyiKjmPZUOXgnNxtJRw1capSTkJnukOq+XpgxEc+cDUFFb+gQXbx4EOIzGvhoXLX0PqFVB+EKVys/ZmcVOZuMDP8VPltOf2y/yi3mYFH/6W5duN7urhNOJPiFoctPp9kAHBwPTGG4cEXosmzpuUoLTxI3ERxKyaU7oU3phTrlXWaYfFVxhifR5t88gHpQzZDrKe1JRxBiz7yXPy23oRJwCeggE7BVDydiPRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfHYhQhbigxpEGoBte0q9YGkhDUrR+BcV7hnW2pvdUA=;
 b=j+DA1GiKYoEyfYl6Jx9bDwd6jWpw1f+fauVQ1GnC2rFku6ZXNTAbRTMMSKtHDlaBVai2HLVQCCeUNnWdXWRr+ap1qRdwoJQLw5ChZw/5fUU7D4S0qzDs0nUXxmfAjo5Eo3XggT2dmmkndpsrkeVMhbG0txWvyQVtAk1/X2Ugulwmq2kSPgPPDrOd2WPVHyVDsOWoHxh0asijrOgksEoab8QKi8emQv9ha6nhPLMHI9fNw4RDknG0//GmqwcTUuNuKwG91FW4Jpj++byavfHPZEZk0iKOUSiSDq84zmOYKcJfS/7TEOuL/VNHmh22ji2tbgMKXSotm+aMj9024ZSWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfHYhQhbigxpEGoBte0q9YGkhDUrR+BcV7hnW2pvdUA=;
 b=iw40Us1jAGfr9dhTL43M74r68/gxJxr3jbAH6BO3tjAQXI8AaAoOH1LAkMd7HpuFlRMuVEKAVhN/7xVV2qsm+L+xFcAi6v4/Q9SFAPhr5fwlOaRcAEWn1RXp/zRXMBj4S3sBsehD0uxeXmgf19ghUcta+lY/++O32Gb2z2IyjMA=
Received: from PH8PR02CA0016.namprd02.prod.outlook.com (2603:10b6:510:2d0::25)
 by CO1PR10MB4659.namprd10.prod.outlook.com (2603:10b6:303:6c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 11:37:04 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::48) by PH8PR02CA0016.outlook.office365.com
 (2603:10b6:510:2d0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 11:37:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 11:37:02 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 06:37:01 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 06:37:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 06:37:00 -0500
Received: from [172.24.231.152] (dhcp-172-24-231-152.dhcp.ti.com [172.24.231.152])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DBawsN464947;
	Fri, 13 Mar 2026 06:36:59 -0500
Message-ID: <67127b11-c24a-4d6d-a9fe-6a8e598dea39@ti.com>
Date: Fri, 13 Mar 2026 17:06:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v3] linuxptp: Add support for HSR in
 Linux ptp
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>,
	<denys@konsulko.com>
CC: <c-shilwant@ti.com>, Denys Dmytriyenko <denis@denix.org>
References: <20260311120943.3524472-1-danishanwar@ti.com>
 <b3b60c92-b328-4b8e-9868-ec3cc6885c24@ti.com>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <b3b60c92-b328-4b8e-9868-ec3cc6885c24@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CO1PR10MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: 3338f1a6-f1af-4672-10c2-08de80f4d85c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	KJF1iHDthGQE1ZTG+eWFC8veJJPsfFZviJxPNribIz8f1QLSKrXVCRoM+r/RehZDCqQMJ8qwPUSo0SSLaX4n+htfrKIvuIM/hxS5RVsDvQfaw9YxMDnExRZcyX6vilxyMqTyYV20JmymeG0oZfb9ZzfTdmV1InNMRlssvfDLfmqh0aiS5WnMF/TwRWOlca2uigtv4LM3Ghctfmxny7B9mbIsfp+kGpX3tnOTHiDUScxFoOWfoSrZKuSWiXgWR6MZaUqa8CWFRs2LdpWtIwP9jFKdZoDuCCWykkqWXQrug1U74xZHRQiQ6FwwamPwZoW/bX450GNhQgAAeMNFSkWwse+x2RIMtI2xvPCZnAE4Uc2u659iIeJKPeuQgD/MComBYD1conlofSLL/3OvNgLT5OS96BCicvEBEP42m8VXp2cA6if2zl2ZsWJADkx4jCjM/5Vs6b3w8jVrIcg96jQxs6GmNHdTWPIBcK6vnp/Q93TCw5fftWl1OFFflVUHBW+zmDINnEynkwFX+nrgqkPaycBCZ38wLL92ETuTM3JfJ2M0jep8VnTDSRnff/NYs2TtEXgoHPoFEY4HImnUcP3XkOKtcwuhq5/w/FF8Ml7WHiENBvmsyEdJGX5O8NJXVfGp+X+/aA0s4kgz0WgkaE+PSqTODUsi8iWwuBTemlYFkU+neao0XJRLEVYaqvBtRYTB7JPE2fcwmaSg526XL+6XolJr6kkx4+jxqczFT5yKyMo0rpJ/YCQZKhQLyGZfL8wQA6hjsXdnskAZ0iSaqrXzvQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fqXRsiK81tyk6qhQj+39lYpLqtBBfi0ZGQHEfZk1PqHMz2KmO+QxPXW6RkZIS7lKsjTsnO8cXMhy8Aqxle0XG+kConzoA5artPWS3f+Mh70DYWCVRVUoleIft8q5gv+YVdJhCgt9LXZ3XtupYcS8pI4GMWyzTMWMdenrD3RuF24yfUPDdw5f/wFb6QlJ0O5hA4PhmhEViAbtqVa5/0rnhqnpkgg2F+SOBfsdAT0mmECQVz7CpvcB7yFcYnRlZRjacY6h9r7sevRjX+VJxy9bv2hOoAAWVJGiUdw+6QyZiNHpxmNi5NhKznw8F7LMpVhL24wJeWm3/XZn7byHqtge9bDQ57Tyr5hQUVGPM8Jaeb/mHnT+UBxi+p8Myor+GwAM8FIf1EHLiAm0RVzMnXsvWY1I36H8L6/VYIci57V76xltkTQOxC0wluyF7Y7t19p5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:37:02.2690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3338f1a6-f1af-4672-10c2-08de80f4d85c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4659
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 11:37:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17333

Hi Ryan,

On 13/03/26 12:27 am, Ryan Eatmon wrote:
> 
> I'm getting build errors with this patch.
> 
> ERROR: linuxptp-4.4-r0.arago0 do_patch: Applying patch '/scratch/
> jenkins_builds/arago-master-wip/build/sources/meta-arago/meta-arago-
> distro/recipes-connectivity/linuxptp/linuxptp/0002-port-Add-the-concept-
> of-doubly-attached-clock.patch' on target directory '/scratch/
> jenkins_builds/arago-master-wip/build/build/arago-tmp-default/work/
> armv7at2hf-neon-oe-linux-gnueabi/linuxptp/4.4/sources/linuxptp-4.4'
> CmdError('quilt --quiltrc /scratch/jenkins_builds/arago-master-wip/
> build/build/arago-tmp-default/work/armv7at2hf-neon-oe-linux-gnueabi/
> linuxptp/4.4/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout:
> Applying patch 0002-port-Add-the-concept-of-doubly-attached-clock.patch
> patching file clock.c
> Hunk #1 FAILED at 151.
> Hunk #2 succeeded at 1350 (offset -44 lines).
> Hunk #3 succeeded at 1428 (offset -50 lines).
> Hunk #4 succeeded at 2320 (offset -62 lines).
> 1 out of 4 hunks FAILED -- rejects in file clock.c
> patching file clock.h
> patching file config.c
> Hunk #2 succeeded at 355 (offset -1 lines).
> patching file ptp4l.8
> Hunk #1 succeeded at 902 (offset -10 lines).
> patching file ptp4l.c
> Patch 0002-port-Add-the-concept-of-doubly-attached-clock.patch does not
> apply (enforce with -f)
> 

These patches are based on master branch of linuxptp. Is there any way I
can find out which branch these patches are being applied to?

> stderr: ')
> ERROR: Logfile of failure stored in: /scratch/jenkins_builds/arago-
> master-wip/build/build/arago-tmp-default/work/armv7at2hf-neon-oe-linux-
> gnueabi/linuxptp/4.4/temp/log.do_patch.1134123
> NOTE: recipe linuxptp-4.4-r0.arago0: task do_patch: Failed
> 

From the logs it seems like it is applying to `(tag: v4.4) Version 4.4`.
I will try rebasing the patches here and send a v4

> 
> So this is a no go.
> 
> 
> 


--
Thanks and Regards,
Danish


