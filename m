Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D723E52A61
	for <meta-arago@arago-project.org>;
	Thu, 27 Feb 2014 00:55:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1R0teGv023552
	for <meta-arago@arago-project.org>; Wed, 26 Feb 2014 18:55:40 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1R0teuD006362
	for <meta-arago@arago-project.org>; Wed, 26 Feb 2014 18:55:40 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 26 Feb 2014 18:55:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1R0tdEd014338;
	Wed, 26 Feb 2014 18:55:39 -0600
Date: Wed, 26 Feb 2014 19:55:39 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Aravind Batni <aravindbr@ti.com>
Message-ID: <20140227005539.GW22125@edge>
References: <1393455091-21238-1-git-send-email-aravindbr@ti.com>
MIME-Version: 1.0
In-Reply-To: <1393455091-21238-1-git-send-email-aravindbr@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v3] ti-rm: provides ti resouce manager recipe for KeyStone devices
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
X-List-Received-Date: Thu, 27 Feb 2014 00:55:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 26, 2014 at 05:51:31PM -0500, Aravind Batni wrote:
> - TI Resource Manager Low Level Driver
> 
> Signed-off-by: Aravind Batni <aravindbr@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

Will be pushed once ti-ipc makes it.

> ---
> Changes from last patch:
> * Removed trailing white spaces
> * Single space before and after '=' sign in line containing DEPENDS variable
> * Sigle line strings for DEVICE and CHOICELIST variables
> * Removed tab in do_install body
> * Removed / between ${D} and ${libdir}
> ---
> ---
>  meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb |   49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> 
> diff --git a/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> new file mode 100644
> index 0000000..38ec0ad
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> @@ -0,0 +1,49 @@
> +DESCRIPTION = "TI Resource Manager Low Level Driver"
> +LICENSE = "TI BSD"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
> +
> +BRANCH="master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
> +# Below commit ID corresponds to DEV.RM_LLD.02.00.00.08
> +SRCREV = "3a73cfe015214ff0401639f85fa5e52ea610e59d"
> +PR = "r0"
> +PV = "02.00.00.08"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +
> +DEPENDS = "ti-ipc"
> +
> +PACKAGES =+ "${PN}-test"
> +
> +FILES_${PN}-test = "${bindir}/rmDspClientTest_*.out \
> +                    ${bindir}/rmLinuxClientTest_*.out \
> +                    ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
> +
> +DEVICELIST = "k2h k2k"
> +
> +CHOICELIST = "yes no"
> +
> +BASEDIR = "${WORKDIR}/git"
> +S = "${BASEDIR}/ti/drv/rm"
> +
> +do_compile () {
> +#   Now build the lld
> +    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} RM_SRC_DIR=${S}
> +    for device in ${DEVICELIST}
> +    do
> +      for choice in ${CHOICELIST}
> +      do
> +        make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} PDK_INSTALL_PATH=${BASEDIR} DEVICE="$device" USEDYNAMIC_LIB="$choice"
> +      done
> +    done
> +}
> +
> +do_install () {
> +    install -d ${D}${includedir}/ti/drv/rm
> +    install -d ${D}${libdir}
> +    install -d ${D}${bindir}
> +    for device in ${DEVICELIST}
> +    do
> +      make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
> +    done
> +}
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

