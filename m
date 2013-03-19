Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1BC7452979
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 15:54:16 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JFsFgF013208
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 10:54:15 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFsF5I018946
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 10:54:15 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 19 Mar 2013 10:54:15 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 6/9] ti-compat-wireless-wl18xx: build
	Wilink8	drivers from TI-OpenLink
Thread-Index: AQHOJLkhUO+xqeGLD0OVYkvIjO3ji5itKnJQ
Date: Tue, 19 Mar 2013 15:54:14 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159485CF2@DLEE11.ent.ti.com>
References: <1363707935-2749-2-git-send-email-eyalr@ti.com>
	<1363707935-2749-6-git-send-email-eyalr@ti.com>
In-Reply-To: <1363707935-2749-6-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv2 6/9] ti-compat-wireless-wl18xx: build Wilink8	drivers from TI-OpenLink
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
X-List-Received-Date: Tue, 19 Mar 2013 15:54:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Reizer, Eyal
> Sent: Tuesday, March 19, 2013 10:46 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCHv2 6/9] ti-compat-wireless-wl18xx:
> build Wilink8 drivers from TI-OpenLink
>=20
> Add a new recipe from fetching the Wilink8 drivers from TI-
> Openlink
> in github by creating a compa-wireless package and build with the
> target linux kernel source.
>=20
> This package replace the wilink6 package which is provided by the
> ti-compat-wireless-wl12xx recipe. Selection between the two is
> done using a "WILINK_VERSION" switch added to arago.conf
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  ...1-git-version-wl18xx-use-compat-base-tree.patch |   68
> ++++++++++++++++++++
>  .../ti-compat-wireless-wl18xx_r8.a6.01.bb          |   66
> +++++++++++++++++++
>  2 files changed, 134 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-
> wireless/ti-compat-wireless-wl18xx-r8.a6.01/0001-git-version-
> wl18xx-use-compat-base-tree.patch
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-
> wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
>=20
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> compat-wireless-wl18xx-r8.a6.01/0001-git-version-wl18xx-use-
> compat-base-tree.patch b/meta-arago-extras/recipes-bsp/ti-compat-
> wireless/ti-compat-wireless-wl18xx-r8.a6.01/0001-git-version-
> wl18xx-use-compat-base-tree.patch
> new file mode 100644
> index 0000000..624d86f
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> wireless-wl18xx-r8.a6.01/0001-git-version-wl18xx-use-compat-base-
> tree.patch
> @@ -0,0 +1,68 @@
> +From bb09bbce828112d81ae473d10a07736e73704ac4 Mon Sep 17
> 00:00:00 2001
> +From: Eyal Reizer <eyalr@ti.com>
> +Date: Sun, 10 Mar 2013 04:42:58 -0700
> +Subject: [PATCH] git-version-wl18xx: use compat base tree
> +
> +For compat-wireless based builds use compat_base_tree_version in
> version.h
> +When building with compat-wireless mechanism, the version info
> captured
> +in version.h reflects target kernel and not the wl18xx version.
> +
> +Signed-off-by: Eyal Reizer <eyalr@ti.com>
> +---
> + drivers/net/wireless/ti/wl18xx/Makefile |   12 ++++++++----
> + drivers/net/wireless/ti/wlcore/Makefile |   12 ++++++++----
> + 2 files changed, 16 insertions(+), 8 deletions(-)
> +
> +diff --git a/drivers/net/wireless/ti/wl18xx/Makefile
> b/drivers/net/wireless/ti/wl18xx/Makefile
> +index 4ddb258..55cc561 100644
> +--- a/drivers/net/wireless/ti/wl18xx/Makefile
> ++++ b/drivers/net/wireless/ti/wl18xx/Makefile
> +@@ -1,12 +1,16 @@
> + wl18xx-objs	=3D main.o acx.o tx.o io.o debugfs.o
> +
> + define filechk_version.h
> +-	(echo 'static const char *wl18xx_git_head =3D \
> +-			"$(shell git describe --dirty)";')
> ++         echo '#ifdef COMPAT_BASE_TREE_VERSION'; \
> ++         echo 'static const char *wl18xx_git_head =3D
> COMPAT_BASE_TREE_VERSION;'; \
> ++         echo '#else'; \
> ++         echo 'static const char *wl18xx_git_head =3D \
> ++                        "$(shell git describe --dirty)";'; \
> ++         echo '#endif')
> + endef
> +
> +-$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
> +-	@$(call filechk,version.h)
> ++#$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
> ++#	@$(call filechk,version.h)
> +
> + $(obj)/main.c: $(src)/version.h
> +
> +diff --git a/drivers/net/wireless/ti/wlcore/Makefile
> b/drivers/net/wireless/ti/wlcore/Makefile
> +index 9923a1a..647489c 100644
> +--- a/drivers/net/wireless/ti/wlcore/Makefile
> ++++ b/drivers/net/wireless/ti/wlcore/Makefile
> +@@ -3,12 +3,16 @@ wlcore-objs		=3D main.o cmd.o io.o
> event.o tx.o rx.o ps.o acx.o \
> +
> + define filechk_version.h
> + 	(echo 'static const char *wlcore_timestamp =3D
> __TIMESTAMP__;'; \
> +-	echo 'static const char *wlcore_git_head =3D \
> +-			"$(shell git describe --dirty)";')
> ++         echo '#ifdef COMPAT_BASE_TREE_VERSION'; \
> ++         echo 'static const char *wl12xx_git_head =3D
> COMPAT_BASE_TREE_VERSION;'; \
> ++         echo '#else'; \
> ++         echo 'static const char *wl12xx_git_head =3D \
> ++                        "$(shell git describe --dirty)";'; \
> ++         echo '#endif')
> + endef
> +
> +-$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
> +-	@$(call filechk,version.h)
> ++#$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
> ++#	@$(call filechk,version.h)
> +
> + $(obj)/main.c: $(src)/version.h
> +
> +--
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> compat-wireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-
> bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
> new file mode 100644
> index 0000000..7549f47
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> wireless-wl18xx_r8.a6.01.bb
> @@ -0,0 +1,66 @@
> +# This is a TI specific version of the compat-wireless recipe
> using a
> +# compat-wireless package created from the TI Systems Tested
> mac80211 releases.
> +
> +DESCRIPTION =3D "ti compat-wireless drivers for wl18xx"
> +HOMEPAGE =3D "https://gforge.ti.com/gf/project/ecs_nlcp/"
> +SECTION =3D "kernel/modules"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://COPYRIGHT;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> +
> +RDEPENDS_${PN} =3D "wireless-tools"
> +
> +PROVIDES +=3D "ti-compat-wireless-wl12xx"
> +RPROVIDES +=3D "ti-compat-wireless-wl12xx"
> +RREPLACES +=3D "ti-compat-wireless-wl12xx"
> +RCONFLICTS +=3D "ti-compat-wireless-wl12xx"

Same comment as the wl18xx-firmware recipe

> +
> +PV =3D "r8.a6.01"
> +inherit module
> +
> +PR =3D "${MACHINE_KERNEL_PR}"
> +PR_append =3D "a"
> +
> +SRCREV_wl18xx =3D "ol_r8.a6.01"
> +SRCREV_compat =3D "ol_r8.a6.01"
> +SRCREV_compat-wireless =3D "ol_r8.a6.01"
> +
> +SRCREV_FORMAT =3D "compat-wireless"
> +
> +S =3D "${WORKDIR}/compat-wireless"
> +
> +SRC_URI =3D "git://github.com/TI-OpenLink/compat-
> wireless.git;destsuffix=3Dcompat-wireless;name=3Dcompat-wireless \
> +           git://github.com/TI-
> OpenLink/compat.git;destsuffix=3Dcompat;name=3Dcompat \
> +           git://github.com/TI-
> OpenLink/wl18xx.git;destsuffix=3Dwl18xx;name=3Dwl18xx \
> +           file://0001-git-version-wl18xx-use-compat-base-
> tree.patch;patchdir=3D../wl18xx \
> +           file://0001-wl12xx-additional-two-members-for-
> wl12xx_platform_da.patch;patchdir=3D../wl18xx \
> +          "
> +
> +
> +EXTRA_OEMAKE =3D "KLIB_BUILD=3D${STAGING_KERNEL_DIR} KLIB=3D${D}"
> +
> +# Prevent sourceipk clear_git function from running.
> +# This preserves the git repo until driver-select is ran.
> +
> +clear_git() {
> +    :
> +}
> +
> +do_configure() {
> +    cd ${S}
> +    GIT_TREE=3D"${WORKDIR}/wl18xx"
> GIT_COMPAT_TREE=3D"${WORKDIR}/compat" ./scripts/admin-refresh.sh
> +    ./scripts/driver-select wl18xx
> +
> +    # Delete the .git repository since it should no longer be
> needed.
> +    rm -rf ${S}/.git ${S}/.gitignore
> +
> +    # Now generate the sourceipk with the properly configured
> sources
> +    sourceipk_do_create_srcipk
> +}
> +
> +do_configure_append() {
> +    sed -i "s#@./scripts/update-initramfs## " Makefile
> +}
> +
> +do_install() {
> +    oe_runmake DEPMOD=3Decho DESTDIR=3D"${D}"
> INSTALL_MOD_PATH=3D"${D}" LDFLAGS=3D"" install-modules
> +}
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

