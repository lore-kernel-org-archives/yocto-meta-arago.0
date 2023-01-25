Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE41BC54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 23:16:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.61444.1674688591833191038
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 15:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wxTTtkxt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30PNGUiV023122
	for <meta-arago@lists.yoctoproject.org>; Wed, 25 Jan 2023 17:16:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674688590;
	bh=mc1IUpJkBe2KND1U1qkc+Ehdmwwurh3mYVIyk9cjnqo=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=wxTTtkxtIr1TOgfj+RDog0nda8m9gmBXb0xZxb+mRWF20xXJK5vTqDE/EAabertMm
	 sFApTC8AeN4Ry7v9HwAjzL13BXYgKLilSKcTqyZgIEW4UzjiYbEnKBirXsFZnIaDAn
	 EKZmQQ+TzNUOEYeg3AfNDFxIlqS+pCQ2VMibiD0I=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30PNGUEo123610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 25 Jan 2023 17:16:30 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 17:16:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 17:16:30 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30PNGTGi022384;
	Wed, 25 Jan 2023 17:16:29 -0600
Date: Wed, 25 Jan 2023 17:16:24 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [meta-arago] [PATCH] all: Remove excessive switches based on gpu
To: Andrew Davis <afd@ti.com>
CC: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>
Message-ID: <CZD2PR.TNCQ4U1KLWJ02@ti.com>
In-Reply-To: <36cee5a5-3b57-646f-086e-5f7e53197281@ti.com>
References: <20230124231733.2219206-1-rs@ti.com>
	<36cee5a5-3b57-646f-086e-5f7e53197281@ti.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Jan 2023 23:16:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14186

On Wed, Jan 25 2023 at 10:33:27 AM -0600, Andrew Davis <afd@ti.com> 
wrote:
> Looks like we forgot to add "SPLASH" to the list below, if we ever 
> want to
> add this back it should depend on MACHINE_FEATURES "screen".

OE-core already has a switch for splash based on screen if we inherit 
from the image class, hence my removal. But I guess it's possible we do 
something goofy to break that. I'm not attempting to untangle the 
package groups in this layer at the moment.



