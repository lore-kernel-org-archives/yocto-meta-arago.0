Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2971EC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:32:25 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.10462.1647613942473085815
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VweHNW6w;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IEWJQh046901
	for <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 09:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647613939;
	bh=u2NfX3cSfo701KdoMvRxFjU7ru0ymFi0mU3OjSkUN3E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VweHNW6w4wAUT0TylCl7swscnPRcvZWw0R3VWQOx8Pb0dDqBJZNpXEWZQpIqsdQUp
	 +ow2o3+yiiyNTTQZ06+VkEKgsq1SNtPyChwMURGF+ax4HT6iMAVfWqU3PrthoIc2/q
	 VkNdVGXhj9RZX6vICbcgMS4twJlaBrU5Oer3hLrU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IEWJkl033903
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 09:32:19 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 09:32:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 09:32:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IEWJGJ057467;
	Fri, 18 Mar 2022 09:32:19 -0500
Date: Fri, 18 Mar 2022 09:32:19 -0500
From: Nishanth Menon <nm@ti.com>
To: <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago] Patchwork
Message-ID: <20220318143219.6cxx4xvh7gg5smj4@wrongly>
References: <edd449b5-0ca9-e984-05fb-2e52615b962f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <edd449b5-0ca9-e984-05fb-2e52615b962f@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:32:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13638

On 15:55-20220315, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> All,
> 
> We are using the new Yocto Project Patchwork server to track the state of
> patches sent to this mailing list.  If you would like to know the status of
> a given patch, you may query the project at:
> 
> https://patchwork.yoctoproject.org/project/arago/list/
> 

There is also a public-inbox in kernel.org https://lore.kernel.org/yocto-meta-arago/

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

