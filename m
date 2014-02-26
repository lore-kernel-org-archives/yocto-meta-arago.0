Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CCEC5529ED
	for <meta-arago@arago-project.org>;
	Wed, 26 Feb 2014 22:11:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1QMBsBP026631
	for <meta-arago@arago-project.org>; Wed, 26 Feb 2014 16:11:54 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1QMBsts010973
	for <meta-arago@arago-project.org>; Wed, 26 Feb 2014 16:11:54 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 26 Feb 2014 16:11:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1QMBs5Y006407;
	Wed, 26 Feb 2014 16:11:54 -0600
Date: Wed, 26 Feb 2014 17:11:53 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Aravind Batni <aravindbr@ti.com>
Message-ID: <20140226221153.GU22125@edge>
References: <1393031261-5360-1-git-send-email-aravindbr@ti.com>
MIME-Version: 1.0
In-Reply-To: <1393031261-5360-1-git-send-email-aravindbr@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] ti-rm: provides ti resouce manager recipe for KeyStone devices
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
X-List-Received-Date: Wed, 26 Feb 2014 22:11:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 21, 2014 at 08:07:41PM -0500, Aravind Batni wrote:
> - TI Resource Manager Low Level Driver
> 
> Signed-off-by: Aravind Batni <aravindbr@ti.com>
> 
> ---
> Changes from last patch:
> * Removed ti-rm.inc file
> * Added destsuffix in the SRCURI to clone RM git under git/ti/drv/rm folder
> * Removed the symbolic link workaround
> * Added PV
> * Added for loop for multiple devices and choices for the test binaries

Thanks! That's a good list of fixes and the patch now looks much better and 
cleaner. Please see few minor comments inline.


> ---
> ---
>  meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb |   53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> 
> diff --git a/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> new file mode 100755
> index 0000000..761a722
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> @@ -0,0 +1,53 @@
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
> +DEPENDS="ti-ipc"

1. It depends on ti-ipc, so will have to wait for that one to get merged 
first.
2. Not critical at all, but would be nice to have a single space before and 
after = sign... :)


> +PACKAGES =+ "${PN}-test"
> +
> +FILES_${PN}-test = "${bindir}/rmDspClientTest_*.out \
> +                    ${bindir}/rmLinuxClientTest_*.out \
> +                    ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
> +
> +DEVICELIST = " k2h \
> +               k2k \
> +"
> +
> +CHOICELIST = " yes \
> +               no  \
> +"

Since you are using above 2 vars in a "for" loop, they can be simple one-line 
strings like "k2h k2k" and "yes no". But it's Ok to split them in multiple 
lines too - it's up to you.


> +BASEDIR = "${WORKDIR}/git"
> +S = "${BASEDIR}/ti/drv/rm"
> +
> +do_compile () {
> +#   Now build the lld in the updated directory	
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
> +	install -d ${D}/${includedir}/ti/drv/rm

There seems to be an inconsistent indentation here - the above line uses tab, 
while other lines use spaces. Either way is fine, as long as they are 
consistent.


> +    install -d ${D}/${libdir}
> +    install -d ${D}/${bindir}	

There shouldn't be / between ${D} and ${libdir}. All the ${*dir} variables are 
defined from root, i.e. starting with / and hence you'd end up with double-/ 
in the code...


> +    for device in ${DEVICELIST}
> +    do	
> +      make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}/${libdir} INSTALL_BIN_BASE_DIR=${D}/${bindir} DEVICE="$device"

Same comment about ${D}/${*dir} as above.


> +    done	
> +}
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

