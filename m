Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 02EAD52A1E
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 14:29:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7EEThe1005702
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 09:29:43 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EETgsd013580
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 09:29:43 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 14 Aug 2014 09:29:42 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] qtwayland - update to 5.4 branch
Thread-Index: AQHPt8f6xYs85ALaN0esLhEEFkB4xpvQdO0AgAADf4D//7BD8A==
Date: Thu, 14 Aug 2014 14:29:41 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140A1C66@DFLE09.ent.ti.com>
References: <1408024773-17838-1-git-send-email-j-stiffler@ti.com>
	<20140814140207.GV23523@edge>
	<8F29D6B095ED194EA1980491A5E029710C6FB695@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6FB695@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] qtwayland - update to 5.4 branch
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
X-List-Received-Date: Thu, 14 Aug 2014 14:29:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I gave that a quick try and it failed:

WARNING: Failed to fetch URL git://qt.gitorious.org/qt/qtwayland.git;branch=
=3DHEAD, attempting MIRRORS if available
ERROR: Fetcher failure: Unable to find revision a237778666666ab77c4e8e6b501=
cf0fbe7c9223e in branch HEAD even from upstream
ERROR: Function failed: Fetcher failure for URL: 'git://qt.gitorious.org/qt=
/qtwayland.git;branch=3DHEAD'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/a0866934local/dev/git/oe-layerse=
tup/build/arago-tmp-external-linaro-toolchain/work/i686-linux/qtwayland-nat=
ive/5.2.1+gitAUTOINC+a237778666-r0-arago2/temp/log.do_fetch.4461
NOTE: recipe qtwayland-native-5.2.1+gitAUTOINC+a237778666-r0-arago2: task d=
o_fetch: Failed
ERROR: Task 463 (/home/a0866934local/dev/git/oe-layersetup/sources/meta-qt5=
/recipes-qt/qt5/qtwayland-native_git.bb, do_fetch) failed with exit code '1=
'


-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Thursday, August 14, 2014 10:15 AM
To: Dmytriyenko, Denys; Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH] qtwayland - update to 5.4 branch

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

Although it would be nice to see if we can set QT_MODULE_BRANCH to HEAD. Th=
at should always point to the latest branch I'm guessing.



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Thursday, August 14, 2014 9:02 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] qtwayland - update to 5.4 branch
>=20
> Ack
>=20
> On Thu, Aug 14, 2014 at 09:59:32AM -0400, Jacob Stiffler wrote:
> > * The 5.3 branch no longer exists and the SRCREV points to a commit=20
> > on
> the 5.4 branch.
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  .../recipes-qt/qt5/qtwayland-native_git.bbappend   |    4 ++--
> >  .../recipes-qt/qt5/qtwayland_git.bbappend          |    4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland-
> native_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland-
> native_git.bbappend
> > index 53c1454..64de589 100644
> > --- a/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
> > +++ b/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
> > @@ -1,3 +1,3 @@
> > -PR_append =3D "-arago0"
> > +PR_append =3D "-arago1"
> >
> > -QT_MODULE_BRANCH =3D "5.3"
> > +QT_MODULE_BRANCH =3D "5.4"
> > diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> > index 53c1454..64de589 100644
> > --- a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> > +++ b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> > @@ -1,3 +1,3 @@
> > -PR_append =3D "-arago0"
> > +PR_append =3D "-arago1"
> >
> > -QT_MODULE_BRANCH =3D "5.3"
> > +QT_MODULE_BRANCH =3D "5.4"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

