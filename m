Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B0FD552A0B
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 15:46:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HFkiXu027275
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 10:46:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HFkhGD030279
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 10:46:43 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Tue, 17 Mar 2015 10:46:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] branding-processor-sdk: Set more preferences
Thread-Index: AQHQYMLR6P8xctnuJkSNgK3WMGPZ1p0hGLEAgAAKUYD//64oIA==
Date: Tue, 17 Mar 2015 15:46:42 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C848F16@DFLE08.ent.ti.com>
References: <1426604292-11709-1-git-send-email-j-stiffler@ti.com>
	<20150317150108.GH4669@edge>
	<4B26FB5A64EBA14C87266869E037F9581410F4DD@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581410F4DD@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] branding-processor-sdk: Set more preferences
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
X-List-Received-Date: Tue, 17 Mar 2015 15:46:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Well based on your last comment you should be setting the preferred provide=
r and version for U-boot and Linux for omap-a15.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Tuesday, March 17, 2015 10:38 AM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] branding-processor-sdk: Set more
> preferences
>=20
> Yes. But I wanted to have this here for our release in case it may change=
 in
> the future.
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, March 17, 2015 11:01 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] branding-processor-sdk: Set more
> preferences
>=20
> Isn't u-boot-ti-staging-2014.07% already a default for am3/4?
>=20
> On Tue, Mar 17, 2015 at 10:58:12AM -0400, Jacob Stiffler wrote:
> > * AUTOREV linux-ti-staging and u-boot-ti-staging for omap-a15
> > * Freeze u-boot for am335x-evm and am437x-evm.
> > * Add commit message for linux-ti-staging.
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  .../conf/distro/include/branding-processor-sdk.inc |   23
> ++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git
> > a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> > b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> > index d277aac..c2327fa 100644
> > --- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> > +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> > @@ -4,10 +4,30 @@ ARAGO_TISDK_IMAGE =3D "processor-sdk-linux-image"
> >  DISTRO_FEATURES_remove_ti33x =3D "wayland"
> >  DISTRO_FEATURES_remove_ti43x =3D "wayland"
> >
> > +# Set preferred providers and srcrevs
> >  PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D "sitara-linux-ti-
> staging"
> >  PREFERRED_PROVIDER_virtual/kernel_am437x-evm =3D "sitara-linux-ti-
> staging"
> >  PREFERRED_VERSION_sitara-linux-ti-staging =3D "3.14%"
> >
> > +# Auto rev important packages to pick up latest
> > +SRCREV_pn-u-boot-ti-staging_omap-a15 =3D "${AUTOREV}"
> > +SRCREV_pn-ltp-ddt_omap-a15 =3D "${AUTOREV}"
> > +
> > +# am3 and am4 use sitara-linux-ti-staging, so this only applies to
> > +omap-a15 SRCREV_pn-linux-ti-staging =3D "${AUTOREV}"
> > +
> > +# Freeze am3 and am4 u-boot
> > +PREFERRED_PROVIDER_virtual/bootloader_am335x-evm =3D "u-boot-ti-
> staging"
> > +PREFERRED_PROVIDER_u-boot_am335x-evm =3D "u-boot-ti-staging"
> > +PREFERRED_VERSION_u-boot-ti-staging_am335x-evm =3D "2014.07%"
> > +SRCREV_pn-u-boot-ti-staging_am335x-evm =3D
> "7e537bfdd261bf8bf444f3ac4d1be3db4ee124e8"
> > +
> > +PREFERRED_PROVIDER_virtual/bootloader_am437x-evm =3D "u-boot-ti-
> staging"
> > +PREFERRED_PROVIDER_u-boot_am437x-evm =3D "u-boot-ti-staging"
> > +PREFERRED_VERSION_u-boot-ti-staging_am437x-evm =3D "2014.07%"
> > +SRCREV_pn-u-boot-ti-staging_am437x-evm =3D
> "7e537bfdd261bf8bf444f3ac4d1be3db4ee124e8"
> > +
> > +
> >  # To create newlines in the message \n is used and the slash must be
> > escaped  # to function properly
> >
> > @@ -28,6 +48,9 @@ script located in the sdk\'s bin directory\\n\  The
> > script may take several minutes but you will then have a full copy
> > of\\n\  the git repository including its entire git history.\\n"
> >
> > +SRCIPK_CUSTOM_GIT_BRANCH_pn-linux-ti-staging =3D "processor-sdk-1.0"
> > +SRCIPK_CUSTOM_GIT_MESSAGE_pn-linux-ti-staging =3D
> "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
> > +
> >  SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging =3D "processor-
> sdk-1.0"
> >  SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging =3D
> "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
> >
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

