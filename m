Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A5F1652976
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 14:44:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83Ei32W027466
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:44:03 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83Ei1R7019014
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:44:03 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 3 Sep 2014 09:44:02 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [for dora] [PATCH v2 04/12]
	wpa-supplicant-wl18xx:	Update recipe to ol_r8.a9.14 version.
Thread-Index: AQHPx3R4bIQwPMhPCUeUiBcjwW0ZupvvfBbw
Date: Wed, 3 Sep 2014 14:44:01 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C727016@DFLE08.ent.ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
	<1409748091-12617-5-git-send-email-a0393906@ti.com>
In-Reply-To: <1409748091-12617-5-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [for dora] [PATCH v2 04/12] wpa-supplicant-wl18xx:	Update recipe to ol_r8.a9.14 version.
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
X-List-Received-Date: Wed, 03 Sep 2014 14:44:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Wednesday, September 03, 2014 7:41 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [for dora] [PATCH v2 04/12] wpa-supplicant-wl18xx:
> Update recipe to ol_r8.a9.14 version.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Changed git sources to git.ti.com
>         - Adjust configuration to match latest package.
>         - Removed redundant files and cleanup.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Tested-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  ....a8.10.bb =3D> wpa-supplicant-wl18xx_r8.a9.14.bb} | 10 +--
>  .../wpa-supplicant/wpa-supplicant.inc              | 91 ++++++++--------=
------
>  .../wpa-supplicant/wpa-supplicant/defaults-sane    |  8 --
>  .../defconfig                                      | 69 ++++++++++++----
>  .../fi.epitest.hostap.WPASupplicant.service        |  4 -
>  .../wpa-supplicant/fi.w1.wpa_supplicant1.service   |  4 -
>  6 files changed, 90 insertions(+), 96 deletions(-)  rename meta-arago-
> extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-
> wl18xx_r8.a8.10.bb =3D> wpa-supplicant-wl18xx_r8.a9.14.bb} (76%)  delete
> mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/defaults-sane
>  rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-
> supplicant-wl18xx =3D> wpa-supplicant}/defconfig (90%)  delete mode 10064=
4
> meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/fi.epitest.hostap.WPASupplicant.service
>  delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-
> connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb
> similarity index 76%
> rename from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a8.10.bb
> rename to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a9.14.bb
> index bfe617e..203364f 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a8.10.bb
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt-wl18xx_r8.a9.14.bb
> @@ -5,15 +5,15 @@ require wpa-supplicant.inc
>=20
>  LICENSE =3D "GPLv2 | BSD"
>  LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e \
> -                    file://../README;md5=3D5cb758942d25f6f61fd4ac388fd44=
6fa \
> +
> + file://../README;md5=3Dba46b65db36e3c82244a3815b3738d63 \
>=20
> file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=3D8835156c8ab8cad6=
356
> ec7f39ebe3aba"
>=20
>  FILESEXTRAPATHS_append :=3D "${THISDIR}/wpa-supplicant:"
>=20
> -# Tag: ol_r8.a8.10
> -SRCREV =3D "257ab333aad993b4be81808524bc0d939c276058"
> -BRANCH =3D "mbss_suspend"
> -PR_append =3D "b+gitr${SRCPV}"
> +# Tag: ol_r8.a9.14
> +SRCREV =3D "281f5adb8eb7ee9e9220546c0227696b02aab332"
> +BRANCH =3D "single_hostap_dfs_dynamic"
> +PR_append =3D "c+gitr${SRCPV}"
>=20
>  # Add ti to the PV to indicate that this is a TI modify version of wpa-
> supplicant.
>  PV =3D "2.0-devel-ti"
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant.inc
> index e0bda11..c8611ea 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant.inc
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt.inc
> @@ -1,47 +1,47 @@
>  # This is a TI specific version of the wpa-supplicant recipe for use wit=
h the -#
> wl12xx wlan and bluetooth module.
> +# wl18xx wlan.
>=20
> -DESCRIPTION =3D "A Client for Wi-Fi Protected Access (WPA)."
> +SUMMARY =3D "Client for Wi-Fi Protected Access (WPA)"
>  HOMEPAGE =3D "http://hostap.epitest.fi/wpa_supplicant/"
>  BUGTRACKER =3D "http://hostap.epitest.fi/bugz/"
>  SECTION =3D "network"
>  LICENSE =3D "GPLv2 | BSD"
>=20
> -DEPENDS =3D "gnutls dbus libnl openssl
> ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng",
> "",d)}"
> +DEPENDS =3D "gnutls dbus libnl openssl libgcrypt"
>  RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase wpa-supplicant-cli"
>=20
>  # To prevent users from accidently picking up this customized version of=
  #
> wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
>  DEFAULT_PREFERENCE =3D "-1"
>=20
> -PR =3D "r6"
> +PR =3D "r7"
>=20
> -SRC_URI =3D "git://github.com/TI-
> OpenLink/hostap.git;protocol=3Dgit;branch=3D${BRANCH} \
> +SRC_URI =3D
> +"git://git.ti.com/wilink8-wlan/hostap.git;protocol=3Dgit;branch=3D${BRAN=
CH}
> +\
>             file://defconfig \
> -           file://defaults-sane \
>             file://wpa-supplicant.sh \
>             file://wpa_supplicant.conf \
>             file://p2p_supplicant.conf \
> -           file://wpa_supplicant.conf-sane \
>             file://99_wpa_supplicant \
> -           file://wpa_supplicant.conf \
> -           file://fi.epitest.hostap.WPASupplicant.service \
> -           file://fi.w1.wpa_supplicant1.service \
>            "
>=20
>  S =3D "${WORKDIR}/git/wpa_supplicant"
>=20
>  PACKAGES_prepend =3D "wpa-supplicant-passphrase wpa-supplicant-cli "
> -FILES_wpa-supplicant-passphrase =3D "/usr/sbin/wpa_passphrase"
> -FILES_wpa-supplicant-cli =3D "/usr/sbin/wpa_cli"
> -FILES_${PN} +=3D " /usr/share/dbus-1/system-services/*"
> +FILES_wpa-supplicant-passphrase =3D "${sbindir}/wpa_passphrase"
> +FILES_wpa-supplicant-cli =3D "${sbindir}/wpa_cli"
> +FILES_${PN} +=3D "${datadir}/dbus-1/system-services/*"
>=20
> -#we introduce MY_ARCH to get 'armv5te' as arch instead of the misleading
> 'arm' on armv5te builds -MY_ARCH :=3D "${PACKAGE_ARCH}"
> -PACKAGE_ARCH =3D "${@base_contains('COMBINED_FEATURES', 'madwifi',
> '${MACHINE_ARCH}', '${MY_ARCH}', d)}"
> +do_configure () {
> +	install -m 0755 ${WORKDIR}/defconfig .config
> +	echo "CFLAGS +=3D\"-I${STAGING_INCDIR}/libnl3\"" >> .config }
>=20
> +export EXTRA_CFLAGS =3D "${CFLAGS}"
> +export BINDIR =3D "${sbindir}"
>  do_compile () {
> -	make
> +	unset CFLAGS CPPFLAGS CXXFLAGS
> +	sed -e "s:CFLAGS\ =3D.*:& \$(EXTRA_CFLAGS):g" -i ${S}/src/lib.rules
> +	oe_runmake
>  }
>=20
>  do_install () {
> @@ -54,63 +54,36 @@ do_install () {
>  	install -m 644 README ${WORKDIR}/wpa_supplicant.conf
> ${D}${docdir}/wpa_supplicant
>=20
>  	install -d ${D}${sysconfdir}/default
> -	install -m 600 ${WORKDIR}/defaults-sane
> ${D}${sysconfdir}/default/wpa
> -	install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane
> ${D}${sysconfdir}/wpa_supplicant.conf
> +	install -m 600 ${WORKDIR}/wpa_supplicant.conf
> +${D}${sysconfdir}/wpa_supplicant.conf
>  	install -m 600 ${WORKDIR}/p2p_supplicant.conf
> ${D}${sysconfdir}/p2p_supplicant.conf
>=20
> -	if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy .config || grep -q
> ^CONFIG_CTRL_IFACE_DBUS_NEW=3Dy .config; then
> -		install -d ${D}/${sysconfdir}/dbus-1/system.d
> -		install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf
> ${D}/${sysconfdir}/dbus-1/system.d
> -		install -d ${D}/${datadir}/dbus-1/system-services
> -		if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy .config; then
> -			sed -i -e s:/sbin:${sbindir}:g
> ${S}/dbus/fi.epitest.hostap.WPASupplicant.service
> -			install -m 644
> ${S}/dbus/fi.epitest.hostap.WPASupplicant.service ${D}/${datadir}/dbus-
> 1/system-services
> -		fi
> -		if grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=3Dy .config; then
> -			sed -i -e s:/sbin:${sbindir}:g
> ${S}/dbus/fi.w1.wpa_supplicant1.service
> -			install -m 644
> ${S}/dbus/fi.w1.wpa_supplicant1.service ${D}/${datadir}/dbus-1/system-
> services
> -		fi
> -	fi
> -
>  	install -d ${D}${sysconfdir}/network/if-pre-up.d/
>  	install -d ${D}${sysconfdir}/network/if-post-down.d/
>  	install -d ${D}${sysconfdir}/network/if-down.d/
> -	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}
>  	install -m 755 ${WORKDIR}/wpa-supplicant.sh
> ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
>  	cd ${D}${sysconfdir}/network/ && \
>  	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
>=20
> +	install -d ${D}/${sysconfdir}/dbus-1/system.d
> +	install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf
> ${D}/${sysconfdir}/dbus-1/system.d
> +	install -d ${D}/${datadir}/dbus-1/system-services
> +	install -m 644 ${S}/dbus/*.service
> +${D}/${datadir}/dbus-1/system-services
> +
> +	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
> then
> +		install -d ${D}/${systemd_unitdir}/system
> +		install -m 644 ${S}/systemd/*.service
> ${D}/${systemd_unitdir}/system
> +	fi
> +
>  	install -d ${D}/etc/default/volatiles
>  	install -m 0644 ${WORKDIR}/99_wpa_supplicant
> ${D}/etc/default/volatiles
> -
> -	install -d 2755 ${D}/usr/share/dbus-1/system-services
> -	install -d 2755 ${D}/etc
> -	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}/etc
> -	install -m 644 ${WORKDIR}/fi.epitest.hostap.WPASupplicant.service
> ${D}/usr/share/dbus-1/system-services
> -	install -m 644 ${WORKDIR}/fi.w1.wpa_supplicant1.service
> ${D}/usr/share/dbus-1/system-services
>  }
>=20
>  pkg_postinst_wpa-supplicant () {
> -	# can't do this offline
> -	if [ "x$D" !=3D "x" ]; then
> -		exit 1
> +	# If we're offline, we don't need to do this.
> +	if [ "x$D" =3D "x" ]; then
> +		killall -q -HUP dbus-daemon || true
>  	fi
> +}
>=20
> -	DBUSPID=3D`pidof dbus-daemon`
>=20
> -	if [ "x$DBUSPID" !=3D "x" ]; then
> -		/etc/init.d/dbus-1 reload
> -	fi
> -}
>=20
> -do_configure () {
> -	install -m 0755 ${WORKDIR}/defconfig .config
> -	echo "CFLAGS +=3D -I${STAGING_INCDIR}" >> .config
> -	echo "CFLAGS +=3D -I${STAGING_INCDIR}/libnl3/" >> .config
> -	echo "LIBS +=3D -L${STAGING_LIBDIR}" >> .config
> -	echo "LIBS_p +=3D -L${STAGING_LIBDIR}" >> .config
> -	if [ "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0, d)}"
> =3D "1" ]; then
> -		echo "CONFIG_DRIVER_MADWIFI=3Dy" >> .config
> -		echo "CFLAGS +=3D -I${STAGING_INCDIR}/madwifi-ng" >>
> .config
> -	fi
> -}
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/defaults-sane b/meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant/defaults-sane
> deleted file mode 100644
> index 67c4cbd..0000000
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx/defconfig b/meta-arago-extras/recipes-
> connectivity/wpa-supplicant/wpa-supplicant/defconfig
> similarity index 90%
> rename from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx/defconfig
> rename to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/defconfig
> index f357b79..fcbe06d 100755
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx/defconfig
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplica
> +++ nt/defconfig
> @@ -176,7 +176,7 @@ CONFIG_EAP_PWD=3Dy
>  CONFIG_EAP_LEAP=3Dy
>=20
>  # EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used) -#CONFIG_EAP_AKA=3Dy
> +CONFIG_EAP_AKA=3Dy
>=20
>  # EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
>  # This requires CONFIG_EAP_AKA to be enabled, too.
> @@ -201,10 +201,12 @@ CONFIG_WPS=3Dy
>  # Enable WSC 2.0 support
>  CONFIG_WPS2=3Dy
>  # Enable WPS external registrar functionality -#CONFIG_WPS_ER=3Dy
> +CONFIG_WPS_ER=3Dy
>  # Disable credentials for an open network by default when acting as a WP=
S
> # registrar.
>  #CONFIG_WPS_REG_DISABLE_OPEN=3Dy
> +# Enable WPS support with NFC config method #CONFIG_WPS_NFC=3Dy
>=20
>  # EAP-IKEv2
>  #CONFIG_EAP_IKEV2=3Dy
> @@ -224,6 +226,9 @@ CONFIG_SMARTCARD=3Dy
>  # Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
> #CONFIG_HT_OVERRIDES=3Dy
>=20
> +# Support VHT overrides (disable VHT, mask MCS rates, etc.)
> +#CONFIG_VHT_OVERRIDES=3Dy
> +
>  # Development testing
>  #CONFIG_EAPOL_TEST=3Dy
>=20
> @@ -231,6 +236,7 @@ CONFIG_SMARTCARD=3Dy
>  # unix =3D UNIX domain sockets (default for Linux/*BSD)  # udp =3D UDP s=
ockets
> using localhost (127.0.0.1)  # named_pipe =3D Windows Named Pipe (default
> for Windows)
> +# udp-remote =3D UDP sockets with remote access (only for tests
> +systems/purpose)
>  # y =3D use default (backwards compatibility)  # If this option is comme=
nted
> out, control interface is not included in the  # build.
> @@ -256,11 +262,6 @@ CONFIG_WPA_CLI_EDIT=3Dy  # 35-50 kB in code size.
>  #CONFIG_NO_WPA=3Dy
>=20
> -# Remove WPA2 support. This allows WPA to be used, but removes WPA2
> code to -# save about 1 kB in code size when building only WPA-Personal (=
no
> EAP support) -# or 6 kB if building for WPA-Enterprise.
> -#CONFIG_NO_WPA2=3Dy
> -
>  # Remove IEEE 802.11i/WPA-Personal ASCII passphrase support  # This
> option can be used to reduce code size by removing support for  # convert=
ing
> ASCII passphrases into PSK. If this functionality is removed, the @@ -304=
,7
> +305,6 @@ CONFIG_OS=3Dunix  # Select event loop implementation  # eloop =
=3D
> select() loop (default)  # eloop_win =3D Windows events and
> WaitForMultipleObject() loop -# eloop_none =3D Empty template
> CONFIG_ELOOP=3Deloop
>=20
>  # Should we use poll instead of select? Select is used by default.
> @@ -322,11 +322,9 @@ CONFIG_L2_PACKET=3Dlinux  # PeerKey handshake
> for Station to Station Link (IEEE 802.11e DLS)  CONFIG_PEERKEY=3Dy
>=20
> -# IEEE 802.11w (management frame protection) -# This version is an
> experimental implementation based on IEEE 802.11w/D1.0 -# draft and is
> subject to change since the standard has not yet been finalized.
> +# IEEE 802.11w (management frame protection), also known as PMF
>  # Driver support is also needed for IEEE 802.11w.
> -#CONFIG_IEEE80211W=3Dy
> +CONFIG_IEEE80211W=3Dy
>=20
>  # Select TLS implementation
>  # openssl =3D OpenSSL (default)
> @@ -404,7 +402,7 @@ CONFIG_PEERKEY=3Dy
>  #CONFIG_DYNAMIC_EAP_METHODS=3Dy
>=20
>  # IEEE Std 802.11r-2008 (Fast BSS Transition) -#CONFIG_IEEE80211R=3Dy
> +CONFIG_IEEE80211R=3Dy
>=20
>  # Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#=
.txt)
> #CONFIG_DEBUG_FILE=3Dy @@ -483,6 +481,10 @@
> CONFIG_ANDROID_LOG=3Dy  # IEEE 802.11n (High Throughput) support
> (mainly for AP mode)  CONFIG_IEEE80211N=3Dy
>=20
> +# Wireless Network Management (IEEE Std 802.11v-2011) # Note: This is
> +experimental and not complete implementation.
> +CONFIG_WNM=3Dy
> +
>  # Interworking (IEEE 802.11u)
>  # This can be used to enable functionality to improve interworking with =
 #
> external networks (GAS/ANQP to learn more about the networks and
> network @@ -495,12 +497,47 @@ CONFIG_HS20=3Dy  # Disable roaming in
> wpa_supplicant  #CONFIG_NO_ROAMING=3Dy
>=20
> -# Enable P2P
> -CONFIG_P2P=3Dy
> +# AP mode operations with wpa_supplicant # This can be used for
> +controlling AP mode operations with wpa_supplicant. It # should be
> +noted that this is mainly aimed at simple cases like # WPA2-Personal
> +while more complex configurations like WPA2-Enterprise with an #
> +external RADIUS server can be supported with hostapd.
>  CONFIG_AP=3Dy
>=20
> +# P2P (Wi-Fi Direct)
> +# This can be used to enable P2P support in wpa_supplicant. See
> +README-P2P for # more information on P2P operations.
> +CONFIG_P2P=3Dy
> +
> +# Enable TDLS support
> +CONFIG_TDLS=3Dy
> +
> +# Wi-Fi Direct
> +# This can be used to enable Wi-Fi Direct extensions for P2P using an
> +external # program to control the additional information exchanges in th=
e
> messages.
> +CONFIG_WIFI_DISPLAY=3Dy
> +
> +# Autoscan
> +# This can be used to enable automatic scan support in wpa_supplicant.
> +# See wpa_supplicant.conf for more information on autoscan usage.
> +#
> +# Enabling directly a module will enable autoscan support.
> +# For exponential module:
> +#CONFIG_AUTOSCAN_EXPONENTIAL=3Dy
> +# For periodic module:
> +#CONFIG_AUTOSCAN_PERIODIC=3Dy
> +
> +# Password (and passphrase, etc.) backend for external storage # These
> +optional mechanisms can be used to add support for storing passwords #
> +and other secrets in external (to wpa_supplicant) location. This
> +allows, for # example, operating system specific key storage to be used
> +# # External password backend for testing purposes (developer use)
> +#CONFIG_EXT_PASSWORD_TEST=3Dy
> +
> +include $(wildcard $(LOCAL_PATH)/android_config_*.inc)
> +
>  # bgscan
>  NEED_BGSCAN=3Dy
>  CONFIG_BGSCAN_LEARN=3Dy
>  CONFIG_BGSCAN_SIMPLE=3Dy
> -
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/fi.epitest.hostap.WPASupplicant.service b/meta-arago-
> extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/fi.epitest.hostap.WPASupplicant.service
> deleted file mode 100644
> index fb3f917..0000000
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/fi.w1.wpa_supplicant1.service b/meta-arago-extras/recipes-
> connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
> deleted file mode 100644
> index 0bb1056..0000000
> --
> 2.0.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

