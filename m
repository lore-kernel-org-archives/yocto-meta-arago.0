Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3222EEC2A4
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:30:05 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7241.1771885795573160587
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 14:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=JlspRLGI;
 spf=pass (domain: list.ti.com, ip: 40.93.196.46, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MB4R+GodGZaxMDjHLiycay9gJPiTWKSSi7L+OkydrBKCgeDNDW5tWmq2PiYFTXBhN7HSTNYijP1KnYSygFVj1TLLNzEikcSikoGLHbxvFLHjMX7hnlkbLmOSzYZfz75XwI1Sl8hOWyrwDVKLe1M5ooJyixufk8AQCfioJmeXRt2o315t4Ylf/OXEtigxtDu6bHl8gDoQcOrCaiToWg7rA5VrSlmQhAjOgdi0OZrNTO9TQmIzWr4lygXwDnapUbsJxjjZLJuaJIaz7SmBLdlXVilqQjUm5GJl5J6bVyD2sWfjcLTr2CU1tzowONFumzGP7kCHx4bKhTx6rrnmzjrSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiV/6PWnsfh0oOSBAq+oqlq/HqjsrKhiDnQ9bRUgHaE=;
 b=VnxQCHsR07jStWBm81KcDw6cNvKXt41Idvq13u7IYyn0CsuGTHIKFQli32XQzEx4VMX3cgwVM/GHhm6wzJdZUtVCHxuiimN+9YJx/1bsIc3hK5fT+cdIY5NAmAMtQgtq2STSEgTwJkavzW3b9SUn6DMajHtoUCbNJfZCjOc9T6lNHK6fIuyk8vNxRzqXPJSXSqvbFQfo9BtmPI6bNLwUHZAkAsTGdn/fJesKhaNyqatUXO+pniwgwLJ9tr24h7m/NT66TyElgkGasEXGW8AkjuM6b8YW7GeVZm9NQFieKTc7gTtqTTKy3c5WajrGqGo7EY9xprmrxRJGbN1t4dOjxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiV/6PWnsfh0oOSBAq+oqlq/HqjsrKhiDnQ9bRUgHaE=;
 b=JlspRLGInuJQMvL+sYKAp5itzzQyUdzrQeBePX15j6RgIM7PbDA54ze+2T7OhmVoqnWYbwUwq4QQ+mcpje73SRXVPKdlS22VvrjZLMabfCxeMsgHA/82ZGPAknvJ+/0wuxVMB0Z1H2FQSmHmSQ2OLaDmLDgeIWOgIqRfPHlNA2x9IlexV3C3+BEi0IWVEJNdr632QvstrJVLi6l8buSjBPLwhMJKjoLJyFvusCK+JkOChyqCELpS/ULa8NQFzYRitJhY5z/3RaYDSVu8L40gVdZygsruudtp3prihRmd/OasXuIhaBheqP1JxyzmC+xbjvdmjueJvFavbEgQmUL2iw==
Received: from CYZPR02CA0014.namprd02.prod.outlook.com (2603:10b6:930:a1::16)
 by LV8PR10MB7824.namprd10.prod.outlook.com (2603:10b6:408:1e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:29:51 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:930:a1:cafe::18) by CYZPR02CA0014.outlook.office365.com
 (2603:10b6:930:a1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 22:29:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:29:51 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:29:50 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:29:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 16:29:50 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NMTodH1112331;
	Mon, 23 Feb 2026 16:29:50 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6121C138B5B; Mon, 23 Feb 2026 16:29:50 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] *: Remove unused patches
Date: Mon, 23 Feb 2026 16:29:50 -0600
Message-ID: <20260223222950.3371873-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260223220731.1224087-1-reatmon@ti.com>
References: <20260223220731.1224087-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|LV8PR10MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: aedd8f51-6112-4de8-b1e9-08de732b0f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NFd/JglOLD5avBp5PoR1h6U20ntSD5XJ8Ze/rCdhWJQE5zf6YnW8Vqj7n6aZ?=
 =?us-ascii?Q?AsXWQGvx7oQ72H6bpgOR7G4/xpcj0dEwW8mMHDejp5nuuLX+SczM1+aexiMT?=
 =?us-ascii?Q?kmyImOcV5ys/QmnCSjQIkEw8A/YAwNDCfiV4EVFPI7XCjZe/YQLkLEkBLWO0?=
 =?us-ascii?Q?X0jLuVvNCk3zsKlTVPmHwl2ICwoHCSi6exuCmkw5W0YRKXpLJYQKwILBZHss?=
 =?us-ascii?Q?VsBzLgGKsq/LtyKo8AoAlvVcGmJwd1x+tlrFSKE5k9EIUbh40nXBzHE00xMR?=
 =?us-ascii?Q?MqvKsT/NGIi4DgVW3U0w1Yo89o/UhYkFQrBzz7wTsxj/rPDPcarg7S3Lfotf?=
 =?us-ascii?Q?8V4i/dbnd9SimWuZo9ZL9w1wS2C1eHmKuQjhvdsBFhZ+quqpr9rDTaTgxJd0?=
 =?us-ascii?Q?W4tuurVly8hzeK2Jfkv2GYo5aN+T+wz4pGHUl7oO4A7DcIcV4xApJTTmkxup?=
 =?us-ascii?Q?JWEVKbNok+cGVLHwVx5bi751kl1AAfrD1cPtkc7rGGddRvjAaHbUUrnrF4KG?=
 =?us-ascii?Q?0qY3fgyVYXAcjwRpSZymSfe/c8+1XK5xbQNG9jnRqixEKMuuKMAWhtkpfqqO?=
 =?us-ascii?Q?BAl8/T2x73sJtE5Y7Pggv8j21iGjc1agoffmcT6ZqJFPgGOMztIv8o6rjXBO?=
 =?us-ascii?Q?YTPC1dOI91dZY0n/btSh9yT8VXO4X8Wmxm3oBmWyQNOo9EkhQ/8cFyyLGJiK?=
 =?us-ascii?Q?e1VSE2VqLCcZT6k7Ba+B5iKerGnUesFUWieGBbplKvdwxQIui4DROz+6cv5j?=
 =?us-ascii?Q?fR4SoK/e7uAyanQzRXw+8nBlSntDhT5zeofSn1hubpXvpwqHxKLfRhavP/J8?=
 =?us-ascii?Q?kXWcc/VdCcphEFViHULWmhI1nMv8d8jHmYCzQwFpgM9h9a4uaOTvMd2k4TQA?=
 =?us-ascii?Q?iM1MCWApMtsH264ZVXRxruaiXMjNOrLnIKQ5hAD8T4k2oRo22qIjMMwqa9xs?=
 =?us-ascii?Q?bhgvyRTGjm5JO1XHDFaeL2ItfxNACccnCl1rgCbQOreY7vc1rZcPL2C1HloN?=
 =?us-ascii?Q?cJCwKpRfDZ5ee7LNIv5wjixZm4kY9mVjWjaF1GfCGqWHRuyt7dT2e+RwBuG3?=
 =?us-ascii?Q?J3vFnUV3v/SZdI5V60ZqvYUbf61sdSwsXd9Gv9BlBB5upWz/YzMvIZbTJwdf?=
 =?us-ascii?Q?XOivYbjY0owp1S5Nh6tOOr7GMVyz8z04KH9oyW4rqHI/Ksh6WZ2y8WzZNBk5?=
 =?us-ascii?Q?zTi9ek1ibZlm7cBh20MpHoawcuOhvvpcq9pB5Axjl03pUPJ8RpaHDXe//bzi?=
 =?us-ascii?Q?8o+pkCLe5iiv+HQfOtDnHTD0d3fpS+zPw35DmuZhL5PzeOFt7k+kT/t/dxw1?=
 =?us-ascii?Q?reBQPsZmhI0u1vZomn8UefMGRXpd01i/TPaREmfNoehOq3a4f9isZ4Bvj9T3?=
 =?us-ascii?Q?08Ef/jTEs35pZwhchzyzaOFc+6SPRxCowka6h0Vy1UeFqv0n0n8rOTYuCha7?=
 =?us-ascii?Q?B41ZKtzezIAdJvKPLoVIEIocJdI9Z4WFbsFHTVB1uTqaCGeRbD8cbo9Vackf?=
 =?us-ascii?Q?K47DzB7rKUXd3JwGUv9DnBga8hmuXFvab/E7IcNfFPxIA8GkejU21DtSlSzq?=
 =?us-ascii?Q?baaxYUefuK9++mOv/xPdARM9vramfi03g3rDg6I9oLTpvBnDiEViZPEfzwxu?=
 =?us-ascii?Q?JRh8BPPiu7YUD5V5C/3KI5BdV1kcArsnbHtVsUs85jBb?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hrtJx2476Q3VrK3WxCFX9k9hBS8j/QOBOKHUxtCdCJ+CsM+pwrMbaRZ+z6lp5y7h4rTB/wXrZn8rI1E3RRNBABQ8oyCgBmU42wkzDTswjFPnLQzebelxZ4YEErm+j/mh/S6jkcbICkq5AcyVzYol5CroUt93TzcVgvMLsAUhB8aKu6++oVLS65K3qYGqEDmLfeM1rp0SFzTIj7IWISsZE56TTZkMS+BdNDC2prMIAMqlfpxohH9wGmrfLA0/fvHOOuYs1IBgyz8HdHGtKfkutDZQH9AtGR9Kk5rJh+7hvXto9Y3vvgQGIwfChERwmK94W3zLktOyV/7eMiusz7VVQPX6bMFAC7QTGHyEPCjV3a0lyfmHdDT1iPLSoWT2IdK8SRTHRHPe3x7l1v0BhjuEvG3hgmLB1fQH01uS+75gM0vuKJ8mNZOYwe/OVCJq0TO9
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:29:51.1389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aedd8f51-6112-4de8-b1e9-08de732b0f64
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7824
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Feb 2026 22:30:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17135

meta-arago / na / 20260223220731.1224087-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] *: Remove unused patches
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
-From: Wei Gao <wegao@suse.com>
- Date: Date: Mon, 23 Feb 2026 16:07:31 -0600
-Date: Wed, 12 Mar 2025 10:37:01 -0500
-Date: Sun, 14 Dec 2025 02:15:20 +0000
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a5b9a91022e7734a098be655c8c01cd87=
cb292fc

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Brandon Brnich <b-brnich@ti.com>
- Commit Subject: gstreamer: Fix CMA Exhaustion in latest gstreamer
- Commit SHA: 92479493d820fd6a617a4605ed2612649f0c4aa7

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
ERROR: <build-dir>/sources/meta-virtualization/recipes-containers/container=
-registry/container-registry-populate.bb: QA Issue: task do_populate_regist=
ry has network enabled

ERROR: Signature change for container-registry-populate
   container-registry-populate:do_populate_registry: f61474a7d29d8198acfc6b=
2114ead84532cd60880a168f8dcc054d5c9a3e2c16 -> 7ec2edb3b42764d8e8dc9f7380895=
851afa5cc050af7d6fc665b2d2cffd3e052
      bitbake-diffsigs --task container-registry-populate do_populate_regis=
try --signature f61474a7d29d8198acfc6b2114ead84532cd60880a168f8dcc054d5c9a3=
e2c16 7ec2edb3b42764d8e8dc9f7380895851afa5cc050af7d6fc665b2d2cffd3e052
      NOTE: Reconnecting to bitbake server...
      Taint (by forced/invalidated task) changed from nostamp(uuid4):cdf8be=
a1-11e1-4ec4-9cbf-0c9eef4546e0 to nostamp(uuid4):5b83945a-7130-4aa9-94e7-ff=
dabc7117ee




