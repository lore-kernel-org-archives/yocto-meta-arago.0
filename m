Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82A5F47CDB
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 21:14:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55156.1772745282833150304
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 13:14:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 38EC140C7B;
	Thu,  5 Mar 2026 21:14:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSww0y6Jmtcf; Thu,  5 Mar 2026 21:14:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DA54140A2F;
	Thu,  5 Mar 2026 21:14:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8A6281798C4; Thu,  5 Mar 2026 16:14:38 -0500 (EST)
Date: Thu, 5 Mar 2026 16:14:38 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: denys@konsulko.com, reatmon@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] emptty: add version 0.15.0
Message-ID: <20260305211438.GN11121@denix.org>
References: <20260305205455.267385-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305205455.267385-1-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 21:14:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17271

How is it different from Randolph's continued efforts to push it to OE-Core 
for many months?


On Thu, Mar 05, 2026 at 02:54:55PM -0600, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
> relatively lightweight display manager that supports x11 as well as
> wayland through both a CLI and an automatic login mechanism.
> 
> This can effectively replace the custom init scripts for both x11
> (xserver-nodm-init) and wayland (weston-init) with a single tool with
> more verbose logging capabilities.
> 
> This is split into two recipes. The emptty package provides the binary
> and various agnostic configs while the emptty-conf package provides the
> default configuration for the application itself. This RPROVIDES
> virtual-emptty-conf, allowing other recipes to provide their own
> configurations to override the default behavior.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  0001-emptty-add-version-0.15.0.patch          | 522 ++++++++++++++++++
>  .../classes/tisdk-bundle.bbclass              |  14 +-
>  meta-arago-distro/conf/distro/arago.conf      |   2 +
>  .../recipes-graphics/emptty/emptty-conf.bb    |  14 +
>  .../recipes-graphics/emptty/emptty.inc        |  27 +
>  .../recipes-graphics/emptty/emptty/pamconf    |  11 +
>  .../recipes-graphics/emptty/emptty_0.15.0.bb  |  57 ++
>  .../wayland/weston-init-arago.bb              |  72 +++
>  .../weston-init-arago/beaglebone/weston.ini   |  85 +++
>  .../wayland/weston-init-arago/emptty.conf     |  77 +++
>  .../weston-launch-calibrator.sh               |  13 +
>  .../wayland/weston-init-arago/weston.ini      |  21 +
>  12 files changed, 914 insertions(+), 1 deletion(-)
>  create mode 100644 0001-emptty-add-version-0.15.0.patch
>  create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
>  create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty.inc
>  create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
>  create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
> 
> diff --git a/0001-emptty-add-version-0.15.0.patch b/0001-emptty-add-version-0.15.0.patch
> new file mode 100644
> index 00000000..dba3013d
> --- /dev/null
> +++ b/0001-emptty-add-version-0.15.0.patch
> @@ -0,0 +1,522 @@
> +From d41ec048882b955124d7dbeee1c2bf1351a0aba4 Mon Sep 17 00:00:00 2001
> +From: Antonios Christidis <a-christidis@ti.com>
> +Date: Thu, 5 Mar 2026 13:12:08 -0600
> +Subject: [PATCH] emptty: add version 0.15.0
> +
> +Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
> +relatively lightweight display manager that supports x11 as well as
> +wayland through both a CLI and an automatic login mechanism.
> +
> +This can effectively replace the custom init scripts for both x11
> +(xserver-nodm-init) and wayland (weston-init) with a single tool with
> +more verbose logging capabilities.
> +
> +This is split into two recipes. The emptty package provides the binary
> +and various agnostic configs while the emptty-conf package provides the
> +default configuration for the application itself. This RPROVIDES
> +virtual-emptty-conf, allowing other recipes to provide their own
> +configurations to override the default behavior.
> +
> +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> +---
> + .../classes/tisdk-bundle.bbclass              | 14 ++-
> + meta-arago-distro/conf/distro/arago.conf      |  2 +
> + .../recipes-graphics/emptty/emptty-conf.bb    | 14 +++
> + .../recipes-graphics/emptty/emptty.inc        | 27 ++++++
> + .../recipes-graphics/emptty/emptty/pamconf    | 11 +++
> + .../recipes-graphics/emptty/emptty_0.15.0.bb  | 57 +++++++++++++
> + .../wayland/weston-init-arago.bb              | 72 ++++++++++++++++
> + .../weston-init-arago/beaglebone/weston.ini   | 85 +++++++++++++++++++
> + .../wayland/weston-init-arago/emptty.conf     | 77 +++++++++++++++++
> + .../weston-launch-calibrator.sh               | 13 +++
> + .../wayland/weston-init-arago/weston.ini      | 21 +++++
> + 11 files changed, 392 insertions(+), 1 deletion(-)
> + create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
> + create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty.inc
> + create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
> + create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
> + create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
> + create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
> + create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
> + create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
> + create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
> +
> +diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
> +index cc5d1481..24146529 100644
> +--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
> ++++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
> +@@ -106,7 +106,7 @@ cleanup_host_packages() {
> + }
> + 
> + ROOTFS_PREPROCESS_COMMAND += "tisdk_image_setup; "
> +-ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build; "
> ++ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build; add_emptty_inittab; "
> + IMAGE_PREPROCESS_COMMAND:append = "tisdk_image_cleanup; "
> + 
> + # Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs functionality
> +@@ -304,6 +304,18 @@ tisdk_image_build () {
> +     cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
> + }
> + 
> ++
> ++add_emptty_inittab() {
> ++    [ -f ${IMAGE_ROOTFS}${sysconfdir}/inittab ] || return 0
> ++
> ++    if ${@bb.utils.contains_any("IMAGE_FEATURES", [ "x11-base", "weston" ], "true", "false", d)}
> ++    then
> ++	echo "7:5:respawn:${bindir}/emptty -t 7 -d" >> ${IMAGE_ROOTFS}${sysconfdir}/inittab
> ++    fi
> ++}
> ++
> ++
> ++
> + TISDK_IMAGE_CLEANUP_DIRS ?= "var etc lib boot dev home media mnt proc run sbin sys tmp usr"
> + TISDK_IMAGE_CLEANUP_FILES ?= "bin/bash bin/bash.bash bin/sh"
> + 
> +diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> +index fb5c703f..43d4db53 100644
> +--- a/meta-arago-distro/conf/distro/arago.conf
> ++++ b/meta-arago-distro/conf/distro/arago.conf
> +@@ -68,6 +68,8 @@ PACKAGECONFIG:pn-glmark2 = "drm-gles2 wayland-gles2"
> + 
> + # Set this to empty string to prevent xwayland config from being added
> + PACKAGECONFIG:pn-weston-init = ""
> ++PREFERRED_RPROVIDER_virtual-emptty-conf = "weston-init-arago"
> ++PREFERRED_RPROVIDER_weston-init = "weston-init-arago"
> + 
> + # Enable testing for opencl and vulkan with piglit
> + PACKAGECONFIG:append:pn-piglit = " \
> +diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
> +new file mode 100644
> +index 00000000..0b98e2e1
> +--- /dev/null
> ++++ b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
> +@@ -0,0 +1,14 @@
> ++require emptty.inc
> ++
> ++SUMMARY += " (Default config)"
> ++
> ++do_configure[noexec] = "1"
> ++do_compile[noexec] = "1"
> ++
> ++do_install () {
> ++    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-config
> ++}
> ++
> ++FILES:${PN} = "${sysconfdir}/emptty/conf"
> ++CONFFILES:${PN} = "${sysconfdir}/emptty/conf"
> ++RPROVIDES:${PN} += "virtual-emptty-conf"
> +diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty.inc b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
> +new file mode 100644
> +index 00000000..d99c4d8c
> +--- /dev/null
> ++++ b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
> +@@ -0,0 +1,27 @@
> ++SUMMARY = "Dead simple CLI Display Manager on TTY"
> ++DESCRIPTION = "Emptty is a simple display manager with a command line greeter \
> ++It supports both X11 and Wayland sessions, exporting required variables and \
> ++creating user paths as necessary."
> ++
> ++HOMEPAGE = "https://github.com/tvrzna/emptty"
> ++BUGTRACKER = "https://github.com/tvrzna/emptty/issues"
> ++LICENSE = "MIT"
> ++LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=d1e4d12c7d1d17367ba5668706a405ba"
> ++
> ++S = "${UNPACKDIR}"
> ++
> ++FILESEXTRAPATHS:append = ":${THISDIR}/emptty"
> ++
> ++GO_IMPORT = "github.com/tvrzna/emptty"
> ++GO_IMPORT_pam = "github.com/msteinert/pam"
> ++SRC_URI = "\
> ++    git://${GO_IMPORT}.git;protocol=https;branch=master;destsuffix=src/${GO_IMPORT} \
> ++    git://${GO_IMPORT_pam}.git;protocol=https;branch=master;name=pam;destsuffix=src/${GO_IMPORT_pam} \
> ++    file://pamconf \
> ++    "
> ++SRCREV = "bb203ad0a224731a7a2ff50deeb342ab79c4af09"
> ++SRCREV_pam = "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
> ++
> ++SRCREV_FORMAT .= "_pam"
> ++
> ++PR = "r1"
> +diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf b/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
> +new file mode 100644
> +index 00000000..5c82d46b
> +--- /dev/null
> ++++ b/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
> +@@ -0,0 +1,11 @@
> ++#%PAM-1.0
> ++auth            sufficient      pam_succeed_if.so user ingroup nopasswdlogin
> ++auth            include         common-auth
> ++-auth           optional        pam_gnome_keyring.so
> ++-auth           optional        pam_kwallet5.so
> ++account         include         common-account
> ++session         include         common-session
> ++-session        optional        pam_gnome_keyring.so auto_start
> ++-session        optional        pam_kwallet5.so auto_start force_run
> ++password        include         common-password
> ++
> +diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb b/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
> +new file mode 100644
> +index 00000000..415c5ea5
> +--- /dev/null
> ++++ b/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
> +@@ -0,0 +1,57 @@
> ++require emptty.inc
> ++
> ++PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
> ++PACKAGECONFIG[pam] = ",,libpam,pam-plugin-succeed-if"
> ++PACKAGECONFIG[x11] = ",,virtual/libx11,util-linux-mcookie"
> ++
> ++DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'virtual/crypt', d)}"
> ++
> ++GO_TAGS = ""
> ++GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
> ++GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
> ++
> ++GOBUILDFLAGS:append = " -tags=${GO_TAGS}"
> ++
> ++export GO111MODULE = "off"
> ++
> ++inherit go
> ++
> ++DEPENDS += "gzip"
> ++
> ++do_install () {
> ++    # general collateral
> ++    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
> ++    install -d ${D}${mandir}/man1
> ++    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/emptty.1.gz
> ++
> ++    # pam config
> ++    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
> ++    then
> ++        install -Dm644 ${S}/pamconf ${D}${sysconfdir}/pam.d/emptty
> ++    fi
> ++
> ++    # systemd init service
> ++    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
> ++    then
> ++        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-systemd
> ++    fi
> ++}
> ++
> ++FILES:${PN} = "\
> ++    ${systemd_system_unitdir}/emptty.service \
> ++    ${bindir}/emptty \
> ++    ${mandir}/man1/emptty.1.gz \
> ++    ${sysconfdir}/pam.d/emptty \
> ++"
> ++
> ++RDEPENDS:${PN} += "virtual-emptty-conf"
> ++SYSTEMD_SERVICE:${PN} = "emptty.service"
> ++
> ++inherit systemd
> ++
> ++USERADD_PACKAGES = "${PN}"
> ++GROUPADD_PARAM:${PN} = "-r nopasswdlogin"
> ++
> ++inherit useradd
> ++
> ++
> +diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
> +new file mode 100644
> +index 00000000..484d25e1
> +--- /dev/null
> ++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
> +@@ -0,0 +1,72 @@
> ++SUMMARY = "Configuration files for the Weston Wayland compositor"
> ++LICENSE = "MIT"
> ++LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> ++
> ++PACKAGE_ARCH = "${MACHINE_ARCH}"
> ++
> ++SRC_URI:append = " \
> ++    file://weston.ini \
> ++    file://weston-launch-calibrator.sh \
> ++    file://emptty.conf \
> ++"
> ++
> ++S = "${UNPACKDIR}"
> ++
> ++PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)}"
> ++PACKAGECONFIG:append:qemuriscv64 = " use-pixman"
> ++PACKAGECONFIG:append:qemuppc64 = " use-pixman"
> ++
> ++PACKAGECONFIG[xwayland] = ",,"
> ++PACKAGECONFIG[no-idle-timeout] = ",,"
> ++PACKAGECONFIG[use-pixman] = ",,"
> ++
> ++DEFAULTBACKEND ??= ""
> ++DEFAULTBACKEND:qemuall ?= "drm"
> ++
> ++do_install() {
> ++	install -D -p -m0644 weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
> ++	install -D -p -m0644 emptty.conf ${D}${sysconfdir}/emptty/conf
> ++
> ++	if [ -n "${DEFAULTBACKEND}" ]; then
> ++		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
> ++	fi
> ++
> ++	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
> ++		sed -i -e "/^\[core\]/a xwayland=true" ${D}${sysconfdir}/xdg/weston/weston.ini
> ++	fi
> ++
> ++	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
> ++		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
> ++	fi
> ++
> ++	if [ "${@bb.utils.contains('PACKAGECONFIG', 'use-pixman', 'yes', 'no', d)}" = "yes" ]; then
> ++		sed -i -e "/^\[core\]/a use-pixman=true" ${D}${sysconfdir}/xdg/weston/weston.ini
> ++	fi
> ++
> ++	install -dm 755 -o weston -g weston ${D}/home/weston
> ++	install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
> ++}
> ++
> ++inherit useradd
> ++
> ++USERADD_PACKAGES = "${PN}"
> ++
> ++# rdepends on weston which depends on virtual/egl
> ++#
> ++require ${COREBASE}/meta/recipes-graphics/wayland/required-distro-features.inc
> ++
> ++RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)} emptty"
> ++
> ++FILES:${PN} += "\
> ++    ${sysconfdir}/xdg/weston/weston.ini \
> ++    ${sysconfdir}/emptty/conf \
> ++    /home/weston \
> ++    ${bindir}/weston-launch-calibrator \
> ++    "
> ++
> ++CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/emptty/conf"
> ++RPROVIDES:${PN}:append = " virtual-emptty-conf weston-init"
> ++RCONFLICTS:${PN} += "weston-init"
> ++
> ++USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,nopasswdlogin weston"
> ++GROUPADD_PARAM:${PN} = "-r wayland; -r render; -r nopasswdlogin"
> +diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
> +new file mode 100644
> +index 00000000..9fd9851d
> +--- /dev/null
> ++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
> +@@ -0,0 +1,85 @@
> ++# configuration file for Weston
> ++
> ++[core]
> ++idle-time=0
> ++#modules=xwayland.so,cms-colord.so
> ++#shell=desktop-shell.so
> ++gbm-format=rgb565
> ++require-input=false
> ++
> ++[shell]
> ++locking=false
> ++animation=zoom
> ++panel-position=top
> ++startup-animation=fade
> ++#background-image=/usr/share/backgrounds/gnome/Aqua.jpg
> ++#background-color=0xff002244
> ++#background-type=tile
> ++#clock-format=minutes
> ++#panel-color=0x90ff0000
> ++#locking=true
> ++#animation=zoom
> ++#startup-animation=fade
> ++#binding-modifier=ctrl
> ++#num-workspaces=6
> ++#cursor-theme=whiteglass
> ++#cursor-size=24
> ++
> ++#lockscreen-icon=/usr/share/icons/gnome/256x256/actions/lock.png
> ++#lockscreen=/usr/share/backgrounds/gnome/Garden.jpg
> ++#homescreen=/usr/share/backgrounds/gnome/Blinds.jpg
> ++#animation=fade
> ++
> ++#[launcher]
> ++#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
> ++#path=/usr/bin/gnome-terminal
> ++
> ++#[launcher]
> ++#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
> ++#path=/usr/bin/weston-terminal
> ++
> ++#[launcher]
> ++#icon=/usr/share/icons/hicolor/24x24/apps/google-chrome.png
> ++#path=/usr/bin/google-chrome
> ++
> ++#[launcher]
> ++#icon=/usr/share/icons/gnome/24x24/apps/arts.png
> ++#path=/build/weston-0lEgCh/weston-1.11.0/weston-flower
> ++
> ++#[input-method]
> ++#path=/usr/libexec/weston-keyboard
> ++
> ++[output]
> ++name=HDMI-A-1
> ++#mode=1680x1050
> ++#transform=90
> ++#icc_profile=/usr/share/color/icc/colord/Bluish.icc
> ++
> ++#[output]
> ++#name=VGA1
> ++#mode=173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
> ++#transform=flipped
> ++
> ++#[output]
> ++#name=X1
> ++#mode=1024x768
> ++#transform=flipped-90
> ++
> ++[libinput]
> ++touchscreen_calibrator=true
> ++#enable_tap=true
> ++
> ++#[touchpad]
> ++#constant_accel_factor = 50
> ++#min_accel_factor = 0.16
> ++#max_accel_factor = 1.0
> ++
> ++[screen-share]
> ++command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
> ++
> ++#[xwayland]
> ++#path=/usr/bin/Xwayland
> ++
> ++[autolaunch]
> ++# launch the calibrator on startup if a touchscreen is detected
> ++path=/usr/bin/weston-launch-calibrator
> +diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
> +new file mode 100644
> +index 00000000..ffe1a3c2
> +--- /dev/null
> ++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
> +@@ -0,0 +1,77 @@
> ++# TTY, where emptty will start.
> ++TTY_NUMBER=7
> ++
> ++# Enables switching to defined TTY number.
> ++SWITCH_TTY=true
> ++
> ++# Enables printing of /etc/issue in daemon mode.
> ++PRINT_ISSUE=true
> ++
> ++# Enables printing of default motd, /etc/emptty/motd or /etc/emptty/motd-gen.sh.
> ++PRINT_MOTD=true
> ++
> ++# Preselected user, if AUTOLOGIN is enabled, this user is logged in.
> ++DEFAULT_USER=weston
> ++
> ++# Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogin group. Possible values are "true" or "false".
> ++AUTOLOGIN=true
> ++
> ++# The default session used, if Autologin is enabled. If session is not found in list of session, it proceeds to manual selection.
> ++AUTOLOGIN_SESSION=Weston
> ++
> ++# If Autologin is enabled and session does not start correctly, the number of retries in short period is kept to eventually stop the infinite loop of restarts. -1 is for infinite retries, 0 is for no retry.
> ++AUTOLOGIN_MAX_RETRY=-1
> ++
> ++# Default LANG, if user does not have set own in init script.
> ++#LANG=en_US.UTF-8
> ++
> ++# Starts desktop with calling "dbus-launch".
> ++DBUS_LAUNCH=true
> ++
> ++# Starts Xorg desktop with calling "~/.xinitrc" script, if is true, file exists and selected WM/DE is Xorg session, it overrides DBUS_LAUNCH.
> ++XINITRC_LAUNCH=false
> ++
> ++# Prints available WM/DE each on new line instead of printing on single line.
> ++VERTICAL_SELECTION=false
> ++
> ++# Defines the way, how is logging handled. Possible values are "rotate", "appending" or "disabled".
> ++#LOGGING=rotate
> ++
> ++# Overrides path of log file
> ++#LOGGING_FILE=/var/log/emptty/[TTY_NUMBER].log
> ++
> ++# Arguments passed to Xorg server.
> ++#XORG_ARGS=
> ++
> ++# Allows to use dynamic motd script to generate custom MOTD.
> ++#DYNAMIC_MOTD=false
> ++
> ++# Allows to override default path to dynamic motd.
> ++#DYNAMIC_MOTD_PATH=/etc/emptty/motd-gen.sh
> ++
> ++# Allows to override default path to static motd.
> ++#MOTD_PATH=/etc/emptty/motd
> ++
> ++# Foreground color, available only in daemon mode.
> ++#FG_COLOR=LIGHT_BLACK
> ++
> ++# Background color, available only in daemon mode.
> ++#BG_COLOR=BLACK
> ++
> ++# Enables numlock in daemon mode. Possible values are "true" or "false".
> ++#ENABLE_NUMLOCK=false
> ++
> ++# Defines the way, how is logging of session errors handled. Possible values are "rotate", "appending" or "disabled".
> ++SESSION_ERROR_LOGGING=rotate
> ++
> ++# Overrides path of session errors log file
> ++#SESSION_ERROR_LOGGING_FILE=/var/log/emptty/session-errors.[TTY_NUMBER].log
> ++
> ++# If set true, it will not use `.emptty-xauth` file, but the standard `~/.Xauthority` file. This allows to handle xauth issues.
> ++#DEFAULT_XAUTHORITY=false
> ++
> ++#If set true, Xorg will be started as rootless, if system allows and emptty is running in daemon mode.
> ++#ROOTLESS_XORG=false
> ++
> ++#If set true, environmental groups are printed to differ Xorg/Wayland/Custom/UserCustom desktops.
> ++IDENTIFY_ENVS=false
> +diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
> +new file mode 100644
> +index 00000000..45863ecd
> +--- /dev/null
> ++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
> +@@ -0,0 +1,13 @@
> ++#!/bin/sh
> ++
> ++if [ -e /dev/input/touchscreen0 ]; then
> ++	echo "Touch screen detected..."
> ++	if [ -n "$LIBINPUT_CALIBRATION_MATRIX" ]; then
> ++		echo "Calibration matrix already present, skipping calibration..."
> ++	else
> ++		echo "Calibrating touchscreen..."
> ++		exec weston-calibrator
> ++	fi
> ++else
> ++	echo "Touch screen not detected, skipping calibration..."
> ++fi
> +diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
> +new file mode 100644
> +index 00000000..1bc7a010
> +--- /dev/null
> ++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
> +@@ -0,0 +1,21 @@
> ++[core]
> ++idle-time=0
> ++require-input=false
> ++require-outputs=none
> ++
> ++[shell]
> ++locking=false
> ++animation=zoom
> ++panel-position=top
> ++startup-animation=fade
> ++
> ++[libinput]
> ++touchscreen_calibrator=true
> ++
> ++[autolaunch]
> ++# launch the calibrator on startup if a touchscreen is detected
> ++path=/usr/bin/weston-launch-calibrator
> ++
> ++[screensaver]
> ++# Uncomment path to disable screensaver
> ++#path=@libexecdir@/weston-screensaver
> +-- 
> +2.34.1
> +
> diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
> index cc5d1481..24146529 100644
> --- a/meta-arago-distro/classes/tisdk-bundle.bbclass
> +++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
> @@ -106,7 +106,7 @@ cleanup_host_packages() {
>  }
>  
>  ROOTFS_PREPROCESS_COMMAND += "tisdk_image_setup; "
> -ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build; "
> +ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build; add_emptty_inittab; "
>  IMAGE_PREPROCESS_COMMAND:append = "tisdk_image_cleanup; "
>  
>  # Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs functionality
> @@ -304,6 +304,18 @@ tisdk_image_build () {
>      cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
>  }
>  
> +
> +add_emptty_inittab() {
> +    [ -f ${IMAGE_ROOTFS}${sysconfdir}/inittab ] || return 0
> +
> +    if ${@bb.utils.contains_any("IMAGE_FEATURES", [ "x11-base", "weston" ], "true", "false", d)}
> +    then
> +	echo "7:5:respawn:${bindir}/emptty -t 7 -d" >> ${IMAGE_ROOTFS}${sysconfdir}/inittab
> +    fi
> +}
> +
> +
> +
>  TISDK_IMAGE_CLEANUP_DIRS ?= "var etc lib boot dev home media mnt proc run sbin sys tmp usr"
>  TISDK_IMAGE_CLEANUP_FILES ?= "bin/bash bin/bash.bash bin/sh"
>  
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index fb5c703f..43d4db53 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -68,6 +68,8 @@ PACKAGECONFIG:pn-glmark2 = "drm-gles2 wayland-gles2"
>  
>  # Set this to empty string to prevent xwayland config from being added
>  PACKAGECONFIG:pn-weston-init = ""
> +PREFERRED_RPROVIDER_virtual-emptty-conf = "weston-init-arago"
> +PREFERRED_RPROVIDER_weston-init = "weston-init-arago"
>  
>  # Enable testing for opencl and vulkan with piglit
>  PACKAGECONFIG:append:pn-piglit = " \
> diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
> new file mode 100644
> index 00000000..0b98e2e1
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
> @@ -0,0 +1,14 @@
> +require emptty.inc
> +
> +SUMMARY += " (Default config)"
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +do_install () {
> +    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-config
> +}
> +
> +FILES:${PN} = "${sysconfdir}/emptty/conf"
> +CONFFILES:${PN} = "${sysconfdir}/emptty/conf"
> +RPROVIDES:${PN} += "virtual-emptty-conf"
> diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty.inc b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
> new file mode 100644
> index 00000000..d99c4d8c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
> @@ -0,0 +1,27 @@
> +SUMMARY = "Dead simple CLI Display Manager on TTY"
> +DESCRIPTION = "Emptty is a simple display manager with a command line greeter \
> +It supports both X11 and Wayland sessions, exporting required variables and \
> +creating user paths as necessary."
> +
> +HOMEPAGE = "https://github.com/tvrzna/emptty"
> +BUGTRACKER = "https://github.com/tvrzna/emptty/issues"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=d1e4d12c7d1d17367ba5668706a405ba"
> +
> +S = "${UNPACKDIR}"
> +
> +FILESEXTRAPATHS:append = ":${THISDIR}/emptty"
> +
> +GO_IMPORT = "github.com/tvrzna/emptty"
> +GO_IMPORT_pam = "github.com/msteinert/pam"
> +SRC_URI = "\
> +    git://${GO_IMPORT}.git;protocol=https;branch=master;destsuffix=src/${GO_IMPORT} \
> +    git://${GO_IMPORT_pam}.git;protocol=https;branch=master;name=pam;destsuffix=src/${GO_IMPORT_pam} \
> +    file://pamconf \
> +    "
> +SRCREV = "bb203ad0a224731a7a2ff50deeb342ab79c4af09"
> +SRCREV_pam = "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
> +
> +SRCREV_FORMAT .= "_pam"
> +
> +PR = "r1"
> diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf b/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
> new file mode 100644
> index 00000000..5c82d46b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
> @@ -0,0 +1,11 @@
> +#%PAM-1.0
> +auth            sufficient      pam_succeed_if.so user ingroup nopasswdlogin
> +auth            include         common-auth
> +-auth           optional        pam_gnome_keyring.so
> +-auth           optional        pam_kwallet5.so
> +account         include         common-account
> +session         include         common-session
> +-session        optional        pam_gnome_keyring.so auto_start
> +-session        optional        pam_kwallet5.so auto_start force_run
> +password        include         common-password
> +
> diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb b/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
> new file mode 100644
> index 00000000..415c5ea5
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
> @@ -0,0 +1,57 @@
> +require emptty.inc
> +
> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
> +PACKAGECONFIG[pam] = ",,libpam,pam-plugin-succeed-if"
> +PACKAGECONFIG[x11] = ",,virtual/libx11,util-linux-mcookie"
> +
> +DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'virtual/crypt', d)}"
> +
> +GO_TAGS = ""
> +GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
> +GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
> +
> +GOBUILDFLAGS:append = " -tags=${GO_TAGS}"
> +
> +export GO111MODULE = "off"
> +
> +inherit go
> +
> +DEPENDS += "gzip"
> +
> +do_install () {
> +    # general collateral
> +    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
> +    install -d ${D}${mandir}/man1
> +    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/emptty.1.gz
> +
> +    # pam config
> +    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
> +    then
> +        install -Dm644 ${S}/pamconf ${D}${sysconfdir}/pam.d/emptty
> +    fi
> +
> +    # systemd init service
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
> +    then
> +        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-systemd
> +    fi
> +}
> +
> +FILES:${PN} = "\
> +    ${systemd_system_unitdir}/emptty.service \
> +    ${bindir}/emptty \
> +    ${mandir}/man1/emptty.1.gz \
> +    ${sysconfdir}/pam.d/emptty \
> +"
> +
> +RDEPENDS:${PN} += "virtual-emptty-conf"
> +SYSTEMD_SERVICE:${PN} = "emptty.service"
> +
> +inherit systemd
> +
> +USERADD_PACKAGES = "${PN}"
> +GROUPADD_PARAM:${PN} = "-r nopasswdlogin"
> +
> +inherit useradd
> +
> +
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
> new file mode 100644
> index 00000000..484d25e1
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
> @@ -0,0 +1,72 @@
> +SUMMARY = "Configuration files for the Weston Wayland compositor"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SRC_URI:append = " \
> +    file://weston.ini \
> +    file://weston-launch-calibrator.sh \
> +    file://emptty.conf \
> +"
> +
> +S = "${UNPACKDIR}"
> +
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)}"
> +PACKAGECONFIG:append:qemuriscv64 = " use-pixman"
> +PACKAGECONFIG:append:qemuppc64 = " use-pixman"
> +
> +PACKAGECONFIG[xwayland] = ",,"
> +PACKAGECONFIG[no-idle-timeout] = ",,"
> +PACKAGECONFIG[use-pixman] = ",,"
> +
> +DEFAULTBACKEND ??= ""
> +DEFAULTBACKEND:qemuall ?= "drm"
> +
> +do_install() {
> +	install -D -p -m0644 weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
> +	install -D -p -m0644 emptty.conf ${D}${sysconfdir}/emptty/conf
> +
> +	if [ -n "${DEFAULTBACKEND}" ]; then
> +		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
> +	fi
> +
> +	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
> +		sed -i -e "/^\[core\]/a xwayland=true" ${D}${sysconfdir}/xdg/weston/weston.ini
> +	fi
> +
> +	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
> +		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
> +	fi
> +
> +	if [ "${@bb.utils.contains('PACKAGECONFIG', 'use-pixman', 'yes', 'no', d)}" = "yes" ]; then
> +		sed -i -e "/^\[core\]/a use-pixman=true" ${D}${sysconfdir}/xdg/weston/weston.ini
> +	fi
> +
> +	install -dm 755 -o weston -g weston ${D}/home/weston
> +	install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
> +}
> +
> +inherit useradd
> +
> +USERADD_PACKAGES = "${PN}"
> +
> +# rdepends on weston which depends on virtual/egl
> +#
> +require ${COREBASE}/meta/recipes-graphics/wayland/required-distro-features.inc
> +
> +RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)} emptty"
> +
> +FILES:${PN} += "\
> +    ${sysconfdir}/xdg/weston/weston.ini \
> +    ${sysconfdir}/emptty/conf \
> +    /home/weston \
> +    ${bindir}/weston-launch-calibrator \
> +    "
> +
> +CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/emptty/conf"
> +RPROVIDES:${PN}:append = " virtual-emptty-conf weston-init"
> +RCONFLICTS:${PN} += "weston-init"
> +
> +USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,nopasswdlogin weston"
> +GROUPADD_PARAM:${PN} = "-r wayland; -r render; -r nopasswdlogin"
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
> new file mode 100644
> index 00000000..9fd9851d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
> @@ -0,0 +1,85 @@
> +# configuration file for Weston
> +
> +[core]
> +idle-time=0
> +#modules=xwayland.so,cms-colord.so
> +#shell=desktop-shell.so
> +gbm-format=rgb565
> +require-input=false
> +
> +[shell]
> +locking=false
> +animation=zoom
> +panel-position=top
> +startup-animation=fade
> +#background-image=/usr/share/backgrounds/gnome/Aqua.jpg
> +#background-color=0xff002244
> +#background-type=tile
> +#clock-format=minutes
> +#panel-color=0x90ff0000
> +#locking=true
> +#animation=zoom
> +#startup-animation=fade
> +#binding-modifier=ctrl
> +#num-workspaces=6
> +#cursor-theme=whiteglass
> +#cursor-size=24
> +
> +#lockscreen-icon=/usr/share/icons/gnome/256x256/actions/lock.png
> +#lockscreen=/usr/share/backgrounds/gnome/Garden.jpg
> +#homescreen=/usr/share/backgrounds/gnome/Blinds.jpg
> +#animation=fade
> +
> +#[launcher]
> +#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
> +#path=/usr/bin/gnome-terminal
> +
> +#[launcher]
> +#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
> +#path=/usr/bin/weston-terminal
> +
> +#[launcher]
> +#icon=/usr/share/icons/hicolor/24x24/apps/google-chrome.png
> +#path=/usr/bin/google-chrome
> +
> +#[launcher]
> +#icon=/usr/share/icons/gnome/24x24/apps/arts.png
> +#path=/build/weston-0lEgCh/weston-1.11.0/weston-flower
> +
> +#[input-method]
> +#path=/usr/libexec/weston-keyboard
> +
> +[output]
> +name=HDMI-A-1
> +#mode=1680x1050
> +#transform=90
> +#icc_profile=/usr/share/color/icc/colord/Bluish.icc
> +
> +#[output]
> +#name=VGA1
> +#mode=173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
> +#transform=flipped
> +
> +#[output]
> +#name=X1
> +#mode=1024x768
> +#transform=flipped-90
> +
> +[libinput]
> +touchscreen_calibrator=true
> +#enable_tap=true
> +
> +#[touchpad]
> +#constant_accel_factor = 50
> +#min_accel_factor = 0.16
> +#max_accel_factor = 1.0
> +
> +[screen-share]
> +command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
> +
> +#[xwayland]
> +#path=/usr/bin/Xwayland
> +
> +[autolaunch]
> +# launch the calibrator on startup if a touchscreen is detected
> +path=/usr/bin/weston-launch-calibrator
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
> new file mode 100644
> index 00000000..ffe1a3c2
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
> @@ -0,0 +1,77 @@
> +# TTY, where emptty will start.
> +TTY_NUMBER=7
> +
> +# Enables switching to defined TTY number.
> +SWITCH_TTY=true
> +
> +# Enables printing of /etc/issue in daemon mode.
> +PRINT_ISSUE=true
> +
> +# Enables printing of default motd, /etc/emptty/motd or /etc/emptty/motd-gen.sh.
> +PRINT_MOTD=true
> +
> +# Preselected user, if AUTOLOGIN is enabled, this user is logged in.
> +DEFAULT_USER=weston
> +
> +# Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogin group. Possible values are "true" or "false".
> +AUTOLOGIN=true
> +
> +# The default session used, if Autologin is enabled. If session is not found in list of session, it proceeds to manual selection.
> +AUTOLOGIN_SESSION=Weston
> +
> +# If Autologin is enabled and session does not start correctly, the number of retries in short period is kept to eventually stop the infinite loop of restarts. -1 is for infinite retries, 0 is for no retry.
> +AUTOLOGIN_MAX_RETRY=-1
> +
> +# Default LANG, if user does not have set own in init script.
> +#LANG=en_US.UTF-8
> +
> +# Starts desktop with calling "dbus-launch".
> +DBUS_LAUNCH=true
> +
> +# Starts Xorg desktop with calling "~/.xinitrc" script, if is true, file exists and selected WM/DE is Xorg session, it overrides DBUS_LAUNCH.
> +XINITRC_LAUNCH=false
> +
> +# Prints available WM/DE each on new line instead of printing on single line.
> +VERTICAL_SELECTION=false
> +
> +# Defines the way, how is logging handled. Possible values are "rotate", "appending" or "disabled".
> +#LOGGING=rotate
> +
> +# Overrides path of log file
> +#LOGGING_FILE=/var/log/emptty/[TTY_NUMBER].log
> +
> +# Arguments passed to Xorg server.
> +#XORG_ARGS=
> +
> +# Allows to use dynamic motd script to generate custom MOTD.
> +#DYNAMIC_MOTD=false
> +
> +# Allows to override default path to dynamic motd.
> +#DYNAMIC_MOTD_PATH=/etc/emptty/motd-gen.sh
> +
> +# Allows to override default path to static motd.
> +#MOTD_PATH=/etc/emptty/motd
> +
> +# Foreground color, available only in daemon mode.
> +#FG_COLOR=LIGHT_BLACK
> +
> +# Background color, available only in daemon mode.
> +#BG_COLOR=BLACK
> +
> +# Enables numlock in daemon mode. Possible values are "true" or "false".
> +#ENABLE_NUMLOCK=false
> +
> +# Defines the way, how is logging of session errors handled. Possible values are "rotate", "appending" or "disabled".
> +SESSION_ERROR_LOGGING=rotate
> +
> +# Overrides path of session errors log file
> +#SESSION_ERROR_LOGGING_FILE=/var/log/emptty/session-errors.[TTY_NUMBER].log
> +
> +# If set true, it will not use `.emptty-xauth` file, but the standard `~/.Xauthority` file. This allows to handle xauth issues.
> +#DEFAULT_XAUTHORITY=false
> +
> +#If set true, Xorg will be started as rootless, if system allows and emptty is running in daemon mode.
> +#ROOTLESS_XORG=false
> +
> +#If set true, environmental groups are printed to differ Xorg/Wayland/Custom/UserCustom desktops.
> +IDENTIFY_ENVS=false
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
> new file mode 100644
> index 00000000..45863ecd
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +
> +if [ -e /dev/input/touchscreen0 ]; then
> +	echo "Touch screen detected..."
> +	if [ -n "$LIBINPUT_CALIBRATION_MATRIX" ]; then
> +		echo "Calibration matrix already present, skipping calibration..."
> +	else
> +		echo "Calibrating touchscreen..."
> +		exec weston-calibrator
> +	fi
> +else
> +	echo "Touch screen not detected, skipping calibration..."
> +fi
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
> new file mode 100644
> index 00000000..1bc7a010
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
> @@ -0,0 +1,21 @@
> +[core]
> +idle-time=0
> +require-input=false
> +require-outputs=none
> +
> +[shell]
> +locking=false
> +animation=zoom
> +panel-position=top
> +startup-animation=fade
> +
> +[libinput]
> +touchscreen_calibrator=true
> +
> +[autolaunch]
> +# launch the calibrator on startup if a touchscreen is detected
> +path=/usr/bin/weston-launch-calibrator
> +
> +[screensaver]
> +# Uncomment path to disable screensaver
> +#path=@libexecdir@/weston-screensaver
> -- 
> 2.34.1


