Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6FDA1529E7
	for <meta-arago@arago-project.org>;
	Sat, 17 Aug 2013 14:55:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7HEtWCI006599;
	Sat, 17 Aug 2013 09:55:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7HEtWbY028896;
	Sat, 17 Aug 2013 09:55:32 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 17 Aug 2013 09:55:32 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7HEtWZ9019737;
	Sat, 17 Aug 2013 09:55:32 -0500
Date: Sat, 17 Aug 2013 10:55:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Christian Gagneraud <chgans@gna.org>
Message-ID: <20130817145531.GC4931@edge>
References: <520D8E81.8080501@gna.org>
MIME-Version: 1.0
In-Reply-To: <520D8E81.8080501@gna.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: meta-toolchain-arago-tisdk failed to build
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
X-List-Received-Date: Sat, 17 Aug 2013 14:55:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yes, toolchain/SDK in dylan requires few fixes that I was testing last week - 
I'll be pushing those soon.

-- 
Denys


On Fri, Aug 16, 2013 at 02:29:21PM +1200, Christian Gagneraud wrote:
> Hi there,
> 
> I was trying to build meta-toolchain-arago-tisdk, but it failed
> because "nothing provides packagegroup-arago-cross-canadian-arm", I
> couldn't find this recipe anywhere in meta-arago.
> 
> Maybe I should modify configs/arago-dylan-config.txt to use a known
> good tag for meta-arago? Are the tags tested somehow (at least
> built)?
> 
> Here is the log:
> 
> Build Configuration:
> BB_VERSION        = "1.18.0"
> BUILD_SYS         = "i686-linux"
> NATIVELSBSTRING   = "Ubuntu-13.04"
> TARGET_SYS        = "arm-oe-linux-gnueabi"
> MACHINE           = "am335x-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2013.07"
> TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta-arago-distro
> meta-arago-extras = "master:25f815a91093952db8d7232315fcae85a628e2a3"
> toolchain-layer
> meta-networking
> meta-oe           = "dylan:13ae5105ee30410136beeae66ec41ee4a8a2e2b0"
> meta-ti           = "dylan:cc1a67b39d8a958f86f30dae5e955b2347745063"
> meta-linaro-toolchain = "dylan:7ab5e76aac4344e1a228b620f469e868e7914f2f"
> meta              = "dylan:acf46cb2eb03c2ed3aadd7858044ba2837a83292"
> 
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'packagegroup-arago-cross-canadian-arm'
> NOTE: Runtime target 'packagegroup-arago-cross-canadian-arm' is
> unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-arago-cross-canadian-arm']
> ERROR: Required build target 'meta-toolchain-arago-tisdk' has no
> buildable providers.
> Missing or unbuildable dependency chain was:
> ['meta-toolchain-arago-tisdk',
> 'packagegroup-arago-cross-canadian-arm']
> 
> 
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> 
> 
> Any hint appreciated.
> 
> Regards,
> Chris
> 
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

