Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3D4C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 13:47:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.10076.1647956875740694520
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 06:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tnoDBglz;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MDlpCT054369;
	Tue, 22 Mar 2022 08:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647956871;
	bh=cmNZb6TtevpLwxy+JZuR2RGgLkFVVppBhDSzl0kW2MU=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=tnoDBglzhw6sF3zSikUSKRsIZ6GAvsH163CtM2l7hISb/Zd14hgk+/gIXp/dgIDTU
	 Rwz7UPi29fKNB5BNcrokrSp4bNu0jVLlA3IJa0ZF7RfhFOknDcew+LzB6Phk/P8gpo
	 G81GgECPXXSdMi+Dwzzwdm+CvbLbE2/E+TLWEz5s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MDlp2Z127786
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 08:47:51 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 08:47:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 08:47:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MDloEu064893;
	Tue, 22 Mar 2022 08:47:50 -0500
Date: Tue, 22 Mar 2022 08:47:50 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <reatmon@ti.com>, <d-gerlach@ti.com>,
        <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>
Subject: Re: [meta-arago] [master/dunfell PATCH V4 12/12] images: Build
 tisdk-bootstrap-image with tisdk-core-bundle
Message-ID: <20220322134750.4tragiw5vpxdxko7@outrank>
References: <20220319123310.8546-1-nm@ti.com>
 <20220319123310.8546-13-nm@ti.com>
 <20220322045555.GI23554@denix.org>
 <16DEB49A300B0672.26416@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <16DEB49A300B0672.26416@lists.yoctoproject.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 13:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13695

On 07:44-20220322, Nishanth Menon via lists.yoctoproject.org wrote:
> On 00:55-20220322, Denys Dmytriyenko wrote:
> > On Sat, Mar 19, 2022 at 07:33:10AM -0500, Nishanth Menon wrote:
> > > Add tisdk-bootstrap-image to the list of TARGET_IMAGES for
> > > tisdk-core-bundle.
> > 
> > I just realized - this won't work (and the patch hasn't been tested).
> > 
> > As you can see, there was no tiny image in this list. The reason is that tiny 
> > image has package management disabled for additional size savings, but that 
> > also breaks the way SDK installer bundle gets processed for the SW manifest. 
> > That means any other images that are based on tiny or that disable package 
> > management, cannot be listed in TARGET_IMAGES of the SDK installer bundle.
> 
> 
> I think you mean IMAGE_FEATURES_remove = "package-management" in
> tiny-image.inc
> 
> I did do MACHINE=xxx bitbake tisdk-core-bundle, but I did'nt wait for it
> to complete (got to 99%).
> 
> I also do see ipks in build/arago-tmp-external-arm-glibc/deploy/ipk/all
> and in build/arago-tmp-external-arm-glibc/deploy/ipk/aarch64/
> 
> During the build, I did notice:
> WARNING: bootstrap-initrd-1.0-r0 do_package: Manifest /workdir/pub-sdk/oe-layersetup/build/arago-tmp-external-arm-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-tisdk-bootstrap-base-image.packagedata not found in j7_evm aarch64 allarch x86_64_x86_64-nativesdk (variant '')?
> 
> And once I waited for the complete build, I got this:
> https://gist.github.com/nmenon/3ef33a14df77d9c7869f4c87fcfbc990
> 
> I guess I have to see how to introduce packagemanagement back in for
> bootstrap image?
> 

Denys: This seems to resolve the build error..  Thoughts?

diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
index 79c8f6075911..958dd8bb9399 100644
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
@@ -2,7 +2,7 @@ ARAGO_SYSVINIT = "1"
 
 require arago-image.inc
 
-IMAGE_FEATURES_remove = "package-management splash"
+IMAGE_FEATURES_remove = "splash"
 
 IMAGE_INSTALL = " \
 	packagegroup-arago-sysvinit-boot \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 210bc32444f9..528efa2746b4 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -12,6 +12,8 @@ ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
 
 require arago-tiny-image.inc
 
+IMAGE_FEATURES_remove += "package-management"
+
 IMAGE_FSTYPES += "cpio cpio.xz"
 
 IMAGE_INSTALL += " \
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

