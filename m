Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3229D529AB
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2012 20:55:00 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q87KsxAs009796
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2012 15:54:59 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q87Ksxdq031594
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2012 15:54:59 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 7 Sep 2012 15:54:59 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago-distro][PATCH] wpa-supplicant: Add TI
	specific version of the wpa-supplicant recipe
Thread-Index: AQHNhsw5Khhte81FZkibvcUV5kjil5d/ucuA//+sT0A=
Date: Fri, 7 Sep 2012 20:54:58 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2B8F33@DFLE09.ent.ti.com>
References: <1346344901-13140-1-git-send-email-fcooper@ti.com>
	<20120907204559.GC13366@denix.org>
In-Reply-To: <20120907204559.GC13366@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago-distro][PATCH] wpa-supplicant: Add TI specific version of the wpa-supplicant recipe
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
X-List-Received-Date: Fri, 07 Sep 2012 20:55:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

My concern is that the recipe isn't based on the mainline wpa-supplicant bu=
t on a git repo that is supposed to be somewhat "synced" with mainline. So =
it isn't clear if their changes will work on any non TI wlan/bluetooth devi=
ce therefore I didn't want to put it in extras which can cause people to un=
intentionally pull it in and find out that things aren't working for them o=
n their non TI wl1271. This is true for all the various recipes that are ba=
sed on some ECS git tree. It is also not clear if any wlan or bluetooth exa=
mple app that we use will work properly without using these modified librar=
ies. That is why you see some of the other patches I sent putting various w=
lan/bluetooth apps in meta-arago-distro also.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, September 07, 2012 3:46 PM
To: Cooper Jr., Franklin
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [meta-arago-distro][PATCH] wpa-supplicant: Add TI=
 specific version of the wpa-supplicant recipe

On Thu, Aug 30, 2012 at 11:41:41AM -0500, Franklin S Cooper Jr wrote:
> * Port the wpa-supplicant recipe from arago to meta-arago.

Do you have any objections for putting this in meta-arago-extras?

Denys

> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf           |    1 +
>  .../wpa-supplicant/wpa-supplicant-0.7.inc          |  121 ++++
>  ...ant-dbus-AP-Add-support-for-WPS-Internal-.patch |  134 ++++
>  .../wpa-supplicant/99_wpa_supplicant               |    1 +
>  .../wpa-supplicant/wpa-supplicant/defaults-sane    |    8 +
>  .../wpa-supplicant/wpa-supplicant/defconfig        |  426 ++++++++++++
>  .../fi.epitest.hostap.WPASupplicant.service        |    4 +
>  .../wpa-supplicant/fi.w1.wpa_supplicant1.service   |    4 +
>  .../wpa-supplicant/wpa-supplicant.sh               |   85 +++
>  .../wpa-supplicant/wpa_supplicant.conf             |  690 ++++++++++++++=
++++++
>  .../wpa-supplicant/wpa_supplicant.conf-sane        |    7 +
>  .../wpa-supplicant/wpa-supplicant_git.bb           |    5 +
>  12 files changed, 1486 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant=
/wpa-supplicant-0.7.inc
>  create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant=
/wpa-supplicant/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.p=
atch
>  create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant=
/wpa-supplicant/99_wpa_supplicant
>  create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant=
/wpa-supplicant/defaults-sane
>  create mode 100755 meta-arago-distro/recipes-connectivity/wpa-supplicant=
/wpa-supplicant/defconfig
>  create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant=
/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
>  create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant=
/wpa-supplicant/fi.w1.wpa_supplicant1.service
>  create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant=
/wpa-supplicant/wpa-supplicant.sh
>  create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant=
/wpa-supplicant/wpa_supplicant.conf
>  create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant=
/wpa-supplicant/wpa_supplicant.conf-sane
>  create mode 100644 meta-arago-distro/recipes-connectivity/wpa-supplicant=
/wpa-supplicant_git.bb
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
> index 6a48b0a..df6cf78 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -17,6 +17,7 @@ PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
>  PREFERRED_VERSION_qt4-embedded =3D "4.8.0"
>  PREFERRED_VERSION_qt4-native =3D "4.8.0"
>  PREFERRED_VERSION_qt4-tools-nativesdk =3D "4.8.0"
> +PREFERRED_VERSION_wpa-supplicant =3D "0.7.3+0.8.0-rc"
> =20
>  # Enable generation of source packages for SDKs
>  require arago-source-ipk.conf
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant-0.7.inc b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wp=
a-supplicant-0.7.inc
> new file mode 100644
> index 0000000..9888a90
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplican=
t-0.7.inc
> @@ -0,0 +1,121 @@
> +# This is a TI specific version of the wpa-supplicant recipe using a
> +# wpa-supplicant package.
> +#
> +# This approach has been taken to simplify the packaging of a wpa-suppli=
cant
> +# release for WL12xx on the PSP/SDK from TI.
> +#
> +# This approach avoids the need to take the latest wpa-supplicant from p=
ublic=20
> +# sources and patching this onto the SDK along with additional patches t=
hat=20
> +# are currently being up-streamed. These later patches are essential to =
address=20
> +# defects that have been found during systems testing. This approach avo=
ids the=20
> +# need to apply many patches which is unmanageable.
> +
> +DESCRIPTION =3D "A Client for Wi-Fi Protected Access (WPA)."
> +HOMEPAGE =3D "http://hostap.epitest.fi/wpa_supplicant/"
> +BUGTRACKER =3D "http://hostap.epitest.fi/bugz/"
> +SECTION =3D "network"
> +LICENSE =3D "GPLv2 | BSD"
> +LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Dc54ce9345727175ff66d17b67f=
f51f58 \
> +                    file://../README;md5=3D79cddd95f8b7539aced400f6aab99=
6e9 \
> +                    file://wpa_supplicant.c;beginline=3D1;endline=3D17;m=
d5=3D009c87d612d92175fe8cd1e93137bf42"
> +DEPENDS =3D "gnutls dbus libnl openssl ${@base_contains("COMBINED_FEATUR=
ES", "madwifi", "madwifi-ng", "",d)}"
> +RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase wpa-supplicant-cli"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRC_URI =3D "git://github.com/TI-OpenLink/hostap.git;protocol=3Dgit \
> +           file://defconfig \
> +           file://defaults-sane \
> +           file://wpa-supplicant.sh \
> +           file://wpa_supplicant.conf \
> +           file://wpa_supplicant.conf-sane \
> +           file://99_wpa_supplicant \
> +           file://0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Intern=
al-.patch;patchdir=3D.. \
> +           file://wpa_supplicant.conf \
> +           file://fi.epitest.hostap.WPASupplicant.service \
> +           file://fi.w1.wpa_supplicant1.service \
> +          "
> +
> +S =3D "${WORKDIR}/git/wpa_supplicant"
> +
> +PACKAGES_prepend =3D "wpa-supplicant-passphrase wpa-supplicant-cli "
> +FILES_wpa-supplicant-passphrase =3D "/usr/sbin/wpa_passphrase"
> +FILES_wpa-supplicant-cli =3D "/usr/sbin/wpa_cli"
> +FILES_${PN} +=3D " /usr/share/dbus-1/system-services/*"
> +
> +#we introduce MY_ARCH to get 'armv5te' as arch instead of the misleading=
 'arm' on armv5te builds
> +MY_ARCH :=3D "${PACKAGE_ARCH}"
> +PACKAGE_ARCH =3D "${@base_contains('COMBINED_FEATURES', 'madwifi', '${MA=
CHINE_ARCH}', '${MY_ARCH}', d)}"
> +
> +do_compile () {
> +	make
> +}
> +
> +do_install () {
> +	install -d ${D}${sbindir}
> +	install -m 755 wpa_supplicant ${D}${sbindir}
> +	install -m 755 wpa_passphrase ${D}${sbindir}
> +	install -m 755 wpa_cli        ${D}${sbindir}
> +
> +	install -d ${D}${docdir}/wpa_supplicant
> +	install -m 644 README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_=
supplicant
> +
> +	install -d ${D}${sysconfdir}/default
> +	install -m 600 ${WORKDIR}/defaults-sane ${D}${sysconfdir}/default/wpa
> +	install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wp=
a_supplicant.conf
> +
> +	if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy .config || grep -q ^CONFIG_CTRL_=
IFACE_DBUS_NEW=3Dy .config; then
> +		install -d ${D}/${sysconfdir}/dbus-1/system.d
> +		install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/d=
bus-1/system.d
> +		install -d ${D}/${datadir}/dbus-1/system-services
> +		if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy .config; then
> +			sed -i -e s:/sbin:${sbindir}:g ${S}/dbus/fi.epitest.hostap.WPASupplic=
ant.service
> +			install -m 644 ${S}/dbus/fi.epitest.hostap.WPASupplicant.service ${D}=
/${datadir}/dbus-1/system-services
> +		fi
> +		if grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=3Dy .config; then
> +			sed -i -e s:/sbin:${sbindir}:g ${S}/dbus/fi.w1.wpa_supplicant1.servic=
e
> +			install -m 644 ${S}/dbus/fi.w1.wpa_supplicant1.service ${D}/${datadir=
}/dbus-1/system-services
> +		fi
> +	fi
> +
> +	install -d ${D}${sysconfdir}/network/if-pre-up.d/
> +	install -d ${D}${sysconfdir}/network/if-post-down.d/
> +	install -d ${D}${sysconfdir}/network/if-down.d/
> +	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}
> +	install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/i=
f-pre-up.d/wpa-supplicant
> +	cd ${D}${sysconfdir}/network/ && \
> +	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
> +
> +	install -d ${D}/etc/default/volatiles
> +	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
> +
> +	install -d 2755 ${D}/usr/share/dbus-1/system-services
> +	install -d 2755 ${D}/etc
> +	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}/etc
> +	install -m 644 ${WORKDIR}/fi.epitest.hostap.WPASupplicant.service ${D}/=
usr/share/dbus-1/system-services
> +	install -m 644 ${WORKDIR}/fi.w1.wpa_supplicant1.service ${D}/usr/share/=
dbus-1/system-services
> +}
> +
> +pkg_postinst_wpa-supplicant () {
> +	# can't do this offline
> +	if [ "x$D" !=3D "x" ]; then
> +		exit 1
> +	fi
> +
> +	DBUSPID=3D`pidof dbus-daemon`
> +
> +	if [ "x$DBUSPID" !=3D "x" ]; then
> +		/etc/init.d/dbus-1 reload
> +	fi
> +}
> +
> +do_configure () {
> +	install -m 0755 ${WORKDIR}/defconfig .config
> +	echo "CFLAGS +=3D -I${STAGING_INCDIR}" >> .config
> +	echo "LIBS +=3D -L${STAGING_LIBDIR}" >> .config
> +	echo "LIBS_p +=3D -L${STAGING_LIBDIR}" >> .config
> +	if [ "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0, d)}" =3D "=
1" ]; then
> +		echo "CONFIG_DRIVER_MADWIFI=3Dy" >> .config
> +		echo "CFLAGS +=3D -I${STAGING_INCDIR}/madwifi-ng" >> .config
> +	fi
> +}
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch b/=
meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-w=
pa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
> new file mode 100644
> index 0000000..15ec6fe
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplican=
t/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
> @@ -0,0 +1,134 @@
> +From 19030351b95f48714007e425eaa2163d9122d788 Mon Sep 17 00:00:00 2001
> +From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> +Date: Sun, 18 Dec 2011 17:06:31 +0200
> +Subject: [PATCH] wpa_supplicant/dbus AP: Add support for WPS Internal
> + Registrar
> +
> +When in AP mode, wpa_supplicant is now enabling WPS (only Internal
> +Registrar). WPS.Start() call can be used to initiate WPS negotiation
> +similarly to how this is done in station mode.
> +
> +This was done to ctrl_iface by Jouni Malinen on April 21, 2009 (commit
> +3ec97afe571f159ea95213262c1c6b89965827d4)
> +
> +Upstream-Status: Submitted [http://lists.shmoo.com/pipermail/hostap/2011=
-December/024947.html]
> +
> +Signed-hostap: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> +---
> + wpa_supplicant/dbus/dbus_new_handlers_wps.c |   72 ++++++++++++++++++++=
+++++--
> + 1 file changed, 67 insertions(+), 5 deletions(-)
> +
> +diff --git a/wpa_supplicant/dbus/dbus_new_handlers_wps.c b/wpa_supplican=
t/dbus/dbus_new_handlers_wps.c
> +index d8b74d0..a72cfb3 100644
> +--- a/wpa_supplicant/dbus/dbus_new_handlers_wps.c
> ++++ b/wpa_supplicant/dbus/dbus_new_handlers_wps.c
> +@@ -19,6 +19,8 @@
> + #include "../config.h"
> + #include "../wpa_supplicant_i.h"
> + #include "../wps_supplicant.h"
> ++#include "../driver_i.h"
> ++#include "../ap.h"
> + #include "dbus_new_helpers.h"
> + #include "dbus_new.h"
> + #include "dbus_new_handlers.h"
> +@@ -30,6 +32,7 @@ struct wps_start_params {
> +	int type; /* 0 - not set, 1 - pin,      2 - pbc       */
> +	u8 *bssid;
> +	char *pin;
> ++	u8 *p2p_dev_addr;
> + };
> +
> +
> +@@ -148,6 +151,41 @@ static int wpas_dbus_handler_wps_pin(DBusMessage *m=
essage,
> + }
> +
> +
> ++#ifdef CONFIG_P2P
> ++static int wpas_dbus_handler_wps_p2p_dev_addr(DBusMessage *message,
> ++					      DBusMessageIter *entry_iter,
> ++					      struct wps_start_params *params,
> ++					      DBusMessage **reply)
> ++{
> ++	DBusMessageIter variant_iter, array_iter;
> ++	int len;
> ++
> ++	dbus_message_iter_recurse(entry_iter, &variant_iter);
> ++	if (dbus_message_iter_get_arg_type(&variant_iter) !=3D DBUS_TYPE_ARRAY=
 ||
> ++	    dbus_message_iter_get_element_type(&variant_iter) !=3D
> ++	    DBUS_TYPE_BYTE) {
> ++		wpa_printf(MSG_DEBUG, "dbus: WPS.Start - Wrong "
> ++			   "P2PDeviceAddress type, byte array required");
> ++		*reply =3D wpas_dbus_error_invalid_args(
> ++			message, "P2PDeviceAddress must be a byte array");
> ++		return -1;
> ++	}
> ++	dbus_message_iter_recurse(&variant_iter, &array_iter);
> ++	dbus_message_iter_get_fixed_array(&array_iter, &params->p2p_dev_addr,
> ++					  &len);
> ++	if (len !=3D ETH_ALEN) {
> ++		wpa_printf(MSG_DEBUG, "dbus: WPS.Start - Wrong "
> ++			   "P2PDeviceAddress length %d", len);
> ++		*reply =3D wpas_dbus_error_invalid_args(message,
> ++						      "P2PDeviceAddress "
> ++						      "has wrong length");
> ++		return -1;
> ++	}
> ++	return 0;
> ++}
> ++#endif /* CONFIG_P2P */
> ++
> ++
> + static int wpas_dbus_handler_wps_start_entry(DBusMessage *message, char=
 *key,
> +					     DBusMessageIter *entry_iter,
> +					     struct wps_start_params *params,
> +@@ -165,6 +203,11 @@ static int wpas_dbus_handler_wps_start_entry(DBusMe=
ssage *message, char *key,
> +	else if (os_strcmp(key, "Pin") =3D=3D 0)
> +		return wpas_dbus_handler_wps_pin(message, entry_iter,
> +						 params, reply);
> ++#ifdef CONFIG_P2P
> ++	else if (os_strcmp(key, "P2PDeviceAddress") =3D=3D 0)
> ++		return wpas_dbus_handler_wps_p2p_dev_addr(message, entry_iter,
> ++							  params, reply);
> ++#endif /* CONFIG_P2P */
> +
> +	wpa_printf(MSG_DEBUG, "dbus: WPS.Start - unknown key %s", key);
> +	*reply =3D wpas_dbus_error_invalid_args(message, key);
> +@@ -231,12 +274,31 @@ DBusMessage * wpas_dbus_handler_wps_start(DBusMess=
age *message,
> +		ret =3D wpas_wps_start_reg(wpa_s, params.bssid, params.pin,
> +					 NULL);
> +	else if (params.type =3D=3D 1) {
> +-		ret =3D wpas_wps_start_pin(wpa_s, params.bssid, params.pin, 0,
> +-					 DEV_PW_DEFAULT);
> +-		if (ret > 0)
> +-			os_snprintf(npin, sizeof(npin), "%08d", ret);
> +-	} else
> ++#ifdef CONFIG_AP
> ++		if (wpa_s->ap_iface)
> ++			ret =3D wpa_supplicant_ap_wps_pin(wpa_s,
> ++							params.bssid,
> ++							params.pin,
> ++							npin, sizeof(npin));
> ++		else
> ++#endif /* CONFIG_AP */
> ++		{
> ++			ret =3D wpas_wps_start_pin(wpa_s, params.bssid,
> ++						 params.pin, 0,
> ++						 DEV_PW_DEFAULT);
> ++			if (ret > 0)
> ++				os_snprintf(npin, sizeof(npin), "%08d", ret);
> ++		}
> ++	} else {
> ++#ifdef CONFIG_AP
> ++		if (wpa_s->ap_iface)
> ++			ret =3D wpa_supplicant_ap_wps_pbc(wpa_s,
> ++							params.bssid,
> ++							params.p2p_dev_addr);
> ++		else
> ++#endif /* CONFIG_AP */
> +		ret =3D wpas_wps_start_pbc(wpa_s, params.bssid, 0);
> ++	}
> +
> +	if (ret < 0) {
> +		wpa_printf(MSG_DEBUG, "dbus: WPS.Start wpas_wps_failed in "
> +--
> +1.7.10
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant/99_wpa_supplicant b/meta-arago-distro/recipes-connectivity/wpa-sup=
plicant/wpa-supplicant/99_wpa_supplicant
> new file mode 100644
> index 0000000..6ff4dd8
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplican=
t/99_wpa_supplicant
> @@ -0,0 +1 @@
> +d root root 0700 /var/run/wpa_supplicant none
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant/defaults-sane b/meta-arago-distro/recipes-connectivity/wpa-supplic=
ant/wpa-supplicant/defaults-sane
> new file mode 100644
> index 0000000..67c4cbd
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplican=
t/defaults-sane
> @@ -0,0 +1,8 @@
> +# Useful flags:
> +#  -i <ifname>          Interface (required, unless specified in config)
> +#  -D <driver>          Wireless Driver
> +#  -d                   Debugging (-dd for more)
> +#  -q                   Quiet (-qq for more)
> +
> +CONFIG=3D"/etc/wpa_supplicant.conf"
> +OPTIONS=3D"-i eth1 -D wext"
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant/defconfig b/meta-arago-distro/recipes-connectivity/wpa-supplicant/=
wpa-supplicant/defconfig
> new file mode 100755
> index 0000000..9b9882a
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplican=
t/defconfig
> @@ -0,0 +1,426 @@
> +# Example wpa_supplicant build time configuration
> +#
> +# This file lists the configuration options that are used when building =
the
> +# hostapd binary. All lines starting with # are ignored. Configuration o=
ption
> +# lines must be commented out complete, if they are not to be included, =
i.e.,
> +# just setting VARIABLE=3Dn is not disabling that variable.
> +#
> +# This file is included in Makefile, so variables like CFLAGS and LIBS c=
an also
> +# be modified from here. In most cases, these lines should use +=3D in o=
rder not
> +# to override previous values of the variables.
> +
> +
> +# Uncomment following two lines and fix the paths if you have installed =
OpenSSL
> +# or GnuTLS in non-default location
> +#CFLAGS +=3D -I/usr/local/openssl/include
> +#LIBS +=3D -L/usr/local/openssl/lib
> +
> +# Some Red Hat versions seem to include kerberos header files from OpenS=
SL, but
> +# the kerberos files are not in the default include path. Following line=
 can be
> +# used to fix build issues on such systems (krb5.h not found).
> +#CFLAGS +=3D -I/usr/include/kerberos
> +
> +# Example configuration for various cross-compilation platforms
> +
> +#### sveasoft (e.g., for Linksys WRT54G) ###############################=
#######
> +#CC=3Dmipsel-uclibc-gcc
> +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> +#CFLAGS +=3D -Os
> +#CPPFLAGS +=3D -I../src/include -I../../src/router/openssl/include
> +#LIBS +=3D -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
> +########################################################################=
#######
> +
> +#### openwrt (e.g., for Linksys WRT54G) ################################=
#######
> +#CC=3Dmipsel-uclibc-gcc
> +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> +#CFLAGS +=3D -Os
> +#CPPFLAGS=3D-I../src/include -I../openssl-0.9.7d/include \
> +#	-I../WRT54GS/release/src/include
> +#LIBS =3D -lssl
> +########################################################################=
#######
> +
> +#CC=3D$(CROSS_COMPILE)gcc
> +#CFLAGS +=3D -DCONFIG_LIBNL20
> +#CPPFLAGS +=3D -DCONFIG_LIBNL20
> +#LIBS +=3D -L$(NFSROOT)/lib -lnl
> +#LIBS_p +=3D -L$(NFSROOT)/lib
> +#LIBDIR =3D $(NFSROOT)/lib
> +#BINDIR =3D $(NFSROOT)/usr/sbin
> +
> +CONFIG_WAPI=3Dy
> +CONFIG_LIBNL20=3Dy
> +NEED_BGSCAN=3Dy
> +CONFIG_BGSCAN_LEARN=3Dy
> +
> +# Driver interface for Host AP driver
> +#CONFIG_DRIVER_HOSTAP=3Dy
> +
> +# Driver interface for Agere driver
> +#CONFIG_DRIVER_HERMES=3Dy
> +# Change include directories to match with the local setup
> +#CFLAGS +=3D -I../../hcf -I../../include -I../../include/hcf
> +#CFLAGS +=3D -I../../include/wireless
> +
> +# Driver interface for madwifi driver
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> +#CONFIG_DRIVER_MADWIFI=3Dy
> +# Set include directory to the madwifi source tree
> +#CFLAGS +=3D -I../../madwifi
> +
> +# Driver interface for ndiswrapper
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> +#CONFIG_DRIVER_NDISWRAPPER=3Dy
> +
> +# Driver interface for Atmel driver
> +#CONFIG_DRIVER_ATMEL=3Dy
> +
> +# Driver interface for old Broadcom driver
> +# Please note that the newer Broadcom driver ("hybrid Linux driver") sup=
portsBG
> +# Linux wireless extensions and does not need (or even work) with the ol=
d
> +# driver wrapper. Use CONFIG_DRIVER_WEXT=3Dy with that driver.
> +#CONFIG_DRIVER_BROADCOM=3Dy
> +# Example path for wlioctl.h; change to match your configuration
> +#CFLAGS +=3D -I/opt/WRT54GS/release/src/include
> +
> +# Driver interface for Intel ipw2100/2200 driver
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> +#CONFIG_DRIVER_IPW=3Dy
> +
> +# Driver interface for Ralink driver
> +#CONFIG_DRIVER_RALINK=3Dy
> +
> +# Driver interface for generic Linux wireless extensions
> +CONFIG_DRIVER_WEXT=3Dy
> +
> +# Driver interface for Linux drivers using the nl80211 kernel interface
> +CONFIG_DRIVER_NL80211=3Dy
> +
> +# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
> +#CONFIG_DRIVER_BSD=3Dy
> +#CFLAGS +=3D -I/usr/local/include
> +#LIBS +=3D -L/usr/local/lib
> +#LIBS_p +=3D -L/usr/local/libBG
> +#LIBS_c +=3D -L/usr/local/lib
> +
> +# Driver interface for Windows NDIS
> +#CONFIG_DRIVER_NDIS=3Dy
> +#CFLAGS +=3D -I/usr/include/w32api/ddk
> +#LIBS +=3D -L/usr/local/lib
> +# For native build using mingw
> +#CONFIG_NATIVE_WINDOWS=3Dy
> +# Additional directories for cross-compilation on Linux host for mingw t=
arget
> +#CFLAGS +=3D -I/opt/mingw/mingw32/include/ddk
> +#LIBS +=3D -L/opt/mingw/mingw32/lib
> +#CC=3Dmingw32-gcc
> +# By default, driver_ndis uses WinPcap for low-level operations. This ca=
n be
> +# replaced with the following option which replaces WinPcap calls with N=
DISUIO.
> +# However, this requires that WZC is disabled (net stop wzcsvc) before s=
tarting
> +# wpa_supplicant.
> +# CONFIG_USE_NDISUIO=3Dy
> +
> +# Driver interface for development testing
> +#CONFIG_DRIVER_TEST=3Dy
> +
> +# Include client MLME (management frame processing) for test driver
> +# This can be used to test MLME operations in hostapd with the test inte=
rface.
> +# space.
> +#CONFIG_CLIENT_MLME=3Dy
> +
> +# Driver interface for wired Ethernet drivers
> +CONFIG_DRIVER_WIRED=3Dy
> +
> +# Driver interface for the Broadcom RoboSwitch family
> +#CONFIG_DRIVER_ROBOSWITCH=3Dy
> +
> +# Driver interface for no driver (e.g., WPS ER only)
> +#CONFIG_DRIVER_NONE=3Dy
> +
> +# Solaris libraries
> +#LIBS +=3D -lsocket -ldlpi -lnsl
> +#LIBS_c +=3D -lsocket
> +
> +# Enable IEEE 802.1X Supplicant (automatically included if any EAP metho=
d is
> +# included)
> +CONFIG_IEEE8021X_EAPOL=3Dy
> +
> +# EAP-MD5
> +CONFIG_EAP_MD5=3Dy
> +
> +# EAP-MSCHAPv2
> +CONFIG_EAP_MSCHAPV2=3Dy
> +
> +# EAP-TLS
> +CONFIG_EAP_TLS=3Dy
> +
> +# EAL-PEAP
> +CONFIG_EAP_PEAP=3Dy
> +
> +# EAP-TTLS
> +CONFIG_EAP_TTLS=3Dy
> +
> +# EAP-FAST
> +# Note: Default OpenSSL package does not include support for all the
> +# functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL=
,
> +# the OpenSSL library must be patched (openssl-0.9.8d-tls-extensions.pat=
ch)
> +# to add the needed functions.
> +#CONFIG_EAP_FAST=3Dy
> +
> +# EAP-GTC
> +CONFIG_EAP_GTC=3Dy
> +
> +# EAP-OTP
> +CONFIG_EAP_OTP=3Dy
> +
> +# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
> +#CONFIG_EAP_SIM=3Dy
> +
> +# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
> +#CONFIG_EAP_PSK=3Dy
> +
> +# EAP-PAX
> +#CONFIG_EAP_PAX=3Dy
> +
> +# LEAP
> +CONFIG_EAP_LEAP=3Dy
> +
> +# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
> +#CONFIG_EAP_AKA=3Dy
> +
> +# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
> +# This requires CONFIG_EAP_AKA to be enabled, too.
> +#CONFIG_EAP_AKA_PRIME=3Dy
> +
> +# Enable USIM simulator (Milenage) for EAP-AKA
> +#CONFIG_USIM_SIMULATOR=3Dy
> +
> +# EAP-SAKE
> +#CONFIG_EAP_SAKE=3Dy
> +
> +# EAP-GPSK
> +#CONFIG_EAP_GPSK=3Dy
> +# Include support for optional SHA256 cipher suite in EAP-GPSK
> +#CONFIG_EAP_GPSK_SHA256=3Dy
> +
> +# EAP-TNC and related Trusted Network Connect support (experimental)
> +#CONFIG_EAP_TNC=3Dy
> +
> +# Wi-Fi Protected Setup (WPS)
> +CONFIG_WPS=3Dy
> +# Enable WSC 2.0 support
> +CONFIG_WPS2=3Dy
> +
> +# EAP-IKEv2
> +#CONFIG_EAP_IKEV2=3Dy
> +
> +# PKCS#12 (PFX) support (used to read private key and certificate file f=
rom
> +# a file that usually has extension .p12 or .pfx)
> +CONFIG_PKCS12=3Dy
> +
> +# Smartcard support (i.e., private key on a smartcard), e.g., with opens=
sl
> +# engine.
> +CONFIG_SMARTCARD=3Dy
> +
> +# PC/SC interface for smartcards (USIM, GSM SIM)
> +# Enable this if EAP-SIM or EAP-AKA is included
> +#CONFIG_PCSC=3Dy
> +
> +# Development testingBG
> +#CONFIG_EAPOL_TEST=3Dy
> +
> +# Select control interface backend for external programs, e.g, wpa_cli:
> +# unix =3D UNIX domain sockets (default for Linux/*BSD)
> +# udp =3D UDP sockets using localhost (127.0.0.1)
> +# named_pipe =3D Windows Named Pipe (default for Windows)
> +# y =3D use default (backwards compatibility)
> +# If this option is commented out, control interface is not included in =
the
> +# build.
> +CONFIG_CTRL_IFACE=3Dy
> +
> +# Include support for GNU Readline and History Libraries in wpa_cli.
> +# When building a wpa_cli binary for distribution, please note that thes=
e
> +# libraries are licensed under GPL and as such, BSD license may not appl=
y for
> +# the resulting binary.
> +#CONFIG_READLINE=3Dy
> +
> +# Remove debugging code that is printing out debug message to stdout.
> +# This can be used to reduce the size of the wpa_supplicant considerably
> +# if debugging code is not needed. The size reduction can be around 35%
> +# (e.g., 90 kB).
> +#CONFIG_NO_STDOUT_DEBUG=3Dy
> +
> +# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to sa=
ve
> +# 35-50 kB in code size.
> +#CONFIG_NO_WPA=3Dy
> +
> +# Remove WPA2 support. This allows WPA to be used, but removes WPA2 code=
 to
> +# save about 1 kB in code size when building only WPA-Personal (no EAP s=
upport)
> +# or 6 kB if building for WPA-Enterprise.
> +#CONFIG_NO_WPA2=3Dy
> +
> +# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
> +# This option can be used to reduce code size by removing support for
> +# converting ASCII passphrases into PSK. If this functionality is remove=
d, the
> +# PSK can only be configured as the 64-octet hexstring (e.g., from
> +# wpa_passphrase). This saves about 0.5 kB in code size.
> +#CONFIG_NO_WPA_PASSPHRASE=3Dy
> +
> +# Disable scan result processing (ap_mode=3D1) to save code size by abou=
t 1 kB.
> +# This can be used if ap_scan=3D1 mode is never enabled.
> +#CONFIG_NO_SCAN_PROCESSING=3Dy
> +
> +# Select configuration backend:
> +# file =3D text file (e.g., wpa_supplicant.conf; note: the configuration=
 file
> +#	path is given on command line, not here; this option is just used to
> +#	select the backend that allows configuration files to be used)
> +# winreg =3D Windows registry (see win_example.reg for an example)
> +CONFIG_BACKEND=3Dfile
> +
> +# Remove configuration write functionality (i.e., to allow the configura=
tion
> +# file to be updated based on runtime configuration changes). The runtim=
e
> +# configuration can still be changed, the changes are just not going to =
be
> +# persistent over restarts. This option can be used to reduce code size =
by
> +# about 3.5 kB.
> +#CONFIG_NO_CONFIG_WRITE=3Dy
> +
> +# Remove support for configuration blobs to reduce code size by about 1.=
5 kB.
> +#CONFIG_NO_CONFIG_BLOBS=3Dy
> +
> +# Select program entry point implementation:
> +# main =3D UNIX/POSIX like main() function (default)
> +# main_winsvc =3D Windows service (read parameters from registry)
> +# main_none =3D Very basic example (development use only)
> +#CONFIG_MAIN=3Dmain
> +
> +# Select wrapper for operatins system and C library specific functions
> +# unix =3D UNIX/POSIX like systems (default)
> +# win32 =3D Windows systems
> +# none =3D Empty template
> +#CONFIG_OS=3Dunix
> +
> +# Select event loop implementation
> +# eloop =3D select() loop (default)
> +# eloop_win =3D Windows events and WaitForMultipleObject() loop
> +# eloop_none =3D Empty template
> +#CONFIG_ELOOP=3Deloop
> +
> +# Select layer 2 packet implementation
> +# linux =3D Linux packet socket (default)
> +# pcap =3D libpcap/libdnet/WinPcap
> +# freebsd =3D FreeBSD libpcap
> +# winpcap =3D WinPcap with receive thread
> +# ndis =3D Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=3Dy)
> +# none =3D Empty template
> +#CONFIG_L2_PACKET=3Dlinux
> +
> +# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
> +CONFIG_PEERKEY=3Dy
> +
> +# IEEE 802.11w (management frame protection)
> +# This version is an experimental implementation based on IEEE 802.11w/D=
1.0
> +# draft and is subject to change since the standard has not yet been fin=
alized.
> +# Driver support is also needed for IEEE 802.11w.
> +#CONFIG_IEEE80211W=3Dy
> +
> +# Select TLS implementation
> +# openssl =3D OpenSSL (default)
> +# gnutls =3D GnuTLS (needed for TLS/IA, see also CONFIG_GNUTLS_EXTRA)
> +# internal =3D Internal TLSv1 implementation (experimental)
> +# none =3D Empty template
> +#CONFIG_TLS=3Dopenssl
> +
> +# Whether to enable TLS/IA support, which is required for EAP-TTLSv1.
> +# You need CONFIG_TLS=3Dgnutls for this to have any effect. Please note =
that
> +# even though the core GnuTLS library is released under LGPL, this extra
> +# library uses GPL and as such, the terms of GPL apply to the combinatio=
n
> +# of wpa_supplicant and GnuTLS if this option is enabled. BSD license ma=
y not
> +# apply for distribution of the resulting binary.
> +#CONFIG_GNUTLS_EXTRA=3Dy
> +
> +# If CONFIG_TLS=3Dinternal is used, additional library and include paths=
 are
> +# needed for LibTomMath. Alternatively, an integrated, minimal version o=
f
> +# LibTomMath can be used. See beginning of libtommath.c for details on b=
enefits
> +# and drawbacks of this option.
> +#CONFIG_INTERNAL_LIBTOMMATH=3Dy
> +#ifndef CONFIG_INTERNAL_LIBTOMMATH
> +#LTM_PATH=3D/usr/src/libtommath-0.39
> +#CFLAGS +=3D -I$(LTM_PATH)
> +#LIBS +=3D -L$(LTM_PATH)
> +#LIBS_p +=3D -L$(LTM_PATH)
> +#endif
> +# At the cost of about 4 kB of additional binary size, the internal LibT=
omMath
> +# can be configured to include faster routines for exptmod, sqr, and div=
 to
> +# speed up DH and RSA calculation considerably
> +#CONFIG_INTERNAL_LIBTOMMATH_FAST=3Dy
> +
> +# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.
> +# This is only for Windows builds and requires WMI-related header files =
and
> +# WbemUuid.Lib from Platform SDK even when building with MinGW.
> +#CONFIG_NDIS_EVENTS_INTEGRATED=3Dy
> +#PLATFORMSDKLIB=3D"/opt/Program Files/Microsoft Platform SDK/Lib"
> +
> +# Add support for old DBus control interface
> +# (fi.epitest.hostap.WPASupplicant)
> +CONFIG_CTRL_IFACE_DBUS=3Dy
> +
> +# Add support for new DBus control interface
> +# (fi.w1.hostap.wpa_supplicant1)
> +CONFIG_CTRL_IFACE_DBUS_NEW=3Dy
> +
> +# Add introspection support for new DBus control interface
> +CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy
> +
> +# Add support for loading EAP methods dynamically as shared libraries.
> +# When this option is enabled, each EAP method can be either included
> +# statically (CONFIG_EAP_<method>=3Dy) or dynamically (CONFIG_EAP_<metho=
d>=3Ddyn).
> +# Dynamic EAP methods are build as shared objects (eap_*.so) and they ne=
ed to
> +# be loaded in the beginning of the wpa_supplicant configuration file
> +# (see load_dynamic_eap parameter in the example file) before being used=
 in
> +# the network blocks.
> +#
> +# Note that some shared parts of EAP methods are included in the main pr=
ogram
> +# and in order to be able to use dynamic EAP methods using these parts, =
the
> +# main program must have been build with the EAP method enabled (=3Dy or=
 =3Ddyn).
> +# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic libr=
aries
> +# unless at least one of them was included in the main build to force in=
clusion
> +# of the shared code. Similarly, at least one of EAP-SIM/AKA must be inc=
luded
> +# in the main build to be able to load these methods dynamically.
> +#
> +# Please also note that using dynamic libraries will increase the total =
binary
> +# size. Thus, it may not be the best option for targets that have limite=
d
> +# amount of memory/flash.
> +#CONFIG_DYNAMIC_EAP_METHODS=3Dy
> +
> +# IEEE Std 802.11r-2008 (Fast BSS Transition)
> +#CONFIG_IEEE80211R=3Dy
> +
> +# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#=
.txt)
> +CONFIG_DEBUG_FILE=3Dy
> +
> +# Enable privilege separation (see README 'Privilege separation' for det=
ails)
> +#CONFIG_PRIVSEP=3Dy
> +
> +# Enable mitigation against certain attacks against TKIP by delaying Mic=
hael
> +# MIC error reports by a random amount of time between 0 and 60 seconds
> +#CONFIG_DELAYED_MIC_ERROR_REPORT=3Dy
> +
> +# Enable tracing code for developer debugging
> +# This tracks use of memory allocations and other registrations and repo=
rts
> +# incorrect use with a backtrace of call (or allocation) location.
> +#CONFIG_WPA_TRACE=3Dy
> +# For BSD, comment out these.
> +#LIBS +=3D -lexecinfo
> +#LIBS_p +=3D -lexecinfo
> +#LIBS_c +=3D -lexecinfo
> +
> +# Use libbfd to get more details for developer debugging
> +# This enables use of libbfd to get more detailed symbols for the backtr=
aces
> +# generated by CONFIG_WPA_TRACE=3Dy.
> +#CONFIG_WPA_TRACE_BFD=3Dy
> +# For BSD, comment out these.
> +#LIBS +=3D -lbfd -liberty -lz
> +#LIBS_p +=3D -lbfd -liberty -lz
> +#LIBS_c +=3D -lbfd -liberty -lz
> +
> +# for p2p
> +CONFIG_P2P=3Dy
> +CONFIG_AP=3Dy
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant/fi.epitest.hostap.WPASupplicant.service b/meta-arago-distro/recipe=
s-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplican=
t.service
> new file mode 100644
> index 0000000..fb3f917
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplican=
t/fi.epitest.hostap.WPASupplicant.service
> @@ -0,0 +1,4 @@
> +[D-BUS Service]
> +Name=3Dfi.epitest.hostap.WPASupplicant
> +Exec=3D/usr/sbin/wpa_supplicant -d -Dnl80211 -c/etc/wpa_supplicant.conf =
-iwlan0 -B -u
> +User=3Droot
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant/fi.w1.wpa_supplicant1.service b/meta-arago-distro/recipes-connecti=
vity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
> new file mode 100644
> index 0000000..0bb1056
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplican=
t/fi.w1.wpa_supplicant1.service
> @@ -0,0 +1,4 @@
> +[D-BUS Service]
> +Name=3Dfi.w1.wpa_supplicant1
> +Exec=3D/usr/sbin/wpa_supplicant -d -Dnl80211 -c/etc/wpa_supplicant.conf =
-iwlan0 -B -u
> +User=3Droot
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant/wpa-supplicant.sh b/meta-arago-distro/recipes-connectivity/wpa-sup=
plicant/wpa-supplicant/wpa-supplicant.sh
> new file mode 100644
> index 0000000..5c9e5d3
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplican=
t/wpa-supplicant.sh
> @@ -0,0 +1,85 @@
> +#!/bin/sh
> +
> +
> +WPA_SUP_BIN=3D"/usr/sbin/wpa_supplicant"
> +WPA_SUP_PNAME=3D"wpa_supplicant"
> +WPA_SUP_PIDFILE=3D"/var/run/wpa_supplicant.$IFACE.pid"
> +WPA_SUP_OPTIONS=3D"-B -P $WPA_SUP_PIDFILE -i $IFACE"
> +
> +VERBOSITY=3D0
> +
> +
> +if [ -s "$IF_WPA_CONF" ]; then
> +	WPA_SUP_CONF=3D"-c $IF_WPA_CONF"
> +else
> +	exit 0
> +fi
> +
> +if [ ! -x "$WPA_SUP_BIN" ]; then
> +=09
> +	if [ "$VERBOSITY" =3D "1" ]; then
> +		echo "$WPA_SUP_PNAME: binaries not executable or missing from $WPA_SUP=
_BIN"
> +	fi
> +=09
> +	exit 1
> +fi
> +
> +if [ "$MODE" =3D "start" ] ; then
> +	# driver type of interface, defaults to wext when undefined
> +	if [ -s "/etc/wpa_supplicant/driver.$IFACE" ]; then
> +		IF_WPA_DRIVER=3D$(cat "/etc/wpa_supplicant/driver.$IFACE")
> +	elif [ -z "$IF_WPA_DRIVER" ]; then
> +	=09
> +		if [ "$VERBOSITY" =3D "1" ]; then
> +			echo "$WPA_SUP_PNAME: wpa-driver not provided, using \"wext\""
> +		fi
> +	=09
> +		IF_WPA_DRIVER=3D"wext"
> +	fi
> +=09
> +	# if we have passed the criteria, start wpa_supplicant
> +	if [ -n "$WPA_SUP_CONF" ]; then
> +	=09
> +		if [ "$VERBOSITY" =3D "1" ]; then
> +			echo "$WPA_SUP_PNAME: $WPA_SUP_BIN $WPA_SUP_OPTIONS $WPA_SUP_CONF -D =
$IF_WPA_DRIVER"
> +		fi
> +	=09
> +		start-stop-daemon --start --quiet \
> +			--name $WPA_SUP_PNAME --startas $WPA_SUP_BIN --pidfile $WPA_SUP_PIDFI=
LE \
> +			--  $WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER
> +	fi
> +
> +	# if the interface socket exists, then wpa_supplicant was invoked succe=
ssfully
> +	if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
> +=09
> +		if [ "$VERBOSITY" =3D "1" ]; then
> +			echo "$WPA_SUP_PNAME: ctrl_interface socket located at $WPA_COMMON_CT=
RL_IFACE/$IFACE"
> +		fi
> +
> +		exit 0
> +	=09
> +	fi
> +=09
> +elif [ "$MODE" =3D "stop" ]; then
> +
> +	if [ -f "$WPA_SUP_PIDFILE" ]; then
> +	=09
> +		if [ "$VERBOSITY" =3D "1" ]; then
> +			echo "$WPA_SUP_PNAME: terminating $WPA_SUP_PNAME daemon"
> +		fi
> +	=09
> +		start-stop-daemon --stop --quiet \
> +			--name $WPA_SUP_PNAME --pidfile	$WPA_SUP_PIDFILE
> +		=09
> +		if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
> +			rm -f $WPA_COMMON_CTRL_IFACE/$IFACE
> +		fi
> +		=09
> +		if [ -f "$WPA_SUP_PIDFILE" ]; then
> +			rm -f $WPA_SUP_PIDFILE
> +		fi
> +	fi
> +
> +fi
> +
> +exit 0
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant/wpa_supplicant.conf b/meta-arago-distro/recipes-connectivity/wpa-s=
upplicant/wpa-supplicant/wpa_supplicant.conf
> new file mode 100644
> index 0000000..f0c993d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplican=
t/wpa_supplicant.conf
> @@ -0,0 +1,690 @@
> +##### Example wpa_supplicant configuration file ########################=
#######
> +#
> +# This file describes configuration file format and lists all available =
option.
> +# Please also take a look at simpler configuration examples in 'examples=
'
> +# subdirectory.
> +#
> +# Empty lines and lines starting with # are ignored
> +
> +# NOTE! This file may contain password information and should probably b=
e made
> +# readable only by root user on multiuser systems.
> +
> +# Note: All file paths in this configuration file should use full (absol=
ute,
> +# not relative to working directory) path in order to allow working dire=
ctory
> +# to be changed. This can happen if wpa_supplicant is run in the backgro=
und.
> +
> +# Whether to allow wpa_supplicant to update (overwrite) configuration
> +#
> +# This option can be used to allow wpa_supplicant to overwrite configura=
tion
> +# file whenever configuration is changed (e.g., new network block is add=
ed with
> +# wpa_cli or wpa_gui, or a password is changed). This is required for
> +# wpa_cli/wpa_gui to be able to store the configuration changes permanen=
tly.
> +# Please note that overwriting configuration file will remove the commen=
ts from
> +# it.
> +#update_config=3D1
> +
> +# global configuration (shared by all network blocks)
> +#
> +# Parameters for the control interface. If this is specified, wpa_suppli=
cant
> +# will open a control interface that is available for external programs =
to
> +# manage wpa_supplicant. The meaning of this string depends on which con=
trol
> +# interface mechanism is used. For all cases, the existance of this para=
meter
> +# in configuration is used to determine whether the control interface is
> +# enabled.
> +#
> +# For UNIX domain sockets (default on Linux and BSD): This is a director=
y that
> +# will be created for UNIX domain sockets for listening to requests from
> +# external programs (CLI/GUI, etc.) for status information and configura=
tion.
> +# The socket file will be named based on the interface name, so multiple
> +# wpa_supplicant processes can be run at the same time if more than one
> +# interface is used.
> +# /var/run/wpa_supplicant is the recommended directory for sockets and b=
y
> +# default, wpa_cli will use it when trying to connect with wpa_supplican=
t.
> +#
> +# Access control for the control interface can be configured by setting =
the
> +# directory to allow only members of a group to use sockets. This way, i=
t is
> +# possible to run wpa_supplicant as root (since it needs to change netwo=
rk
> +# configuration and open raw sockets) and still allow GUI/CLI components=
 to be
> +# run as non-root users. However, since the control interface can be use=
d to
> +# change the network configuration, this access needs to be protected in=
 many
> +# cases. By default, wpa_supplicant is configured to use gid 0 (root). I=
f you
> +# want to allow non-root users to use the control interface, add a new g=
roup
> +# and change this value to match with that group. Add users that should =
have
> +# control interface access to this group. If this variable is commented =
out or
> +# not included in the configuration file, group will not be changed from=
 the
> +# value it got by default when the directory or socket was created.
> +#
> +# When configuring both the directory and group, use following format:
> +# DIR=3D/var/run/wpa_supplicant GROUP=3Dwheel
> +# DIR=3D/var/run/wpa_supplicant GROUP=3D0
> +# (group can be either group name or gid)
> +#
> +# For UDP connections (default on Windows): The value will be ignored. T=
his
> +# variable is just used to select that the control interface is to be cr=
eated.
> +# The value can be set to, e.g., udp (ctrl_interface=3Dudp)
> +#
> +# For Windows Named Pipe: This value can be used to set the security des=
criptor
> +# for controlling access to the control interface. Security descriptor c=
an be
> +# set using Security Descriptor String Format (see http://msdn.microsoft=
.com/
> +# library/default.asp?url=3D/library/en-us/secauthz/security/
> +# security_descriptor_string_format.asp). The descriptor string needs to=
 be
> +# prefixed with SDDL=3D. For example, ctrl_interface=3DSDDL=3DD: would s=
et an empty
> +# DACL (which will reject all connections). See README-Windows.txt for m=
ore
> +# information about SDDL string format.
> +#
> +ctrl_interface=3D/var/run/wpa_supplicant
> +
> +# IEEE 802.1X/EAPOL version
> +# wpa_supplicant is implemented based on IEEE Std 802.1X-2004 which defi=
nes
> +# EAPOL version 2. However, there are many APs that do not handle the ne=
w
> +# version number correctly (they seem to drop the frames completely). In=
 order
> +# to make wpa_supplicant interoperate with these APs, the version number=
 is set
> +# to 1 by default. This configuration value can be used to set it to the=
 new
> +# version (2).
> +eapol_version=3D1
> +
> +# AP scanning/selection
> +# By default, wpa_supplicant requests driver to perform AP scanning and =
then
> +# uses the scan results to select a suitable AP. Another alternative is =
to
> +# allow the driver to take care of AP scanning and selection and use
> +# wpa_supplicant just to process EAPOL frames based on IEEE 802.11 assoc=
iation
> +# information from the driver.
> +# 1: wpa_supplicant initiates scanning and AP selection
> +# 0: driver takes care of scanning, AP selection, and IEEE 802.11 associ=
ation
> +#    parameters (e.g., WPA IE generation); this mode can also be used wi=
th
> +#    non-WPA drivers when using IEEE 802.1X mode; do not try to associat=
e with
> +#    APs (i.e., external program needs to control association). This mod=
e must
> +#    also be used when using wired Ethernet drivers.
> +# 2: like 0, but associate with APs using security policy and SSID (but =
not
> +#    BSSID); this can be used, e.g., with ndiswrapper and NDIS drivers t=
o
> +#    enable operation with hidden SSIDs and optimized roaming; in this m=
ode,
> +#    the network blocks in the configuration file are tried one by one u=
ntil
> +#    the driver reports successful association; each network block shoul=
d have
> +#    explicit security policy (i.e., only one option in the lists) for
> +#    key_mgmt, pairwise, group, proto variables
> +ap_scan=3D1
> +
> +# EAP fast re-authentication
> +# By default, fast re-authentication is enabled for all EAP methods that
> +# support it. This variable can be used to disable fast re-authenticatio=
n.
> +# Normally, there is no need to disable this.
> +fast_reauth=3D1
> +
> +# OpenSSL Engine support
> +# These options can be used to load OpenSSL engines.
> +# The two engines that are supported currently are shown below:
> +# They are both from the opensc project (http://www.opensc.org/)
> +# By default no engines are loaded.
> +# make the opensc engine available
> +#opensc_engine_path=3D/usr/lib/opensc/engine_opensc.so
> +# make the pkcs11 engine available
> +#pkcs11_engine_path=3D/usr/lib/opensc/engine_pkcs11.so
> +# configure the path to the pkcs11 module required by the pkcs11 engine
> +#pkcs11_module_path=3D/usr/lib/pkcs11/opensc-pkcs11.so
> +
> +# Dynamic EAP methods
> +# If EAP methods were built dynamically as shared object files, they nee=
d to be
> +# loaded here before being used in the network blocks. By default, EAP m=
ethods
> +# are included statically in the build, so these lines are not needed
> +#load_dynamic_eap=3D/usr/lib/wpa_supplicant/eap_tls.so
> +#load_dynamic_eap=3D/usr/lib/wpa_supplicant/eap_md5.so
> +
> +# Driver interface parameters
> +# This field can be used to configure arbitrary driver interace paramete=
rs. The
> +# format is specific to the selected driver interface. This field is not=
 used
> +# in most cases.
> +#driver_param=3D"field=3Dvalue"
> +
> +# Maximum lifetime for PMKSA in seconds; default 43200
> +#dot11RSNAConfigPMKLifetime=3D43200
> +# Threshold for reauthentication (percentage of PMK lifetime); default 7=
0
> +#dot11RSNAConfigPMKReauthThreshold=3D70
> +# Timeout for security association negotiation in seconds; default 60
> +#dot11RSNAConfigSATimeout=3D60
> +
> +# network block
> +#
> +# Each network (usually AP's sharing the same SSID) is configured as a s=
eparate
> +# block in this configuration file. The network blocks are in preference=
 order
> +# (the first match is used).
> +#
> +# network block fields:
> +#
> +# disabled:
> +#	0 =3D this network can be used (default)
> +#	1 =3D this network block is disabled (can be enabled through ctrl_ifac=
e,
> +#	    e.g., with wpa_cli or wpa_gui)
> +#
> +# id_str: Network identifier string for external scripts. This value is =
passed
> +#	to external action script through wpa_cli as WPA_ID_STR environment
> +#	variable to make it easier to do network specific configuration.
> +#
> +# ssid: SSID (mandatory); either as an ASCII string with double quotatio=
n or
> +#	as hex string; network name
> +#
> +# scan_ssid:
> +#	0 =3D do not scan this SSID with specific Probe Request frames (defaul=
t)
> +#	1 =3D scan with SSID-specific Probe Request frames (this can be used t=
o
> +#	    find APs that do not accept broadcast SSID or use multiple SSIDs;
> +#	    this will add latency to scanning, so enable this only when needed=
)
> +#
> +# bssid: BSSID (optional); if set, this network block is used only when
> +#	associating with the AP using the configured BSSID
> +#
> +# priority: priority group (integer)
> +# By default, all networks will get same priority group (0). If some of =
the
> +# networks are more desirable, this field can be used to change the orde=
r in
> +# which wpa_supplicant goes through the networks when selecting a BSS. T=
he
> +# priority groups will be iterated in decreasing priority (i.e., the lar=
ger the
> +# priority value, the sooner the network is matched against the scan res=
ults).
> +# Within each priority group, networks will be selected based on securit=
y
> +# policy, signal strength, etc.
> +# Please note that AP scanning with scan_ssid=3D1 and ap_scan=3D2 mode a=
re not
> +# using this priority to select the order for scanning. Instead, they tr=
y the
> +# networks in the order that used in the configuration file.
> +#
> +# mode: IEEE 802.11 operation mode
> +# 0 =3D infrastructure (Managed) mode, i.e., associate with an AP (defau=
lt)
> +# 1 =3D IBSS (ad-hoc, peer-to-peer)
> +# Note: IBSS can only be used with key_mgmt NONE (plaintext and static W=
EP)
> +# and key_mgmt=3DWPA-NONE (fixed group key TKIP/CCMP). In addition, ap_s=
can has
> +# to be set to 2 for IBSS. WPA-None requires following network block opt=
ions:
> +# proto=3DWPA, key_mgmt=3DWPA-NONE, pairwise=3DNONE, group=3DTKIP (or CC=
MP, but not
> +# both), and psk must also be set.
> +#
> +# proto: list of accepted protocols
> +# WPA =3D WPA/IEEE 802.11i/D3.0
> +# RSN =3D WPA2/IEEE 802.11i (also WPA2 can be used as an alias for RSN)
> +# If not set, this defaults to: WPA RSN
> +#
> +# key_mgmt: list of accepted authenticated key management protocols
> +# WPA-PSK =3D WPA pre-shared key (this requires 'psk' field)
> +# WPA-EAP =3D WPA using EAP authentication (this can use an external
> +#	program, e.g., Xsupplicant, for IEEE 802.1X EAP Authentication
> +# IEEE8021X =3D IEEE 802.1X using EAP authentication and (optionally) dy=
namically
> +#	generated WEP keys
> +# NONE =3D WPA is not used; plaintext or static WEP could be used
> +# If not set, this defaults to: WPA-PSK WPA-EAP
> +#
> +# auth_alg: list of allowed IEEE 802.11 authentication algorithms
> +# OPEN =3D Open System authentication (required for WPA/WPA2)
> +# SHARED =3D Shared Key authentication (requires static WEP keys)
> +# LEAP =3D LEAP/Network EAP (only used with LEAP)
> +# If not set, automatic selection is used (Open System with LEAP enabled=
 if
> +# LEAP is allowed as one of the EAP methods).
> +#
> +# pairwise: list of accepted pairwise (unicast) ciphers for WPA
> +# CCMP =3D AES in Counter mode with CBC-MAC [RFC 3610, IEEE 802.11i/D7.0=
]
> +# TKIP =3D Temporal Key Integrity Protocol [IEEE 802.11i/D7.0]
> +# NONE =3D Use only Group Keys (deprecated, should not be included if AP=
s support
> +#	pairwise keys)
> +# If not set, this defaults to: CCMP TKIP
> +#
> +# group: list of accepted group (broadcast/multicast) ciphers for WPA
> +# CCMP =3D AES in Counter mode with CBC-MAC [RFC 3610, IEEE 802.11i/D7.0=
]
> +# TKIP =3D Temporal Key Integrity Protocol [IEEE 802.11i/D7.0]
> +# WEP104 =3D WEP (Wired Equivalent Privacy) with 104-bit key
> +# WEP40 =3D WEP (Wired Equivalent Privacy) with 40-bit key [IEEE 802.11]
> +# If not set, this defaults to: CCMP TKIP WEP104 WEP40
> +#
> +# psk: WPA preshared key; 256-bit pre-shared key
> +# The key used in WPA-PSK mode can be entered either as 64 hex-digits, i=
.e.,
> +# 32 bytes or as an ASCII passphrase (in which case, the real PSK will b=
e
> +# generated using the passphrase and SSID). ASCII passphrase must be bet=
ween
> +# 8 and 63 characters (inclusive).
> +# This field is not needed, if WPA-EAP is used.
> +# Note: Separate tool, wpa_passphrase, can be used to generate 256-bit k=
eys
> +# from ASCII passphrase. This process uses lot of CPU and wpa_supplicant
> +# startup and reconfiguration time can be optimized by generating the PS=
K only
> +# only when the passphrase or SSID has actually changed.
> +#
> +# eapol_flags: IEEE 802.1X/EAPOL options (bit field)
> +# Dynamic WEP key required for non-WPA mode
> +# bit0 (1): require dynamically generated unicast WEP key
> +# bit1 (2): require dynamically generated broadcast WEP key
> +# 	(3 =3D require both keys; default)
> +# Note: When using wired authentication, eapol_flags must be set to 0 fo=
r the
> +# authentication to be completed successfully.
> +#
> +# proactive_key_caching:
> +# Enable/disable opportunistic PMKSA caching for WPA2.
> +# 0 =3D disabled (default)
> +# 1 =3D enabled
> +#
> +# wep_key0..3: Static WEP key (ASCII in double quotation, e.g. "abcde" o=
r
> +# hex without quotation, e.g., 0102030405)
> +# wep_tx_keyidx: Default WEP key index (TX) (0..3)
> +#
> +# peerkey: Whether PeerKey negotiation for direct links (IEEE 802.11e DL=
S) is
> +# allowed. This is only used with RSN/WPA2.
> +# 0 =3D disabled (default)
> +# 1 =3D enabled
> +#peerkey=3D1
> +#
> +# Following fields are only used with internal EAP implementation.
> +# eap: space-separated list of accepted EAP methods
> +#	MD5 =3D EAP-MD5 (unsecure and does not generate keying material ->
> +#			cannot be used with WPA; to be used as a Phase 2 method
> +#			with EAP-PEAP or EAP-TTLS)
> +#       MSCHAPV2 =3D EAP-MSCHAPv2 (cannot be used separately with WPA; t=
o be used
> +#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
> +#       OTP =3D EAP-OTP (cannot be used separately with WPA; to be used
> +#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
> +#       GTC =3D EAP-GTC (cannot be used separately with WPA; to be used
> +#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
> +#	TLS =3D EAP-TLS (client and server certificate)
> +#	PEAP =3D EAP-PEAP (with tunnelled EAP authentication)
> +#	TTLS =3D EAP-TTLS (with tunnelled EAP or PAP/CHAP/MSCHAP/MSCHAPV2
> +#			 authentication)
> +#	If not set, all compiled in methods are allowed.
> +#
> +# identity: Identity string for EAP
> +# anonymous_identity: Anonymous identity string for EAP (to be used as t=
he
> +#	unencrypted identity with EAP types that support different tunnelled
> +#	identity, e.g., EAP-TTLS)
> +# password: Password string for EAP
> +# ca_cert: File path to CA certificate file (PEM/DER). This file can hav=
e one
> +#	or more trusted CA certificates. If ca_cert and ca_path are not
> +#	included, server certificate will not be verified. This is insecure an=
d
> +#	a trusted CA certificate should always be configured when using
> +#	EAP-TLS/TTLS/PEAP. Full path should be used since working directory ma=
y
> +#	change when wpa_supplicant is run in the background.
> +#	On Windows, trusted CA certificates can be loaded from the system
> +#	certificate store by setting this to cert_store://<name>, e.g.,
> +#	ca_cert=3D"cert_store://CA" or ca_cert=3D"cert_store://ROOT".
> +#	Note that when running wpa_supplicant as an application, the user
> +#	certificate store (My user account) is used, whereas computer store
> +#	(Computer account) is used when running wpasvc as a service.
> +# ca_path: Directory path for CA certificate files (PEM). This path may
> +#	contain multiple CA certificates in OpenSSL format. Common use for thi=
s
> +#	is to point to system trusted CA list which is often installed into
> +#	directory like /etc/ssl/certs. If configured, these certificates are
> +#	added to the list of trusted CAs. ca_cert may also be included in that
> +#	case, but it is not required.
> +# client_cert: File path to client certificate file (PEM/DER)
> +#	Full path should be used since working directory may change when
> +#	wpa_supplicant is run in the background.
> +#	Alternatively, a named configuration blob can be used by setting this
> +#	to blob://<blob name>.
> +# private_key: File path to client private key file (PEM/DER/PFX)
> +#	When PKCS#12/PFX file (.p12/.pfx) is used, client_cert should be
> +#	commented out. Both the private key and certificate will be read from
> +#	the PKCS#12 file in this case. Full path should be used since working
> +#	directory may change when wpa_supplicant is run in the background.
> +#	Windows certificate store can be used by leaving client_cert out and
> +#	configuring private_key in one of the following formats:
> +#	cert://substring_to_match
> +#	hash://certificate_thumbprint_in_hex
> +#	for example: private_key=3D"hash://63093aa9c47f56ae88334c7b65a4"
> +#	Note that when running wpa_supplicant as an application, the user
> +#	certificate store (My user account) is used, whereas computer store
> +#	(Computer account) is used when running wpasvc as a service.
> +#	Alternatively, a named configuration blob can be used by setting this
> +#	to blob://<blob name>.
> +# private_key_passwd: Password for private key file (if left out, this w=
ill be
> +#	asked through control interface)
> +# dh_file: File path to DH/DSA parameters file (in PEM format)
> +#	This is an optional configuration file for setting parameters for an
> +#	ephemeral DH key exchange. In most cases, the default RSA
> +#	authentication does not use this configuration. However, it is possibl=
e
> +#	setup RSA to use ephemeral DH key exchange. In addition, ciphers with
> +#	DSA keys always use ephemeral DH keys. This can be used to achieve
> +#	forward secrecy. If the file is in DSA parameters format, it will be
> +#	automatically converted into DH params.
> +# subject_match: Substring to be matched against the subject of the
> +#	authentication server certificate. If this string is set, the server
> +#	sertificate is only accepted if it contains this string in the subject=
.
> +#	The subject string is in following format:
> +#	/C=3DUS/ST=3DCA/L=3DSan Francisco/CN=3DTest AS/emailAddress=3Das@examp=
le.com
> +# altsubject_match: Semicolon separated string of entries to be matched =
against
> +#	the alternative subject name of the authentication server certificate.
> +#	If this string is set, the server sertificate is only accepted if it
> +#	contains one of the entries in an alternative subject name extension.
> +#	altSubjectName string is in following format: TYPE:VALUE
> +#	Example: EMAIL:server@example.com
> +#	Example: DNS:server.example.com;DNS:server2.example.com
> +#	Following types are supported: EMAIL, DNS, URI
> +# phase1: Phase1 (outer authentication, i.e., TLS tunnel) parameters
> +#	(string with field-value pairs, e.g., "peapver=3D0" or
> +#	"peapver=3D1 peaplabel=3D1")
> +#	'peapver' can be used to force which PEAP version (0 or 1) is used.
> +#	'peaplabel=3D1' can be used to force new label, "client PEAP encryptio=
n",
> +#	to be used during key derivation when PEAPv1 or newer. Most existing
> +#	PEAPv1 implementation seem to be using the old label, "client EAP
> +#	encryption", and wpa_supplicant is now using that as the default value=
.
> +#	Some servers, e.g., Radiator, may require peaplabel=3D1 configuration =
to
> +#	interoperate with PEAPv1; see eap_testing.txt for more details.
> +#	'peap_outer_success=3D0' can be used to terminate PEAP authentication =
on
> +#	tunneled EAP-Success. This is required with some RADIUS servers that
> +#	implement draft-josefsson-pppext-eap-tls-eap-05.txt (e.g.,
> +#	Lucent NavisRadius v4.4.0 with PEAP in "IETF Draft 5" mode)
> +#	include_tls_length=3D1 can be used to force wpa_supplicant to include
> +#	TLS Message Length field in all TLS messages even if they are not
> +#	fragmented.
> +#	sim_min_num_chal=3D3 can be used to configure EAP-SIM to require three
> +#	challenges (by default, it accepts 2 or 3)
> +# phase2: Phase2 (inner authentication with TLS tunnel) parameters
> +#	(string with field-value pairs, e.g., "auth=3DMSCHAPV2" for EAP-PEAP o=
r
> +#	"autheap=3DMSCHAPV2 autheap=3DMD5" for EAP-TTLS)
> +# Following certificate/private key fields are used in inner Phase2
> +# authentication when using EAP-TTLS or EAP-PEAP.
> +# ca_cert2: File path to CA certificate file. This file can have one or =
more
> +#	trusted CA certificates. If ca_cert2 and ca_path2 are not included,
> +#	server certificate will not be verified. This is insecure and a truste=
d
> +#	CA certificate should always be configured.
> +# ca_path2: Directory path for CA certificate files (PEM)
> +# client_cert2: File path to client certificate file
> +# private_key2: File path to client private key file
> +# private_key2_passwd: Password for private key file
> +# dh_file2: File path to DH/DSA parameters file (in PEM format)
> +# subject_match2: Substring to be matched against the subject of the
> +#	authentication server certificate.
> +# altsubject_match2: Substring to be matched against the alternative sub=
ject
> +#	name of the authentication server certificate.
> +#
> +# fragment_size: Maximum EAP fragment size in bytes (default 1398).
> +#	This value limits the fragment size for EAP methods that support
> +#	fragmentation (e.g., EAP-TLS and EAP-PEAP). This value should be set
> +#	small enough to make the EAP messages fit in MTU of the network
> +#	interface used for EAPOL. The default value is suitable for most
> +#	cases.
> +#
> +# EAP-PSK variables:
> +# eappsk: 16-byte (128-bit, 32 hex digits) pre-shared key in hex format
> +# nai: user NAI
> +#
> +# EAP-PAX variables:
> +# eappsk: 16-byte (128-bit, 32 hex digits) pre-shared key in hex format
> +#
> +# EAP-SAKE variables:
> +# eappsk: 32-byte (256-bit, 64 hex digits) pre-shared key in hex format
> +#	(this is concatenation of Root-Secret-A and Root-Secret-B)
> +# nai: user NAI (PEERID)
> +#
> +# EAP-GPSK variables:
> +# eappsk: Pre-shared key in hex format (at least 128 bits, i.e., 32 hex =
digits)
> +# nai: user NAI (ID_Client)
> +#
> +# EAP-FAST variables:
> +# pac_file: File path for the PAC entries. wpa_supplicant will need to b=
e able
> +#	to create this file and write updates to it when PAC is being
> +#	provisioned or refreshed. Full path to the file should be used since
> +#	working directory may change when wpa_supplicant is run in the
> +#	background. Alternatively, a named configuration blob can be used by
> +#	setting this to blob://<blob name>
> +# phase1: fast_provisioning=3D1 option enables in-line provisioning of E=
AP-FAST
> +#	credentials (PAC)
> +#
> +# wpa_supplicant supports number of "EAP workarounds" to work around
> +# interoperability issues with incorrectly behaving authentication serve=
rs.
> +# These are enabled by default because some of the issues are present in=
 large
> +# number of authentication servers. Strict EAP conformance mode can be
> +# configured by disabling workarounds with eap_workaround=3D0.
> +
> +# Example blocks:
> +
> +# Simple case: WPA-PSK, PSK as an ASCII passphrase, allow all valid ciph=
ers
> +network=3D{
> +	ssid=3D"simple"
> +	psk=3D"very secret passphrase"
> +	priority=3D5
> +}
> +
> +# Same as previous, but request SSID-specific scanning (for APs that rej=
ect
> +# broadcast SSID)
> +network=3D{
> +	ssid=3D"second ssid"
> +	scan_ssid=3D1
> +	psk=3D"very secret passphrase"
> +	priority=3D2
> +}
> +
> +# Only WPA-PSK is used. Any valid cipher combination is accepted.
> +network=3D{
> +	ssid=3D"example"
> +	proto=3DWPA
> +	key_mgmt=3DWPA-PSK
> +	pairwise=3DCCMP TKIP
> +	group=3DCCMP TKIP WEP104 WEP40
> +	psk=3D06b4be19da289f475aa46a33cb793029d4ab3db7a23ee92382eb0106c72ac7bb
> +	priority=3D2
> +}
> +
> +# Only WPA-EAP is used. Both CCMP and TKIP is accepted. An AP that used =
WEP104
> +# or WEP40 as the group cipher will not be accepted.
> +network=3D{
> +	ssid=3D"example"
> +	proto=3DRSN
> +	key_mgmt=3DWPA-EAP
> +	pairwise=3DCCMP TKIP
> +	group=3DCCMP TKIP
> +	eap=3DTLS
> +	identity=3D"user@example.com"
> +	ca_cert=3D"/etc/cert/ca.pem"
> +	client_cert=3D"/etc/cert/user.pem"
> +	private_key=3D"/etc/cert/user.prv"
> +	private_key_passwd=3D"password"
> +	priority=3D1
> +}
> +
> +# EAP-PEAP/MSCHAPv2 configuration for RADIUS servers that use the new pe=
aplabel
> +# (e.g., Radiator)
> +network=3D{
> +	ssid=3D"example"
> +	key_mgmt=3DWPA-EAP
> +	eap=3DPEAP
> +	identity=3D"user@example.com"
> +	password=3D"foobar"
> +	ca_cert=3D"/etc/cert/ca.pem"
> +	phase1=3D"peaplabel=3D1"
> +	phase2=3D"auth=3DMSCHAPV2"
> +	priority=3D10
> +}
> +
> +# EAP-TTLS/EAP-MD5-Challenge configuration with anonymous identity for t=
he
> +# unencrypted use. Real identity is sent only within an encrypted TLS tu=
nnel.
> +network=3D{
> +	ssid=3D"example"
> +	key_mgmt=3DWPA-EAP
> +	eap=3DTTLS
> +	identity=3D"user@example.com"
> +	anonymous_identity=3D"anonymous@example.com"
> +	password=3D"foobar"
> +	ca_cert=3D"/etc/cert/ca.pem"
> +	priority=3D2
> +}
> +
> +# EAP-TTLS/MSCHAPv2 configuration with anonymous identity for the unencr=
ypted
> +# use. Real identity is sent only within an encrypted TLS tunnel.
> +network=3D{
> +	ssid=3D"example"
> +	key_mgmt=3DWPA-EAP
> +	eap=3DTTLS
> +	identity=3D"user@example.com"
> +	anonymous_identity=3D"anonymous@example.com"
> +	password=3D"foobar"
> +	ca_cert=3D"/etc/cert/ca.pem"
> +	phase2=3D"auth=3DMSCHAPV2"
> +}
> +
> +# WPA-EAP, EAP-TTLS with different CA certificate used for outer and inn=
er
> +# authentication.
> +network=3D{
> +	ssid=3D"example"
> +	key_mgmt=3DWPA-EAP
> +	eap=3DTTLS
> +	# Phase1 / outer authentication
> +	anonymous_identity=3D"anonymous@example.com"
> +	ca_cert=3D"/etc/cert/ca.pem"
> +	# Phase 2 / inner authentication
> +	phase2=3D"autheap=3DTLS"
> +	ca_cert2=3D"/etc/cert/ca2.pem"
> +	client_cert2=3D"/etc/cer/user.pem"
> +	private_key2=3D"/etc/cer/user.prv"
> +	private_key2_passwd=3D"password"
> +	priority=3D2
> +}
> +
> +# Both WPA-PSK and WPA-EAP is accepted. Only CCMP is accepted as pairwis=
e and
> +# group cipher.
> +network=3D{
> +	ssid=3D"example"
> +	bssid=3D00:11:22:33:44:55
> +	proto=3DWPA RSN
> +	key_mgmt=3DWPA-PSK WPA-EAP
> +	pairwise=3DCCMP
> +	group=3DCCMP
> +	psk=3D06b4be19da289f475aa46a33cb793029d4ab3db7a23ee92382eb0106c72ac7bb
> +}
> +
> +# Special characters in SSID, so use hex string. Default to WPA-PSK, WPA=
-EAP
> +# and all valid ciphers.
> +network=3D{
> +	ssid=3D00010203
> +	psk=3D000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f
> +}
> +
> +
> +# IEEE 802.1X/EAPOL with dynamically generated WEP keys (i.e., no WPA) u=
sing
> +# EAP-TLS for authentication and key generation; require both unicast an=
d
> +# broadcast WEP keys.
> +network=3D{
> +	ssid=3D"1x-test"
> +	key_mgmt=3DIEEE8021X
> +	eap=3DTLS
> +	identity=3D"user@example.com"
> +	ca_cert=3D"/etc/cert/ca.pem"
> +	client_cert=3D"/etc/cert/user.pem"
> +	private_key=3D"/etc/cert/user.prv"
> +	private_key_passwd=3D"password"
> +	eapol_flags=3D3
> +}
> +
> +
> +# LEAP with dynamic WEP keys
> +network=3D{
> +	ssid=3D"leap-example"
> +	key_mgmt=3DIEEE8021X
> +	eap=3DLEAP
> +	identity=3D"user"
> +	password=3D"foobar"
> +}
> +
> +# Plaintext connection (no WPA, no IEEE 802.1X)
> +network=3D{
> +	ssid=3D"plaintext-test"
> +	key_mgmt=3DNONE
> +}
> +
> +
> +# Shared WEP key connection (no WPA, no IEEE 802.1X)
> +network=3D{
> +	ssid=3D"static-wep-test"
> +	key_mgmt=3DNONE
> +	wep_key0=3D"abcde"
> +	wep_key1=3D0102030405
> +	wep_key2=3D"1234567890123"
> +	wep_tx_keyidx=3D0
> +	priority=3D5
> +}
> +
> +
> +# Shared WEP key connection (no WPA, no IEEE 802.1X) using Shared Key
> +# IEEE 802.11 authentication
> +network=3D{
> +	ssid=3D"static-wep-test2"
> +	key_mgmt=3DNONE
> +	wep_key0=3D"abcde"
> +	wep_key1=3D0102030405
> +	wep_key2=3D"1234567890123"
> +	wep_tx_keyidx=3D0
> +	priority=3D5
> +	auth_alg=3DSHARED
> +}
> +
> +
> +# IBSS/ad-hoc network with WPA-None/TKIP.
> +network=3D{
> +	ssid=3D"test adhoc"
> +	mode=3D1
> +	proto=3DWPA
> +	key_mgmt=3DWPA-NONE
> +	pairwise=3DNONE
> +	group=3DTKIP
> +	psk=3D"secret passphrase"
> +}
> +
> +
> +# Catch all example that allows more or less all configuration modes
> +network=3D{
> +	ssid=3D"example"
> +	scan_ssid=3D1
> +	key_mgmt=3DWPA-EAP WPA-PSK IEEE8021X NONE
> +	pairwise=3DCCMP TKIP
> +	group=3DCCMP TKIP WEP104 WEP40
> +	psk=3D"very secret passphrase"
> +	eap=3DTTLS PEAP TLS
> +	identity=3D"user@example.com"
> +	password=3D"foobar"
> +	ca_cert=3D"/etc/cert/ca.pem"
> +	client_cert=3D"/etc/cert/user.pem"
> +	private_key=3D"/etc/cert/user.prv"
> +	private_key_passwd=3D"password"
> +	phase1=3D"peaplabel=3D0"
> +}
> +
> +# Example of EAP-TLS with smartcard (openssl engine)
> +network=3D{
> +	ssid=3D"example"
> +	key_mgmt=3DWPA-EAP
> +	eap=3DTLS
> +	proto=3DRSN
> +	pairwise=3DCCMP TKIP
> +	group=3DCCMP TKIP
> +	identity=3D"user@example.com"
> +	ca_cert=3D"/etc/cert/ca.pem"
> +	client_cert=3D"/etc/cert/user.pem"
> +
> +	engine=3D1
> +
> +	# The engine configured here must be available. Look at
> +	# OpenSSL engine support in the global section.
> +	# The key available through the engine must be the private key
> +	# matching the client certificate configured above.
> +
> +	# use the opensc engine
> +	#engine_id=3D"opensc"
> +	#key_id=3D"45"
> +
> +	# use the pkcs11 engine
> +	engine_id=3D"pkcs11"
> +	key_id=3D"id_45"
> +
> +	# Optional PIN configuration; this can be left out and PIN will be
> +	# asked through the control interface
> +	pin=3D"1234"
> +}
> +
> +# Example configuration showing how to use an inlined blob as a CA certi=
ficate
> +# data instead of using external file
> +network=3D{
> +	ssid=3D"example"
> +	key_mgmt=3DWPA-EAP
> +	eap=3DTTLS
> +	identity=3D"user@example.com"
> +	anonymous_identity=3D"anonymous@example.com"
> +	password=3D"foobar"
> +	ca_cert=3D"blob://exampleblob"
> +	priority=3D20
> +}
> +
> +blob-base64-exampleblob=3D{
> +SGVsbG8gV29ybGQhCg=3D=3D
> +}
> +
> +
> +# Wildcard match for SSID (plaintext APs only). This example select any
> +# open AP regardless of its SSID.
> +network=3D{
> +	key_mgmt=3DNONE
> +}
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant/wpa_supplicant.conf-sane b/meta-arago-distro/recipes-connectivity/=
wpa-supplicant/wpa-supplicant/wpa_supplicant.conf-sane
> new file mode 100644
> index 0000000..c91ffe0
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplican=
t/wpa_supplicant.conf-sane
> @@ -0,0 +1,7 @@
> +ctrl_interface=3D/var/run/wpa_supplicant
> +ctrl_interface_group=3D0
> +update_config=3D1
> +
> +network=3D{
> +        key_mgmt=3DNONE
> +}
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant_git.bb b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa=
-supplicant_git.bb
> new file mode 100644
> index 0000000..e810a9b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplican=
t_git.bb
> @@ -0,0 +1,5 @@
> +require wpa-supplicant-0.7.inc
> +
> +SRCREV =3D "ol_R5.00.18"
> +PR =3D "r0-arago0+gitr${SRCPV}"
> +PV =3D "0.7.3+0.8.0-rc"
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20

