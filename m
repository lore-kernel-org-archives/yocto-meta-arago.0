Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1721F52A10
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 20:08:04 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AK83pr018307;
	Wed, 10 Oct 2012 15:08:03 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AK834a012797;
	Wed, 10 Oct 2012 15:08:03 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 15:08:03 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] linux: Add copy-defconfig and
	setup-defconfig	include files
Thread-Index: AQHNpx0Arwaj7yeJoEWDfKis4n70NZey9iLQ
Date: Wed, 10 Oct 2012 20:08:02 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159257644@DLEE12.ent.ti.com>
References: <1349898949-413-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349898949-413-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] linux: Add copy-defconfig and setup-defconfig	include files
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
X-List-Received-Date: Wed, 10 Oct 2012 20:08:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Where is the append to actually use these?  I know you are pending some pat=
ches going into meta-ti but we could at least review your appends and plann=
ed changes ahead of time.  Just let us know that the patch is dependent on =
the patch to meta-ti.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Wednesday, October 10, 2012 2:56 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH] linux: Add copy-defconfig and
> setup-defconfig include files
>=20
> * Port copy-defconfig and setup-defconfig from Arago.
> * These include files are used in a variety of kernel recipes in
> the Arago SDK.
> * copy-defconfig copies the config file used by the SDK build to
> the kernel
>   sources to be packaged into the sourceipk.
> * setup-defconfig.inc determines which kernel configuration file
> to use.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-kernel/linux/copy-defconfig.inc        |   11
> ++++++++
>  .../recipes-kernel/linux/setup-defconfig.inc       |   26
> ++++++++++++++++++++
>  2 files changed, 37 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-kernel/linux/copy-
> defconfig.inc
>  create mode 100644 meta-arago-distro/recipes-kernel/linux/setup-
> defconfig.inc
>=20
> diff --git a/meta-arago-distro/recipes-kernel/linux/copy-
> defconfig.inc b/meta-arago-distro/recipes-kernel/linux/copy-
> defconfig.inc
> new file mode 100644
> index 0000000..10be10c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
> @@ -0,0 +1,11 @@
> +CONFIG_NAME ?=3D "tisdk_${MACHINE}_defconfig"
> +
> +# Copy the configuration file used during the SDK build in Arago
> to
> +# the kernel sources to be packaged into the sourceipk.  Then
> call
> +# the function to build the sourceipk again.  This is done as a
> +# do_compile_prepend so that we can pick up any changes to the
> +# defconfig thay may have been done by the sanitizer code.
> +do_compile_prepend() {
> +    cp ${S}/.config ${S}/arch/arm/configs/${CONFIG_NAME}
> +    sourceipk_do_create_srcipk
> +}
> diff --git a/meta-arago-distro/recipes-kernel/linux/setup-
> defconfig.inc b/meta-arago-distro/recipes-kernel/linux/setup-
> defconfig.inc
> new file mode 100644
> index 0000000..fc5e18e
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/linux/setup-defconfig.inc
> @@ -0,0 +1,26 @@
> +# Check the defconfig file and see if it points to an in kernel
> +# defconfig that should be used, or if it is a complete config
> file
> +
> +addtask setup_defconfig before do_configure after do_patch
> +do_setup_defconfig() {
> +    # Always copy the defconfig file to .config to keep
> consistency
> +    # between the case where there is a real config and the in
> kernel
> +    # tree config
> +    cp ${WORKDIR}/defconfig ${S}/.config
> +}
> +
> +# define our own do_configure that will:
> +#   1. Check the .config file and see if string use-kernel-
> config=3D is present
> +#   2. If the use-kernel-config string is present parse out the
> config to use
> +#      and run make ${config}
> +#   3. else run yes '' | oe_runmake oldconfig like the default
> do_configure
> +#      does
> +do_configure() {
> +    config=3D`cat ${S}/.config | grep use-kernel-config | cut -d=3D
> -f2`
> +    if [ "x${config}" !=3D "x" ]
> +    then
> +        oe_runmake ${config}
> +    else
> +        yes '' | oe_runmake oldconfig
> +    fi
> +}
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

