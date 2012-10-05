Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BBE2D529E1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 12:40:22 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95CeMB7032274;
	Fri, 5 Oct 2012 07:40:22 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95CeM27009377;
	Fri, 5 Oct 2012 07:40:22 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 07:40:21 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] ltp-ddt: Add Arago tweaks
Thread-Index: AQHNosHSdFBE9GbJiUudhR09ZT787Jeqp5Ew
Date: Fri, 5 Oct 2012 12:40:20 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159247D1B@DLEE12.ent.ti.com>
References: <1349419858-21729-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349419858-21729-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] ltp-ddt: Add Arago tweaks
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
X-List-Received-Date: Fri, 05 Oct 2012 12:40:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:51 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] ltp-ddt: Add Arago tweaks
>=20
> * Port tweaks from Arago
> * AUTOREV the recipe to get the latest changes.
> * Compile test kernel modules.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../ltp-ddt/ltp-ddt_0.0.4.bbappend                 |   32
> ++++++++++++++++++++
>  1 files changed, 32 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-devtools/ltp-
> ddt/ltp-ddt_0.0.4.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-
> ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-
> ddt/ltp-ddt_0.0.4.bbappend
> new file mode 100644
> index 0000000..65a16f9
> --- /dev/null
> +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-
> ddt_0.0.4.bbappend
> @@ -0,0 +1,32 @@
> +PR_append =3D "-arago0+gitr${SRCPV}"
> +
> +# Auto rev so we pick up the latest changes
> +SRCREV =3D "${AUTOREV}"
> +
> +do_compile_kmodules() {
> +        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +        oe_runmake modules
> +}
> +
> +addtask compile_kmodules after do_compile before do_install
> +
> +# Grab a portion of the module.bbclass to provide the needed
> kernel application
> +# scripts/basic/fixdep. This issue is discussed in the following
> thread.
> +# http://lists.linuxtogo.org/pipermail/openembedded-core/2011-
> July/005536.html
> +
> +inherit module-base
> +
> +#
> +# Ensure the hostprogs are available for module compilation.
> Modules that
> +# inherit this recipe and override do_compile() should be sure
> to call
> +# do_make_scripts() or ensure the scripts are built
> independently.
> +#
> +do_make_scripts() {
> +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +	oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
> AR=3D"${KERNEL_AR}" \
> +	           -C ${STAGING_KERNEL_DIR} scripts
> +}
> +
> +addtask make_scripts before do_compile
> +do_make_scripts[lockfiles] =3D "${TMPDIR}/kernel-scripts.lock"
> +do_make_scripts[deptask] =3D "do_populate_sysroot"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

