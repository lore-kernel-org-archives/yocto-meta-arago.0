Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52A6C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:15:43 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.10657.1648127742684537826
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GPGRtX5V;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ODFbNW098851;
	Thu, 24 Mar 2022 08:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648127737;
	bh=tnGdeOG/ZUCyPb1R63tSm+hoMU0+Qleusxy524YxY5s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GPGRtX5VBmOGFX0DjmrZjgy8qAMwU9dCMh7HkixUSXSEFR0TBKm8me3duR3hjxA8B
	 UVFXaB+pU81f/1T082QgkZKSSgyYXpHeQLFdLJ4dAv8yLgadmoWWSCkozsueFdSJBe
	 LmdAePuw1s29PobyfBVS2fJASH/5pcxKDD8nGjCs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ODFbe8122226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 08:15:37 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 08:15:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 08:15:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ODFb4h068157;
	Thu, 24 Mar 2022 08:15:37 -0500
Date: Thu, 24 Mar 2022 08:15:37 -0500
From: Nishanth Menon <nm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, Yogesh Siraswar <yogeshs@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH] images: Build
 tisdk-thinklinux-image with tisdk-core-bundle
Message-ID: <20220324131537.5o5lmdohvhpfkr3l@abstract>
References: <20220314202840.18904-1-reatmon@ti.com>
 <20220318134823.7rzaq2wqcfnkxgv2@animate>
 <20220318171143.GA23554@denix.org>
 <d5a6f763-4118-8208-eabd-9d4af9698a87@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d5a6f763-4118-8208-eabd-9d4af9698a87@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 13:15:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13735

On 10:33-20220323, Ryan Eatmon wrote:
> I'm fixing it and submitting a v2.  Thanks.

please avoid top posting.


A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

