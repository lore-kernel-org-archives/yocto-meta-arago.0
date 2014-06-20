Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 22B1A52A63
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:29:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJToYn003575;
	Fri, 20 Jun 2014 14:29:50 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJToLT032288;
	Fri, 20 Jun 2014 14:29:50 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:29:50 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 12/19] hostap-daemon: specify the branch
	being used for this version
Thread-Index: AQHPjLJummTmVNgFcEWHk/nODv/qmZt6sLmA//+si/CAAAUdwA==
Date: Fri, 20 Jun 2014 19:29:49 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D642B@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-13-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D936D@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C6D63CF@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6D63CF@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 12/19] hostap-daemon: specify the branch being used for this version
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
X-List-Received-Date: Fri, 20 Jun 2014 19:29:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

FYI I'm ok with this as is just to get things working. I just want to know =
if we need to track this and make a future update.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Friday, June 20, 2014 2:29 PM
> To: Maupin, Chase; Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 12/19] hostap-daemon: specify the branch
> being used for this version
>=20
> I'm not familiar with the git repos for these wireless packages. Do we ne=
ed our
> wireless friends to confirm these branches? Taking a quick glance it look=
s like
> this tag was based on the android_jb_mr1_39 branch but mbss_suspend is
> forked off of android_jb_mr1_39.
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > Sent: Friday, June 20, 2014 2:09 PM
> > To: Denys Dmytriyenko; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 12/19] hostap-daemon: specify the
> > branch being used for this version
> >
> > Acked-by: Chase Maupin <chase.maupin@ti.com>
> >
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > >Sent: Friday, June 20, 2014 12:57 PM
> > >To: meta-arago@arago-project.org
> > >Subject: [meta-arago] [PATCH 12/19] hostap-daemon: specify the branch
> > >being used for this version
> > >
> > >From: Denys Dmytriyenko <denys@ti.com>
> > >
> > >Bitbake fetcher now requires the branch to be specified when SRCREV
> > >is not on master
> > >
> > >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >---
> > > .../recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
> > >| 1 +
> > > meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> > >| 2 +-
> > > 2 files changed, 2 insertions(+), 1 deletion(-)
> > >
> > >diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-
> > >daemon-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-
> > >connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
> > >index acd3c29..cd5d8d3 100644
> > >--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> > >wl18xx_r8.a8.10.bb
> > >+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> > >wl18xx_r8.a8.10.bb
> > >@@ -16,6 +16,7 @@ PV =3D "2.0-devel-ti"
> > >
> > > # Tag: ol_r8.a8.10
> > > SRCREV =3D "257ab333aad993b4be81808524bc0d939c276058"
> > >+BRANCH =3D "mbss_suspend"
> > >
> > > PROVIDES +=3D "hostap-daemon"
> > > RPROVIDES_${PN} +=3D "hostap-daemon"
> > >diff --git a/meta-arago-extras/recipes-
> > >connectivity/hostap/hostap.inc
> > >b/meta-arago-extras/recipes- connectivity/hostap/hostap.inc index
> > >9be2585..15e82d5 100644
> > >--- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> > >+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> > >@@ -18,7 +18,7 @@ INITSCRIPT_NAME=3D"hostapd"
> > >
> > > CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
> > >
> > >-SRC_URI =3D "git://github.com/TI-OpenLink/hostap.git;protocol=3Dgit \
> > >+SRC_URI =3D "git://github.com/TI-
> > >OpenLink/hostap.git;protocol=3Dgit;branch=3D${BRANCH} \
> > >            file://0001-hostapd-change-conf-file-for-better-oob-
> > >startup.patch;patchdir=3D.. \
> > >            file://defconfig \
> > > 	       file://init"
> > >--
> > >2.0.0
> > >
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

