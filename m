Return-Path: <btv1==33888e39b36==Matt.Schuckmann@planar.com>
Received: from barbvt11.planar.com (mail.planar.com [199.244.172.52])
	by arago-project.org (Postfix) with ESMTP id C04C1529B7
	for <meta-arago@arago-project.org>;
	Thu, 18 Sep 2014 22:56:05 +0000 (UTC)
X-ASG-Debug-ID: 1411080960-04afd2135f922870001-NloGV9
Received: from msxbvt03.planar.net (msxbvt03.planar.net [172.16.0.147]) by
	barbvt11.planar.com with ESMTP id 9BcmKCufql1k6LFy;
	Thu, 18 Sep 2014 15:56:00 -0700 (PDT)
X-Barracuda-Envelope-From: Matt.Schuckmann@planar.com
Received: from MSXBEBVT12.planar.net ([::1]) by msxbvt03.planar.net ([::1])
	with mapi; Thu, 18 Sep 2014 15:56:00 -0700
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Thu, 18 Sep 2014 15:55:59 -0700
Thread-Topic: [meta-arago] Arago build fails if building srcipk is disabled
X-ASG-Orig-Subj: RE: [meta-arago] Arago build fails if building srcipk is
	disabled
Thread-Index: Ac/TifwqTTIahg62QiCaXrbz22oJ0AABnfTw
Message-ID: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FD3@MSXBEBVT12.planar.net>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FA1@MSXBEBVT12.planar.net>
	<20140918214549.GY2480@denix.org>
In-Reply-To: <20140918214549.GY2480@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: msxbvt03.planar.net[172.16.0.147]
X-Barracuda-Start-Time: 1411080960
X-Barracuda-URL: http://10.10.111.113:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at planar.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4996 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No,
	SCORE=0.00 using per-user scores of TAG_LEVEL=1000.0
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
X-List-Received-Date: Thu, 18 Sep 2014 22:56:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com]
> Sent: Thursday, September 18, 2014 2:46 PM
> To: Matt Schuckmann
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] Arago build fails if building srcipk is
> disabled
>=20
> On Thu, Sep 18, 2014 at 02:02:24PM -0700, Matt Schuckmann wrote:
> > I've been chasing this for a bit and I think I've almost got it
> figured out.
> > I've been trying to create a new DISTRO based on Arago and I keep
> getting the following error.
> >
> > /home/dev/builds/zanzibar/tisdk/build/arago-tmp-external-linaro-
> toolch
> > ain/work/zanziboard-oe-linux-gnueabi/linux-ti-staging/3.14.17-
> r22e+git
> > rAUTOINC+1ef37cd35d-arago1/temp/run.do_compile.28819: line 105:
> > sourceipk_do_create_srcipk: command not found
> >
> > I finally figured out that if I included arago-source-ipk.conf in my
> DISTRO file the error goes away.
> > My understanding is that arago-source-ipk.conf turns on creating
> srcipk packages for all the packages included in the SDK. I'm not
> interested in creating srcipk's (at least I don't think I am) since I'm
> not trying to create an SDK I just want a deployable image.
> >
> > Digging a little deeper I found that meta-arago-distro/recipes-
> kernel/linux/copy-defconfig.inc calls sourceipk_do_create_srcipk in a
> do_compile_prepend() function to pick up any changes to the
> configuration file and then rebuild the srcipk.
> >
> > I think that the do_compile_prepend() function should test the value
> of one of the CREATE_SRCIPK_* variables before it tries to call
> sourceipk_do_create_srcipk, I'm just not sure which one.
> > I'm guessing maybe CREATE_SRCIPK_pn-linux-ti-staging but I'm not sure
> or maybe it should test multiple variables?
> >
> > I'd appreciate any guidance.
>=20
> Matt,
>=20
> So, the arago-source-ipk.conf defines which components need to create
> srcipk packages, but it also inherits the sourceipk.bbclass which
> provides the necessary sourceipk_do_create_srcipk() function. The first
> thing that function does is it checks whether CREATE_SRCIPK variable is
> defined and doesn't do anything if it's not.
>=20
> So, it appears that copy-defconfig.inc should not directly try to call
> that function because it makes the assumption that sourceipk.bbclass is
> always inherited. Simplest workaround would be to check for
> CREATE_SRCIPK variabe before calling that function, but I wonder if
> there's a better solution...
>=20
> --

Denys,=20
Being new to this I can't really answer the question if there is a better w=
ay.=20
I would like to know the proper way to check for CREATE_SRCIPK so that I ca=
n move on from this.=20
This seems to work but I do not have a high degree of confidence that I got=
 it correct, seems like the value should be checked too.=20

do_compile_prepend() {
    if [ -n "$CREATE_SRCIPK" ]
    then
        cp ${S}/.config ${S}/arch/arm/configs/${CONFIG_NAME}
        sourceipk_do_create_srcipk
    fi
}

Matt S.=20

PS.=20
I did notice that there is one other recipe doing something similar
./meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18x=
x_r8.a9.14.bb

> Denys

