Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 66D7452A1C
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 19:42:10 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0PJg9OZ009459;
	Fri, 25 Jan 2013 13:42:09 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0PJg9dr004882;
	Fri, 25 Jan 2013 13:42:09 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Fri, 25 Jan 2013 13:42:09 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH 40/47] meta-toolchain-arago: Substitute
	dirname statement
Thread-Index: AQHN+j4kzEMgQAH+XUKHMKJAZL+a9Zha1aKA//+cEnA=
Date: Fri, 25 Jan 2013 19:42:08 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C37B7D8@DFLE09.ent.ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
	<1359037281-12610-9-git-send-email-fcooper@ti.com>
	<20130125193253.GE23977@denix.org>
In-Reply-To: <20130125193253.GE23977@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 40/47] meta-toolchain-arago: Substitute dirname statement
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
X-List-Received-Date: Fri, 25 Jan 2013 19:42:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This issue only occurred on 32bit systems and it was a problem 100% of the =
time. I only tried on Ubuntu 10.04 and not 12.04.=20
This fix was something I came up with that essentially mimicked dirname.=20

Below is what my tweak looks like in the various stub files.

if [ -n "$BASH_SOURCE" ]; then
	filename=3D`echo ${BASH_SOURCE##*/}`
	dirname=3D${BASH_SOURCE/%$filename/}
	. $dirname../environment-setup
fi

So the reason why I broke it up in multiple lines is so it atleast it is ea=
sier to understand what I am trying to accomplish.

I am still unsure what the root cause of this issue is.
=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, January 25, 2013 1:33 PM
> To: Franklin S. Cooper Jr
> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> Subject: Re: [meta-arago] [PATCH 40/47] meta-toolchain-arago: Substitute
> dirname statement
>=20
> On Thu, Jan 24, 2013 at 08:21:14AM -0600, Franklin S. Cooper Jr wrote:
> > * On 32bit systems, the dirname statement sometimes return an empty
> string.
> > * Replace dirname with several statements that provide the same result.
>=20
> I know we discussed it before, but I'm still having a hard time comprehen=
ding
> the issue and the proposed "fix"... Why is it affecting only 32bit system=
s and
> why is it happening only sometimes? What are the other factors? And why
> splitting it in several lines instead of one "fixes" the problem?
>=20
> Have you looked into it some more to understand the actual root cause?
>=20
> --
> Denys
>=20
>=20
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../recipes-core/meta/meta-toolchain-arago.bb      |    9 +++++++--
> >  1 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.b=
b
> b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > index a9d07b6..332fe48 100644
> > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-
> ${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
> >
> >  require recipes-core/meta/meta-toolchain.bb
> >
> > -PR =3D "r13"
> > +PR =3D "r14"
> >
> >  SDKTARGETSYSROOT =3D "${SDKPATH}/${ARAGO_TARGET_SYS}"
> >
> > @@ -59,7 +59,12 @@ toolchain_create_sdk_env_script () {
> >  create_shell_stub () {
> >  	i=3D$1
> >  	mv $i $i.real
> > -	printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n\t.
> \x60dirname \x24BASH_SOURCE\x60/../environment-setup\nfi\n" > $i
> > +	printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n" > $i
> > +	printf "\tfilename\x3D\x60echo
> \x24\x7BBASH_SOURCE\x23\x23\x2A\x2F\x7D\x60\n" >> $i
> > +	printf
> "\tdirname\x3D\x24\x7BBASH_SOURCE\x2F\x25\x24filename\x2F\x7D\n" >> $i
> > +	printf "\t\x2E \x24dirname\x2E\x2E\x2Fenvironment-setup\n" >> $i
> > +	printf "fi\n" >> $i
> > +
> >  	if [ "$2" =3D=3D "yes" ]; then
> >  		echo 'export PYTHONHOME=3D$SDK_PATH' >> $i
> >  		echo 'export PYTHONPATH=3Dlib/python2.7' >> $i
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

