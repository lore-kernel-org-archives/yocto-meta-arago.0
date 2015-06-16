Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8ACE7529B5
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 14:35:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t5GEZOiE020679;
	Tue, 16 Jun 2015 09:35:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5GEZOx6012030;
	Tue, 16 Jun 2015 09:35:24 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 16 Jun 2015 09:35:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5GEZOd3021008;
	Tue, 16 Jun 2015 09:35:24 -0500
Date: Tue, 16 Jun 2015 10:35:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: matti kaasinen <matti.kaasinen@gmail.com>
Message-ID: <20150616143524.GC14786@edge>
References: <CADnUhn12omPvo_t8L9+bt4H4t1U4q4xkK1N6WwbDiYoAyfXMZw@mail.gmail.com>
	<CADnUhn3=ToQNxiSZkwkmQD75WpDEUx5p5Q=Vx4h0NC-+guMJ4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnUhn3=ToQNxiSZkwkmQD75WpDEUx5p5Q=Vx4h0NC-+guMJ4A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Arago/Daisy, systemd_211.bb crashes
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
X-List-Received-Date: Tue, 16 Jun 2015 14:35:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

We don't use systemd for now.

On Tue, Jun 16, 2015 at 03:42:04PM +0300, matti kaasinen wrote:
> Some additions:
> Error takes place when compiling git/src/udev/udev-builtin-kmod.c with
> message:
> git/src/udev/udev-builtin-kmod.c:71: error: undefined reference to
> 'udev_main_log'
> 
> Requested symbol is defined both in git/src/udev/udevadm.c,
> git/src/udev/udevd.c and git/src/test/test-udev.c. It is also declared in
> git/src/udev/udev.h.
> udevadm.o, udevd.o and test-udev.o can all be found from build/src/udev
> folder. So, most like there is some kind dependency problem in autotools
> settings.
> 
> Thanks,
> Matti
> 
> 2015-06-16 8:40 GMT+03:00 matti kaasinen <matti.kaasinen@gmail.com>:
> 
> > Hi!
> >
> > I get following error listing from systemd_211.bb run:
> >
> > | arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-ranlib
> > .libs/libsystemd-core.a
> > | arm-linux-gnueabi-libtool: link: rm -fr .libs/libsystemd-core.lax
> > | arm-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "
> > libsystemd-core.la" && ln -s "../libsystemd-core.la" "libsystemd-core.la"
> > )
> > | arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-ranlib
> > .libs/libsystemd-networkd-core.a
> > | arm-linux-gnueabi-libtool: link: rm -fr
> > .libs/libsystemd-networkd-core.lax .libs/libsystemd-networkd-core.lax
> > | arm-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "
> > libsystemd-networkd-core.la" && ln -s "../libsystemd-networkd-core.la" "
> > libsystemd-networkd-core.la" )
> > | make[1]: *** [all-recursive] Error 1
> > | make: *** [all] Error 2
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_compile (log file is located at
> > /ARAGO/BUILT-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/systemd/1_211+gitAUTOINC+3a450ec5c6-r0/temp/log.do_compile.13883)
> >
> > My system configuration is:
> > Build Configuration:
> > BB_VERSION        = "1.26.0"
> > BUILD_SYS         = "x86_64-linux"
> > NATIVELSBSTRING   = "Ubuntu-14.04"
> > TARGET_SYS        = "arm-linux-gnueabi"
> > MACHINE           = "am335x-evm"
> > DISTRO            = "arago"
> > DISTRO_VERSION    = "2015.05"
> > TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa8"
> > TARGET_FPU        = "vfp-neon"
> > meta-arago-distro
> > meta-arago-extras = "daisy:91ff756d1b089f2c6d70a907419550314e2a6a28"
> > meta-qt5          = "master:9925146ee780e7a1df8bf2bc958619b7cfdae690"
> > toolchain-layer
> > meta-networking
> > meta-ruby
> > meta-oe
> > meta-initramfs
> > meta-webserver    = "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
> > meta-ti           = "daisy:b812d89ed4e9a64f60a279f3fd26f91d22d17647"
> > meta-linaro-toolchain = "daisy:06008235ca752fea678953e85adaa29a491d246b"
> > meta              = "daisy:5a577ec878a15f3caaf4893b819825ffb8c81266"
> >
> > Thanks,
> > Matti
> >

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


