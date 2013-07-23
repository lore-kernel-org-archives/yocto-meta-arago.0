Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 44E2E52A98
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2013 17:00:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6NH03EU030848
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 12:00:03 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6NH02aI020813
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 12:00:03 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 12:00:01 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6NH01lQ016982;
	Tue, 23 Jul 2013 12:00:01 -0500
Date: Tue, 23 Jul 2013 13:00:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130723170001.GM31158@edge>
References: <5DE143D81A65C045A4FF105C9132505F0421839C@DFLE11.ent.ti.com>
	<8EAE6244CE843044A42356038645C8551573575F@DFLE12.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015965764F@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015965764F@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Kuttiyam,
	Prabhu" <pkuttiyam@ti.com>
Subject: Re: Question when building devkit
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
X-List-Received-Date: Tue, 23 Jul 2013 17:00:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jul 16, 2013 at 12:54:39PM +0000, Maupin, Chase wrote:
> The error log says:
> 
> * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-arago-sc-mcsdk-toolchain-target:
> *            ti-trace-framework-staticdev *
>  * opkg_install_cmd: Cannot install package packagegroup-arago-sc-mcsdk-toolchain-target.
> 
> So it looks like the ti-trace-framework-staticdev package is not there.  
> However, since neither the packagegroup-arago-sc-mcsdk-toolchain-target or 
> ti-trace-framework-staticdev recipes seem to be in the mainline git 
> repositories I can’t tell you much else.  This could be an mis-used 
> COMPATIBLE_MACHINE setting or something else.

I agree with Chase here in general. Specifically to your case, -staticdev 
packages created automatically and hold static .a libraries. Looks like that 
is what you add a dependency for in your toolchain-target recipe. But for some 
reason ti-trace-framework did no generate that package - check if there's a 
static .a library being built.

-- 
Denys


> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Saran, Sajesh Kumar
> Sent: Monday, July 15, 2013 2:50 PM
> To: meta-arago@arago-project.org
> Cc: Kuttiyam, Prabhu
> Subject: [meta-arago] FW: Question when building devkit
> 
> 
> 
> From: Kuttiyam, Prabhu
> Sent: Monday, July 15, 2013 10:43 AM
> To: 'meta-arago@arago-project.org'
> Subject: Question when building devkit
> 
> Hi:
> I have hopefully a quick question while building a devkit for our SDK.
> 
> This is what I do:
> 
> MACHINE=tci6614-evm TOOLCHAIN_BRAND=linaro bitbake meta-toolchain-arago-sc-mcsdk
> 
> And I get this error:
> 
> =====
> Parsing of 1538 .bb files complete (1528 cached, 10 parsed). 1902 targets, 199 skipped, 7 masked, 0 errors.
> 
> Build Configuration:
> BB_VERSION        = "1.17.0"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "tci6614-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2013.04"
> TUNE_FEATURES     = "armv7a vfp neon thumb callconvention-hard cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta-arago-distro
> meta-arago-extras = "tci6614-evm:d68c33a710b445fdd062c4b6e6cd40b43aee37b7"
> toolchain-layer
> meta-oe           = "(nobranch):f00028caf257e386c0f3ae46bd4b3ba53dd0729d"
> meta-ti           = "tci6614-evm:c764bfc1cc04b376a52cf4fbbce6021f9b990aaa"
> meta-linaro       = "(nobranch):d0558fa4304592622423582f8b464e1c22cfe6f1"
> meta              = "(nobranch):0785489d558c34cacf5cb349949a15e27084efbf"
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: populate_sdk_image (see /home/a0271283/yocto/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/meta-toolchain-arago-sc-mcsdk-1.0-r1/temp/log.do_populate_sdk.15900 for further information)
> 
> I have attached the log file with this email.
> 
> Thanks for your reply.
> Also let me know if you need more information on my setup/scripts.
> 
> Thanks
> Prabhu
> 

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


