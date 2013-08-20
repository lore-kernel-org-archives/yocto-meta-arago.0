Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6AC4D5299B
	for <meta-arago@arago-project.org>;
	Tue, 20 Aug 2013 22:24:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KMO7tw032348;
	Tue, 20 Aug 2013 17:24:07 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KMO7aQ018588;
	Tue, 20 Aug 2013 17:24:07 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 17:24:07 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7KMO74C011611;
	Tue, 20 Aug 2013 17:24:07 -0500
Date: Tue, 20 Aug 2013 18:24:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brad Litterell <bradl@taser.com>
Message-ID: <20130820222406.GI8481@edge>
References: <5681790B-56AE-40FB-8B03-1127F3107B0E@taser.com>
MIME-Version: 1.0
In-Reply-To: <5681790B-56AE-40FB-8B03-1127F3107B0E@taser.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: How to run Arago in QEMU?
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Aug 2013 22:24:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 20, 2013 at 10:14:32PM +0000, Brad Litterell wrote:
> HI,
> 
> I downloaded the Arago system and successfully built an image for 
> am335x-evm, but I want to create an image I can run in QEMU.
> 
> When I change my local.conf file from:
> 
> 
> MACHINE = "am335x-evm"
> 
> 
> to
> 
> 
> MACHINE="qemuarm"

I believe you should be able to run it under quemu w/o changing the MACHINE...


> I receive this error:
> 
> ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
>     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
>     Following is the list of potential problems / advisories:
> 
>     Error, the PACKAGE_ARCHS (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon} qemuarm) variable does not contain TUNE_PKGARCH (armv5).Toolchain tunings invalid:
> Tuning 'cortexa8thf-neon' has no defined features, and cannot be used.

You are trying to build using Cortex-A8 specific optimizations, while 
"qemuarm" machine does not support them. Those optimizations are being set in 
conf/distro/include/toolchain-linaro.inc

-- 
Denys


> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
> 
> I don't understand how the tunings work, so I'm completely stumped about how to run my image in QEMU.
> 
> Are there any instructions for building & running Arago under QEMU?
> 
> Thanks,
> Brad
> 

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


