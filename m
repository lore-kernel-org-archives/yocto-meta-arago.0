Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7AF4152A9D
	for <meta-arago@arago-project.org>;
	Wed,  2 Mar 2016 15:08:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u22F8jbu025529;
	Wed, 2 Mar 2016 09:08:45 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u22F8jBp012466;
	Wed, 2 Mar 2016 09:08:45 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 2 Mar 2016 09:08:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u22F8jqS004104;
	Wed, 2 Mar 2016 09:08:45 -0600
Date: Wed, 2 Mar 2016 10:08:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <anton.gerasimov@openmailbox.org>
Message-ID: <20160302150829.GB7505@edge>
References: <a997894609107b25e5d70de8ab1c2b34@openmailbox.org>
MIME-Version: 1.0
In-Reply-To: <a997894609107b25e5d70de8ab1c2b34@openmailbox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Compiling with internal toolchain
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
X-List-Received-Date: Wed, 02 Mar 2016 15:08:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 02, 2016 at 05:01:17PM +0300, anton.gerasimov@openmailbox.org wrote:
> I'm trying to compile arago-test-image for varsomam33 machine and
> arago distro with internal toolchain. When bitbake reaches cmem_mod,

How do you select internal toolchain?


> I get the following error "make[3]: arm-oe-linuxeabi-gcc: Command
> not found".
> And arm-oe-linuxeabi-gcc is really not built, real target toolchain
> is called arm-oe-linux-gnueabi-gcc.
> After running bitbake -e I see that arm-oe-linuxeabi is the value of
> TOOLCHAIN_SYS:
> 
> # $TOOLCHAIN_SYS
> #   immediate /home/a-gerasimov/Yocto/meta-arago/meta-arago-distro/conf/distro/include/toolchain-gcc.inc:6
> #     "${TARGET_SYS}"
> TOOLCHAIN_SYS="arm-oe-linuxeabi"
> 
> But TARGET_SYS is set to arm-oe-linux-gnueabi:
> 
> # $TARGET_SYS [2 operations]
> #   set /home/a-gerasimov/Yocto/poky/meta/conf/bitbake.conf:118
> #     "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS',
> True), ''][d.getVar('TARGET_OS', True) == ('' or 'custom')]}"
> #   set /home/a-gerasimov/Yocto/poky/meta/conf/documentation.conf:415
> #     [doc] "The target system is comprised of
> TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
> # pre-expansion value:
> #   "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS',
> True), ''][d.getVar('TARGET_OS', True) == ('' or 'custom')]}"
> TARGET_SYS="arm-oe-linux-gnueabi"
> 
> It seems that for some reason when toolchain-gcc.inc is included
> into distro/arago.conf, TARGET_SYS is set to some weird value, not
> the one that is set by bitbake.conf. Do you have any ideas about how
> that is possible and how it can be debugged.
> Thank you!
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

