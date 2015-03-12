Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C1F3452A78
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 14:25:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CEPj4l004338
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:25:45 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CEPiG7000500
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:25:44 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 09:25:43 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 4/4] branding-processor-sdk: Add
	processor-sdk brand.
Thread-Index: AQHQXMPl+PTibaNGEEaABpIDaxT/cp0ZMwOA//+svQCAAFnNAP//rS5A
Date: Thu, 12 Mar 2015 14:25:43 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814107E3E@DFLE09.ent.ti.com>
References: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
	<1426164957-22030-5-git-send-email-j-stiffler@ti.com>
	<20150312135639.GC24885@edge>
	<4B26FB5A64EBA14C87266869E037F95814107DDB@DFLE09.ent.ti.com>
	<20150312142004.GF24885@edge>
In-Reply-To: <20150312142004.GF24885@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/4] branding-processor-sdk: Add processor-sdk brand.
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
X-List-Received-Date: Thu, 12 Mar 2015 14:25:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've been testing the patches since submitting the patches (wanted to get t=
hese comments as soon as I could). It seems that this oe_filter_out method =
is not working as expected...


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, March 12, 2015 10:20 AM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 4/4] branding-processor-sdk: Add processor=
-sdk brand.

On Thu, Mar 12, 2015 at 10:00:35AM -0400, Stiffler, Jacob wrote:
> What would you suggest? That wayland be controlled as a feature from=20
> each branding file? Or a new variable introduced that arago.conf can=20
> check to decide if wayland should be added to the DISTRO_FEATURES?

Leave it like that for now - we'll see if we get any problems...


> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, March 12, 2015 9:57 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 4/4] branding-processor-sdk: Add process=
or-sdk brand.
>=20
> On Thu, Mar 12, 2015 at 08:55:57AM -0400, Jacob Stiffler wrote:
> > * Set ARAGO_TISDK_IMAGE to "processor-sdk-linux-image"
> > * For now, use sitara-linux-ti-staging
> > * and remove wayland feature for ti33x and ti43x soc families.
> >=20
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  .../conf/distro/include/branding-processor-sdk.inc |   35 ++++++++++++=
++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644
> > meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> >=20
> > diff --git
> > a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> > b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> > new file mode 100644
> > index 0000000..5eab952
> > --- /dev/null
> > +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.i
> > +++ nc
> > @@ -0,0 +1,35 @@
> > +ARAGO_TISDK_IMAGE =3D "processor-sdk-linux-image"
> > +
> > +# Remove wayland from ti33x and ti43x DISTRO_FEATURES.
> > +DIRSTO_FEATURES_ti33x =3D "${@oe_filter_out('DISTRO_FEATURES', 'waylan=
d', d)}"
> > +DIRSTO_FEATURES_ti43x =3D "${@oe_filter_out('DISTRO_FEATURES', 'waylan=
d', d)}"
>=20
> Usually you want immediate assignment here. But I have my doubts it will =
work reliably either way, when done like that...
>=20
>=20
> > +PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D "sitara-linux-ti-stag=
ing"
> > +PREFERRED_PROVIDER_virtual/kernel_am437x-evm =3D "sitara-linux-ti-stag=
ing"
> > +PREFERRED_VERSION_sitara-linux-ti-staging =3D "3.14%"
> > +
> > +# To create newlines in the message \n is used and the slash must=20
> > +be escaped # to function properly
> > +
> > +SRCIPK_GIT_COMMIT_MESSAGE =3D "\
> > +Create local branch\\n\
> > +\\n\
> > +The below commit is used for this local branch and is the one used=20
> > +by\\n\ this sdk:\\n\ ${SRCREV}."
> > +
> > +SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE=20
> > +=3D"${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n\
> > +To reduce the size of the SDK installer only a portion of the git=20
> > +commit\\n\ history has been preserved. Also links to remote=20
> > +branches and tags do\\n\ not exist in this copy of the=20
> > +repository.\\n\ To fix this please run the=20
> > +unshallow-repositories.sh\\n\ script located in the sdk\'s bin=20
> > +directory\\n\ \\n\ The script may take several minutes but you will=20
> > +then have a full copy of\\n\ the git repository including its=20
> > +entire git history.\\n"
> > +
> > +SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging =3D "processor-sdk=
-1.0"
> > +SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging =3D "${SRCIPK_SHA=
LLOW_GIT_COMMIT_MESSAGE}"
> > +
> > +SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging =3D "processor-sdk-1.0"
> > +SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging =3D "${SRCIPK_GIT_COMMI=
T_MESSAGE}"
> > --
> > 1.7.9.5
> >=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

