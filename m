Return-Path: <btv1==33888e39b36==Matt.Schuckmann@planar.com>
Received: from barbvt10.planar.com (mail.planar.com [199.244.172.52])
	by arago-project.org (Postfix) with ESMTP id F13DD52A04
	for <meta-arago@arago-project.org>;
	Thu, 18 Sep 2014 23:38:20 +0000 (UTC)
X-ASG-Debug-ID: 1411083493-04b02b73833fb560001-NloGV9
Received: from msxbvt03.planar.net ([172.16.0.147]) by barbvt10.planar.com
	with ESMTP id Lvf9L6sShrWzGoJF; Thu, 18 Sep 2014 16:38:13 -0700 (PDT)
X-Barracuda-Envelope-From: Matt.Schuckmann@planar.com
Received: from MSXBEBVT12.planar.net ([::1]) by msxbvt03.planar.net ([::1])
	with mapi; Thu, 18 Sep 2014 16:38:13 -0700
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Thu, 18 Sep 2014 16:38:12 -0700
Thread-Topic: [meta-arago] Arago build fails if building srcipk is disabled
X-ASG-Orig-Subj: RE: [meta-arago] Arago build fails if building srcipk is
	disabled
Thread-Index: Ac/TlF4apRc9HR/CRQKTyBujc90ESwABEcbA
Message-ID: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FDF@MSXBEBVT12.planar.net>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FA1@MSXBEBVT12.planar.net>
	<20140918214549.GY2480@denix.org>
	<4B07ADD556F70043925DA2E9C5D4346D2FD8727FD3@MSXBEBVT12.planar.net>
	<20140918230025.GZ2480@denix.org>
In-Reply-To: <20140918230025.GZ2480@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[172.16.0.147]
X-Barracuda-Start-Time: 1411083493
X-Barracuda-URL: http://10.10.111.112:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at planar.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No,
	SCORE=-2.02 using per-user scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.9631
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Arago build fails if building srcipk is disabled
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
X-List-Received-Date: Thu, 18 Sep 2014 23:38:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com]
> Sent: Thursday, September 18, 2014 4:00 PM
> To: Matt Schuckmann
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] Arago build fails if building srcipk is
> disabled
>=20
> On Thu, Sep 18, 2014 at 03:55:59PM -0700, Matt Schuckmann wrote:
> >
> >
> > > -----Original Message-----
> > > From: Denys Dmytriyenko [mailto:denys@ti.com]
> > > Sent: Thursday, September 18, 2014 2:46 PM
> > > To: Matt Schuckmann
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] Arago build fails if building srcipk is
> > > disabled
> > >
> > > On Thu, Sep 18, 2014 at 02:02:24PM -0700, Matt Schuckmann wrote:
> > > > I've been chasing this for a bit and I think I've almost got it
> > > figured out.
> > > > I've been trying to create a new DISTRO based on Arago and I keep
> > > getting the following error.
> > > >
> > > > /home/dev/builds/zanzibar/tisdk/build/arago-tmp-external-linaro-
> > > toolch
> > > > ain/work/zanziboard-oe-linux-gnueabi/linux-ti-staging/3.14.17-
> > > r22e+git
> > > > rAUTOINC+1ef37cd35d-arago1/temp/run.do_compile.28819: line 105:
> > > > sourceipk_do_create_srcipk: command not found
> > > >
> > > > I finally figured out that if I included arago-source-ipk.conf in
> > > > my
> > > DISTRO file the error goes away.
> > > > My understanding is that arago-source-ipk.conf turns on creating
> > > srcipk packages for all the packages included in the SDK. I'm not
> > > interested in creating srcipk's (at least I don't think I am) since
> > > I'm not trying to create an SDK I just want a deployable image.
> > > >
> > > > Digging a little deeper I found that meta-arago-distro/recipes-
> > > kernel/linux/copy-defconfig.inc calls sourceipk_do_create_srcipk in
> > > a
> > > do_compile_prepend() function to pick up any changes to the
> > > configuration file and then rebuild the srcipk.
> > > >
> > > > I think that the do_compile_prepend() function should test the
> > > > value
> > > of one of the CREATE_SRCIPK_* variables before it tries to call
> > > sourceipk_do_create_srcipk, I'm just not sure which one.
> > > > I'm guessing maybe CREATE_SRCIPK_pn-linux-ti-staging but I'm not
> > > > sure
> > > or maybe it should test multiple variables?
> > > >
> > > > I'd appreciate any guidance.
> > >
> > > Matt,
> > >
> > > So, the arago-source-ipk.conf defines which components need to
> > > create srcipk packages, but it also inherits the sourceipk.bbclass
> > > which provides the necessary sourceipk_do_create_srcipk() function.
> > > The first thing that function does is it checks whether
> > > CREATE_SRCIPK variable is defined and doesn't do anything if it's
> not.
> > >
> > > So, it appears that copy-defconfig.inc should not directly try to
> > > call that function because it makes the assumption that
> > > sourceipk.bbclass is always inherited. Simplest workaround would be
> > > to check for CREATE_SRCIPK variabe before calling that function,
> but
> > > I wonder if there's a better solution...
> > >
> > > --
> >
> > Denys,
> > Being new to this I can't really answer the question if there is a
> better way.
> > I would like to know the proper way to check for CREATE_SRCIPK so
> that I can move on from this.
> > This seems to work but I do not have a high degree of confidence that
> I got it correct, seems like the value should be checked too.
> >
> > do_compile_prepend() {
> >     if [ -n "$CREATE_SRCIPK" ]
> >     then
> >         cp ${S}/.config ${S}/arch/arm/configs/${CONFIG_NAME}
> >         sourceipk_do_create_srcipk
> >     fi
> > }
> >
> > Matt S.
> >
> > PS.
> > I did notice that there is one other recipe doing something similar
> > ./meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> wireless-
> > wl18xx_r8.a9.14.bb
>=20
> Check line #197 here:
> http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=3Dmeta-arago-
> distro/classes/sourceipk.bbclass;h=3D8fef2e9d631228eb7255ff1d43cc54b53e7d
> e607;hb=3DHEAD#l197
>=20
> --
> Denys

Ok I tried that and if turn off srcipk creation (i.e. don't INHERIT +=3D so=
urceipk and don't set CREATE_SRCIPK_pn-linux-ti-staging) and run:=20

bitbake --verbose -c compile virtual/kernel

I can see that this error occurs.=20
+ do_compile
+ '[' '!=3D' 0 ']'
/home/dev/builds/zanzibar/tisdk/build/arago-tmp-external-linaro-toolchain/w=
ork/zanziboard-oe-linux-gnueabi/linux-ti-staging/3.14.17-r22e+gitrAUTOINC+1=
ef37cd35d-arago1/temp/run.do_compile.6970: line 105: [: !=3D: unary operato=
r expected

Which leads me to believe that this is not correct.
I'm assuming that this is a bash script here? It's still not clear which pa=
rts are bash and which are python code.=20

Matt S.=20



