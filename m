Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CC1F052A55
	for <meta-arago@arago-project.org>;
	Tue,  9 Jul 2013 15:05:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r69F5OTT011848
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2013 10:05:24 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r69F5NRY025492
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2013 10:05:24 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 9 Jul 2013 10:05:23 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r69F5NVK011220	for
	<meta-arago@arago-project.org>; Tue, 9 Jul 2013 10:05:23 -0500
Date: Tue, 9 Jul 2013 11:05:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20130709150523.GB14185@edge>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Building am180x-evm
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
X-List-Received-Date: Tue, 09 Jul 2013 15:05:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

FYI.

Date: Tue, 9 Jul 2013 11:03:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Firat Kasmis <firat.kasmis@steinbeis-stg.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-arago] Building am180x-evm

On Tue, Jul 09, 2013 at 05:00:22PM +0200, Firat Kasmis wrote:
> Thanks. It works now. Where do I get the information that am180x is not 
> compatible with Linaro toolchain?

am180x is ARM9 (armv5te) and pre-built Linaro toolchain doesn't come with 
armv5te runtime libraries, only Cortex*. We'll be updating the Wiki page to 
have this mentioned.


> Changes I made:
> 1. Install arago-2011.09-armv5te-linux-gnueabi-sdk from 
> http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/index_FDS.html
> 2. Add it to PATH
> 3. export TOOLCHAIN_BRAND=arago

That is correct. Thanks.

-- 
Denys


> Von: Dmytriyenko, Denys [mailto:denys@ti.com]
> Gesendet: Dienstag, 9. Juli 2013 14:39
> An: meta-arago@arago-project.org; Firat Kasmis
> Betreff: RE: [meta-arago] Building am180x-evm
> 
> am180x cannot be built with Linaro toolchain - it has still to be built with Arago toolchain.
> 
> 
> Denys
> 
> 
> -----Original Message-----
> From: Firat Kasmis [firat.kasmis@steinbeis-stg.de]
> Received: Tuesday, 09 Jul 2013, 4:58
> To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org> [meta-arago@arago-project.org]
> Subject: [meta-arago] Building am180x-evm
> Hi,
> 
> I just saw that http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment has been changed, so I tried building a file system and kernel for da850-omapl138-evm board like before following the new instructions.
> 
> Unfortunately this board is not available in meta-ti/conf/machine/ anymore. Since am180x-evm is the same, I tried:
> 
> > MACHINE=am180x-evm bitbake virtual/kernel
> ERROR: No valid toolchain in PATH
> 
> Linaro is of course in my path. So after a bit of googling I tried:
> 
> > export TOOLCHAIN_BRAND=linaro
> > MACHINE=am180x-evm bitbake virtual/kernel
> Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (armv5).Toolchain tunings invalid:
> Tuning 'cortexa8thf-neon' has no defined features, and cannot be used.
> 
> I could solve the first one by doing in tune-arm926ejs.inc:
> 
> +TUNE_FEATURES = "${TUNE_FEATURES_tune-armv5te} arm926ejs"
> -TUNE_FEATURES_tune-arm926ejs = "${TUNE_FEATURES_tune-armv5te} arm926ejs"
> 
> +PACKAGE_EXTRA_ARCHS = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
> -PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
> 
> But the second one with 'cortexa8thf-neon' still exists but I don't know where it is exactly been set. toolchain-linaro/gcc.inc is using this as DEFAULTUNE . Shouldn't this be arm926ejs for my machine?
> 
> Regards,
> Firat
> 
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

