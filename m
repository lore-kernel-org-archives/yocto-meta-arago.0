Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 12B7B52992
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 14:47:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7TElTxr000936;
	Fri, 29 Aug 2014 09:47:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7TElTxt012279;
	Fri, 29 Aug 2014 09:47:29 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 29 Aug 2014 09:47:29 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Devin Hughes <devin@jd2.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] Building meta-arago daisy
Thread-Index: Ac/BMENeG7tsuEZNS3mhRYwxryBe8QAMqqQAAJeIpIAACmIYUA==
Date: Fri, 29 Aug 2014 14:47:28 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C721666@DFLE08.ent.ti.com>
References: <003101cfc132$d793d8b0$86bb8a10$@jd2.com>
	<20140826142126.GN23523@edge> <003f01cfc397$28a0ab50$79e201f0$@jd2.com>
In-Reply-To: <003f01cfc397$28a0ab50$79e201f0$@jd2.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Building meta-arago daisy
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
X-List-Received-Date: Fri, 29 Aug 2014 14:47:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Devin Hughes
> Sent: Friday, August 29, 2014 9:40 AM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] Building meta-arago daisy
>=20
> Hi Denys,
>=20
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denys@ti.com]
> > Sent: Tuesday, August 26, 2014 10:21 AM
> > To: Devin Hughes
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] Building meta-arago daisy
> >
> > Hi, Devin,
> >
> > On Tue, Aug 26, 2014 at 09:37:11AM -0400, Devin Hughes wrote:
> > > I am trying to build the daisy branch for my 335x-EVMSK. The build
> > > is
> > setup
> > > using arago-daisy-config.txt, and I am using the internal linaro
> > compiler. I
> > > get the same results described using the external linaro gcc4.7
> > toolchain
> > > mentioned on the wiki page. I have run into a couple of problems:
> > >
> > > 1.      The arago-base-tisdk-image builds successfully and boots on t=
he
> > SK,
> > > but the splash screen fails to show with failure to find /dev/fb0 in
> > dmesg.
> > > After the boot is complete, I can manually display the splash properl=
y.
> > This
> > > makes me think psplash is running before the lcd modules are loaded,
> > > and
> > I
> > > was curious if any of you have seen this behavior.
> >
> > Yes, it's a known issue, but not a critical one, so not yet being
> addressed.
> [Devin Hughes] No problem, I think I will use the kernel splash as a subs=
titute.
>=20
> >
> >
> > > 2.  Building arago-core-tisdk-image fails when building qt 5.2.1
> > > with
> > (from
> > > log.do_compile):
> > >
> > >
> > >
> > /home/devin/yocto/build/arago-tmp-eglibc/work/cortexa8t2hf-vfp-neon-
> oe
> > -lin
> > ux
> > >
> > -gnueabi/qtbase/5.2.1-r0-arago2/qtbase-opensource-src-5.2.1/src/tools/
> > qdoc
> > /q
> > > uoter.cpp: In constructor 'Quoter::Quoter()':
> > >
> > >
> > /home/devin/yocto/build/arago-tmp-eglibc/work/cortexa8t2hf-vfp-neon-
> oe
> > -lin
> > ux
> > >
> > -gnueabi/qtbase/5.2.1-r0-arago2/qtbase-opensource-src-5.2.1/src/tools/
> > qdoc
> > /q
> > > uoter.cpp:139:1: internal compiler error: in add_stores, at
> > > var-tracking.c:5918
> >
> > Internal compiler error in qtbase is also a known issue with Linaro
> toolchain
> > gcc-4.8 and Linaro developers are looking into it already. Right now
> > we
> are
> > using gcc-4.7 (2013.03) and evaluating gcc-4.9...
> [Devin Hughes] Is the daisy configured build stable? I rebuilt the image
> yesterday after the servers returned and it seems to run unexpectedly. No
> boot errors, but the touchscreen and application performance seem worse
> than the SDK release.=20
[Franklin] Can you explain what you mean in terms of application performanc=
e issues?
I am going to build a customized image as a test next,
> and I was thinking arago-base from daisy would be a good starting point
> since I would like qt 5.2 or greater.
[Franklin] So by default we are using Wayland/Weston and for Qt 5 we are us=
ing the Wayland compositor. However, there are several touch screen related=
 bugs in Weston and Qt 5 that we are working with the Qt 5 and Weston team =
to address. It will take some time to fix so if acceptable I would recommen=
d just using a usb mouse as a work around for now if your running into thos=
e problems also.

> >
> > --
> > Denys
> >
> >
> > > }
> > >
> > > ^
> > >
> > > Please submit a full bug report,
> > >
> > > with preprocessed source if appropriate.
> > >
> > > See <http://gcc.gnu.org/bugs.html> for instructions.
> > >
> > > make[2]: *** [.obj/quoter.o] Error 1
> > >
> > > make[2]: *** Waiting for unfinished jobs....
> > >
> > >
> > >
> > > Any guidance is greatly appreciated.
> > >
> > >
> > >
> > > Regards,
> > >
> > > Devin Hughes
> > >
> > >
> > >
> >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

