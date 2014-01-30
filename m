Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 074F052972
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 05:12:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0U5C3xD001713;
	Wed, 29 Jan 2014 23:12:03 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0U5C3Ga025110;
	Wed, 29 Jan 2014 23:12:03 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 29 Jan 2014 23:12:03 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "jose.alarcon@kuviovision.com"
	<jose.alarcon@kuviovision.com>
Thread-Topic: [meta-arago] ti-mpm-transport broken on MCSDK
Thread-Index: AQHPHAFd5pmVTW4n6kOvlbIps7GHIZqbX4qAgAFbKqA=
Date: Thu, 30 Jan 2014 05:12:03 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490549E9CD0@DLEE11.ent.ti.com>
References: <1390871192-3063-1-git-send-email-denis@denix.org>
	<25a2617e42192ee8409b5072a91434b7@kuviovision.com>
	<20140129022615.GK6814@edge>
In-Reply-To: <20140129022615.GK6814@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: ti-mpm-transport broken on MCSDK
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
X-List-Received-Date: Thu, 30 Jan 2014 05:12:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Jose,
The mpm-transport recipes were updated for MCSDK 3.0.3 to point to DEV.MPM-=
TRANSPORT-01.00.01.00.=20
May be you are looking at the older version of the recipe?
With regards,
Sam
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Tuesday, January 28, 2014 9:26 PM
> To: jose.alarcon@kuviovision.com
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] ti-mpm-transport broken on MCSDK
>=20
> Thanks for the report. MCSDK is only now being merged to mainline meta-
> arago,
> so the support should improve in the future.
>=20
> --
> Denys
>=20
>=20
> On Tue, Jan 28, 2014 at 10:17:11AM +0200, jose.alarcon@kuviovision.com
> wrote:
> > Hello,
> >
> > ti-mpm-transport is broken on MCSDK 3.0.3:
> >
> > ERROR: Logfile of failure stored in: /home/jose/environments/kuvio-
> newserver/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-
> neon-oe-linux-gnueabi/ti-mpm-transport-git-r4/temp/log.do_compile.14714
> > Log data follows:
> > | DEBUG: Executing shell function do_compile
> > | mkdir -p /home/jose/environments/kuvio-newserver/build/arago-tmp-
> external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/ti-
> mpm-transport-git-r4/git/lib
> > | make -C /home/jose/environments/kuvio-newserver/build/arago-tmp-
> external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/ti-
> mpm-transport-git-r4/git/src/transport
> > all
> > | arm-linux-gnueabihf-gcc  -march=3Darmv7-a    -marm -mthumb-interwork
> > -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15 --
> sysroot=3D/home/jose/environments/kuvio-newserver/build/arago-tmp-
> external-linaro-toolchain/sysroots/keystone-evm
> > -I. -I/home/jose/environments/kuvio-newserver/build/arago-tmp-external-
> linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/ti-mpm-
> transport-git-r4/git/include -I/home/jose/environments/kuvio-
> newserver/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-
> neon-oe-linux-gnueabi/ti-mpm-transport-git-r4/git/src/utils
> > -I./sharedmem -I./hyplnk -I/home/jose/environments/kuvio-
> newserver/build/arago-tmp-external-linaro-toolchain/sysroots/keystone-
> evm/usr/include -I/home/jose/environments/kuvio-newserver/build/arago-
> tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-
> gnueabi/ti-mpm-transport-git-r4/git/src/utils/edma3
> > -D__ARMv7 -DDEVICE_`echo k2h | tr a-z A-Z` -D_VIRTUAL_ADDR_SUPPORT
> > -c -o mpm_transport.o mpm_transport.c
> > | In file included from mpm_transport_cfg.h:42:0,
> > |                  from mpm_transport.c:45:
> > | /home/jose/environments/kuvio-newserver/build/arago-tmp-external-
> linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/ti-mpm-
> transport-git-r4/git/src/utils/edma3/mpm_transport_edma3.h:49:40:
> > fatal error: ti/sdo/edma3/drv/edma3_drv.h: No such file or directory
> > | compilation terminated.
> > | make[1]: *** [mpm_transport.o] Error 1
> > | make: *** [transport] Error 2
> >
> > This same version of the MCSDK used to build correctly for me couple
> > of months ago. I went to the recipe file for ti-mpm-transport and
> > found that it clones the source from the top of the git repo:
> >
> > BRANCH ?=3D "master"
> > #SRCREV =3D "DEV.MPM-TRANSPORT-01.00.00.00"
> > SRCREV =3D "${AUTOREV}"
> >
> > So I changed the revision to DEV.MPM-TRANSPORT-01.00.00.00 instead.
> > Now it compiles, but it fails to install:
> >
> > ERROR: Logfile of failure stored in: /home/jose/environments/kuvio-
> newserver/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-
> neon-oe-linux-gnueabi/ti-mpm-transport-git-r4/temp/log.do_install.15271
> > Log data follows:
> > | DEBUG: Executing shell function do_install
> > | install: cannot stat `/home/jose/environments/kuvio-
> newserver/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-
> neon-oe-linux-gnueabi/ti-mpm-transport-git-
> r4/git/src/transport/test/sharedmem/mpm_transport_test.out':
> > No such file or directory
> > | ERROR: Function failed: do_install (see /home/jose/environments/kuvio=
-
> newserver/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-
> neon-oe-linux-gnueabi/ti-mpm-transport-git-r4/temp/log.do_install.15271
> > for further information)
> > ERROR: Task 2 (/home/jose/environments/kuvio-newserver/sources/meta-
> arago/meta-arago-extras/recipes-bsp/ti-mpm-transport/ti-mpm-
> transport_git.bb,
> > do_install) failed with exit code '1'
> >
> > I went to my old build and search for the particular git commit that
> > happened to be the top of the git repo at that time. Using this
> > commit, it builds OK.
> >
> > This is how I modified ti-mpm-transport.bb:
> >
> > BRANCH ?=3D "master"
> > #SRCREV =3D "DEV.MPM-TRANSPORT-01.00.00.00"
> > #SRCREV =3D "${AUTOREV}"
> > SRCREV =3D "ffa58d41aaf2a3ab4800eed91d6356b58b46a1e7"
> >
> > BTW, I reported another issue with this same recipe last Novemeber
> > on TI's e2e community (it uses a wrong SRC_URI) [1]
> >
> > Could you please take a look at those for the next MCSDK release?
> >
> > Thanks,
> >
> > --
> > Jose Alarcon
> >
> >
> > [1] http://e2e.ti.com/support/dsp/c6000_multi-
> core_dsps/b/announcements/archive/2013/11/25/mcsdk-3-0-3-
> maintenance-update-for-k2h-k2k.aspx#comments
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

