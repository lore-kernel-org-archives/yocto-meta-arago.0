Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898B4CF64B3
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 04:44:43 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27494.1763613882829921184
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 20:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ORHgYiX1;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.56.46, mailfrom: s-vadapalli@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Udw7g25WBTQf/z1QADWodnCZdnFqxzc2TBepkfq/CIWEcKF34B5UnojNMGpxNoXEffSsngsq3PUi0W5B3a+AcNm1A+1ULT6wlODnuP+0PTHJ1JDOZdMTpff4WF3VS2Vim1RUUETFEQxSIEUsgNC/hnt9bK8MwtJ4/zhh9RePI6J5xAUz2tWiVIS6p6WJJismNz31HTQRVtKKw54BAUH6DeRKa4JwjutizhXCmTVRxsFSz+Ye8V0VgWuNXy1H8OC08qgEAJh4flpvmr9dk279mu1AgbVndhSdRtobqaretrvfZzzbdiZd51ktsXnziiqP3keO2aE9SK044TCA/unZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WchOm6MCDKgX4BeMqND1CJy24v4QIdUk7qlKwrber/U=;
 b=urlXjD4CcTV+GDyAgVq4wQ8DOBEeghUXiS4Oh9afeMceNZz45cqJPz9C90eTQopCM7065q3+PRkKEfAB47IBUES/MfyumuAcsrYzHK11Yren5rGpE+bZ0ZeiXj+MSSNQHdqC4krecRjJ8+n81DXRNpN04sbAOP6gShCo3PfqZSg+RtUBhI/3XCvSZYX8Lx1y4eH6ZO4IOQdHBrE28NTFM/ONN1uX6fVv4qYzAXchf9aRBHZVXY4HdHT1FjtuvbfHrZulCw8BV3wNPfDh4kaJkPHddkMf9G1+2IlHCJeeXKyhkavwOfyjZr9BMxevN/IWPXJO6621kEIziqWhTWe/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WchOm6MCDKgX4BeMqND1CJy24v4QIdUk7qlKwrber/U=;
 b=ORHgYiX1XTCpV6FRcU4TKnAC+WVwMFibQMxLsvd6XSYaBD+P/L+OMe755uroOv4tLqbkrluXhl1sDrU9vHvDH0tDdhvWCNJE7+JjcWe/13qXRvy9fzJBzL1+/NbQFG/HWuRwCGQnXioT6r/aiPKF0kyecxXWd1Yx3gthTwCUSOI=
Received: from SA0PR11CA0154.namprd11.prod.outlook.com (2603:10b6:806:1bb::9)
 by DS0PR10MB6126.namprd10.prod.outlook.com (2603:10b6:8:c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 04:44:38 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:1bb:cafe::8e) by SA0PR11CA0154.outlook.office365.com
 (2603:10b6:806:1bb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 04:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 04:44:38 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 22:44:36 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 22:44:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 22:44:36 -0600
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK4iXur3061862;
	Wed, 19 Nov 2025 22:44:34 -0600
Message-ID: <b75531b412f4c0181255b76b8aa2e1e00006ca04.camel@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH] udev-aragoconf: remove legacy
 usb rules
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Randolph Sapp <rs@ti.com>, Hrushikesh Salunke <h-salunke@ti.com>
CC: <d-gole@ti.com>, <reatmon@ti.com>, <denis@denix.org>, <praneeth@ti.com>,
	<nsaulnier@ti.com>, <meta-arago@lists.yoctoproject.org>, <s-vadapalli@ti.com>
Date: Thu, 20 Nov 2025 10:14:52 +0530
In-Reply-To: <DECXQ6GPF1SU.1SNYQ9LW3S469@ti.com>
References: <20251118215640.249268-2-rs@ti.com>
	 <09b233298d3b995ec7b1f9595d3332491ccaf176.camel@ti.com>
	 <DECXQ6GPF1SU.1SNYQ9LW3S469@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|DS0PR10MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f092bc-92d2-482b-ae20-08de27ef82f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bG9LdjE3YU1rUFJCY1FTUVBUR0hrVWIyU2NjczlqVTRwVXYra2hHMmU2MGM0?=
 =?utf-8?B?MHVvNlBmMnVkRm1UMEd1eVBRTjMyTkczRnAxVmJUb3JUTUtWWG9ORHdKc2tT?=
 =?utf-8?B?RElZVDc4bmZZbW9zbjI3ZDdQMHBJMHE3ZHkxMVFiQ0trWEdacStYYkFzclJq?=
 =?utf-8?B?blI5bVZLcndaVmhRM1o0Rmw2aTJqeUNORjJNdlM0bWRFcllQaDlnUCtPVjdL?=
 =?utf-8?B?MTFWMnptUGFxdjJ3UlEvQ0d1U25VOWRKTEVGRDBNM0IzcEdIMG9kSTI4NzZT?=
 =?utf-8?B?RitOcFUvQ2U0WjErNUdSRG5la3o2SEsxcWxuZnlDNkxkVEs4MlN6bU9wNExQ?=
 =?utf-8?B?aSswbzJYeVVpK1c0TkNnN0pLd29lNXk0NEZZd3hLNWVwdGNXdWgyblQ2U2Jq?=
 =?utf-8?B?MU56UmZDYTFYV1FLREthWDRGRVVMNUo5WjFxaEhvSlFMQWJUZjE1UHRvaEQ1?=
 =?utf-8?B?eDlET3pLbHFGMXZJNG8vUWttSEp1OTcxVkk0MlhvbUZLRVFrTEh3ZHhpeEgr?=
 =?utf-8?B?aldlS09pa3V2bFNXVitUU2tnaUErQVNpNS9GalNXYnJzMU5kaXh3c3lNdDBo?=
 =?utf-8?B?b2JsQTRzYStiQlVzY2JNNDJwWU5SdzBkb25OVHN4T0VlMFd6eDljc251YUFU?=
 =?utf-8?B?bXZkVVlUWEYxZkJpMzRGbzEzSmFGUnJXdEtiTFY5WmFQeXA0dFRJdkUrVjJq?=
 =?utf-8?B?anlsSjluWjJ0QWRDei9CK3crQlVUN2NsU3Z5S05xRnVpYmZSeUk3VktyR2wz?=
 =?utf-8?B?SjdlQlhrUk1LZW43ck1wQ3htTlhTQ1lsTnRrWmVkdjUxUlN3U1pDNkpRV2xj?=
 =?utf-8?B?LzhOYm5MdDI5eVlmTXlNNEk0VXFjaDBQcmRSUEhWbzZTbGZyMEI4bGVsTWhY?=
 =?utf-8?B?S2pnbHNjWWt5N2pWWk5CYURnR2E3ZmxidEozS3pxWnpDUVA4KzZBUDdKTkpI?=
 =?utf-8?B?SGlDdi81ZHUxV01lWmh2anFNMkUranZUR01UckZyK3NOU3RoV1hDSHhHaTIv?=
 =?utf-8?B?N0xKb1BjTmFTaEFzQWVPWmwvNzhwT09DYlN5eitIVlhxbVNnSWpUTFNNd2xw?=
 =?utf-8?B?ZEtkcE9vanFKNitLVExlQ3huS0JPb1J4SmhoZUR6NllYSElkekpoNENRNWhP?=
 =?utf-8?B?WUtWNFBTcW1xTS85bGU0MWgxRGlXSjFXUGZpOFpuTU5kVVcwSEtNeGE1dU9y?=
 =?utf-8?B?bFFuQTZSQVQ4Zit6TUh0UVZuZHlydm4rdHQvU3dkTWpKUXV2ZEFIYjdnQUdR?=
 =?utf-8?B?T3hTVGpIYUYwUW9uT0lsbm1kZXBOaUxIVE5BdnpFaUtxM0t3OVl0aEowbjVY?=
 =?utf-8?B?SUZiVGhBMUdkRXNXa05neUdCeEpmZTBGQis3QUVVUy9SY2VSVUdxK2pUYU9t?=
 =?utf-8?B?NXpiY21LSDBQTFNobTFEQUxaaDVLazQxdjVTVnU1c0I0SEtsek5jVEUyemVL?=
 =?utf-8?B?a1MreG9aMi9xZys4alhSNFNPU0d3czltVlM2QTVTK1BOemZKZGdVKytPelNm?=
 =?utf-8?B?T3hFdVNUN28rdFNrUWthcXUrTEd2dTNyTWVwd0JJYkJHYk5KQzhvWFBXNTFm?=
 =?utf-8?B?aEx1SlUyczR0d3JuenA2aGcvZDNCYU1GeFlwWUxaTGh3OHdqc2U0alhGQkpy?=
 =?utf-8?B?RzZMQmhQSUtmeUFGaUgyRzUvR1gyZG0zRjQ1Rld2MXdWd2tWTmVnbm9jT2di?=
 =?utf-8?B?TmZJWXlESmkxTXlHTkR4WHRPK3g1alFHTUVIdUIyZFpXVVNHUThNdFYyMUZu?=
 =?utf-8?B?SkFEb1I1VnBydjNaZWxkZUg4MzlDSjF6Qm1BMmlienllR1Q0QzNlYnppcVQ1?=
 =?utf-8?B?WHoreUptUCsybXlFeHV4WUdBYXVlbWxkTnFNbUErSlZmcjdqZmV1SlYveGVm?=
 =?utf-8?B?NkdXeU5pamZUTytvUXRKNDlSRzZpWjkwYXlHYzZIYVd4bXl3blhqQlJoMGxo?=
 =?utf-8?B?VC9UTGtpT0NSME1TTkQ4MmFvUk1HVnQyL2c2UHYwVW1ML0JlK1VsYWsxWGdW?=
 =?utf-8?B?RVo2SHNjNGcxdFhpTnMwYjdWRk1UVzY4WDJBcnoyRUJIelIxcWNCMVhQNzJU?=
 =?utf-8?B?cytmTThDU0ZOaW5vV21nQlZzYVVNamhtVnR4SXZVYzZKaVMyNlFtc2d2VWZW?=
 =?utf-8?Q?/EIQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 04:44:38.0560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f092bc-92d2-482b-ae20-08de27ef82f1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6126
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Nov 2025 04:44:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16814

On Wed, 2025-11-19 at 13:57 -0600, Randolph Sapp wrote:

+ Hrushikesh.

> On Wed Nov 19, 2025 at 12:21 AM CST, Siddharth Vadapalli wrote:
> > On Tue, 2025-11-18 at 15:56 -0600, rs@ti.com wrote:
> > > From: Randolph Sapp <rs@ti.com>
> > >=20
> > > These rules do not match the current structure of the USB DEVPATH and
> > > are not actually fired.
> > >=20
> > > They were initially cited as being help scripts, but I think users
> > > should attempt to gracefully bring down the gadget interface on their
> > > own instead of relying on a script that will attempt to reload it pos=
t
> > > mode change.
> > >=20
> > > Signed-off-by: Randolph Sapp <rs@ti.com>
> >=20
> > Additionally, 'configfs' is used for configuring USB Gadget drivers usi=
ng
> > the libcomposite driver. The Gadget Zero 'g_zero' and other USB Gadgets
> > should be enabled via 'configfs' as documented at:
> > https://docs.kernel.org/usb/gadget_configfs.html
> >=20
> > Loading individual Gadget drivers via 'modprobe' is deprecated in favor=
 of
> > the above.
> >=20
> > Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> >=20
> > Regards,
> > Siddharth.
>=20
> Thanks for the review Siddharth. Could you or someone familiar with the c=
urrent
> USB tooling update the documentation for the DWC3 [1]? I'm not sure if it=
 was
> never correctly imported from the processor wiki or what, but it appears =
there a
> sections missing and the content present appears disjointed.
>=20
> A lot of it can be reduced to links to the upstream DWC3 docs [2] and lin=
ked
> gadget configfs. At the moment the only thing that even mentions gadget c=
onfigfs
> is the AM62_DWC3 document, and it only does so because of a kconfig code
> snippet.
>=20
> [1] https://github.com/TexasInstruments/processor-sdk-doc/blob/master/sou=
rce/linux/Foundational_Components/Kernel/Kernel_Drivers/USB/DWC3.rst
> [2] https://docs.kernel.org/driver-api/usb/dwc3.html

Hrushikesh, please refer to the above feedback regarding USB Documentation
in the Processor-SDK-Documentation GitHub repository.

Regards,
Siddharth.

