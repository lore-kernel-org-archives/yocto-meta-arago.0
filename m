Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D66C433FE
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 18:23:38 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.902.1652379812345897876
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 May 2022 11:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NounLGB3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24CINRAW075603;
	Thu, 12 May 2022 13:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652379807;
	bh=M8pbttMt35w5vS7oz8D/k+6xvRnhlcQxyZAnQc7ZBW0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NounLGB30lQE2xSpmJO+2zycC6B/6elalN+tC/M0MByhCLOsOiJCjWw8TGMuE3qIO
	 KM5qCqPFs2WBYXdRI9qcv3+9ayQvopZfgsFiTwA1EAY+gks03F8CE81lWiWyA4BfCM
	 uKFN/vYoAiMjHYZDw75ur3LQyyc5Dsh4bhy87h6I=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24CINR86114346
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 May 2022 13:23:27 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 13:23:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 13:23:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24CINRha101248;
	Thu, 12 May 2022 13:23:27 -0500
Date: Thu, 12 May 2022 13:23:27 -0500
From: Nishanth Menon <nm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Aparna M <a-m1@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denis@denix.org>, <devarsht@ti.com>,
        <s-adivi@ti.com>
Subject: Re: [meta-arago][dunfell][PATCH] tisdk-core-bundle: Add
 ti-sci-firmware binary to prebuilt-images directory of SDK
Message-ID: <20220512182327.bmfw5quno3bhfwy6@footprint>
References: <20220512152846.661-1-a-m1@ti.com>
 <a77eefeb-df53-ee0f-4bbf-89b2c353db36@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a77eefeb-df53-ee0f-4bbf-89b2c353db36@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 May 2022 18:23:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13852

On 10:35-20220512, Ryan Eatmon wrote:
> 
> 
> On 5/12/2022 10:28, Aparna M wrote:
> > Add ti-sci-firmware binaries required for uboot build to the
> > prebuilt-images directory of SDK.
> > 
> > Signed-off-by: Aparna M <a-m1@ti.com>
> > ---
> >   meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > This patch is dependent on
> > https://lists.yoctoproject.org/g/meta-ti/topic/dunfell_patch_ti_sci_fw/91058279
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> > index 9ebcbb0e..d5a11f36 100644
> > --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> > +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> > @@ -21,6 +21,9 @@ DEPLOY_IMAGES_NAME_append_j7-evm = " sysfw.itb"
> >   DEPLOY_IMAGES_NAME_append_j7-hs-evm = " sysfw.itb"
> >   DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
> >   DEPLOY_IMAGES_NAME_append_j7-evm = " ti-fs-firmware-j721e-gp.bin"
> > +DEPLOY_IMAGES_NAME_append_am64xx-evm = " ti-sci-firmware-am64x-gp.bin"
> > +DEPLOY_IMAGES_NAME_append_am64xx-hs-evm = " ti-sci-firmware-am64x-hs-cert.bin ti-sci-firmware-am64x-hs-enc.bin fitImage-its.its"
> > +DEPLOY_IMAGES_NAME_append_am62xx-evm = " ti-fs-firmware-am62x-gp.bin ipc_echo_testb_mcu1_0_release_strip.xer5f"
> >   ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
> >   export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
> 
> 
> Same as the other patch on meta-ti.  I think the
> ipc_echo_testb_mcu1_0_release_strip.xer5f file needs to not be in this file.
> The other changes are fine, but remove that one.


I do NOT understand what purpose this serves! these are embedded in
the boot images already. $commit message claims if you dont copy these
files, system wont build? that is not true! Agreed these files are
tiny, but they confuse the user as to what are the real images used
to boot. Just switching this binary has 0 function on the deployed
images!

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

