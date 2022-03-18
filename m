Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA64CC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 12:39:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.9018.1647607185255202867
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 05:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JPxsoLXW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ICdenj003538;
	Fri, 18 Mar 2022 07:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647607180;
	bh=ALX7lwARkK1qSOXHoxKb162q6dJGsUcia0q4PPsQ+IA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JPxsoLXWU7JRqhsGP7azj1uBzJSneeQftfYbBv0dqGwShVOME9cvCx7j1O1pIsBwY
	 WC3OCF9XlZ/puaUnX/iCxiQZx9VoDPsduyoAm9V5IVcxAUzHODN1nO9S7YF4+2/2g0
	 NKrF6kCGzQJ0iBnjH0uFZb7vQyy91y9ZLUFSveQc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ICdeee102866
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 07:39:40 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 07:39:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 07:39:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ICdesw003469;
	Fri, 18 Mar 2022 07:39:40 -0500
Date: Fri, 18 Mar 2022 07:39:40 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>
Subject: Re: [meta-arago] [dunfell/master][PATCH] README: update mailing list
 address
Message-ID: <20220318123940.ui2op6krxd6msizg@showbiz>
References: <20220311215928.60477-1-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220311215928.60477-1-denis@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 12:39:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13636

On 21:59-20220311, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> The mailing list has moved from arago-project.org to yoctoproject.org
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Reviewed-by: Nishanth Menon <nm@ti.com>


[...]


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

