Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BF4C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 20:53:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.198.1647636832349344799
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 13:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XjilKWcC;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IKrmcs121212;
	Fri, 18 Mar 2022 15:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647636828;
	bh=I9FJWoJlXJV2kOxPKbLOWSUUoeWIfz+9Kag/s/3Cqxw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XjilKWcCBs8/AYHZOe45WFpig90WYYfQk0iS4sgzbOsQAtMEqPbnX0FQAelvdvCVw
	 3r94bke1k3im3SVGd0iuFyWmhp0c/jLIpBJmGZUvVfocSjSm7iRCWxdUJvKRcKW9cM
	 3+4uYezaMpFe8Xc7klG2kswQtj13f4mFG6W+bZEY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IKrmt9002855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 15:53:48 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 15:53:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 15:53:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IKrmOV019696;
	Fri, 18 Mar 2022 15:53:48 -0500
Date: Fri, 18 Mar 2022 15:53:48 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        praneeth <praneeth@ti.com>, minas
	<minas@ti.com>,
        "Hilman, Kevin" <khilman@ti.com>, "Patton, Schuyler"
	<spatton@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [dunfell/master PATCH V3 11/12] recipes-core: images: Introduce
 tisdk-bootstrap-image
Message-ID: <20220318205348.65fqseoywfcxffif@stargazer>
References: <20220318184045.11246-1-nm@ti.com>
 <20220318184045.11246-12-nm@ti.com>
 <20220318204901.GF23554@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220318204901.GF23554@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 20:53:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13677

On 16:49-20220318, Denys Dmytriyenko wrote:
> On Fri, Mar 18, 2022 at 01:40:44PM -0500, Nishanth Menon wrote:
> > Lets introduce tisdk-bootstrap-image which now consists of a
> > completely bootable system with minimal initramfs that can be used
> > to boot up a system. We also will create a rootfs that matches with
> > the initramfs to allow users who use mmc and other boot media to have
> > access to the same debug tools for a new platform bringup
> > 
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> > no changes since V2
> > V2: https://lore.kernel.org/all/20220318143735.17642-11-nm@ti.com/
> > 
> >  .../images/tisdk-bootstrap-image.bb           | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
> > new file mode 100644
> > index 000000000000..685916ca3f6a
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
> > @@ -0,0 +1,22 @@
> > +SUMMARY = "Arago TI SDK bootstrap image usable for board bringup"
> > +
> > +DESCRIPTION = "This image is a complete package containing a rootfs\
> > + and an initrd with platform test utilities that can be used for new\
> > + platform bringup activities. Typically one would use the bootstrap\
> > + initrd till the storage media access is debugged, following which one\
> > + would switch over to using the storage media of choice with the same\
> > + content.\
> > +"
> > +
> > +require arago-tiny-image.inc
> > +
> > +ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL ?= ""
> > +
> > +IMAGE_INSTALL += " \
> > +	packagegroup-arago-bootstrap \
> > +	kernel \
> 
> ??


GGGAAH!!! Thanks for catching it.. I think i picked the wrong patch
when rebasing :( /me weeps. will fix for V4 to kernel-base again.

Will wait for any additional comments prior to posting v4.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

