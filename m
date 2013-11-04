Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 774E152AA3
	for <meta-arago@arago-project.org>;
	Mon,  4 Nov 2013 16:36:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA4Gaerp007664;
	Mon, 4 Nov 2013 10:36:40 -0600
Received: from DFLE73.ent.ti.com ([128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA4GaewH022532;
	Mon, 4 Nov 2013 10:36:40 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 4 Nov 2013 10:36:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA4Gadj4019101;
	Mon, 4 Nov 2013 10:36:39 -0600
Date: Mon, 4 Nov 2013 11:36:39 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
Message-ID: <20131104163639.GR24696@edge>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BA0132E@USNYGRMBX4.raymondcorp.local>
MIME-Version: 1.0
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622BA0132E@USNYGRMBX4.raymondcorp.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: wpa-supplicant failure
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
X-List-Received-Date: Mon, 04 Nov 2013 16:36:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Nov 04, 2013 at 04:11:41PM +0000, Vanderpool Josh wrote:
> I am using the instructions from http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> And using the branding-amsdk.inc with some items added from the 

Any specific reason for branding-amsdk?


> arago-prefs.inc to include qt5 and the wifi items.

http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=ecc685fdbb24a30a6956ddd9463a68d80304f291

-- 
Denys


> Build Configuration:
> BB_VERSION        = "1.18.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-12.04"
> TARGET_SYS        = "arm-oe-linux-gnueabi"
> MACHINE           = "am335x-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2013.10"
> TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta-arago-distro
> meta-arago-extras = "master:370c6ed8e738eb3066160f133897a14eb3af1955"
> meta-qt5          = "master:a6753fa646f714bd0a794d270bd77e951d8204ac"
> toolchain-layer
> meta-networking
> meta-ruby
> meta-oe           = "dylan:a108b2203a997634f87ac687e81712badaf3c546"
> meta-ti           = "dylan:7e054d1277cfe3b8d59725930cd42177cef1d9f0"
> meta-linaro-toolchain = "dylan:c9f78d6eff14ada3f2bc960e81883b27a10afecc"
> meta              = "dylan:3549f5f203363302256848bb33c05c4fd4871948"
> 
> 
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | ../src/drivers/driver_nl80211.c:19:31: fatal error: netlink/genl/genl.h: No such file or directory
> | compilation terminated.
> | make: *** [../src/drivers/driver_nl80211.o] Error 1
> | ERROR: Function failed: do_compile (see /home/joshua/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-3.2-oe-linux-gnueabi/wpa-supplicant/r5.sp4.01-r6b+gitrAUTOINC+7190ff7dbd43243290b626068ded0d61c5019050-arago0/temp/log.do_compile.33324 for further information)
> ERROR: Task 1257 (/home/joshua/tisdk/sources/meta-arago/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb, do_compile) failed with exit code '1'
> 
> Josh Vanderpool
> Electrical Engineer
> Control Systems
> ________________________________
> The Raymond Corporation
> 20 South Canal Street
> Greene, New York 13778-0130
> Phone: 607-656-2617
> Fax: 607-656-4845
> joshua.vanderpool@raymondcorp.com<mailto:joshua.vanderpool@raymondcorp.com>
> http://www.raymondcorp.com<http://www.raymondcorp.com/>
> 
> 
> 
> Confidentiality Notice:
> 
> The preceding e-mail message (including any attachments) contains information that may be confidential, protected by applicable legal privileges, or constitute non-public information. It is intended to be conveyed only to the designated recipient(s). If you are not an intended recipient of this message, please notify the sender by replying to this message and then delete it from your system. Use, dissemination, distribution or reproduction of this message by unintended recipients is 
> not authorized and may be unlawful.
> 
> 

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


