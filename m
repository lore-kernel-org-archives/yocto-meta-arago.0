Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 48F1052AC6
	for <meta-arago@arago-project.org>;
	Sat,  6 Oct 2012 18:49:17 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q96InGEI000734
	for <meta-arago@arago-project.org>; Sat, 6 Oct 2012 13:49:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q96InGul016526
	for <meta-arago@arago-project.org>; Sat, 6 Oct 2012 13:49:16 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Sat, 6 Oct 2012 13:49:16 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] iperf: Update to version 2.0.5
Thread-Index: AQHNosG0cHidp72OpUGutB+zE4gVbZerQ3QA//+yYGKAAFRpgIABVhVA
Date: Sat, 6 Oct 2012 18:49:15 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2FDC7B@DFLE09.ent.ti.com>
References: <1349419808-21687-1-git-send-email-fcooper@ti.com>
	<20121005165800.GA31500@edge>
	<A0CC959A-B26A-43D1-BE47-61EBB6E7A6DD@ti.com>
	<20121005172217.GI23366@denix.org>
In-Reply-To: <20121005172217.GI23366@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] iperf: Update to version 2.0.5
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
X-List-Received-Date: Sat, 06 Oct 2012 18:49:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sent the below message to only Denys. Didn't realize I didn't copy the enti=
re list.

Anyway. I will be sending a version 2 of this iperf patch and also sending =
a patch to meta-oe.

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Friday, October 05, 2012 12:42 PM
To: Dmytriyenko, Denys
Subject: Re: [meta-arago] [PATCH] iperf: Update to version 2.0.5

I was referring to this recipe which I ported from arago. This recipe didn'=
t have the patches the the meta-oe 2.0.4 version included.

http://arago-project.org/git/?p=3Darago.git;a=3Dblob;f=3Drecipes/iperf/iper=
f_2.0.5.bb;h=3D63f23262dda0284f01f1a76105dec606b46fbc8c;hb=3DHEAD

Most likely I will send a v2 if those patches from meta-oe are still needed

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, October 05, 2012 12:22 PM
To: Cooper Jr., Franklin
Cc: Dmytriyenko, Denys; meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] iperf: Update to version 2.0.5

On Fri, Oct 05, 2012 at 05:20:09PM +0000, Cooper Jr., Franklin wrote:
> Original recipe didn't use the patches from 2.0.4 I didn't check if it di=
dn't apply or not.=20

Huh?
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-benchma=
rk/iperf/iperf_2.0.4.bb


> On Oct 5, 2012, at 11:59 AM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
>=20
> > On Fri, Oct 05, 2012 at 01:50:08AM -0500, Franklin S. Cooper Jr wrote:
> >> * Upgrading to newer version of iperf.
> >> * Newer versions of iperf reduced CPU load thus increasing=20
> >> performance in  wl12xx tests.
> >=20
> > And one more question - sorry for separate emails.
> >=20
> >=20
> >> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >> ---
> >> .../recipes-benchmark/iperf/iperf_2.0.5.bb         |   34 ++++++++++++=
++++++++
> >> 1 files changed, 34 insertions(+), 0 deletions(-) create mode=20
> >> 100644 meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
> >>=20
> >> diff --git=20
> >> a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb=20
> >> b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
> >> new file mode 100644
> >> index 0000000..aff06b2
> >> --- /dev/null
> >> +++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
> >> @@ -0,0 +1,34 @@
> >> +DESCRIPTION =3D "Iperf is a tool to measure maximum TCP bandwidth, al=
lowing the tuning of various parameters and UDP characteristics"
> >> +HOMEPAGE =3D "http://dast.nlanr.net/Projects/Iperf/"
> >> +SECTION =3D "console/network"
> >> +LICENSE =3D "NewBSD"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De8478eae9f479e39bc34975193=
360298"
> >> +
> >> +SRC_URI =3D " ${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz"
> >=20
> > You dropped all the other patches that were part of 2.0.4 - did you=20
> > verify they are already there in 2.0.5 tree or they no longer needed?
> >=20
> > --
> > Denys
> >=20
> >=20
> >> +
> >> +SRC_URI[md5sum] =3D "44b5536b67719f4250faed632a3cd016"
> >> +SRC_URI[sha256sum] =3D "636b4eff0431cea80667ea85a67ce4c68698760a9837e=
1e9d13096d20362265b"
> >> +
> >> +PR =3D "r0"
> >> +
> >> +inherit autotools
> >> +
> >> +S=3D"${WORKDIR}/iperf-${PV}"
> >> +
> >> +EXTRA_OECONF =3D "--exec-prefix=3D${STAGING_DIR_HOST}${layout_exec_pr=
efix}"
> >> +
> >> +do_configure() {
> >> +    export ac_cv_func_malloc_0_nonnull=3Dyes
> >> +    gnu-configize
> >> +    oe_runconf
> >> +}
> >> +
> >> +do_compile() {
> >> +    cd ${WORKDIR}/iperf-${PV}
> >> +    oe_runmake
> >> +}
> >> +
> >> +do_install() {
> >> +    cd ${WORKDIR}/iperf-${PV}/src
> >> +    oe_runmake DESTDIR=3D${D} install }
> >> --
> >> 1.7.0.4
> >>=20
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20

