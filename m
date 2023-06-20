Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E75EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 19:07:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2865.1687288049739195983
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 12:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=c/yTzVcp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35KJ7NpZ097192;
	Tue, 20 Jun 2023 14:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687288043;
	bh=gXLzVDcRADRT8WDJps1eFKWCNdkCoifTVrj8qTGNOoU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c/yTzVcp0KVTHyvQ09XbYxD27xggMaBWzlerXutOmYH47snKqqq0y1KjBUXJnWlox
	 +FGSqLELRD1Be155aWsRu3BMHXoaOQXvjcnyvnTOe3QfxJta59D3JRqA8hrIDm60yG
	 RxYh/TBlOEb0upTDsLPh40uxxd6PzzwyPo/1Wozo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35KJ7NID028501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jun 2023 14:07:23 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 14:07:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 14:07:23 -0500
Received: from [10.250.36.99] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35KJ7NxP095290;
	Tue, 20 Jun 2023 14:07:23 -0500
Message-ID: <9ef1f6e6-6ee6-e6dd-8b1d-08188a71cc5e@ti.com>
Date: Tue, 20 Jun 2023 14:07:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [DISCUSSION] Flutter Enablement - Meta-Arago vs PSDK
Content-Language: en-US
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan
 Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <937ef202-c3dc-6e5b-963f-def28a4d130b@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <937ef202-c3dc-6e5b-963f-def28a4d130b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jun 2023 19:07:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14660

On 6/20/23 1:44 PM, Randolph Sapp wrote:
> Hey,
> 
> People keep asking about flutter and I know there has been effort to explicitly enable it for 9.0.
> 
> Should it belong in meta-arago or meta-processor-sdk?
> 
> I can see an argument for both, it essentially being another widget based UI toolkit, it should belong in the same layer that enables and adds dependencies for Qt. On the other hand, it's a higher level tool with some interesting dependencies that not every SDK may want to inherit.
> 
> What do we think?
> 

Do we need any device specific fixups to enable this on our hardware? If
so then meta-ti is the place (I'd argue the Qt fixups belonged there too given
they where specific to our GPU and without them (for instance Poky on meta-ti)
things did not work correctly).

If not, then no harm in enabling it in meta-arago, will help with
build test coverage.

Andrew

