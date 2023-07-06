Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A54EB64DA
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 03:40:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.13750.1688614798298437168
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 20:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=osksnsmq;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-luthra@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3663dsHP060732;
	Wed, 5 Jul 2023 22:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688614794;
	bh=AkdXMOkvOEomVNB2pA9fQWuxAjkdhhO8lBLn2Fgoefg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=osksnsmqUiYIgvepf2lYyJPDAoevb94XBLB475O3Ox4ywHcp6SoehlxTZ2ZNzRAco
	 Ple9/w2h8JWeO55LXYVRXPEHuUwrX4tCIlbag6Q6uvVkMvl1NOWzhDgTgj/azwW17s
	 IE4Pnaa9dKNcChqg94CvRWJSALVYd2U505uuEsL4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3663dsDf096114
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 22:39:54 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 22:39:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 22:39:53 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3663drfS025608;
	Wed, 5 Jul 2023 22:39:53 -0500
Date: Thu, 6 Jul 2023 09:09:51 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>,
        Sai Sree
 Kartheek Adivi <s-adivi@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        Devarsh
 Thakkar <devarsht@ti.com>
Subject: Re: [meta-arago] [master/kirkstone][PATCH 2/3] libcamera: Add
 support for TI CSI-RX
Message-ID: <z3wjhhvei7fwi4qr4csu4xfrtshpuusi6j2yxzmqyr3imwrvtr@rug4jaz7ezf6>
References: <20230705130928.1201894-1-j-luthra@ti.com>
 <20230705130928.1201894-2-j-luthra@ti.com>
 <20230705231454.GA1518@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230705231454.GA1518@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 03:40:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14756

Hi Denys,

On Jul 05, 2023 at 19:14:54 -0400, Denys Dmytriyenko wrote:
> On Wed, Jul 05, 2023 at 06:39:27PM +0530, Jai Luthra via lists.yoctoproject.org wrote:
> > TI's CSI-RX driver is not yet upstream, so the libcamera simple pipeline
> > does not recognize it.
> > 
> > Apply a patch to the simple pipeline so that it can recognize the media
> > entity for TI's CSI-RX driver.
> > 
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  .../0001-simple-Support-TI-CSI-RX.patch       | 26 +++++++++++++++++++
> >  .../libcamera/libcamera_0.0.5.bb              |  1 +
> >  2 files changed, 27 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
> > 
> > diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
> > new file mode 100644
> > index 00000000..66b94863
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
> > @@ -0,0 +1,26 @@
> > +From 2a82bce49ce4098ac17b4a654a9db5f2dee56415 Mon Sep 17 00:00:00 2001
> > +From: Jai Luthra <j-luthra@ti.com>
> > +Date: Thu, 23 Mar 2023 11:38:46 +0530
> > +Subject: [PATCH] simple: Support TI CSI-RX
> 
> Upstream-Status is missing here
> 

Thanks, will fix in v2.

> 
> > +Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > +---
> > + src/libcamera/pipeline/simple/simple.cpp | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/pipeline/simple/simple.cpp
> > +index e1f8b989..520405a1 100644
> > +--- a/src/libcamera/pipeline/simple/simple.cpp
> > ++++ b/src/libcamera/pipeline/simple/simple.cpp
> > +@@ -194,6 +194,8 @@ static const SimplePipelineInfo supportedDevices[] = {
> > + 	{ "mxc-isi", {} },
> > + 	{ "qcom-camss", {} },
> > + 	{ "sun6i-csi", {} },
> > ++	{ "j721e-csi2rx", {} },
> > ++
> > + };
> > + 
> > + } /* namespace */
> > +-- 
> > +2.41.0
> > +
> > diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > index 6ad376f2..b2eb5fac 100644
> > --- a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > +++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "\
> >  
> >  SRC_URI = " \
> >          git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
> > +        file://0001-simple-Support-TI-CSI-RX.patch \
> >  "
> >  
> >  SRCREV = "fb44403f1c5571549ac128c21daee9761eb9249c"
> > -- 
> > 2.41.0

-- 
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

