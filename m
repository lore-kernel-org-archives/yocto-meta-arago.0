Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AD600529C7
	for <meta-arago@arago-project.org>;
	Thu,  3 Mar 2016 15:03:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u23F3QkS011794;
	Thu, 3 Mar 2016 09:03:26 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u23F3O1S013526;
	Thu, 3 Mar 2016 09:03:26 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 3 Mar 2016 09:03:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u23F3PqM015834;
	Thu, 3 Mar 2016 09:03:25 -0600
Date: Thu, 3 Mar 2016 10:03:09 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <anton.gerasimov@openmailbox.org>
Message-ID: <20160303150309.GL7505@edge>
References: <a997894609107b25e5d70de8ab1c2b34@openmailbox.org>
	<20160302150829.GB7505@edge>
	<9b7bbc1e8acebd2e42d243366eddec37@openmailbox.org>
MIME-Version: 1.0
In-Reply-To: <9b7bbc1e8acebd2e42d243366eddec37@openmailbox.org>
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
X-List-Received-Date: Thu, 03 Mar 2016 15:03:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sorry, I haven't tried internal toolchain lately - I'll have to look into 
this.

-- 
Denys


On Wed, Mar 02, 2016 at 06:46:55PM +0300, anton.gerasimov@openmailbox.org wrote:
> I set it in my local.conf. Here's the whole file (comments stripped):
> 
> BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
> PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
> MACHINE = "varsomam33"
> DISTRO ?= "arago"
> PACKAGE_CLASSES ?= "package_ipk"
> EXTRA_IMAGE_FEATURES = "debug-tweaks"
> IMAGE_INSTALL_append = " gdbserver"
> USER_CLASSES ?= "buildstats image-mklibs image-prelink"
> PATCHRESOLVE = "noop"
> BB_DISKMON_DIRS = "\
>     STOPTASKS,${TMPDIR},1G,100K \
>     STOPTASKS,${DL_DIR},1G,100K \
>     STOPTASKS,${SSTATE_DIR},1G,100K \
>     ABORT,${TMPDIR},100M,1K \
>     ABORT,${DL_DIR},100M,1K \
>     ABORT,${SSTATE_DIR},100M,1K"
> PACKAGECONFIG_pn-qemu-native = "sdl"
> PACKAGECONFIG_pn-nativesdk-qemu = "sdl"
> ASSUME_PROVIDED += "libsdl-native"
> CONF_VERSION = "1"
> PRSERV_HOST = "localhost:0"
> TOOLCHAIN_BRAND ?= "gcc"
> TOOLCHAIN_TYPE ?= "internal"
> 
> 
> On 2016-03-02 18:08, Denys Dmytriyenko wrote:
> >On Wed, Mar 02, 2016 at 05:01:17PM +0300,
> >anton.gerasimov@openmailbox.org wrote:
> >>I'm trying to compile arago-test-image for varsomam33 machine and
> >>arago distro with internal toolchain. When bitbake reaches cmem_mod,
> >
> >How do you select internal toolchain?
> >
> >
> >>I get the following error "make[3]: arm-oe-linuxeabi-gcc: Command
> >>not found".
> >>And arm-oe-linuxeabi-gcc is really not built, real target toolchain
> >>is called arm-oe-linux-gnueabi-gcc.
> >>After running bitbake -e I see that arm-oe-linuxeabi is the value of
> >>TOOLCHAIN_SYS:
> >>
> >># $TOOLCHAIN_SYS
> >>#   immediate /home/a-gerasimov/Yocto/meta-arago/meta-arago-distro/conf/distro/include/toolchain-gcc.inc:6
> >>#     "${TARGET_SYS}"
> >>TOOLCHAIN_SYS="arm-oe-linuxeabi"
> >>
> >>But TARGET_SYS is set to arm-oe-linux-gnueabi:
> >>
> >># $TARGET_SYS [2 operations]
> >>#   set /home/a-gerasimov/Yocto/poky/meta/conf/bitbake.conf:118
> >>#     "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS',
> >>True), ''][d.getVar('TARGET_OS', True) == ('' or 'custom')]}"
> >>#   set /home/a-gerasimov/Yocto/poky/meta/conf/documentation.conf:415
> >>#     [doc] "The target system is comprised of
> >>TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
> >># pre-expansion value:
> >>#   "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS',
> >>True), ''][d.getVar('TARGET_OS', True) == ('' or 'custom')]}"
> >>TARGET_SYS="arm-oe-linux-gnueabi"
> >>
> >>It seems that for some reason when toolchain-gcc.inc is included
> >>into distro/arago.conf, TARGET_SYS is set to some weird value, not
> >>the one that is set by bitbake.conf. Do you have any ideas about how
> >>that is possible and how it can be debugged.
> >>Thank you!
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

