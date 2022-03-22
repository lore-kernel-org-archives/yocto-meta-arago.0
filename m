Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CECC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 12:44:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.9385.1647953086575519405
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 05:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XkbsQx5e;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MCihMh027304;
	Tue, 22 Mar 2022 07:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647953083;
	bh=FeDcUufwHY2kRv458sfGLtnAlYacHz2VDJgJ9fX2GCM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XkbsQx5epijutnrnr10tYBIQw0EI2052hATotd/regZgL4ZRAFjUev+NroVi0d8Au
	 ccv/g7fB9YMjtLcylCsv70nDhatY8okpytr6hqL/9f0UL2kYDyWFHSouOT0ipIRbll
	 ApptXASDRRhObW2kMMzTKaS8ju9j4NYN1I0Hb48U=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MCihxO119584
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 07:44:43 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 07:44:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 07:44:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MCigUF087555;
	Tue, 22 Mar 2022 07:44:42 -0500
Date: Tue, 22 Mar 2022 07:44:42 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <d-gerlach@ti.com>, <j-humphreys@ti.com>,
        <khilman@ti.com>, <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>
Subject: Re: [master/dunfell PATCH V4 12/12] images: Build
 tisdk-bootstrap-image with tisdk-core-bundle
Message-ID: <20220322124442.p7a2q5wxeshfsmb6@humbling>
References: <20220319123310.8546-1-nm@ti.com>
 <20220319123310.8546-13-nm@ti.com>
 <20220322045555.GI23554@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220322045555.GI23554@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 12:44:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13694

On 00:55-20220322, Denys Dmytriyenko wrote:
> On Sat, Mar 19, 2022 at 07:33:10AM -0500, Nishanth Menon wrote:
> > Add tisdk-bootstrap-image to the list of TARGET_IMAGES for
> > tisdk-core-bundle.
> 
> I just realized - this won't work (and the patch hasn't been tested).
> 
> As you can see, there was no tiny image in this list. The reason is that tiny 
> image has package management disabled for additional size savings, but that 
> also breaks the way SDK installer bundle gets processed for the SW manifest. 
> That means any other images that are based on tiny or that disable package 
> management, cannot be listed in TARGET_IMAGES of the SDK installer bundle.


I think you mean IMAGE_FEATURES_remove = "package-management" in
tiny-image.inc

I did do MACHINE=xxx bitbake tisdk-core-bundle, but I did'nt wait for it
to complete (got to 99%).

I also do see ipks in build/arago-tmp-external-arm-glibc/deploy/ipk/all
and in build/arago-tmp-external-arm-glibc/deploy/ipk/aarch64/

During the build, I did notice:
WARNING: bootstrap-initrd-1.0-r0 do_package: Manifest /workdir/pub-sdk/oe-layersetup/build/arago-tmp-external-arm-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-tisdk-bootstrap-base-image.packagedata not found in j7_evm aarch64 allarch x86_64_x86_64-nativesdk (variant '')?

And once I waited for the complete build, I got this:
https://gist.github.com/nmenon/3ef33a14df77d9c7869f4c87fcfbc990

I guess I have to see how to introduce packagemanagement back in for
bootstrap image?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

