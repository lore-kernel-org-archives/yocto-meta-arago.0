Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF0EEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:02:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.15457.1687449730306546231
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 09:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9DE1240C37;
	Thu, 22 Jun 2023 16:02:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4b3ucPD5vKaL; Thu, 22 Jun 2023 16:02:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5611940BD4;
	Thu, 22 Jun 2023 16:02:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 16452163B34; Thu, 22 Jun 2023 12:02:05 -0400 (EDT)
Date: Thu, 22 Jun 2023 12:02:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, g-gupta@ti.com,
	praneeth@ti.com
Subject: Re: [master/kirkstone][PATCH v2 2/3] meta-arago-extras: sysrepo:
 Add meta-sysrepo recipes
Message-ID: <20230622160205.GP1518@denix.org>
References: <20230622103445.31114-1-r-gunasekaran@ti.com>
 <20230622103445.31114-3-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622103445.31114-3-r-gunasekaran@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jun 2023 16:02:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14681

Agree with Andrew - the proper way to do this is:

1. Add *verbatim* unmodified recipes from the original layer one-per-patch, 
making sure to explicitly spell it in the commit message, so reviewers don't 
have to go dig the originals and manually compare them.

2. Add your modifications or updates separately, probably also one-per-patch.


On Thu, Jun 22, 2023 at 04:04:44PM +0530, Ravi Gunasekaran wrote:
> meta-sysrepo recipes are hosted at [1]. But the layer seems to
> be inactive. So add the recipes to meta-arago-extras.
> 
> [1] - https://github.com/sartura/meta-sysrepo
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
>  meta-arago-extras/recipes-sysrepo/README.md   | 85 +++++++++++++++++++
>  .../libnetconf2/libnetconf2_git.bb            | 24 ++++++
>  .../libredblack/libredblack_git.bb            | 21 +++++
>  .../recipes-sysrepo/libssh/libssh_0.9.5.bb    | 35 ++++++++
>  .../recipes-sysrepo/libyang/libyang_git.bb    | 23 +++++
>  .../netopeer2-server/netopeer2-server         | 36 ++++++++
>  .../netopeer2-server/netopeer2-server_git.bb  | 32 +++++++
>  .../0001-so-version.patch                     | 12 +++
>  .../sysrepo-plugins-common_git.bb             | 27 ++++++
>  .../recipes-sysrepo/sysrepo/sysrepo/sysrepo   | 52 ++++++++++++
>  .../recipes-sysrepo/sysrepo/sysrepo_git.bb    | 35 ++++++++
>  11 files changed, 382 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-sysrepo/README.md
>  create mode 100644 meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
>  create mode 100644 meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
>  create mode 100644 meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
>  create mode 100644 meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
>  create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-server
>  create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
>  create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch
>  create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb
>  create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo
>  create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
> 
> diff --git a/meta-arago-extras/recipes-sysrepo/README.md b/meta-arago-extras/recipes-sysrepo/README.md
> new file mode 100644
> index 00000000..9c312bf8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/README.md
> @@ -0,0 +1,85 @@
> +# sysrepo/netopeer2 layer for Yocto Project
> +
> +This README file contains information on the contents of the sysrepo/netopeer2 layer for Yocto Project.
> +
> +Please see the corresponding sections below for details.
> +
> +## Dependencies
> +
> +This layer depends on:
> +
> +* URI: git://git.openembedded.org/meta-openembedded 
> +* branch: kirkstone
> +
> +It was tested with yocto project kirkstone branch:
> +
> +* URI: git://git.yoctoproject.org/poky
> +* branch: kirkstone
> +
> +Build host dependencies:
> +https://docs.yoctoproject.org/dev-manual/start.html#preparing-the-build-host
> +
> +## Adding the layer to your build
> +
> +In order to use this layer, you need to make the build system aware of it.
> +First prepare yocto project and all required layers:
> +```
> +git clone git://git.yoctoproject.org/poky -b kirkstone
> +cd poky
> +git clone git://git.openembedded.org/meta-openembedded -b kirkstone
> +git clone https://github.com/sartura/meta-sysrepo
> +source oe-init-build-env
> +```
> +The last command initializes the build environment and your current working directory is set to the `build` directory.
> +Now add the layer to the build system by adding the location of the sysrepo layer to `conf/bblayers.conf`, along with any other layers needed, e.g.:
> +```
> +BBLAYERS ?= " \
> +  /home/build/poky/meta \
> +  /home/build/poky/meta-poky \
> +  /home/build/poky/meta-yocto-bsp \
> +  /home/build/poky/meta-sysrepo \
> +  /home/build/poky/meta-openembedded/meta-initramfs \
> +  /home/build/poky/meta-openembedded/meta-multimedia \
> +  /home/build/poky/meta-openembedded/meta-networking \
> +  /home/build/poky/meta-openembedded/meta-oe \
> +  /home/build/poky/meta-openembedded/meta-python \
> +  "
> +```
> +
> +Update `conf/local.conf` file to include additional software in the final image, e.g. add to the end:
> +```
> +IMAGE_INSTALL:append = " sysrepo netopeer2-server openssh openssl "
> +```
> +Optionally, adapt `MACHINE` variable for target system.
> +
> +Append "pam" to DISTRO_FEATURES, if needed
> +```
> +DISTRO_FEATURES += " pam"
> +```
> +## Build test image
> +
> +Now a test image can be built, e.g.:
> +```
> +bitbake core-image-base
> +```
> +
> +The image is located under `tmp/deploy/images/<target>` directory.
> +
> +Default `MACHINE` target is `qemux86`, so it can be run with:
> +```
> +runqemu qemux86-64
> +```
> +
> +## Starting sysrepo and netopeer2-server
> +
> +There are init.d scripts (as part of the meta-sysrepo layer) which are automatically stored in the image:
> +* /etc/init.d/sysrepo
> +* /etc/init.d/netopeer2-server
> +
> +It is enough to start only `/etc/init.d/netopeer2-server` script and it will make sure `sysrepo` processes are also started.
> +```
> +/etc/init.d/netopeer2-server start
> +```
> +
> +## Demo
> +[![asciicast](https://asciinema.org/a/360926.svg)](https://asciinema.org/a/360926)
> diff --git a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
> new file mode 100644
> index 00000000..a534b9ac
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "libnetconf2 is a NETCONF library in C intended for building NETCONF clients and servers"
> +DESCRIPTION = "The library provides functions to connect NETCONF client and server to each other via SSH and to send, receive and process NETCONF messages."
> +SECTION = "libs"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=08a5578c9bab06fb2ae84284630b973f"
> +
> +SRC_URI = "git://github.com/CESNET/libnetconf2.git;protocol=https;branch=devel"
> +
> +PV = "2.1.34+git${SRCPV}"
> +SRCREV = "91cd6d75722c65de5c005d908f6d645b48cee89b"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "libssh openssl libyang libxcrypt libpam"
> +
> +FILES:${PN} += "/usr/share/yang/modules/libnetconf2/*"
> +
> +inherit cmake pkgconfig
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +#EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release -DLIBYANG_INCLUDE_DIR=/usr/include -DLIBYANG_LIBRARY=/usr/lib "
> +EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release "
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
> new file mode 100644
> index 00000000..ea51b618
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "Library for handling red-black tree searching algorithm"
> +DESCRIPTION = "A library to provide the RedBlack balanced tree searching and sorting algorithm."
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=de174fb5a92cdbe038c88dc4c4316f99"
> +
> +SRC_URI = "git://github.com/sysrepo/libredblack.git;protocol=https"
> +
> +PV = "1.0+git${SRCPV}"
> +SRCREV = "a399310d99b61eec4d3c0677573ab5dddcf9395d"
> +
> +S = "${WORKDIR}/git"
> +
> +# NOTE: if this software is not capable of being built in a separate build directory
> +# from the source, you should replace autotools with autotools-brokensep in the
> +# inherit line
> +inherit python3native autotools
> +
> +# Specify any options you want to pass to the configure script using EXTRA_OECONF:
> +EXTRA_OECONF = " --without-rbgen "
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb b/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
> new file mode 100644
> index 00000000..43a6827e
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "Multiplatform C library implementing the SSHv2 and SSHv1 protocol"
> +HOMEPAGE = "http://www.libssh.org"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
> +
> +DEPENDS = "zlib openssl"
> +
> +SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=stable-0.9"
> +SRCREV = "0cceefd49d4d397eb21bd36e314ac87739da51ff"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +PACKAGECONFIG ??=""
> +PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
> +
> +ARM_INSTRUCTION_SET:armv5 = "arm"
> +
> +EXTRA_OECMAKE = " \
> +    -DWITH_GCRYPT=0 \
> +    -DWITH_PCAP=1 \
> +    -DWITH_SFTP=1 \
> +    -DWITH_ZLIB=1 \
> +    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
> +    "
> +
> +do_configure:prepend () {
> +    # Disable building of examples
> +    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLists.txt \
> +        || bbfatal "Failed to disable examples"
> +}
> +
> +TOOLCHAIN = "gcc"
> diff --git a/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb b/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
> new file mode 100644
> index 00000000..c984a252
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "YANG data modelling language parser and toolkit"
> +DESCRIPTION = "libyang is YANG data modelling language parser and toolkit written (and providing API) in C. The library is used e.g. in libnetconf2, Netopeer2 or sysrepo projects."
> +SECTION = "libs"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
> +
> +SRC_URI = "git://github.com/CESNET/libyang.git;protocol=https;branch=devel"
> +
> +PV = "2.1.77+git${SRCPV}"
> +SRCREV = "a804113c9bbac3e36c53221be469c1ca5af5b435"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "libpcre2"
> +
> +FILES:${PN} += "/usr/share/yang/modules/libyang/*"
> +
> +inherit cmake pkgconfig
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release "
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-server b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-server
> new file mode 100644
> index 00000000..fc0ee793
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-server
> @@ -0,0 +1,36 @@
> +#!/bin/sh
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +EXEC_PATH="/usr/sbin"
> +SERVER_EXEC="netopeer2-server"
> +SERVER_OPTS=" -v 1"
> +
> +
> +case "$1" in
> +    start)
> +        /etc/init.d/sysrepo start
> +        start-stop-daemon --start --exec $EXEC_PATH/$SERVER_EXEC -- $SERVER_OPTS
> +        ;;
> +    stop)
> +        start-stop-daemon --stop --quiet --exec $EXEC_PATH/$SERVER_EXEC
> +        ;;
> +    status)
> +        status $SERVER_EXEC
> +        ;;
> +    reload)
> +        echo "not supported"
> +        ;;
> +    restart)
> +        $0 stop
> +        $0 start
> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop|status|restart}"
> +        exit 1;;
> +esac
> +
> +
> +exit 0
> +
> diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
> new file mode 100644
> index 00000000..c64cd2f1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "Netopeer2 is a set of tools implementing network configuration tools based on the NETCONF Protocol."
> +DESCRIPTION = "Netopeer2 is based on the new generation of the NETCONF and YANG libraries - libyang and libnetconf2. The Netopeer server uses sysrepo as a NETCONF datastore implementation."
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=41daedff0b24958b2eba4f9086d782e1"
> +
> +SRC_URI = "git://github.com/CESNET/Netopeer2.git;protocol=https;branch=devel file://netopeer2-server"
> +
> +PV = "2.1.59+git${SRCPV}"
> +SRCREV = "b81788d9a81770313a0eb7f88d4224726b3d6e15"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "libyang libnetconf2 sysrepo curl"
> +RDEPENDS:${PN} += "bash curl"
> +
> +FILES:${PN} += "/usr/share/yang* /usr/share/netopeer2/* /usr/lib/sysrepo-plugind/*"
> +
> +inherit cmake pkgconfig
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE:String=Release -DINSTALL_MODULES=OFF -DGENERATE_HOSTKEY=OFF -DMERGE_LISTEN_CONFIG=OFF"
> +
> +do_install:append () {
> +    install -d ${D}/etc/netopeer2/scripts
> +    install -o root -g root ${S}/scripts/setup.sh ${D}/etc/netopeer2/scripts/setup.sh
> +    install -o root -g root ${S}/scripts/merge_hostkey.sh ${D}/etc/netopeer2/scripts/merge_hostkey.sh
> +    install -o root -g root ${S}/scripts/merge_config.sh ${D}/etc/netopeer2/scripts/merge_config.sh
> +    install -d ${D}/etc/netopeer2
> +    install -d ${D}/etc/init.d
> +    install -m 0755 ${WORKDIR}/netopeer2-server ${D}/etc/init.d/
> +}
> +
> diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch
> new file mode 100644
> index 00000000..547f3642
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch
> @@ -0,0 +1,12 @@
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index fd64b80..910510d 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -23,6 +23,7 @@ include_directories(${LIBYANG_INCLUDE_DIRS})
> + include_directories(${SYSREPO_INCLUDE_DIRS})
> + 
> + add_library(${PROJECT_NAME} SHARED ${SRPC_SOURCES})
> ++set_target_properties(${PROJECT_NAME} PROPERTIES VERSION 1.0.0 SOVERSION 1)
> + 
> + install(
> +     TARGETS ${PROJECT_NAME}
> diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb
> new file mode 100644
> index 00000000..f107b423
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "Set of utilities/functionalities which can be used for easier build of sysrepo plugins."
> +DESCRIPTION = ""
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f91d5dfaae99cc1943a8eca222cafa5c"
> +
> +SRC_URI = "gitsm://github.com/telekom/sysrepo-plugins-common.git;protocol=https;branch=devel "
> +SRC_URI += " file://0001-so-version.patch "
> +FILESEXTRAPATHS:prepend := "${THISDIR}:"
> +
> +PV = "dev+git${SRCPV}"
> +SRCREV = "20885de0d3bb95a05610fdb3a0f83d8f7c370fad"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "libyang sysrepo"
> +
> +FILES:${PN} += ""
> +
> +inherit cmake pkgconfig
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr "
> +
> +do_install:append () {
> +    true
> +}
> +
> diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo
> new file mode 100644
> index 00000000..9dff7ba5
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo
> @@ -0,0 +1,52 @@
> +#!/bin/sh
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +EXEC_PATH="/usr/bin"
> +SYSREPOPLUGIND_EXEC="sysrepo-plugind"
> +SERVER_OPTS=" -d -v 1"
> +
> +init_sysrepo() {
> +    export NP2_MODULE_DIR="/usr/share/yang/modules/netopeer2"
> +    export NP2_MODULE_PERMS="600"
> +    export NP2_MODULE_OWNER="root"
> +    export NP2_MODULE_GROUP="root"
> +    if [ -x /usr/bin/sysrepoctl ]; then
> +        sh /etc/netopeer2/scripts/setup.sh
> +    fi
> +    if [ -x /usr/bin/sysrepocfg ]; then
> +        sh /etc/netopeer2/scripts/merge_hostkey.sh
> +        sh /etc/netopeer2/scripts/merge_config.sh
> +    fi
> +    touch /etc/sysrepo/init
> +}
> +
> +
> +case "$1" in
> +    start)
> +        test -r /etc/sysrepo/init || init_sysrepo
> +        start-stop-daemon --start --background --exec $EXEC_PATH/$SYSREPOPLUGIND_EXEC -- $SERVER_OPTS
> +        ;;
> +    stop)
> +        start-stop-daemon --stop --quiet --exec $EXEC_PATH/$SYSREPOPLUGIND_EXEC
> +        rm -rf /var/run/sysrepo-subscriptions/*
> +        ;;
> +    status)
> +        status $SYSREPOPLUGIND_EXEC
> +        ;;
> +    reload)
> +        echo "not supported"
> +        ;;
> +    restart)
> +        $0 stop
> +        $0 start
> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop|status|restart}"
> +        exit 1;;
> +esac
> +
> +
> +exit 0
> +
> diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
> new file mode 100644
> index 00000000..56818fd9
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
> @@ -0,0 +1,35 @@
> +# Recipe created by recipetool
> +SUMMARY = "YANG-based configuration and operational state data store for Unix/Linux applications."
> +DESCRIPTION = ""
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ef345f161efb68c3836e6f5648b2312f"
> +
> +SRC_URI = "git://github.com/sysrepo/sysrepo.git;protocol=https;branch=devel file://sysrepo"
> +
> +PV = "2.2.71+git${SRCPV}"
> +SRCREV = "b828f0ab4693c613cc66efd053a146e05854d5c8"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "libyang protobuf protobuf-c protobuf-c-native libredblack libev libnetconf2"
> +
> +FILES:${PN} += "/usr/share/yang/* /usr/lib/sysrepo-plugind/*"
> +
> +inherit cmake pkgconfig python3native python3-dir
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release -DBUILD_EXAMPLES:String=False -DENABLE_TESTS:String=False -DREPOSITORY_LOC:PATH=/etc/sysrepo  -DCALL_TARGET_BINS_DIRECTLY=False -DGEN_LANGUAGE_BINDINGS:String=False "
> +
> +BBCLASSEXTEND = "native nativesdk" 
> +
> +do_install:append () {
> +    install -d ${D}/etc/sysrepo/data/notifications
> +    install -d ${D}/etc/sysrepo/yang
> +    install -o root -g root ${S}/modules/ietf-netconf-notifications.yang ${D}/etc/sysrepo/yang/ietf-netconf-notifications@2012-02-06.yang
> +    install -o root -g root ${S}/modules/ietf-netconf-with-defaults.yang ${D}/etc/sysrepo/yang/ietf-netconf-with-defaults@2011-06-01.yang
> +    install -o root -g root ${S}/modules/ietf-netconf.yang ${D}/etc/sysrepo/yang/ietf-netconf@2011-06-01.yang
> +    install -d ${D}/etc/init.d
> +    install -m 0775 ${WORKDIR}/sysrepo ${D}/etc/init.d/
> +    install -d ${D}/usr/lib/sysrepo/plugins
> +}

