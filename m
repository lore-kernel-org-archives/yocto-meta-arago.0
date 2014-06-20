Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7840552A63
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:28:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJSh4R018717;
	Fri, 20 Jun 2014 14:28:43 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJShqw031716;
	Fri, 20 Jun 2014 14:28:43 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:28:43 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 12/19] hostap-daemon: specify the branch
	being used for this version
Thread-Index: AQHPjLJummTmVNgFcEWHk/nODv/qmZt6sLmA//+si/A=
Date: Fri, 20 Jun 2014 19:28:43 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D63CF@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-13-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D936D@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D0D936D@DLEE11.ent.ti.com>
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
X-List-Received-Date: Fri, 20 Jun 2014 19:28:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm not familiar with the git repos for these wireless packages. Do we need=
 our wireless friends to confirm these branches? Taking a quick glance it l=
ooks like this tag was based on the android_jb_mr1_39 branch but mbss_suspe=
nd is forked off of android_jb_mr1_39.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, June 20, 2014 2:09 PM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 12/19] hostap-daemon: specify the branch
> being used for this version
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, June 20, 2014 12:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 12/19] hostap-daemon: specify the branch
> >being used for this version
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Bitbake fetcher now requires the branch to be specified when SRCREV is
> >not on master
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > .../recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
> >| 1 +
> > meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> >| 2 +-
> > 2 files changed, 2 insertions(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-
> >daemon-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-
> >connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
> >index acd3c29..cd5d8d3 100644
> >--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> >wl18xx_r8.a8.10.bb
> >+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> >wl18xx_r8.a8.10.bb
> >@@ -16,6 +16,7 @@ PV =3D "2.0-devel-ti"
> >
> > # Tag: ol_r8.a8.10
> > SRCREV =3D "257ab333aad993b4be81808524bc0d939c276058"
> >+BRANCH =3D "mbss_suspend"
> >
> > PROVIDES +=3D "hostap-daemon"
> > RPROVIDES_${PN} +=3D "hostap-daemon"
> >diff --git a/meta-arago-extras/recipes- connectivity/hostap/hostap.inc
> >b/meta-arago-extras/recipes- connectivity/hostap/hostap.inc index
> >9be2585..15e82d5 100644
> >--- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> >+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> >@@ -18,7 +18,7 @@ INITSCRIPT_NAME=3D"hostapd"
> >
> > CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
> >
> >-SRC_URI =3D "git://github.com/TI-OpenLink/hostap.git;protocol=3Dgit \
> >+SRC_URI =3D "git://github.com/TI-
> >OpenLink/hostap.git;protocol=3Dgit;branch=3D${BRANCH} \
> >            file://0001-hostapd-change-conf-file-for-better-oob-
> >startup.patch;patchdir=3D.. \
> >            file://defconfig \
> > 	       file://init"
> >--
> >2.0.0
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

