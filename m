Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 967095296D
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 15:09:35 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9NF9WU3029675
	for <meta-arago@arago-project.org>; Tue, 23 Oct 2012 10:09:32 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9NF9VnS030275
	for <meta-arago@arago-project.org>; Tue, 23 Oct 2012 10:09:31 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Tue, 23 Oct 2012 10:09:30 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH 1/2] tisdk-image: class for making TI SDK images
Thread-Index: AQHNsJ6WuLzWPyLRK0O+AMd37aLymZfG/3fQ
Date: Tue, 23 Oct 2012 15:09:29 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101592787B1@DLEE12.ent.ti.com>
References: <1350942337-26956-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1350942337-26956-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: AB9y Aj/q CfhI DTmq EMSt EXRS Ecw+ Evfj GNhU G14f HV12
	HZhk ICMl INbb JlYZ KTw8; 1;
	bQBlAHQAYQAtAGEAcgBhAGcAbwBAAGEAcgBhAGcAbwAtAHAAcgBvAGoAZQBjAHQALgBvAHIAZwA=;
	Sosha1_v1; 7; {D3B9253C-098A-48F9-B55C-56C2291CDBFF};
	YwBoAGEAcwBlAC4AbQBhAHUAcABpAG4AQAB0AGkALgBjAG8AbQA=; Tue,
	23 Oct 2012 15:09:26 GMT;
	UgBFADoAIABbAFAAQQBUAEMASAAgADEALwAyAF0AIAB0AGkAcwBkAGsALQBpAG0AYQBnAGUAOgAgAGMAbABhAHMAcwAgAGYAbwByACAAbQBhAGsAaQBuAGcAIABUAEkAIABTAEQASwAgAGkAbQBhAGcAZQBzAA==
x-cr-puzzleid: {D3B9253C-098A-48F9-B55C-56C2291CDBFF}
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] tisdk-image: class for making TI SDK images
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
X-List-Received-Date: Tue, 23 Oct 2012 15:09:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I will submit a new version based on the latest arago toolchain updates tod=
ay.

> -----Original Message-----
> From: Maupin, Chase
> Sent: Monday, October 22, 2012 4:46 PM
> To: meta-arago@arago-project.org
> Cc: Maupin, Chase
> Subject: [PATCH 1/2] tisdk-image: class for making TI SDK images
>=20
> * This class handles packaging the following pieces into a single
>   tarball to be installed by InstallJammer as the TI SDK:
>     * source components using the sourceipk functionality
>     * target file systems
>     * cross compile toolchain
>     * TI style software manifest
> * Additional features/files that are not controlled via recipes
>   can be pulled in optionally using the value set for
>   EXTRA_TISDK_FILES.  These files are placed in the SDK according
>   to the directory structure defined in the EXTRA_TISDK_FILES
>   directory.
> * This class is intended to make building TI SDKs simpler and
> more
>   consistent across teams.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta-arago-distro/classes/tisdk-image.bbclass |  587
> +++++++++++++++++++++++++
>  1 files changed, 587 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/classes/tisdk-image.bbclass
>=20
> diff --git a/meta-arago-distro/classes/tisdk-image.bbclass
> b/meta-arago-distro/classes/tisdk-image.bbclass
> new file mode 100644
> index 0000000..854aee6
> --- /dev/null
> +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> @@ -0,0 +1,587 @@
> +inherit rootfs_ipk
> +inherit image_types
> +
> +# This defines the list of features that we want to include in
> the SDK
> +# image.  The list of packages this will be installed for each
> features
> +# is controlled with the PACKAGE_GROUP_<feature> settings below.
> +IMAGE_FEATURES ?=3D ""
> +IMAGE_FEATURES[type] =3D "list"
> +
> +# Always add the sdk_base feature
> +IMAGE_FEATURES_prepend =3D "sdk_base package-management"
> +
> +# Define our always included sdk package group as the
> IMAGE_INSTALL settings
> +# like you would expect.
> +PACKAGE_GROUP_sdk_base =3D "${IMAGE_INSTALL}"
> +
> +# Create the list of packages to be installed
> +PACKAGE_INSTALL =3D "${@'
> '.join(oe.packagegroup.required_packages('${IMAGE_FEATURES}'.spli
> t(), d))}"
> +
> +RDEPENDS +=3D "${@'
> '.join(oe.packagegroup.active_packages('${IMAGE_FEATURES}'.split(
> ), d))}"
> +
> +# "export IMAGE_BASENAME" not supported at this time
> +IMAGE_BASENAME[export] =3D "1"
> +
> +# SDK images are unique to a machine
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +# List of target side images to be built and packaged.  By
> default take
> +# the base image but this can be modified if desired to package
> +# additional images.
> +TARGET_IMAGES ?=3D "arago-base-tisdk-image"
> +
> +# path to install the meta-toolchain package in the SDK
> +TISDK_TOOLCHAIN_PATH ?=3D "linux-devkit"
> +
> +# meta toolchain recipe to build and package as part of the
> tisdk image
> +TISDK_TOOLCHAIN ?=3D "meta-toolchain-arago"
> +
> +# List of the type of target file system images we want to
> include
> +TARGET_IMAGE_TYPES ?=3D "tar.bz2 ubi"
> +
> +# If EXTRA_TISDK_FILES points to a valid directory then all the
> contents
> +# of that directory will be added to the SDK using the same
> directory
> +# structure found inside of the EXTRA_TISDK_FILES directory.
> +# This can be set in the recipe or from the command line as long
> as
> +# the variable is in the BB_ENV_EXTRAWHITE list.
> +EXTRA_TISDK_FILES ?=3D ""
> +
> +# Manifest file location which will be created as part of the
> image build
> +# process.
> +# This manifest follows the TI manifest format requirements
> which is why
> +# it differs from some of the default manifest code in oe-core.
> +SW_MANIFEST_FILE ?=3D "${IMAGE_ROOTFS}/docs/software_manifest.htm"
> +
> +# helper function for generating a set of strings based on a
> list.  Taken
> +# from the image.bbclass.
> +def string_set(iterable):
> +    return ' '.join(set(iterable))
> +
> +# Add a dependency for the do_rootfs function that will force us
> to build
> +# the TARGET_IMAGES first so that they will be available for
> packaging.
> +do_sdk_image[depends] +=3D "${@string_set('%s:do_rootfs' % pn for
> pn in (d.getVar("TARGET_IMAGES", True) or "").split())}"
> +
> +# Add a dependency for the do_populate_sdk function of the
> TIDSK_TOOLCHAIN
> +# variable which will force us to build the toolchain first so
> that it will be
> +# available for packaging
> +do_sdk_image[depends] +=3D "${@string_set('%s:do_populate_sdk' %
> pn for pn in (d.getVar("TISDK_TOOLCHAIN", True) or "").split())}"
> +
> +do_sdk_image[nostamp] =3D "1"
> +do_sdk_image[lockfiles] +=3D "${IMAGE_ROOTFS}.lock"
> +do_sdk_image[cleandirs] +=3D "${S}"
> +
> +# Call the cleanup_host_packes to remove packages that should be
> removed from
> +# the host for various reasons.  This may include licensing
> issues as well.
> +OPKG_POSTPROCESS_COMMANDS =3D "cleanup_host_packages;
> cleanup_toolchain_packages; "
> +
> +# List of packages to remove from the SDK host package set
> +HOST_CLEANUP_PACKAGES ?=3D ""
> +
> +# List of packages to remove from the SDK toolchain package set
> +TOOLCHAIN_CLEANUP_PACKAGES ?=3D ""
> +
> +# Remove any packages that may have been pulled in by other
> package installs
> +# that are not desired.  This should be used with caution.
> +cleanup_host_packages() {
> +    if [ "${HOST_CLEANUP_PACKAGES}" !=3D "" ]
> +    then
> +        opkg-cl ${IPKG_ARGS} --force-depends remove
> ${HOST_CLEANUP_PACKAGES}
> +    fi
> +}
> +
> +# Remove undesired packages that may be pulled into the
> toolchain by -dev
> +# package dependencies.  This is usually GPLv3 components.
> +cleanup_toolchain_packages() {
> +    if [ "${TOOLCHAIN_CLEANUP_PACKAGES}" !=3D "" ]
> +    then
> +        # Make sure the TISDK_TOOLCHAIN_PATH is valid
> +        if [ ! -d ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH} ]
> +        then
> +            echo "Could not find the TISDK_TOOLCHAIN_PATH
> (${TISDK_TOOLCHAIN_PATH})"
> +            return 1
> +        fi
> +
> +        # Clean up the native side of the toolchain
> +        opkg_dir=3D"`ls
> ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots | grep
> ${SDKMACHINE}-*`"
> +        opkg_conf=3D"${opkg_dir}/etc/opkg-sdk.conf"
> +        opkg-cl -o
> ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/$opkg_dir -f
> ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/$opkg_conf --
> force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
> +
> +        # Clean up the target side of the toolchain
> +        opkg_dir=3D"`ls
> ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots | grep
> ${TARGET_ARCH}*`"
> +        opkg_conf=3D"${opkg_dir}/etc/opkg.conf"
> +        opkg-cl -o
> ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/$opkg_dir -f
> ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/$opkg_conf --
> force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
> +    fi
> +}
> +
> +# Copy log_check from image.bbclass since the
> rootfs_ipk_do_rootfs function
> +# uses it, but we are not inheriting the full image class.
> +log_check() {
> +	for target in $*
> +	do
> +		lf_path=3D"${WORKDIR}/temp/log.do_$target.${PID}"
> +
> +		echo "log_check: Using $lf_path as logfile"
> +
> +		if test -e "$lf_path"
> +		then
> +			${IMAGE_PKGTYPE}_log_check $target $lf_path
> +		else
> +			echo "Cannot find logfile [$lf_path]"
> +		fi
> +		echo "Logfile is clean"
> +	done
> +}
> +
> +# Generate the header for a TI style software manifest
> +sw_manifest_header() {
> +echo "
> +<HTML>
> +<HEAD>
> +<TITLE>
> +${MACHINE} TISDK ${SDK_VERSION} Installation Summary
> +</TITLE>
> +</HEAD>
> +<BODY>
> +<h1><CENTER> ${MACHINE} TISDK ${SDK_VERSION} Software Manifest
> </CENTER></h1>
> +<h2><CENTER> `date +"%B %d, %Y"` </CENTER></h2>
> +<h2><b><u>Legend (explanation of the fields in the Manifest
> Table below)</u></b></h2>
> +<table border=3D1 width=3D45%>
> +<tr>
> +    <td>Software Name</td>
> +    <td>The name of the application or files</td>
> +</tr>
> +<tr>
> +    <td>Version</td>
> +    <td>Version of the application or files</td>
> +</tr>
> +<tr>
> +    <td>License Type</td>
> +    <td>Type of license(s) under which TI will be providing
> software to the licensee (e.g. BSD, GPLv2, TI TSPA License, TI
> Commercial License).  See Open Source Reference License
> Disclaimer in the Disclaimers Section.</td>
> +</tr>
> +<tr>
> +    <td>Location</td>
> +    <td>The directory name and path on the media (or in an
> archive) where the Package is located.</td>
> +</tr>
> +<tr>
> +    <td>Delivered As</td>
> +    <td>This field will either be &ldquo;Source&rdquo;,
> &ldquo;Binary&rdquo; or &ldquo;Source and Binary&ldquo; and is
> the form the content of the Package is delivered in.  If the
> Package is delivered in an archive format, this field applies to
> the contents of the archive. If the word Limited is used with
> Source, as in &ldquo;Limited Source&rdquo; or &ldquo;Limited
> Source and Binary&rdquo; then only portions of the Source for the
> application are provided.</td>
> +</tr>
> +<tr>
> +    <td>Modified by TI</td>
> +    <td>This field will either be &ldquo;Yes&rdquo; or
> &ldquo;No&rdquo;. A &ldquo;Yes&rdquo; means TI had made changes
> to the Software. A &ldquo;No&rdquo; means TI has not made any
> changes.  NOTE: This field is not applicable for Software
> &ldquo;Obtained from&rdquo; TI.</td>
> +</tr>
> +<tr>
> +    <td>Obtained from</td>
> +    <td>This field specifies from where or from whom TI obtained
> the Software. It may be a URL to an Open Source site, a 3rd party
> companylicensor, or TI (if TI developed the software). If this
> field contains a link to an Open Source software, the date it was
> downloaded is also recorded.  See Links Disclaimer in the
> Disclaimers Section.</td>
> +</tr>
> +</table>
> +
> +
> +<h2><b>DISCLAIMERS</b></h2>
> +<h2><u>Export Control Classification Number (ECCN)</u></h2>
> +<p>
> +Any use of ECCNs listed in the Manifest is at the user's risk
> and without recourse to TI.  Your company, as the exporter of
> record, is responsible for determining the correct classification
> of any item at the time of export.  Any export classification by
> TI of Software is for TI's internal use only and shall not be
> construed as a representation or warranty regarding the proper
> export classification for such Software or whether an export
> license or other documentation is required for exporting such
> Software.
> +</p>
> +
> +<h2><u>Links in the Manifest</u></h2>
> +<p>
> +Any links appearing on this Manifest (for example in the
> &ldquo;Obtained from&rdquo field) were verified at the time the
> Manifest was created.  TI makes no guarantee that any listed
> links will remain active in the future.
> +</p>
> +
> +<h2><u>Open Source License References</u></h2>
> +<p>
> +Your company is responsible for confirming the applicable
> license terms for any open source Software listed in this
> Manifest that was not &ldquo;Obtained from&rdquo TI.  Any open
> source license specified in this Manifest for Sotware that was
> not &ldquo;Obtained from&rdquo TI is for TI's internal use only
> and shall not be construed as a representation of warranty
> regarding the proper open source license terms for such Software.
> +</p>
> +
> +<h2><b>Export Information</b></h2>
> +<p>
> +ECCN for Software included in this release: 5D002
> +</p>
> +
> +<p>
> +ECCN for Technology (e.g., user documentation, specifications)
> included in this release: 5D002
> +</p>
> +
> +<h2><b>Manifest</b></h2>
> +<p>
> +See Legend above for a description of the columns and possible
> values.
> +</p>
> +" > ${SW_MANIFEST_FILE}
> +}
> +
> +sw_manifest_footer() {
> +echo "
> +<h2>Credits</h2>
> +
> +<h2>Licenses</h2>
> +<p>Licenses can be found in the \"docs/licenses\" directory of
> the SDK install directory</p>
> +
> +<h2><u><b>GCC RUNTIME LIBRARY EXCEPTION</b></u></h2>
> +<p>Version 3.1, 31 March 2009</p>
> +
> +<p>Copyright =C2=A9 2009 Free Software Foundation, Inc. <a
> href=3D\"http://fsf.org/\">http://fsf.org/</a></p>
> +
> +<p>Everyone is permitted to copy and distribute verbatim copies
> of this license document, but changing it is not allowed.</p>
> +
> +<p>This GCC Runtime Library Exception ("Exception") is an
> additional permission under section 7 of the GNU General Public
> License, version 3 ("GPLv3"). It applies to a given file (the
> "Runtime Library") that bears a notice placed by the copyright
> holder of the file stating that the file is governed by GPLv3
> along with this Exception.</p>
> +
> +<p>When you use GCC to compile a program, GCC may combine
> portions of certain GCC header files and runtime libraries with
> the compiled program. The purpose of this Exception is to allow
> compilation of non-GPL (including proprietary) programs to use,
> in this way, the header files and runtime libraries covered by
> this Exception.</p>
> +
> +<h3><b>0. Definitions.</b></h3>
> +<p>A file is an "Independent Module" if it either requires the
> Runtime Library for execution after a Compilation Process, or
> makes use of an interface provided by the Runtime Library, but is
> not otherwise based on the Runtime Library.</p>
> +
> +<p>"GCC" means a version of the GNU Compiler Collection, with or
> without modifications, governed by version 3 (or a specified
> later version) of the GNU General Public License (GPL) with the
> option of using any subsequent versions published by the FSF.</p>
> +
> +<p>"GPL-compatible Software" is software whose conditions of
> propagation, modification and use would permit combination with
> GCC in accord with the license of GCC.</p>
> +
> +<p>"GPL-compatible Software" is software whose conditions of
> propagation, modification and use would permit combination with
> GCC in accord with the license of GCC.</p>
> +
> +<p>The "Compilation Process" transforms code entirely
> represented in non-intermediate languages designed for human-
> written code, and/or in Java Virtual Machine byte code, into
> Target Code. Thus, for example, use of source code generators and
> preprocessors need not be considered part of the Compilation
> Process, since the Compilation Process can be understood as
> starting with the output of the generators or preprocessors.</p>
> +
> +<p>A Compilation Process is "Eligible" if it is done using GCC,
> alone or with other GPL-compatible software, or if it is done
> without using any work based on GCC. For example, using non-GPL-
> compatible Software to optimize any GCC intermediate
> representations would not qualify as an Eligible Compilation
> Process.</p>
> +
> +<h3><b>1. Grant of Additional Permission.</b></h3>
> +<p>You have permission to propagate a work of Target Code formed
> by combining the Runtime Library with Independent Modules, even
> if such propagation would otherwise violate the terms of GPLv3,
> provided that all Target Code was generated by Eligible
> Compilation Processes. You may then convey such a combination
> under terms of your choice, consistent with the licensing of the
> Independent Modules.</p>
> +
> +<h3><b>2. No Weakening of GCC Copyleft.</b></h3>
> +<p>The availability of this Exception does not imply any general
> presumption that third-party software is unaffected by the
> copyleft requirements of the license of GCC.</p>
> +
> +<hr>
> +<right> <i><font color=3Dgrey>Auto generated by TISDK installer on
> `date`</i> </right></font>
> +</body>
> +</html>
> +
> +" >> ${SW_MANIFEST_FILE}
> +}
> +
> +# Create the host side toolchain components table
> +sw_manifest_toolchain_host() {
> +
> opkg_dir=3D"${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/`ls
> ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots | grep
> ${SDKMACHINE}-*`/var/lib/opkg/info"
> +
> +echo "
> +<h2><u>Development Host Content</u></h2>
> +<p>This table describes any software being delivered that is
> expected to run on a Development Host, instead of the target
> device.  Some of this software may be licensed under GPLv3 but it
> is not expected to be shipped as a product.</p>
> +" >> ${SW_MANIFEST_FILE}
> +
> +    generate_sw_manifest_table $opkg_dir
> +
> +}
> +
> +# Create the target side toolchain components table.  These are
> components on
> +# the host but intended for the target.
> +sw_manifest_toolchain_target() {
> +
> opkg_dir=3D"${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/`ls
> ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots | grep
> ${TARGET_ARCH}*`/var/lib/opkg/info"
> +
> +    generate_sw_manifest_table $opkg_dir
> +}
> +
> +# Create the table of GPLv3 components found in the target file
> system
> +sw_manifest_target_gplv3() {
> +    opkg_dir=3D"$1"
> +
> +echo "
> +<h2><u>GPLv3 Target Device Content</u></h2>
> +
> +<p>This table describes any GPLv3 software being delivered that
> is expected to run on the target device.</p>
> +
> +" >> ${SW_MANIFEST_FILE}
> +
> +    generate_sw_manifest_table $opkg_dir "true"
> +}
> +
> +# Generate the full target file system components table.
> +sw_manifest_target() {
> +    # Extract the combined set of .control files from the
> TARGET_IMAGES in
> +    # the filesystem directory to generate the manifest.
> +    for image in ${TARGET_IMAGES}
> +    do
> +        # Only extract tar.gz or tar.bz2 types
> +        if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-
> ${MACHINE}.tar.bz2 ]
> +        then
> +            tar xjf ${IMAGE_ROOTFS}/filesystem/${image}-
> ${MACHINE}.tar.bz2 -C ${IMAGE_ROOTFS}/filesystem --wildcards
> *.control
> +        elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-
> ${MACHINE}.tar.gz ]
> +        then
> +            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-
> ${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards
> *.control
> +        fi
> +    done
> +
> +    # set the opkg_dir value to look at the extracted target
> file system
> +    # image files
> +    opkg_dir=3D"${IMAGE_ROOTFS}/filesystem/var/lib/opkg/info"
> +
> +    sw_manifest_target_gplv3 $opkg_dir
> +
> +echo "
> +<h2><u>All Target Device Content</u></h2>
> +
> +<p>This table describes any software being delivered that is
> expected to run on the target device.</p>
> +
> +" >> ${SW_MANIFEST_FILE}
> +
> +    generate_sw_manifest_table $opkg_dir
> +
> +    # Remove the temporary var directory that was extracted
> +    rm -rf ${IMAGE_ROOTFS}/filesystem/var
> +}
> +
> +# Create the table of host components installed.
> +sw_manifest_host() {
> +echo "
> +<h2><u>Additional Development Host Content</u></h2>
> +
> +<p>This table describes software that is installed on the
> development host but is not part of the linux-devkit package.
> This is usually software example sources or tools such a flash
> utilities.</p>
> +
> +" >> ${SW_MANIFEST_FILE}
> +
> +    opkg_dir=3D"${IMAGE_ROOTFS}/var/lib/opkg/info"
> +
> +    generate_sw_manifest_table $opkg_dir
> +}
> +
> +# This function expects to be passed the following parameter
> +#   - The location to the opkg info directory containing the
> control files
> +#     of the installed packages
> +# Optionally if the second parameter is set to true then only
> GPLv3 contents
> +# will be listed.  This is for TI SW Manifests where GPLv3
> content is
> +# highlighted as a separate table.
> +generate_sw_manifest_table() {
> +    control_dir=3D"$1"
> +    gplv3_only=3D"$2"
> +
> +    if [ ! -d "$control_dir" ]
> +    then
> +        echo "Could not find the control directory
> ($control_dir)"
> +        return 1
> +    fi
> +
> +    if [ "$gplv3_only" =3D=3D "" ]
> +    then
> +        # The second parameter was not passed so set to false
> +        gplv3_only=3D"false"
> +    fi
> +
> +echo "
> +<table border=3D1 cellspacing=3D1 cellpadding=3D1 width=3D80%>
> +<tr bgcolor=3D#c0c0c0  color=3Dwhite>
> +    <td><b>Software Name</b></td>
> +    <td><b>Version</b></td>
> +    <td><b>License</b></td>
> +    <td><b>Location</b></td>
> +    <td><b>Delivered As</b></td>
> +    <td><b>Modified by TI</b></td>
> +    <td><b>Obtained from</b></td>
> +</tr>
> +" >> ${SW_MANIFEST_FILE}
> +
> +    for i in $control_dir/*.control
> +    do
> +        package=3D"`cat $i | grep Package: | awk {'print $2'}`"
> +        version=3D"`cat $i | grep Version: | awk {'print $2'} |
> cut -f1-2 -d-`"
> +        long_version=3D"`cat $i | grep Version: | awk {'print
> $2'}`"
> +        license=3D"`cat $i | grep License: | cut -d: -f2 `"
> +        architecture=3D"`cat $i | grep Architecture: | awk {'print
> $2'}`"
> +        sources=3D"`cat $i | grep Source: | cut -d ':' -f2-`"
> +
> location=3D"$package""_""$long_version""_""$architecture"".ipk"
> +
> +        # Set the highlight color if the license in GPLv3.  If
> this is
> +        # a GPLv3 only table then skip this package.
> +        case "$license" in
> +            *GPLv3*)
> +                highlight=3D"bgcolor=3Dyellow" ;;
> +            *unknown*)
> +                if [ "$gplv3_only" !=3D "true" ]
> +                then
> +                    highlight=3D"bgcolor=3Dyellow"
> +                else
> +                    continue
> +                fi
> +                ;;
> +            *)
> +                if [ "$gplv3_only" !=3D "true" ]
> +                then
> +                    highlight=3D""
> +                else
> +                    continue
> +                fi
> +                ;;
> +        esac
> +
> +        # source variable contains the text to be used in the
> manifest
> +        source=3D""
> +        # Are there additional files in the package that come
> from the
> +        # arago/OE metadata?
> +        extra_files=3D"0"
> +        modified=3D"No"
> +        for s in $sources
> +        do
> +            case "$s" in
> +                file://*)
> +                    extra_files=3D"1"
> +                    ;;
> +                http://install.source.dir.local*)
> +                    # If we are pulling something from a local
> file system then
> +                    # it is not a public modification and this
> should be marked
> +                    # as modified.  This should not be the
> normal case.
> +                    modified=3D"Yes"
> +                    ;;
> +                *)
> +                    source=3D"$source""<a href=3D$s>$s</a>";;
> +            esac
> +        done
> +
> +        if [ "$extra_files" =3D=3D "1" ]
> +        then
> +            source=3D"$source"" <br>Files from:<br><a
> href=3Dgit://arago-project.org/git/meta-arago.git>git://arago-
> project.org/git/meta-arago.git</a><br><a href=3Dgit://arago-
> project.org/git/meta-ti.git>git://arago-project.org/git/meta-
> ti.git</a>"
> +        fi
> +
> +        case "$package" in
> +            task-*)
> +                continue ;;
> +            *-src*)
> +                delivered_as=3D"Source"
> +                ;;
> +            *)
> +                delivered_as=3D"Binary"
> +                ;;
> +        esac
> +
> +echo "
> +<tr>
> +    <td>${package} </td>
> +    <td>${version}</td>
> +    <td $highlight>${license}</td>
> +    <td>${location}</td>
> +    <td>${delivered_as}</td>
> +    <td>${modified}</td>
> +    <td>${source}</td>
> +</tr>
> +" >> ${SW_MANIFEST_FILE}
> +
> +    done
> +
> +    echo "</table><br><br>" >> ${SW_MANIFEST_FILE}
> +}
> +
> +# Generate the TI SW Manifest for the SDK image
> +generate_sw_manifest() {
> +    sw_manifest_header
> +    sw_manifest_toolchain_host
> +    sw_manifest_target
> +    sw_manifest_host
> +    sw_manifest_toolchain_target
> +    sw_manifest_footer
> +}
> +
> +# Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs
> functionality
> +# to install a given list of packages using opkg.
> +do_sdk_image () {
> +	set -x
> +	rm -rf ${IMAGE_ROOTFS}
> +	mkdir -p ${IMAGE_ROOTFS}
> +	mkdir -p ${DEPLOY_DIR_IMAGE}
> +
> +	mkdir -p ${IMAGE_ROOTFS}/etc
> +
> +    # Extract the toolchain SDK here so that it will be
> available when the
> +    # OPKG_POSTPROCESS_COMMANDS are run
> +    tar xjf ${DEPLOY_DIR}/sdk/oecore-${SDKMACHINE}*-arago-* -C
> ${IMAGE_ROOTFS}/
> +    mkdir -p ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}
> +    mv ${IMAGE_ROOTFS}/usr/local/oecore-${SDKMACHINE}/*
> ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}
> +    rm -rf ${IMAGE_ROOTFS}/usr
> +
> +    # Creat the base SDK image
> +	rootfs_${IMAGE_PKGTYPE}_do_rootfs
> +
> +    mkdir -p ${IMAGE_ROOTFS}/filesystem
> +
> +    # Copy the TARGET_IMAGES to the sdk image before packaging
> +    for image in ${TARGET_IMAGES}
> +    do
> +        for type in ${TARGET_IMAGE_TYPES}
> +        do
> +            if [ -e ${DEPLOY_DIR_IMAGE}/${image}-
> ${MACHINE}.${type} ]
> +            then
> +                cp ${DEPLOY_DIR_IMAGE}/${image}-
> ${MACHINE}.${type} ${IMAGE_ROOTFS}/filesystem/
> +            fi
> +        done
> +    done
> +
> +    # Copy the pre-built images for kernel and boot loaders
> +    prebuilt_dir=3D"${IMAGE_ROOTFS}/board-support/prebuilt-images"
> +    if [ ! -e "${prebuilt_dir}" ]
> +    then
> +        mkdir -p ${prebuilt_dir}
> +    fi
> +
> +    # Copy the U-Boot image if it exists
> +    if [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.img ]
> +    then
> +        cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.img
> ${prebuilt_dir}/
> +    elif [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin ]
> +    then
> +        cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin
> ${prebuilt_dir}/
> +    else
> +        echo "Could not find the u-boot image"
> +        return 1
> +    fi
> +
> +    # Copy the Kernel image if it exists
> +    if [ -e ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.bin ]
> +    then
> +        cp ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.bin
> ${prebuilt_dir}/
> +    else
> +        echo "Could not find the Kernel image"
> +        return 1
> +    fi
> +
> +    # Copy the MLO image if it exists
> +    if [ -e ${DEPLOY_DIR_IMAGE}/MLO-${MACHINE} ]
> +    then
> +        cp ${DEPLOY_DIR_IMAGE}/MLO-${MACHINE} ${prebuilt_dir}/
> +    else
> +        echo "Could not find the MLO image"
> +        return 1
> +    fi
> +
> +    # Add the EXTRA_TISDK_FILES contents if they exist
> +    # Make sure EXTRA_TISDK_FILES is not empty so we don't
> accidentaly
> +    # copy the root directory.
> +    # Use -L to copy the actual contents of symlinks instead of
> just
> +    # the links themselves
> +    if [ "${EXTRA_TISDK_FILES}" !=3D "" ]
> +    then
> +        if [ -d "${EXTRA_TISDK_FILES}" ]
> +        then
> +            cp -rLf ${EXTRA_TISDK_FILES}/* ${IMAGE_ROOTFS}/
> +        fi
> +    fi
> +
> +    # Copy the licenses directory in the $DEPLOY_DIR to capture
> all
> +    # the licenses that were used in the build.
> +    if [ -d ${DEPLOY_DIR}/licenses ]
> +    then
> +        if [ ! -d ${IMAGE_ROOTFS}/docs ]
> +        then
> +            mkdir -p ${IMAGE_ROOTFS}/docs
> +        fi
> +        cp -rf ${DEPLOY_DIR}/licenses ${IMAGE_ROOTFS}/docs/
> +    fi
> +
> +    # Create the TI software manifest
> +    generate_sw_manifest
> +
> +    # Copy the opkg.conf used by the image to allow for future
> updates
> +    cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
> +
> +    # Move the var/etc directories which contains the opkg data
> used for the
> +    # manifest (and maybe one day for online updates) to a
> hidden directory.
> +    mv ${IMAGE_ROOTFS}/var ${IMAGE_ROOTFS}/.var
> +    mv ${IMAGE_ROOTFS}/etc ${IMAGE_ROOTFS}/.etc
> +
> +    # Create the image directory symlinks
> +    ${@get_imagecmds(d)}
> +}
> +
> +EXPORT_FUNCTIONS do_sdk_image
> +addtask sdk_image before do_build after do_install
> +
> --
> 1.7.0.4


