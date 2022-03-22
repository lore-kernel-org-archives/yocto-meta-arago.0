Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8595EC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 12:18:11 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.9123.1647951490533802293
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 05:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EPidvqiL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MCI3Un019724;
	Tue, 22 Mar 2022 07:18:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647951483;
	bh=d//mrbHqUC/nVgdIh6AuZDHxzDpaaY7a4cRLIa+xY1U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=EPidvqiLIUKclw6uc9ADsaud024HJaW7po9SJm5YsOUKgJU4t3pY4o1Nx3xwAJppg
	 h8iFqeQ7l0sk2Vv2Y7ALRUogqtWgv7PTpqb/crf/vrrEBjZoiPjg5GAeMreLb4qGW2
	 uZgp4nes9JznrZJ+fsRtJr6iAlEo+gpx/uzjK7mc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MCI20J079489
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 07:18:03 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 07:18:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 07:18:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MCI37J024093;
	Tue, 22 Mar 2022 07:18:03 -0500
Date: Tue, 22 Mar 2022 07:18:02 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>
Subject: Re: [master/dunfell PATCH V4 07/12] tisdk-core-bundle: Add
 documentation to clarify usage
Message-ID: <20220322121802.j5ttowvdegc7y3ny@jaybird>
References: <20220319123310.8546-1-nm@ti.com>
 <20220319123310.8546-8-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220319123310.8546-8-nm@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 12:18:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13693

On 07:33-20220319, Nishanth Menon wrote:
> Add documentation to the core-bundle to explain the usage and intent
> of the build configuration.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Changes Since V3: None.
> 
> V3: https://lore.kernel.org/all/20220318184045.11246-8-nm@ti.com/
> 
>  meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> index 253bfbb68657..0892a8a62d57 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> @@ -1,3 +1,10 @@
> +SUMMARY = "Installer package for TI SDK - NOT for direct use on target"
> +
> +DESCRIPTION = "This creates an installer including all the default images\
> + recommended including source, binaries, filesystems, etc.
> + for TI SDK. This is meant to be used on the host system.

^^ Missing \ at EoL. Sorry about that, I did some last min reformatting
:(

> +"
> +
>  require tisdk-core-bundle.inc
>  
>  DEPLOY_SPL_NAME_omapl138 = ""
> -- 
> 2.31.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

