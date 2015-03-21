Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3FB38529DA
	for <meta-arago@arago-project.org>;
	Sat, 21 Mar 2015 05:31:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2L5Vkpo027142
	for <meta-arago@arago-project.org>; Sat, 21 Mar 2015 00:31:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2L5VjGh027633
	for <meta-arago@arago-project.org>; Sat, 21 Mar 2015 00:31:45 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 21 Mar 2015 00:31:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2L5VijV026686;
	Sat, 21 Mar 2015 00:31:45 -0500
Date: Sat, 21 Mar 2015 01:31:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150321053144.GV11557@edge>
References: <1424898364-24979-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1424898364-24979-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2 1/2] packagegroup-arago-base-tisdk-server-extra: Add new package group
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
X-List-Received-Date: Sat, 21 Mar 2015 05:31:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

Please see at the very end.


On Wed, Feb 25, 2015 at 04:06:03PM -0500, Sam Nelson wrote:
> - Adds other packages libnl, perl, ndisc6, python and other ti packages
>   meant to be shared by tisdk server filesystem.
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Update from previous version for patch
> -- Reorganised to separate Machine specific packages
> -- Added additional components
> ---
> ---
>  .../packagegroup-arago-base-tisdk-server-extra.bb  |  163 ++++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> new file mode 100644
> index 0000000..5f71b2f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> @@ -0,0 +1,163 @@
> +DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +PR = "r0"
> +
> +inherit packagegroup
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +ARAGO_LIBNL = "\
> +    libnl-route \
> +    libnl-nf \
> +    libnl-genl \
> +    libnl-cli \
> +    "
> +
> +ARAGO_PERL = "\
> +    perl \
> +    perl-module-carp \
> +    perl-module-class-struct \
> +    perl-module-errno \
> +    perl-module-exporter \
> +    perl-module-exporter-heavy \
> +    perl-module-fcntl \
> +    perl-module-file-spec \
> +    perl-module-file-spec-unix \
> +    perl-module-file-stat \
> +    perl-module-io-dir \
> +    perl-module-io-file \
> +    perl-module-io-handle \
> +    perl-module-io-pipe \
> +    perl-module-io-poll \
> +    perl-module-io-seekable \
> +    perl-module-io-select \
> +    perl-module-io-socket-inet \
> +    perl-module-io-socket-unix \
> +    perl-module-io-socket \
> +    perl-module-io \
> +    perl-module-list-util \
> +    perl-module-selectsaver \
> +    perl-module-socket \
> +    perl-module-strict \
> +    perl-module-symbol \
> +    perl-module-tie-handle \
> +    perl-module-tie-hash \
> +    perl-module-tie-stdhandle \
> +    perl-module-vars \
> +    perl-module-warnings-register \
> +    perl-module-warnings \
> +    perl-module-xsloader \
> +    "
> +
> +ARAGO_NDISC6 = "\
> +    ndisc6-ndisc6 \
> +    ndisc6-rdisc6 \
> +    ndisc6-rltraceroute6 \
> +    ndisc6-tcpspray6 \
> +    ndisc6-tcptraceroute6 \
> +    ndisc6-tracert6 \
> +    "
> +
> +ARAGO_PYTHON = "\
> +    python-core \
> +    python-io \
> +    python-ctypes \
> +    python-json \
> +    python-numpy \
> +    python-codecs \
> +    python-subprocess \
> +    python-pickle \
> +    python-shell \
> +    python-logging \
> +    python-mmap \
> +    python-profile \
> +    python \
> +    "
> +
> +ARAGO_SECURE_STORAGE = "\
> +    ti-softhsmv2 \
> +    libp11 \
> +    engine-pkcs11 \
> +    "
> +
> +ARAGO_TI_KEYSTONE_PKGS = "\
> +    ${ARAGO_SECURE_STORAGE} \
> +    uio-module-drv \
> +    multiprocmgr \
> +    mpm-transport \
> +    traceframework \
> +    cuia \
> +    hplib \
> +    hplib-mod \
> +    netapi \
> +    netapi-test \
> +    ipsecmgr-mod \
> +    libnl-xfrm \
> +    demo-image-proc \
> +    ti-ipc \
> +    rm-lld \
> +    cmem \
> +    cmem-mod \
> +    mmap-lld \
> +    udma \
> +    cuia \
> +    qmss-lld \
> +    pa-lld \
> +    cppi-lld \
> +    edma3-lld \
> +    hyplnk-lld \
> +    pktlib \
> +    nwal-lld \
> +    srss-tc \
> +    "
> +
> +ARAGO_TI_PKGS = "\
> +    uio-module-drv \
> +    cmem \
> +    cmem-mod \
> +    "
> +ARAGO_TI_PKGS_append_keystone = "${ARAGO_TI_KEYSTONE_PKGS}"
> +ARAGO_TI_PKGS_append_k2l-evm = "\
> +    dfe-lld \
> +    iqn2-lld \
> +    "
> +
> +ARAGO_TI_PKGS_append_k2hk-evm = "\
> +    srio-lld \
> +    "
> +
> +RDEPENDS_${PN} = "\
> +    ${ARAGO_LIBNL} \
> +    ${ARAGO_PERL} \
> +    ${ARAGO_NDISC6} \
> +    ${ARAGO_PYTHON} \
> +    ${ARAGO_TI_PKGS} \
> +    ptpd \
> +    vsftpd \
> +    syslog-ng \
> +    dtc \
> +    strongswan \
> +    procps \
> +    dhcp-client \
> +    ipsec-tools \
> +    kexec \
> +    kdump \
> +    tzdata \
> +    lksctp-tools \
> +    lksctp-tools-utils \
> +    libdnet \
> +    vtun \
> +    bridge-utils \
> +    ebtables \
> +    rng-tools \
> +    elfutils \
> +    zip \
> +    libsdl \
> +    libgomp \
> +    libgomp-dev \
> +    file \
> +    libbz2 \
> +    boost \
> +    libgl \

^^^^^^^^^^^^^
So, why do you have libgl here? I thought you don't have any graphics and it's 
definitely breaking the build now...

-- 
Denys

