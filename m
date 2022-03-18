Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D6EC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 16:07:51 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.11362.1647619670008369386
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 09:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TKtw8Bzf;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IG7meV070627
	for <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 11:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647619668;
	bh=ot0T5T/uqd/OASUBM0+5GY3OMk+xdZ5KJtObQiONwmw=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=TKtw8BzfWmjo9eqHpUBo1gq9kjB21ID/ddV6p0MQXSOfnUlL0NKtm0FzG4krTNFdA
	 NKl1zDU3Ir3Jc6sXfNKA39dfkfkdUshb7Gvt0qLgt1I5SCN80Mq2k1XNW4BYV68SZZ
	 QCSYjLp67QSqLNA4NlQ4UqVkVkGdmfRfC+q3zLs8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IG7mGi008497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 11:07:48 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 11:07:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 11:07:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IG7mX2026361;
	Fri, 18 Mar 2022 11:07:48 -0500
Date: Fri, 18 Mar 2022 11:07:47 -0500
From: Nishanth Menon <nm@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: wiki
Message-ID: <20220318160747.ywfzjcasoj76u53i@gratify>
References: <edd449b5-0ca9-e984-05fb-2e52615b962f@ti.com>
 <16DD80271A49B4DC.17931@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <16DD80271A49B4DC.17931@lists.yoctoproject.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 16:07:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13653

All,

I have migrated a few of the wiki pages from arago-project.org to https://lists.yoctoproject.org/g/meta-arago/wiki/Home

I am hoping we make some time to clean it up and update eventually given
that arago-project.org will die in the near future. if there are any
interesting ones we need to keep alive, do reply on this thread and we
can migrate them over.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

