Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4B9795298A
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 17:23:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0RHNbSY015551;
	Mon, 27 Jan 2014 11:23:37 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RHNbLv017573;
	Mon, 27 Jan 2014 11:23:37 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 11:23:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RHNaNE014274;
	Mon, 27 Jan 2014 11:23:36 -0600
Date: Mon, 27 Jan 2014 12:23:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yves Godin <Yves.Godin@nutaq.com>
Message-ID: <20140127172335.GG6814@edge>
References: <86E210CFD3EEDE46A58DE4793CFA6C3FC2EF26@NTWAEX01.interne.lyrtech.com>
MIME-Version: 1.0
In-Reply-To: <86E210CFD3EEDE46A58DE4793CFA6C3FC2EF26@NTWAEX01.interne.lyrtech.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: lldpd
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
X-List-Received-Date: Mon, 27 Jan 2014 17:23:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yves,

Unfortunately, lldpd is not part of the official meta-arago repository, so my 
help here is very limited.

According to the logs you provided and correctly guessed, it looks like it 
tries to install into host's /usr/sbin directory, which it shouldn't.

-- 
Denys


On Mon, Jan 27, 2014 at 12:10:02PM -0500, Yves Godin wrote:
> Hi,
> 
> I'm trying to build the sc-mcsdk for the tci6614-evm but I am having
> problem with the lldpd package.
> 
> I guess that /usr/sbin of the host machine is not the intended
> installation path.
> 
>  
> 
> I'm following the instructions as documented in the SC-MCSDK 2.0 User
> Guide.
> 
>  
> 
> Any advice ?
> 
> Yves
> 
>  
> 
> Here is the output:
> 
>  
> 
> Build Configuration:
> 
> BB_VERSION        = "1.17.0"
> 
> TARGET_ARCH       = "arm"
> 
> TARGET_OS         = "linux-gnueabi"
> 
> MACHINE           = "tci6614-evm"
> 
> DISTRO            = "arago"
> 
> DISTRO_VERSION    = "2013.04"
> 
> TUNE_FEATURES     = "armv7a vfp neon thumb callconvention-hard cortexa8"
> 
> TARGET_FPU        = "vfp-neon"
> 
> meta-arago-distro 
> 
> meta-arago-extras =
> "tci6614-evm-2.2.1:5368073046d02e64bb4f3b3323640f63b539b572"
> 
> toolchain-layer   
> 
> meta-oe           =
> "(nobranch):f00028caf257e386c0f3ae46bd4b3ba53dd0729d"
> 
> meta-ti           =
> "tci6614-evm-2.2.1:1d2a6bde4429c1a390f9067464053e3968991582"
> 
> meta-linaro       =
> "(nobranch):d0558fa4304592622423582f8b464e1c22cfe6f1"
> 
> meta              =
> "(nobranch):0785489d558c34cacf5cb349949a15e27084efbf"
> 
>  
> 
> NOTE: Resolving any missing task queue dependencies
> 
> NOTE: Preparing runqueue
> 
> NOTE: Executing SetScene Tasks
> 
> NOTE: Executing RunQueue Tasks
> 
> WARNING: Failed to fetch URL http://www.zlib.net/zlib-1.2.7.tar.bz2,
> attempting MIRRORS if available
> 
> WARNING: Failed to fetch URL http://zlib.net/pigz/pigz-2.2.5.tar.gz,
> attempting MIRRORS if available
> 
> WARNING: Failed to fetch URL
> http://pkg-shadow.alioth.debian.org/releases/shadow-4.1.4.3.tar.bz2,
> attempting MIRRORS if available
> 
> WARNING: Failed to fetch URL
> http://kernel.org/pub/linux/utils/kernel/hotplug/udev-164.tar.gz,
> attempting MIRRORS if available
> 
> WARNING: Failed to fetch URL
> http://www.apache.org/dist/apr/apr-1.4.6.tar.bz2, attempting MIRRORS if
> available
> 
> WARNING: Failed to fetch URL
> http://www.apache.org/dist/apr/apr-util-1.4.1.tar.gz, attempting MIRRORS
> if available
> 
> WARNING: Failed to fetch URL
> http://www.apache.org/dist/subversion/subversion-1.7.6.tar.bz2,
> attempting MIRRORS if available
> 
> WARNING: File '/lib/ld-2.15.so' from external-linaro-toolchain was
> already stripped, this will prevent future debugging!
> 
> WARNING: File '/lib/libc-2.15.so' from external-linaro-toolchain was
> already stripped, this will prevent future debugging!
> 
> WARNING: QA Issue: external-linaro-toolchain: Files/directories were
> installed but not shipped
> 
>   /lib/libitm.spec
> 
>   /lib/libgomp.so.1
> 
>   /lib/libattr.so.1.1.0
> 
>   /lib/libattr.so.1
> 
>   /lib/libacl.so.1.1.0
> 
>   /lib/libgomp.so.1.0.0
> 
>   /lib/libacl.so.1
> 
>   /lib/libssp.so.0
> 
>   /lib/libitm.so.1.0.0
> 
>   /lib/libitm.so.1
> 
>   /lib/libssp.so.0.0.0
> 
>   /lib/libgomp.spec
> 
>   /lib/arm-linux-gnueabi
> 
>   /lib/arm-linux-gnueabi/libmudflap.so
> 
>   /lib/arm-linux-gnueabi/libgfortran.so
> 
>   /lib/arm-linux-gnueabi/libmudflapth.a
> 
>   /lib/arm-linux-gnueabi/libgomp.a
> 
>   /lib/arm-linux-gnueabi/libitm.spec
> 
>   /lib/arm-linux-gnueabi/libstdc++.so
> 
>   /lib/arm-linux-gnueabi/libgomp.so.1
> 
>   /lib/arm-linux-gnueabi/libmudflapth.so.0.0.0
> 
>   /lib/arm-linux-gnueabi/libstdc++.so.6
> 
>   /lib/arm-linux-gnueabi/libssp_nonshared.a
> 
>   /lib/arm-linux-gnueabi/libgomp.so.1.0.0
> 
>   /lib/arm-linux-gnueabi/libstdc++.a
> 
>   /lib/arm-linux-gnueabi/libitm.so
> 
>   /lib/arm-linux-gnueabi/libgomp.so
> 
>   /lib/arm-linux-gnueabi/libitm.a
> 
>   /lib/arm-linux-gnueabi/libstdc++.so.6.0.17-gdb.py
> 
>   /lib/arm-linux-gnueabi/libgfortran.a
> 
>   /lib/arm-linux-gnueabi/libgcc_s.so
> 
>   /lib/arm-linux-gnueabi/libmudflap.so.0.0.0
> 
>   /lib/arm-linux-gnueabi/libgcc_s.so.1
> 
>   /lib/arm-linux-gnueabi/libssp.so.0
> 
>   /lib/arm-linux-gnueabi/libmudflap.a
> 
>   /lib/arm-linux-gnueabi/libitm.so.1.0.0
> 
>   /lib/arm-linux-gnueabi/libmudflapth.so
> 
>   /lib/arm-linux-gnueabi/libgfortran.so.3.0.0
> 
>   /lib/arm-linux-gnueabi/libmudflap.so.0
> 
>   /lib/arm-linux-gnueabi/libmudflapth.so.0
> 
>   /lib/arm-linux-gnueabi/libssp.a
> 
>   /lib/arm-linux-gnueabi/libsupc++.a
> 
>   /lib/arm-linux-gnueabi/libstdc++.so.6.0.17
> 
>   /lib/arm-linux-gnueabi/libitm.so.1
> 
>   /lib/arm-linux-gnueabi/libssp.so.0.0.0
> 
>   /lib/arm-linux-gnueabi/libgfortran.spec
> 
>   /lib/arm-linux-gnueabi/libssp.so
> 
>   /lib/arm-linux-gnueabi/libgomp.spec
> 
>   /lib/arm-linux-gnueabi/libgfortran.so.3
> 
>   /lib/arm-linux-gnueabi/.debug
> 
>   /lib/arm-linux-gnueabi/.debug/libmudflap.so
> 
>   /lib/arm-linux-gnueabi/.debug/libgfortran.so
> 
>   /lib/arm-linux-gnueabi/.debug/libstdc++.so
> 
>   /lib/arm-linux-gnueabi/.debug/libgomp.so.1
> 
>   /lib/arm-linux-gnueabi/.debug/libmudflapth.so.0.0.0
> 
>   /lib/arm-linux-gnueabi/.debug/libstdc++.so.6
> 
>   /lib/arm-linux-gnueabi/.debug/libgomp.so.1.0.0
> 
>   /lib/arm-linux-gnueabi/.debug/libitm.so
> 
>   /lib/arm-linux-gnueabi/.debug/libgomp.so
> 
>   /lib/arm-linux-gnueabi/.debug/libmudflap.so.0.0.0
> 
>   /lib/arm-linux-gnueabi/.debug/libssp.so.0
> 
>   /lib/arm-linux-gnueabi/.debug/libitm.so.1.0.0
> 
>   /lib/arm-linux-gnueabi/.debug/libmudflapth.so
> 
>   /lib/arm-linux-gnueabi/.debug/libgfortran.so.3.0.0
> 
>   /lib/arm-linux-gnueabi/.debug/libmudflap.so.0
> 
>   /lib/arm-linux-gnueabi/.debug/libmudflapth.so.0
> 
>   /lib/arm-linux-gnueabi/.debug/libstdc++.so.6.0.17
> 
>   /lib/arm-linux-gnueabi/.debug/libitm.so.1
> 
>   /lib/arm-linux-gnueabi/.debug/libssp.so.0.0.0
> 
>   /lib/arm-linux-gnueabi/.debug/libssp.so
> 
>   /lib/arm-linux-gnueabi/.debug/libgfortran.so.3
> 
>   /usr/lib/liblzma.so.5.0.0
> 
>   /usr/lib/liblzma.so.5
> 
> WARNING: QA Issue: No GNU_HASH in the elf binary:
> '/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
> l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-lina
> ro-toolchain-2013.03-r2-arago3/packages-split/external-linaro-toolchain/
> lib/libmudflapth.so.0.0.0'
> 
> WARNING: QA Issue: No GNU_HASH in the elf binary:
> '/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
> l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-lina
> ro-toolchain-2013.03-r2-arago3/packages-split/external-linaro-toolchain/
> lib/libmudflap.so.0.0.0'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/lib/libmudfla
> pth.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/lib/libgomp.a
> '
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/lib/libitm.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/lib/libmudfla
> p.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/lib/libssp.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libut
> il.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libg.
> a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/librp
> csvc.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libc.
> a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libmc
> heck.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libns
> l.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/librt
> .a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libm.
> a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libBr
> okenLocale.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libpt
> hread.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libre
> solv.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libbs
> d-compat.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libcr
> ypt.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libie
> ee.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/liban
> l.a'
> 
> WARNING: QA Issue: non -staticdev package contains static .a library:
> external-linaro-toolchain-dev path
> '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
> .03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libdl
> .a'
> 
> WARNING: QA Issue: No GNU_HASH in the elf binary:
> '/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
> l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/zip-3.0-r1/pa
> ckages-split/zip/usr/bin/zip'
> 
> WARNING: QA Issue: No GNU_HASH in the elf binary:
> '/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
> l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/zip-3.0-r1/pa
> ckages-split/zip/usr/bin/zipsplit'
> 
> WARNING: QA Issue: No GNU_HASH in the elf binary:
> '/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
> l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/zip-3.0-r1/pa
> ckages-split/zip/usr/bin/zipcloak'
> 
> WARNING: QA Issue: No GNU_HASH in the elf binary:
> '/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
> l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/zip-3.0-r1/pa
> ckages-split/zip/usr/bin/zipnote'
> 
> WARNING: QA Issue: No GNU_HASH in the elf binary:
> '/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
> l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/gdbm-1.8.3-r4
> /packages-split/gdbm/usr/lib/libgdbm.so.3.0.0'
> 
> WARNING: The recipe is trying to install files into a shared area when
> those files already exist. Those files are:
> 
>  
> /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
> -linaro-toolchain/sysroots/tci6614-evm/lib/libattr.so.1.1.0
> 
>  
> /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
> -linaro-toolchain/sysroots/tci6614-evm/lib/libattr.so.1
> 
> WARNING: The recipe is trying to install files into a shared area when
> those files already exist. Those files are:
> 
>  
> /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
> -linaro-toolchain/sysroots/tci6614-evm/lib/libacl.so.1.1.0
> 
>  
> /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
> -linaro-toolchain/sysroots/tci6614-evm/lib/libacl.so.1
> 
> WARNING: ti-cuia: No generic license file exists for: TI in any provider
> 
> WARNING: QA Issue: ti-cuia: Files/directories were installed but not
> shipped
> 
>   /usr/lib/gnu.targets.codesourcery.rtsv5T.a470MV
> 
>   /usr/lib/boot.am3g
> 
>   /usr/lib/syscalls.am3g
> 
>   /usr/lib/syscalls.am4g
> 
>   /usr/lib/gnu.targets.arm.rtsv7M.am4g
> 
>   /usr/lib/boot.am4g
> 
>   /usr/lib/gnu.targets.arm.rtsv6.av6
> 
>   /usr/lib/boot.am4fg
> 
>   /usr/lib/gnu.targets.arm.rtsv5T.av5T
> 
>   /usr/lib/syscalls.am4fg
> 
>   /usr/lib/gnu.targets.arm.rtsv7M.am3g
> 
>   /usr/lib/gnu.targets.arm.rtsv7A.av7A
> 
>   /usr/lib/gnu.targets.codesourcery.rtsv6.av6
> 
>   /usr/lib/gnu.targets.arm.rtsv7M.am4fg
> 
> WARNING: Failed to fetch URL
> http://www.remlab.net/files/ndisc6/ndisc6-0.6.7.tar.bz2, attempting
> MIRRORS if available
> 
> WARNING: Failed to fetch URL
> ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-2.11.src
> .tar.gz, attempting MIRRORS if available
> 
> WARNING: Failed to fetch URL
> http://www.angstrom-distribution.org/unstable/sources/tinylogin-1.4.tar.
> bz2, attempting MIRRORS if available
> 
> WARNING: ti-transportnetlib-ipsecmgr: No generic license file exists
> for: TI in any provider
> 
> WARNING: ti-udma: No generic license file exists for: TI in any provider
> 
> WARNING: ti-trace-framework: No generic license file exists for: TI in
> any provider
> 
> WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the
> base_prefix, requires a shared library under exec_prefix (/usr):
> libgobject-2.0.so.0 => /usr/lib/libgobject-2.0.so.0 (0xdead2000)
> 
> WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the
> base_prefix, requires a shared library under exec_prefix (/usr):
> libgthread-2.0.so.0 => /usr/lib/libgthread-2.0.so.0 (0xdead3000)
> 
> WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the
> base_prefix, requires a shared library under exec_prefix (/usr):
> libffi.so.6 => /usr/lib/libffi.so.6 (0xdead4000)
> 
> WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the
> base_prefix, requires a shared library under exec_prefix (/usr):
> libglib-2.0.so.0 => /usr/lib/libglib-2.0.so.0 (0xdead5000)
> 
> WARNING: QA Issue: udev: /lib/udev/udev-acl, installed in the
> base_prefix, requires a shared library under exec_prefix (/usr):
> libglib-2.0.so.0 => /usr/lib/libglib-2.0.so.0 (0xdead2000)
> 
> ERROR: Function failed: do_install (see
> /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
> -linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r1
> /temp/log.do_install.31494 for further information)
> 
> ERROR: Logfile of failure stored in:
> /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
> -linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r1
> /temp/log.do_install.31494
> 
> Log data follows:
> 
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> 'common']
> 
> | DEBUG: Executing shell function do_install
> 
> | NOTE: make -j 8 install
> 
> | Making install in src
> 
> | make[1]: Entering directory
> `/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
> l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r
> 1/lldpd-0.5.7/src'
> 
> | make[2]: Entering directory
> `/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
> l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r
> 1/lldpd-0.5.7/src'
> 
> | make[2]: Nothing to be done for `install-data-am'.
> 
> | test -z "/usr/sbin" || /bin/mkdir -p "/usr/sbin"
> 
> |   /bin/bash ../libtool   --mode=install /usr/bin/install -c lldpd
> lldpctl '/usr/sbin'
> 
> | libtool: install: /usr/bin/install -c lldpd /usr/sbin/lldpd
> 
> | /usr/bin/install: cannot create regular file `/usr/sbin/lldpd':
> Permission denied
> 
> | make[2]: *** [install-sbinPROGRAMS] Error 1
> 
> | make[2]: Leaving directory
> `/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
> l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r
> 1/lldpd-0.5.7/src'
> 
> | make[1]: *** [install-am] Error 2
> 
> | make[1]: Leaving directory
> `/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
> l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r
> 1/lldpd-0.5.7/src'
> 
> | make: *** [install-recursive] Error 1
> 
> | ERROR: oe_runmake failed
> 
> | ERROR: Function failed: do_install (see
> /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
> -linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r1
> /temp/log.do_install.31494 for further information)
> 
> ERROR: Task 1739
> (/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/sources/meta-arago/meta
> -arago-extras/recipes-bsp/lldpd/lldpd_0.5.7.bb, do_install) failed with
> exit code '1'
> 
> NOTE: Tasks Summary: Attempted 1772 tasks of which 179 didn't need to be
> rerun and 1 failed.
> 
> Waiting for 0 running tasks to finish:
> 
>  
> 
> Summary: 1 task failed:
> 
>  
> /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/sources/meta-arago/meta-
> arago-extras/recipes-bsp/lldpd/lldpd_0.5.7.bb, do_install
> 
> Summary: There were 53 WARNING messages shown.
> 
> Summary: There was 1 ERROR message shown, returning a non-zero exit
> code.
> 

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


