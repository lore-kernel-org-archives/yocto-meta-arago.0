Return-Path: <eyalr@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E54FF52972
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 07:44:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB47ie9f026330;
	Wed, 4 Dec 2013 01:44:41 -0600
Received: from DNCE70.ent.ti.com (dncmailx.itg.ti.com [137.167.131.19])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB47ieeS012907;
	Wed, 4 Dec 2013 01:44:40 -0600
Received: from DNCE04.ent.ti.com ([fe80::50a2:cda3:1471:a76]) by
	DNCE70.ent.ti.com ([fe80::78db:4901:78e8:69bb%20]) with mapi id
	14.02.0342.003; Wed, 4 Dec 2013 08:44:40 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Eyal Reizer <eyalreizer@gmail.com>
Thread-Topic: [meta-arago] [PATCH 1/2] ti-compat-wireless-wl18xx: build from
	ol_r8.a8.08
Thread-Index: AQHO7pNJhGdvgkcsEUSpTqIWAhrI75pDk12AgAAWT+A=
Date: Wed, 4 Dec 2013 07:44:38 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B211CFE55@DNCE04.ent.ti.com>
References: <1385901947-10316-1-git-send-email-eyalr@ti.com>
	<20131204071541.GW690@edge>
In-Reply-To: <20131204071541.GW690@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] ti-compat-wireless-wl18xx: build from ol_r8.a8.08
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
X-List-Received-Date: Wed, 04 Dec 2013 07:44:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denis,
>=20
> The same comment as to Yaniv - please combine the 2 patches into 1.

OK, actually separated it into two patches just as it was suggested by Chas=
e to Yaniv last week.

>=20
> Also - will there be compat-bluetooth?
>=20
There is no compat-bluetooth for some time now. Since Linux 3.2 we use the =
Bluetooth modules in the kernel.
In fact, we do not keep maintaining bluez in ECS, so the latest version sup=
ported before (4.98) will not change.

> As of the kernel version - is 3.12 the exact cutting line where the
> change to
> the drivers was introduced? This wasn't in 3.8, right, as I see you set
> COMPATIBLE_MACHINE to omap-a15. I guess that is to make GLSDK work, as
> it
> still uses 3.8 kernel. Unfortunately, it won't be enough, as CoreSDK
> also
> builds omap-a15 machines, but with 3.12 kernel...

Yes, 3.12 is the exact cutting. A couple of weeks ago the wl18xx mac80211 d=
rivers were merged into the ti-linux-kernel.
I guess this patch would be usefull only for glsdk that use the 3.8 kernel.=
 You do not need it for CoreSDK where we do not need compat-wireless any lo=
nger.
So currently glsdk are the are the only ones that need to pick it up for th=
eir forked release.

>=20
> Can you please run git-format-patch with -M and --find-copies-harder so
> it
> presents as a change against the previous version of the recipe?
>=20

OK.

>=20
> On Sun, Dec 01, 2013 at 02:45:45PM +0200, Eyal Reizer wrote:
> > Add a new recipe fetching the Wilink8 drivers from TI-Openlink
> > based on release ol_r8.a8.08.
> > This recipe is used for building with kernels older then the
> > 3.12 kernel where the drivers are now in-tree.
> > For 3.12 and newer, this recipe is not needed.
> >
> > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > ---
> >  .../ti-compat-wireless-wl18xx_r8.a8.08.bb          |   71
> ++++++++++++++++++++
> >  1 files changed, 71 insertions(+), 0 deletions(-)
> >  create mode 100755 meta-arago-extras/recipes-bsp/ti-compat-
> wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
> >
> > diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> compat-wireless-wl18xx_r8.a8.08.bb b/meta-arago-extras/recipes-bsp/ti-
> compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
> > new file mode 100755
> > index 0000000..9baf628
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> wireless-wl18xx_r8.a8.08.bb
> > @@ -0,0 +1,71 @@
> > +# This is a TI specific version of the compat-wireless recipe using
> a
> > +# compat-wireless package created from the TI Systems Tested
> mac80211 releases.
> > +
> > +DESCRIPTION =3D "ti compat-wireless drivers for wl18xx"
> > +HOMEPAGE =3D "https://gforge.ti.com/gf/project/ecs_nlcp/"
> > +SECTION =3D "kernel/modules"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> > +
> > +RDEPENDS_${PN} =3D "wireless-tools"
> > +
> > +PROVIDES +=3D "ti-compat-wireless-wl12xx"
> > +RPROVIDES_${PN} +=3D "ti-compat-wireless-wl12xx"
> > +RREPLACES_${PN} +=3D "ti-compat-wireless-wl12xx"
> > +RCONFLICTS_${PN} +=3D "ti-compat-wireless-wl12xx"
> > +
> > +COMPATIBLE_MACHINE =3D "(omap-a15)"
> > +
> > +PV =3D "r8.a8.08"
> > +inherit module
> > +
> > +PR =3D "${MACHINE_KERNEL_PR}"
> > +PR_append =3D "a"
> > +
> > +# Tags: ol_r8.a8.08
> > +SRCREV_wl18xx =3D "eaa1820c02dc076e6ad9254e9cb7a3bb0c17471b"
> > +SRCREV_compat =3D "5d80865281795f962e1400a95202bbd07dd763c0"
> > +SRCREV_compat-wireless =3D "23a0d62ea1a57327709a77f08d6265ec807a909f"
> > +
> > +SRCREV_FORMAT =3D "compat-wireless"
> > +
> > +S =3D "${WORKDIR}/compat-wireless"
> > +
> > +SRC_URI =3D "git://github.com/TI-OpenLink/compat-
> wireless.git;destsuffix=3Dcompat-wireless;name=3Dcompat-wireless \
> > +           git://github.com/TI-
> OpenLink/compat.git;destsuffix=3Dcompat;name=3Dcompat \
> > +           git://github.com/TI-
> OpenLink/wl18xx.git;destsuffix=3Dwl18xx;name=3Dwl18xx \
> > +"
> > +
> > +EXTRA_OEMAKE =3D "KLIB_BUILD=3D${STAGING_KERNEL_DIR} KLIB=3D${D}"
> > +
> > +# Prevent sourceipk clear_git function from running.
> > +# This preserves the git repo until driver-select is ran.
> > +
> > +clear_git() {
> > +    :
> > +}
> > +
> > +do_configure() {
> > +    cd ${S}
> > +    GIT_TREE=3D"${WORKDIR}/wl18xx" GIT_COMPAT_TREE=3D"${WORKDIR}/compa=
t"
> ./scripts/admin-refresh.sh network
> > +    ./scripts/driver-select wl18xx
> > +
> > +    # Delete the .git repository since it should no longer be
> needed.
> > +    #rm -rf ${S}/.git ${S}/.gitignore
> > +
> > +    # Now generate the sourceipk with the properly configured
> sources
> > +    sourceipk_do_create_srcipk
> > +}
> > +
> > +do_configure_append() {
> > +    sed -i "s#@./scripts/update-initramfs## " Makefile
> > +}
> > +
> > +do_install() {
> > +    # Remove hardcoded references to host depmod
> > +    sed -i "s#@/sbin/depmod -a## " Makefile
> > +    sed -i "s#@/sbin/depmod -ae## " Makefile
> > +
> > +    # Install modules
> > +    oe_runmake DEPMOD=3Decho DESTDIR=3D"${D}" INSTALL_MOD_PATH=3D"${D}=
"
> LDFLAGS=3D"" install-modules
> > +}
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

