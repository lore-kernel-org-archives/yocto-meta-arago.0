Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D97CAC587
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 01:42:52 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.4968.1757641364688200021
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 18:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fuu4SP3M;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: bb@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C1gdnp928421;
	Thu, 11 Sep 2025 20:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757641359;
	bh=5+TWC8sAJ3ZmTIu+CKsQKPa6BO3dt1RxUwjQjo9MmDA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fuu4SP3MpsVeKnT+8tR+xtLWWFsPJfUGOZg3J/NXApHeiWk6MUhJ+t42X5k33orU3
	 I701Yz11gNU6t8nFhWcluX/daVmloi4sWl2Xu3ZtjT/e0d2XSHN6fYtgdiQEtz8WEQ
	 9pbwlWQoyrRnMGBeuRrUx7OdF93q+kHolYZwuxvk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C1gdAK1627540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 20:42:39 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 20:42:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 20:42:38 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C1gcW82834737;
	Thu, 11 Sep 2025 20:42:38 -0500
Date: Thu, 11 Sep 2025 20:42:38 -0500
From: Bryan Brattlof <bb@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>,
        Praneeth Bajjuri <praneeth@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [master/scarthgap][PATCH] hwspinlocktest: Update hwspinlock
 recipe remote repo url
Message-ID: <20250912014238.ybfmnyi7enifv2y3@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250911210645.2142573-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250911210645.2142573-1-jm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 12 Sep 2025 01:42:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16573

On September 11, 2025 thus sayeth Judith Mendez:
> The hwspinlock module is still not moved to git.ti.com. So a new
> fork has been created to add support for am62sip platform.
> 
> Move now to new forked repo and remove patches that have already been
> integrated to the new forked repo master branch.
> 

Why are we marking our own testing recipe as inactive and patching it. 
This test looks like a prime candidate for a kselftest port rather than 
punting this problem for each baseline forever.

~Bryan

