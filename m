Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 17F315299F
	for <meta-arago@arago-project.org>;
	Wed,  1 Jun 2016 17:14:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u51HEpGs032531;
	Wed, 1 Jun 2016 12:14:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u51HEu8d004876;
	Wed, 1 Jun 2016 12:14:56 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 1 Jun 2016 12:14:55 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u51HEtG4022189;
	Wed, 1 Jun 2016 12:14:55 -0500
Message-ID: <574F180F.6070000@ti.com>
Date: Wed, 1 Jun 2016 13:14:55 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1464385969-8101-1-git-send-email-denis@denix.org>
In-Reply-To: <1464385969-8101-1-git-send-email-denis@denix.org>
Subject: Re: [PATCH] packagrgoup*: re-enable ipsecmgr and netapi
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
X-List-Received-Date: Wed, 01 Jun 2016 17:14:57 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ACK

On 5/27/2016 5:52 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> This reverts commit 51cdd4eaefd05f3801d0ba17e6d20403849f9f10.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   .../packagegroup-arago-base-tisdk-server-extra.bb      | 16 ++++++++--------
>   .../packagegroups/packagegroup-arago-test-addons.bb    | 10 +++++-----
>   .../packagegroup-arago-tisdk-addons-sdk-host.bb        |  4 ++--
>   .../packagegroup-arago-tisdk-addons-sdk-target.bb      | 18 +++++++++---------
>   4 files changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> index c5352bc..5820ee3 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r11"
> +PR = "r12"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -81,7 +81,6 @@ ARAGO_SECURE_STORAGE = "\
>       engine-pkcs11 \
>       "
>   
> -#    ipsecmgr-mod
>   ARAGO_TI_KEYSTONE_PKGS = "\
>       ${ARAGO_SECURE_STORAGE} \
>       uio-module-drv \
> @@ -104,6 +103,7 @@ ARAGO_TI_KEYSTONE_PKGS = "\
>       hplib-mod \
>       pktlib \
>       cppi-lld \
> +    ipsecmgr-mod \
>       "
>   
>   # The following packages are not yet ready for k2g-evm
> @@ -114,31 +114,31 @@ ARAGO_TI_KEYSTONE_PKGS = "\
>   
>   ARAGO_TI_PKGS = ""
>   ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
> -#    netapi
> -#    netapi-test
>   ARAGO_TI_PKGS_append_k2l-evm = "\
>       dfe-lld \
>       iqn2-lld \
> +    netapi \
> +    netapi-test \
>       hplib \
>       nwal-lld \
>       "
>   
> -#    netapi
> -#    netapi-test
>   ARAGO_TI_PKGS_append_k2hk-evm = "\
>       srio-lld \
>       mmap-lld \
>       hyplnk-lld \
>       aif2-lld \
> +    netapi \
> +    netapi-test \
>       hplib \
>       nwal-lld \
>       "
>   
> -#    netapi
> -#    netapi-test
>   ARAGO_TI_PKGS_append_k2e-evm = "\
>       mmap-lld \
>       hyplnk-lld \
> +    netapi \
> +    netapi-test \
>       hplib \
>       nwal-lld \
>       "
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> index 51bfc2f..5d5ee6e 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "Task to install additional utilities/demos for test image"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r9"
> +PR = "r10"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -18,7 +18,6 @@ TEST_ADDONS_TI = " \
>       cmem-test \
>       "
>   
> -#    ipsecmgr
>   TEST_ADDONS_TI_append_keystone = " \
>       mpm-transport-test \
>       multiprocmgr-test \
> @@ -32,6 +31,7 @@ TEST_ADDONS_TI_append_keystone = " \
>       sa-lld-test \
>       traceframework-test \
>       udma-test \
> +    ipsecmgr \
>       "
>   
>   # The following are not yet ready for k2g-evm
> @@ -41,7 +41,6 @@ TEST_ADDONS_TI_append_keystone = " \
>   #    ipc-transport-qmss-test
>   #    netapi-test
>   
> -#    netapi-test
>   TEST_ADDONS_TI_append_k2hk-evm = " \
>       srio-lld-test \
>       ipc-transport-srio-test \
> @@ -52,9 +51,9 @@ TEST_ADDONS_TI_append_k2hk-evm = " \
>       nwal-lld-test \
>       hplib-test \
>       nwal-lld \
> +    netapi-test \
>       "
>   
> -#    netapi-test
>   TEST_ADDONS_TI_append_k2l-evm = " \
>       dfe-lld-test \
>       iqn2-lld-test \
> @@ -62,9 +61,9 @@ TEST_ADDONS_TI_append_k2l-evm = " \
>       hplib-test \
>       nwal-lld \
>       ipc-transport-qmss-test \
> +    netapi-test \
>       "
>   
> -#    netapi-test
>   TEST_ADDONS_TI_append_k2e-evm = " \
>       mmap-lld-test \
>       hyplnk-lld-test \
> @@ -72,6 +71,7 @@ TEST_ADDONS_TI_append_k2e-evm = " \
>       hplib-test \
>       nwal-lld \
>       ipc-transport-qmss-test \
> +    netapi-test \
>       "
>   
>   RDEPENDS_${PN} = "\
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> index e026089..6fcd6b0 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
>   LICENSE = "MIT"
> -PR = "r27"
> +PR = "r28"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -43,11 +43,11 @@ EXTRA_LIBS_append_dra7xx = " \
>       gdbserverproxy-module-drv-src \
>   "
>   
> -#    ipsecmgr-mod-src
>   EXTRA_LIBS_append_keystone = " \
>       cmem-mod-src \
>       uio-module-drv-src \
>       hplib-mod-src \
> +    ipsecmgr-mod-src \
>   "
>   
>   EXTRA_LIBS_append_k2hk-evm = " \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> index 5bc9218..b768c70 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
>   LICENSE = "MIT"
> -PR = "r32"
> +PR = "r33"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -28,8 +28,6 @@ TI_SECURE_STORAGE_DEV = "\
>   	libp11-staticdev \
>   	"
>   
> -#	ipsecmgr-dev
> -#	ipsecmgr-staticdev
>   EXTRA_LIBS_append_keystone = "\
>   	${TI_SECURE_STORAGE_DEV} \
>   	cmem-dev \
> @@ -69,23 +67,23 @@ EXTRA_LIBS_append_keystone = "\
>   	lksctp-tools-staticdev \
>   	ipc-transport-qmss-dev \
>   	ipc-transport-qmss-staticdev \
> +	ipsecmgr-dev \
> +	ipsecmgr-staticdev \
>   	"
>   
> -#	netapi-dev
> -#	netapi-staticdev
>   EXTRA_LIBS_append_k2l-evm = "\
>   	dfe-lld-dev \
>   	dfe-lld-staticdev \
>   	iqn2-lld-dev \
>   	iqn2-lld-staticdev \
> +	netapi-dev \
> +	netapi-staticdev \
>   	hplib-dev \
>   	hplib-staticdev \
>   	nwal-lld-dev \
>   	nwal-lld-staticdev \
>   	"
>   
> -#	netapi-dev
> -#	netapi-staticdev
>   EXTRA_LIBS_append_k2hk-evm = "\
>   	srio-lld-dev \
>   	srio-lld-staticdev \
> @@ -95,6 +93,8 @@ EXTRA_LIBS_append_k2hk-evm = "\
>   	mmap-lld-staticdev \
>   	hyplnk-lld-dev \
>   	hyplnk-lld-staticdev \
> +	netapi-dev \
> +	netapi-staticdev \
>   	hplib-dev \
>   	hplib-staticdev \
>   	nwal-lld-dev \
> @@ -103,13 +103,13 @@ EXTRA_LIBS_append_k2hk-evm = "\
>   	aif2-lld-staticdev \
>   	"
>   
> -#	netapi-dev
> -#	netapi-staticdev
>   EXTRA_LIBS_append_k2e-evm = "\
>   	mmap-lld \
>   	mmap-lld-staticdev \
>   	hyplnk-lld-dev \
>   	hyplnk-lld-staticdev \
> +	netapi-dev \
> +	netapi-staticdev \
>   	hplib-dev \
>   	hplib-staticdev \
>   	nwal-lld-dev \


