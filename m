Return-Path: <x0171695@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E019E529B0
	for <meta-arago@arago-project.org>;
	Wed, 25 Sep 2013 13:52:28 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8PDqQjE010083
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2013 08:52:27 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8PDqMlX017791;
	Wed, 25 Sep 2013 08:52:22 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Wed, 25 Sep 2013 21:52:22 +0800
From: "Muddegowda, Deepak" <x0171695@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Srinivasan, Nageswari"
	<nageswari@ti.com>, "Heroor, Siddharth" <heroor@ti.com>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>, "Mankad,
	Maulik Ojas" <maulik@ti.com>, "epos_dev@list.ti.com - Internal mailing list
	for EPOS dev team (May contain non-TIers)" <epos_dev@list.ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-argao patch v3] arago-source-ipk: Added the new packages
	to generate the sourceipk
Thread-Index: AQHOuewOpKQAR/zIzkmRlAt8zohW6ZnV8W2AgACHDaA=
Date: Wed, 25 Sep 2013 13:52:21 +0000
Message-ID: <16D38216B6B8BA4B9AF9DBFC3760F38D3F14DDEB@DBDE04.ent.ti.com>
References: <1380112668-22445-1-git-send-email-x0171695@ti.com>
	<7D46E86EC0A8354091174257B2FED1015974D700@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015974D700@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Sep 2013 17:32:55 +0000
Subject: Re: [meta-argao patch v3] arago-source-ipk: Added the new packages to generate the sourceipk
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
X-List-Received-Date: Wed, 25 Sep 2013 13:52:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Maupin, Chase
> Sent: Wednesday, September 25, 2013 7:17 PM
> To: Muddegowda, Deepak; Srinivasan, Nageswari; Heroor, Siddharth;
> Cooper Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
> epos_dev@list.ti.com - Internal mailing list for EPOS dev team (May
> contain non-TIers); meta-arago@arago-project.org
> Subject: RE: [meta-argao patch v3] arago-source-ipk: Added the new
> packages to generate the sourceipk
>=20
> >-----Original Message-----
> >From: Muddegowda, Deepak
> >Sent: Wednesday, September 25, 2013 7:38 AM
> >To: Srinivasan, Nageswari; Maupin, Chase; Heroor, Siddharth; Cooper
> >Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas; Muddegowda,
> >Deepak; epos_dev@list.ti.com - Internal mailing list for EPOS dev team
> >(May contain non-TIers); meta-arago@arago- project.org
> >Subject: [meta-argao patch v3] arago-source-ipk: Added the new
> packages
> >to generate the sourceipk
> >
> >Signed-off-by: Deepak M <x0171695@ti.com>
> >---
> >v3 changes:
> >1. Changed the aegis name to am43xx.
> >2. Added the meta-arago@arago-project.org for review.
> >
> > meta-arago-distro/conf/distro/arago-source-ipk.conf | 12
> >++++++++++++
> > 1 file changed, 12 insertions(+)
> >
> >diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> >b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> >index 63cad0d..1797091 100644
> >--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> >+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> >@@ -142,6 +142,18 @@ CREATE_SRCIPK_pn-u-boot-am3517 =3D "1"
> > SRCIPK_INSTALL_DIR_pn-u-boot-am3517 =3D "board-support/u-boot-
> >${UVER}-psp${PSPREL}"
> > SRCIPK_PACKAGE_ARCH_pn-u-boot-am3517 =3D "${MACHINE_ARCH}"
> >
> >+CREATE_SRCIPK_pn-u-boot-am43xx =3D "1"
> >+SRCIPK_INSTALL_DIR_pn-u-boot-am43xx =3D "board-support/u-boot-
> >${PV}"
> >+SRCIPK_PACKAGE_ARCH_pn-u-boot-am43xx =3D "${MACHINE_ARCH}"
> >+
> >+CREATE_SRCIPK_pn-ppa =3D "1"
> >+SRCIPK_INSTALL_DIR_pn-ppa =3D "board-support/ppa-${PV}"
> >+SRCIPK_PACKAGE_ARCH_pn-ppa =3D "${MACHINE_ARCH}"
> >+
>=20
> Is this where you want ppa installed?
[Muddegowda, Deepak] Directly, I was not able to make it sit on top layer d=
irectory. So I first I placed it in board-support and then in meta-secure p=
atch I have moved it to top directory.=20
>=20
> >+CREATE_SRCIPK_pn-linux-am43xx =3D "1"
> >+SRCIPK_INSTALL_DIR_pn-linux-am43xx =3D "board-support/linux-${PV}"
> >+SRCIPK_PACKAGE_ARCH_pn-linux-am43xx =3D "${MACHINE_ARCH}"
> >+
> > CREATE_SRCIPK_pn-linux-ti-staging =3D "1"
> > SRCIPK_INSTALL_DIR_pn-linux-ti-staging =3D "board-support/linux- ${PV}"
> > SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging =3D "${MACHINE_ARCH}"
> >--
> >1.8.1


