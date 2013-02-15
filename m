Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0EA5852A55
	for <meta-arago@arago-project.org>;
	Fri, 15 Feb 2013 22:27:15 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1FMREaC006105;
	Fri, 15 Feb 2013 16:27:14 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1FMREnj004730;
	Fri, 15 Feb 2013 16:27:14 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 15 Feb 2013 16:27:14 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r1FMREKx007906;
	Fri, 15 Feb 2013 16:27:14 -0600
Date: Fri, 15 Feb 2013 17:27:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <fcooperjr27@gmail.com>
Message-ID: <20130215222713.GC26343@edge>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
	<1360629979-24789-17-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1360629979-24789-17-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 17/18] tisdk-image: Add support for new toolchain sdk structure
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
X-List-Received-Date: Fri, 15 Feb 2013 22:27:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 11, 2013 at 06:46:18PM -0600, fcooperjr27@gmail.com wrote:
> From: Franklin S. Cooper Jr <fcooper@ti.com>
> 
> * Previous the toolchain sdk was delivered as a simple tar.gz file that
>   could be extracted.
> * Now the toolchain sdk needs to be installed via a self contained script
>   installer that provides alot more flexibility.
> * Need to tweak this class to reflect this change.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/classes/tisdk-image.bbclass |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
> index c2f93e2..b08f93b 100644
> --- a/meta-arago-distro/classes/tisdk-image.bbclass
> +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> @@ -478,6 +478,11 @@ do_sdk_image () {
>  
>  	mkdir -p ${IMAGE_ROOTFS}/etc
>  
> +    chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk-${SDK_ARCH}*
> +
> +    # Temporarily extract the toolchain sdk so we can read license information from it.
> +    echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk-${SDK_ARCH}*

Why not use -y and -d path?

${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk-${SDK_ARCH}* -y -d "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}"


>      # Creat the base SDK image
>  	rootfs_${IMAGE_PKGTYPE}_do_rootfs
>  
> @@ -562,6 +567,14 @@ do_sdk_image () {
>      # Create the TI software manifest
>      generate_sw_manifest
>  
> +    # Delete installed toolchain sdk since we need the toolchain sdk installer
> +    # not the extracted version
> +    rm -rf ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}
> +
> +    # Copy over the toolchain sdk installer an give it a simple name which
> +    # matches the traditional name within the SDK.
> +    cp ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk-${SDK_ARCH}* ${IMAGE_ROOTFS}/linux-devkit.sh
> +
>      # Copy the opkg.conf used by the image to allow for future updates
>      cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
>  
> @@ -574,6 +587,11 @@ do_sdk_image () {
>      ${@get_imagecmds(d)}
>  }
>  
> +license_create_manifest() {
> +    # Override license_create_manifest and do nothing
> +    echo ""

Usually you'd use colon ":" for noop command:

blah() {
	:
}


> +}
> +
>  EXPORT_FUNCTIONS do_sdk_image
>  addtask sdk_image before do_build after do_install
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

