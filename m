Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B5BCED62A
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 08:10:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.11199.1728461430699602064
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 01:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qsK3dW4u;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-vadapalli@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4998ATsm087942;
	Wed, 9 Oct 2024 03:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728461429;
	bh=7WusVQG3rKYKyBtEmk3euWjpDl+wDp2go1gMeLEgbaM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qsK3dW4uCU0C734XqxGcJ+eR0FpKwDN55XjIduHZ8uYjP0YiI//NOdhwFXNd/0bWk
	 q9OQJGxg7KEXkaVO/nx3t5wHY9O8qaiNH59TRAWeJ6CIhQExh0JvkM1XT219TK9e8i
	 C8bH1dXHcZy+Ce6yXXUqp47GfzqP2Nz3do6dyPb0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4998ATsg005294
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Oct 2024 03:10:29 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Oct 2024 03:10:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Oct 2024 03:10:28 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4998ARcD044482;
	Wed, 9 Oct 2024 03:10:28 -0500
Date: Wed, 9 Oct 2024 13:40:27 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Chirag Shilwant <c-shilwant@ti.com>
CC: <s-vadapalli@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [EXTERNAL] Re: [meta-arago][master/scarthgap][PATCH]
 packagegroup-arago-base: Add lldpd package
Message-ID: <829caf6e-e6a8-44d6-b6fa-dcc2d044cc8b@ti.com>
References: <20240927084635.1182552-1-s-vadapalli@ti.com>
 <98ae4444-e803-4f69-b5ae-4c6bd9ff4af2@ti.com>
 <220aee0f-aa10-4073-acb5-1311e2096e09@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <220aee0f-aa10-4073-acb5-1311e2096e09@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 09 Oct 2024 08:10:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15566

On Wed, Oct 09, 2024 at 01:37:03PM +0530, Chirag Shilwant wrote:
> Hi,

Hello Chirag,

[...]

> > On Fri, Sep 27, 2024 at 02:16:35PM +0530, Siddharth Vadapalli wrote:
> > 
> > Please review and merge this patch in case of no concerns.
> 
> 
> The patch is already pulled in scarthgap-next branch of meta-arago [1]
> & is waiting for a cicd promotion before it moves to scarthgap
> 
> [1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=scarthgap-next&id=30fb90c42c4fab9cc7d5a6aa2a57f97d2c4fb956

Thank you for letting me know.

Regards,
Siddharth.

