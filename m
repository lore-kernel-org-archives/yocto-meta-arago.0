Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8392552A70
	for <meta-arago@arago-project.org>;
	Wed,  2 Jul 2014 13:27:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s62DRTrD018213;
	Wed, 2 Jul 2014 08:27:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62DRTv6016110;
	Wed, 2 Jul 2014 08:27:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 2 Jul 2014 08:27:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62DRSBS011684;
	Wed, 2 Jul 2014 08:27:29 -0500
Date: Wed, 2 Jul 2014 09:27:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140702132728.GM15788@edge>
References: <1404242399-15206-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6D8314@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015D108C96@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D108C96@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] tisdk-image.bbclass: update for the new rootfs/image infrastructure
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
X-List-Received-Date: Wed, 02 Jul 2014 13:27:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 02, 2014 at 01:00:17PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Tuesday, July 01, 2014 4:10 PM
> >To: Denys Dmytriyenko; meta-arago@arago-project.org
> >Subject: Re: [meta-arago] [PATCH] tisdk-image.bbclass: update for
> >the new rootfs/image infrastructure
> >
> >Thanks for this!
> >Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> >
> >> -----Original Message-----
> >> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >> Sent: Tuesday, July 01, 2014 2:20 PM
> >> To: meta-arago@arago-project.org
> >> Subject: [meta-arago] [PATCH] tisdk-image.bbclass: update for
> >the new
> >> rootfs/image infrastructure
> >>
> >> From: Denys Dmytriyenko <denys@ti.com>
> >>
> >> The entire rootfs/image processing infrastructure was rewritten
> >in Python for
> >> Daisy release. Since tisdk_image class is based on rootfs/image
> >base classes
> >> and uses their APIs, some adjustments are required in order for
> >it to work.
> >>
> >> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> ---
> >>  meta-arago-distro/classes/tisdk-image.bbclass | 83
> >+++++++++++++--------------
> >>  1 file changed, 39 insertions(+), 44 deletions(-)
> >>
> >> diff --git a/meta-arago-distro/classes/tisdk-image.bbclass
> >b/meta-arago-
> >> distro/classes/tisdk-image.bbclass
> >> index b100261..6023d6b 100644
> >> --- a/meta-arago-distro/classes/tisdk-image.bbclass
> >> +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> >> @@ -65,18 +65,18 @@ def string_set(iterable):
> >>
> >>  # Add a dependency for the do_rootfs function that will force
> >us to build  #
> >> the TARGET_IMAGES first so that they will be available for
> >packaging.
> >> -do_sdk_image[depends] += "${@string_set('%s:do_rootfs' % pn for
> >pn in
> >> (d.getVar("TARGET_IMAGES", True) or "").split())}"
> >> +do_rootfs[depends] += "${@string_set('%s:do_rootfs' % pn for pn
> >in
> >> (d.getVar("TARGET_IMAGES", True) or "").split())}"
> >>
> >>  # Add a dependency for the do_populate_sdk function of the
> >> TIDSK_TOOLCHAIN  # variable which will force us to build the
> >toolchain first so
> >> that it will be  # available for packaging -
> >do_sdk_image[depends] +=
> >> "${@string_set('%s:do_populate_sdk' % pn for pn in
> >> (d.getVar("TISDK_TOOLCHAIN", True) or "").split())}"
> >> +do_rootfs[depends] += "${@string_set('%s:do_populate_sdk' % pn
> >for pn in
> >> (d.getVar("TISDK_TOOLCHAIN", True) or "").split())}"
> >>
> >> -do_sdk_image[nostamp] = "1"
> >> -do_sdk_image[lockfiles] += "${IMAGE_ROOTFS}.lock"
> >> -do_sdk_image[cleandirs] += "${S}"
> >> +do_rootfs[nostamp] = "1"
> >> +do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
> >> +do_rootfs[cleandirs] += "${S}"
> >>
> >> -# Call the cleanup_host_packes to remove packages that should
> >be removed
> >> from
> >> +# Call the cleanup_host_packages to remove packages that should
> >be
> >> +removed from
> >>  # the host for various reasons.  This may include licensing
> >issues as well.
> >>  OPKG_POSTPROCESS_COMMANDS = "cleanup_host_packages; "
> >>
> >> @@ -92,25 +92,6 @@ cleanup_host_packages() {
> >>      fi
> >>  }
> >>
> >> -# Copy log_check from image.bbclass since the
> >rootfs_ipk_do_rootfs function
> >> -# uses it, but we are not inheriting the full image class.
> >> -log_check() {
> >> -	for target in $*
> >> -	do
> >> -		lf_path="${WORKDIR}/temp/log.do_$target.${PID}"
> >> -
> >> -		echo "log_check: Using $lf_path as logfile"
> >> -
> >> -		if test -e "$lf_path"
> >> -		then
> >> -			${IMAGE_PKGTYPE}_log_check $target $lf_path
> >> -		else
> >> -			echo "Cannot find logfile [$lf_path]"
> >> -		fi
> >> -		echo "Logfile is clean"
> >> -	done
> >> -}
> >> -
> >>  # Generate the header for a TI style software manifest
> >>  sw_manifest_header() {
> >>  echo "
> >> @@ -235,7 +216,7 @@ echo "
> >>
> >>  # Create the host side toolchain components table
> >>  sw_manifest_toolchain_host() {
> >> -
> >opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/i686-*-
> >> linux/var/lib/opkg/info"
> >> +
> >opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/i686-*-
> >> linux/var/lib/opkg"
> >>
> >>  echo "
> >>  <h2><u>GPLv3 Development Host Content</u></h2> @@ -471,24
> >+452,43
> >> @@ generate_sw_manifest() {
> >>      sw_manifest_footer
> >>  }
> >>
> >> +ROOTFS_PREPROCESS_COMMAND += "tisdk_image_setup; "
> >> +ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build; "
> >> +IMAGE_PREPROCESS_COMMAND += "tisdk_image_cleanup; "
> >> +
> >>  # Create the SDK image.  We will re-use the
> >rootfs_ipk_do_rootfs
> >> functionality  # to install a given list of packages using opkg.
> >> -do_sdk_image () {
> >> -	set -x
> >> -	rm -rf ${IMAGE_ROOTFS}
> >> -	mkdir -p ${IMAGE_ROOTFS}
> >> -	mkdir -p ${DEPLOY_DIR_IMAGE}
> >> +fakeroot python do_rootfs () {
> >> +    from oe.rootfs import create_rootfs
> >> +    from oe.image import create_image
> >> +    from oe.manifest import create_manifest
> >> +
> >> +    # generate the initial manifest
> >> +    create_manifest(d)
> 
> What about the generate_sw_manifest function?

What about it? It's still there. I haven't validated all the licenses and 
other data in the manifest, but it looks reasonable on the first pass.


> Overall I think this is a step in the right direction though, so ACK for 
> this patch.  Just curious if we should expect more.

Yeah, I tried to minimize the impact as much as possible. But overall, it's 
still rather hacky...


> >> +
> >> +    # generate rootfs
> >> +    create_rootfs(d)
> >> +
> >> +    # generate final images
> >> +    create_image(d)
> >> +}
> >> +
> >> +tisdk_image_setup () {
> >> +    set -x
> >> +    rm -rf ${IMAGE_ROOTFS}
> >> +    mkdir -p ${IMAGE_ROOTFS}
> >> +    mkdir -p ${DEPLOY_DIR_IMAGE}
> >>
> >> -	mkdir -p ${IMAGE_ROOTFS}/etc
> >> +    mkdir -p ${IMAGE_ROOTFS}/etc
> >> +    mkdir -p ${IMAGE_ROOTFS}/var/lib/opkg
> >>
> >>      chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-
> >> ${TARGET_OS}-tisdk*
> >>
> >>      # Temporarily extract the toolchain sdk so we can read
> >license information
> >> from it.
> >>      echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" |
> >> ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*
> >> +}
> >>
> >> -    # Creat the base SDK image
> >> -	rootfs_${IMAGE_PKGTYPE}_do_rootfs
> >> -
> >> +tisdk_image_build () {
> >>      mkdir -p ${IMAGE_ROOTFS}/filesystem
> >>
> >>      # Copy the TARGET_IMAGES to the sdk image before packaging
> >@@ -
> >> 607,23 +607,18 @@ do_sdk_image () {
> >>
> >>      # Copy the opkg.conf used by the image to allow for future
> >updates
> >>      cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
> >> +}
> >>
> >> +tisdk_image_cleanup () {
> >>      # Move the var/etc directories which contains the opkg data
> >used for the
> >>      # manifest (and maybe one day for online updates) to a
> >hidden directory.
> >>      mv ${IMAGE_ROOTFS}/var ${IMAGE_ROOTFS}/.var
> >>      mv ${IMAGE_ROOTFS}/etc ${IMAGE_ROOTFS}/.etc
> >> -
> >> -    # Create the image directory symlinks
> >> -    # $ { @ get_imagecmds(d) }
> >>  }
> >>
> >>  license_create_manifest() {
> >>      :
> >>  }
> >>
> >> -rootfs_install_complementary() {
> >> -    :
> >> -}
> >> -
> >> -EXPORT_FUNCTIONS do_sdk_image
> >> -addtask sdk_image before do_build after do_install
> >> +EXPORT_FUNCTIONS do_rootfs
> >> +addtask rootfs before do_build after do_install
> >> --
> >> 2.0.0
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

