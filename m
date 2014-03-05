Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 701CD52986
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 03:10:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s253ADGT009809
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:10:13 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s253ADR0026922
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:10:13 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 21:10:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s253ACPR016068;
	Tue, 4 Mar 2014 21:10:13 -0600
Date: Tue, 4 Mar 2014 22:10:12 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140305031012.GV22125@edge>
References: <1393802558-7742-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1393802558-7742-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ti-hyplnk: Add recipe for ti hyperlink low level driver
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
X-List-Received-Date: Wed, 05 Mar 2014 03:10:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This one as well - is this a v2 of previously submitted patch, or just 
re-send?


On Sun, Mar 02, 2014 at 06:22:38PM -0500, Sam Nelson wrote:
> - User space low level driver and test code for hyperlink
>   peripheral
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb     |   38 ++++++++++++++++++++
>  .../recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb     |   21 +++++++++++
>  .../recipes-bsp/ti-hyplnk/ti-hyplnk.inc            |   10 ++++++
>  3 files changed, 69 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb
>  create mode 100755 meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc
> 
> diff --git a/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb
> new file mode 100755
> index 0000000..9938b18
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb
> @@ -0,0 +1,38 @@
> +DESCRIPTION = "TI HYPLNK low level driver test binaries"
> +LICENSE = "TI BSD"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +
> +PR = "r0"
> +DEPENDS="ti-csl ti-hyplnk-lib"
> +
> +include ti-hyplnk.inc
> +
> +BASEDIR = "${WORKDIR}/git"
> +S = "${BASEDIR}/ti/drv/${LLDNAME}"
> +
> +DEVICELIST = " k2h \
> +               k2k \
> +"
> +
> +CHOICELIST = " yes \
> +               no  \
> +"
> +
> +do_compile () {
> +	make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} HYPLNK_SRC_DIR=${PWD}
> +	for device in ${DEVICELIST}
> +	do
> +		for choice in ${CHOICELIST}
> +		do
> +			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="${device}" HYPLNK_SRC_DIR=${S} USEDYNAMIC_LIB="${choice}"
> +		done
> +	done
> +}
> +
> +do_install () {
> +    for device in ${DEVICELIST}
> +	do
> +	    make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="${device}" HYPLNK_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}/${bindir}
> +	done
> +}
> diff --git a/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb
> new file mode 100755
> index 0000000..03399c6
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "TI HYPLNK Low Level Driver"
> +LICENSE = "TI BSD"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +
> +PR = "r0"
> +DEPENDS="ti-csl"
> +
> +include ti-hyplnk.inc
> +
> +BASEDIR = "${WORKDIR}/git"
> +S = "${BASEDIR}/ti/drv/${LLDNAME}"
> +
> +do_compile () {
> +#   Now build the lld in the updated directory	
> +    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
> +}
> +
> +do_install () {
> +    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
> +}
> diff --git a/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc
> new file mode 100644
> index 0000000..26f22db
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc
> @@ -0,0 +1,10 @@
> +LLDNAME="hyplnk"
> +
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
> +
> +BRANCH="master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/hyplnk-lld.git;destsuffix=git/ti/drv/${LLDNAME};protocol=git;branch=${BRANCH}"
> +# Following commit corresponds to tag DEV.HYPLNK_LLD.02.00.00.09
> +SRCREV = "f88e31b60aa2b4d591d5a845361c7e56792eeda1"
> +
> +PV = "2.0.0"
> \ No newline at end of file
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

