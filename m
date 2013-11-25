Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 68BBB52A5F
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2013 16:35:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAPGZtxJ029898
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 10:35:55 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPGZtnP029372
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 10:35:55 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 25 Nov 2013 10:35:55 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/7] packagegroup-arago-tisdk-qt: Make
	packagegroup generic
Thread-Index: AQHO6fYmTiewO5KZkU2Ta9waUEvQ05o2haqA//+cknA=
Date: Mon, 25 Nov 2013 16:35:54 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C288B@DFLE08.ent.ti.com>
References: <1385398442-24668-1-git-send-email-fcooper@ti.com>
	<1385398442-24668-3-git-send-email-fcooper@ti.com>
	<20131125162215.GI690@edge>
In-Reply-To: <20131125162215.GI690@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/7] packagegroup-arago-tisdk-qt: Make packagegroup generic
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
X-List-Received-Date: Mon, 25 Nov 2013 16:35:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, November 25, 2013 10:22 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 3/7] packagegroup-arago-tisdk-qt: Make
> packagegroup generic
>=20
> On Mon, Nov 25, 2013 at 10:53:58AM -0600, Franklin S. Cooper Jr wrote:
> > * Update packagegroup so it applies to Qt 5 users along with Qt 4 users=
.
> > * To reflect this change also rename recipe top reflect that its a gene=
ric qt
> >   packagegroup.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../packagegroups/packagegroup-arago-tisdk-qt.bb   |   27
> ++++++++++++++++++++
> >  .../packagegroups/packagegroup-arago-tisdk-qte.bb  |   19 ------------=
--
> >  2 files changed, 27 insertions(+), 19 deletions(-)  create mode
> > 100644
> > meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
> > qt.bb  delete mode 100644
> > meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
> > qte.bb
> >
> > diff --git
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-qt.bb
> > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-qt.bb
> > new file mode 100644
> > index 0000000..c981f9e
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > +++ tisdk-qt.bb
> > @@ -0,0 +1,27 @@
> > +DESCRIPTION =3D "Task to add Qt embedded related packages"
> > +LICENSE =3D "MIT"
> > +PR =3D "r0"
> > +
> > +inherit packagegroup
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +QT4_DEMOS =3D "\
> > +    qt4-embedded-examples \
> > +    qt4-embedded-demos \
> > +    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles',
> > +'quick-playground', '', d)} \
>=20
> BTW, should we drop ARAGO_QT_PROVIDER?
[Franklin] Yeah I think we should. But should we drop QT_PROVIDER and use A=
RAGO_QT_PROVIDER instead since this is Arago specific? Or were you planning=
 on pushing that up to meta-qt5?

No matter what choice we make would you want to make this change before thi=
s patchset, after this patchset or after my remaining Qt 5 patches that I h=
ave yet to send?
> We now have QT_PROVIDER for qt4 vs qt5 (can possibly extend it to cover q=
t4-
> gles too) Otherwise, we started using "sgx" in MACHINE_FEATURES to
> determine whether to enable gles or not.=20
[Franklin] We would still need to check for sgx in MACHINE_FEATURES since w=
e don't have a concept of qt5-gles.
So, if we unify on that, we can drop
> ARAGO_QT_PROVIDER to avoid confusion with QT_PROVIDER.
>=20
>=20
> > +"
> > +
> > +QT5_DEMOS =3D "\
> > +    qtwebkit-examples-examples \
> > +"
> > +
> > +QT_DEMOS =3D "\
> > +    ${@base_conditional('QT_PROVIDER', 'qt5', '${QT5_DEMOS}',
> '${QT4_DEMOS}', d)} \
> > +    qt-tstat \
> > +"
> > +
> > +RDEPENDS_${PN} =3D "\
> > +    ${@base_conditional('QT_PROVIDER', 'qt5', 'packagegroup-arago-qt5'=
,
> 'packagegroup-arago-qte', d)} \
> > +    ${QT_DEMOS} \
> > +"
> > diff --git
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-qte.bb
> > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-qte.bb
> > deleted file mode 100644
> > index 10187a6..0000000
> > ---
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-qte.bb
> > +++ /dev/null
> > @@ -1,19 +0,0 @@
> > -DESCRIPTION =3D "Task to add Qt embedded related packages"
> > -LICENSE =3D "MIT"
> > -PR =3D "r4"
> > -
> > -inherit packagegroup
> > -
> > -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > -
> > -QT_DEMOS =3D "\
> > -    qt4-embedded-examples \
> > -    qt4-embedded-demos \
> > -    qt-tstat \
> > -    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles',
> 'quick-playground', '', d)} \
> > -"
> > -
> > -RDEPENDS_${PN} =3D "\
> > -    packagegroup-arago-qte \
> > -    ${QT_DEMOS} \
> > -"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

