Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0369552998
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 14:30:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OEUnGY014941;
	Thu, 24 Apr 2014 09:30:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OEUn8t032490;
	Thu, 24 Apr 2014 09:30:49 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 09:30:48 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 5/8] base-files: remove symlinking of /run
	vs. /var/run not needed in Dora
Thread-Index: AQHPX1+4GUzJ5wf5vEyTQ9GgutpkZpshCD8A///MiLA=
Date: Thu, 24 Apr 2014 14:30:47 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C68E191@DFLE08.ent.ti.com>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
	<1398304280-15426-5-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015CFB1F93@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CFB1F93@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 5/8] base-files: remove symlinking of /run vs. /var/run not needed in Dora
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
X-List-Received-Date: Thu, 24 Apr 2014 14:30:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Thursday, April 24, 2014 7:35 AM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 5/8] base-files: remove symlinking of /r=
un
> vs. /var/run not needed in Dora
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Wednesday, April 23, 2014 8:51 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 5/8] base-files: remove symlinking of /run
> >vs. /var/run not needed in Dora
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > .../recipes-core/base-files/base-files_3.0.14.bbappend        |
> >11 +----------
> > 1 file changed, 1 insertion(+), 10 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-core/base-files/base-
> >files_3.0.14.bbappend b/meta-arago-distro/recipes-core/base-
> >files/base-files_3.0.14.bbappend
> >index 4d831fd..8c65bd1 100644
> >--- a/meta-arago-distro/recipes-core/base-files/base-
> >files_3.0.14.bbappend
> >+++ b/meta-arago-distro/recipes-core/base-files/base-
> >files_3.0.14.bbappend
> >@@ -1,13 +1,4 @@
> > # look for files in this layer first
> > FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> >
> >-PR_append =3D "-arago1"
> >-
> >-# Pre-create /run symlink to point to /var/run at build time -# This
> >normally happens on first boot, but may be too late for automount, -#
> >which tries to create mount-points in /run -# NOTE: This step is not
> >required in Dora and up, due to reverse direction -# of symlinking
> >between /run and /var/run -do_install_append () {
> >-	ln -sf /var/run ${D}/run
> >-}
> >+PR_append =3D "-arago2"
> >--
> >1.9.2
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

