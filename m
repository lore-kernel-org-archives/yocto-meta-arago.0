Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7FD1E52A81
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2013 14:04:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7LE4JdD026381;
	Wed, 21 Aug 2013 09:04:19 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7LE4JvY022289;
	Wed, 21 Aug 2013 09:04:19 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 21 Aug 2013 09:04:19 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7LE4JMu011891;
	Wed, 21 Aug 2013 09:04:19 -0500
Date: Wed, 21 Aug 2013 10:04:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brad Litterell <bradl@taser.com>
Message-ID: <20130821140419.GB24491@edge>
References: <5681790B-56AE-40FB-8B03-1127F3107B0E@taser.com>
	<20130820222406.GI8481@edge>
	<B792B041-567C-426A-AD0E-AD6C90F3FB85@taser.com>
MIME-Version: 1.0
In-Reply-To: <B792B041-567C-426A-AD0E-AD6C90F3FB85@taser.com>
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
X-List-Received-Date: Wed, 21 Aug 2013 14:04:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 20, 2013 at 11:18:05PM +0000, Brad Litterell wrote:
> Hi Denys,
> 
> Thanks for reply, but I'm afraid I have another question: I am using the 
> Linaro toolchain recommended here: 
> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> 
> Do I correctly understand the A8 optimizations are coming from that 
> toolchain?

Well, toolchain makes the optimizations, but it is configurable.


> If those optimizations are not supported under QEMU, should I be using a 
> different toolchain for the emulator?

No, you should just disable them. The file I pointed you to, check DEFAULTTUNE

-- 
Denys


> On Aug 20, 2013, at 3:24 PM, Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>> wrote:
> 
> On Tue, Aug 20, 2013 at 10:14:32PM +0000, Brad Litterell wrote:
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
> 
> I believe you should be able to run it under quemu w/o changing the MACHINE...
> 
> 
> I receive this error:
> 
> ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
>    Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
>    Following is the list of potential problems / advisories:
> 
>    Error, the PACKAGE_ARCHS (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon} qemuarm) variable does not contain TUNE_PKGARCH (armv5).Toolchain tunings invalid:
> Tuning 'cortexa8thf-neon' has no defined features, and cannot be used.
> 
> You are trying to build using Cortex-A8 specific optimizations, while
> "qemuarm" machine does not support them. Those optimizations are being set in
> conf/distro/include/toolchain-linaro.inc
> 
> --
> Denys
> 
> 
> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
> 
> I don't understand how the tunings work, so I'm completely stumped about how to run my image in QEMU.
> 
> Are there any instructions for building & running Arago under QEMU?
> 
> Thanks,
> Brad
> 
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 
> 

