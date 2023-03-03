Return-Path: <dannenberg@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D67C7EE2D
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 15:25:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.26169.1677857136807315953
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 03 Mar 2023 07:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=r1UWe4Cw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: dannenberg@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 323FPVSS064227;
	Fri, 3 Mar 2023 09:25:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677857131;
	bh=ii6yNNAmPjay5IR96n5RAmbHJjbtdzPpyJk/K19N5Jg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=r1UWe4Cwu4iMFeB7WlYDHmDWnJ/OfByzYqmUoJfEXUXW1iLvlXMgv3/29V8dgLFK4
	 eP60nGcdCvKKx9aPf6Sq2z5EJVp+1rjYeE1TSCIjdTuosZ68zn13s4cIrnLFkq32O+
	 GkWJn+uQBIZypf8nF64Ue/bVMDwU8RJ3H7JuoJNs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 323FPVQq130398
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Mar 2023 09:25:31 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 3
 Mar 2023 09:25:31 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 3 Mar 2023 09:25:31 -0600
Received: from dasso (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 323FPVtK089366;
	Fri, 3 Mar 2023 09:25:31 -0600
Date: Fri, 3 Mar 2023 09:25:31 -0600
From: Andreas Dannenberg <dannenberg@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <denys@konsulko.com>, <afd@ti.com>,
        <reatmon@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-arago][kirkstone/master] ti-rtos-firmware:
 use nonarch_base_libdir for firmware installations
Message-ID: <20230303152531.bmglvgy6ckbvypbx@dasso>
References: <20230301225047.15898-1-dannenberg@ti.com>
 <20230301225620.GR22689@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230301225620.GR22689@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 03 Mar 2023 15:25:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14248

On Wed, Mar 01, 2023 at 05:56:20PM -0500, Denys Dmytriyenko wrote:
> On Wed, Mar 01, 2023 at 04:50:47PM -0600, Andreas Dannenberg via lists.yoctoproject.org wrote:
> > It was previously established that we should only use nonarch_base_libdir
> > for firmware installations, see
> > 
> > fa8035fc263 ("meta-ti: use nonarch_base_libdir for firmware installations")
> > 
> > However there have been some regressions on this endeavour with some
> > additional changes that were since committed to ti-rtos-firmware. Go ahead
> > and fix those to prevent this from biting us later, for example during
> > multilib builds.
> 
> 1. wrong list

Ops, my bad.

> 
> 2. see this:
> https://patchwork.yoctoproject.org/project/ti/patch/20230215193355.9676-15-afd@ti.com/
> 
> It is now in WIP branches going through the testing.

I didn't spent the extra time to rummage through what's already in the
queue but glad to see this was alraedy on the radar screen!!

Also pls note there's still a few of those instances I see in
meta-arago/kirkstone related to opencl/openvx (just pointing it out,
I've not double-checked what may be in that queue either).


--
Andreas Dannenberg
Texas Instruments Inc


> 
> 
> > Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> > ---
> > 
> > I see there are other instances of ${base_libdir} being used probably
> > incorrectly such as in...
> > 
> > meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
> > meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
> 
> Those are severely outdated and probably should be removed instead...
> 
> 
> BTW, Ryan, I see you didn't pick up these patches from the Patchwork for some 
> reason.
> 
> 
> > ...related to systemd but since I'm not 100% sure about those and can't
> > test those changes at the moment I'm not including them here.
> 
> -- 
> Denys

