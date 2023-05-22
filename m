Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AC3C7EE2A
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 18:38:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3159.1684780734310351217
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 11:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Chk+8o45;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MIcpIP041731;
	Mon, 22 May 2023 13:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684780731;
	bh=k/gVlZXaXP6oBfXnWJ1ygABhNXioyBHZX80Y45jRv1Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Chk+8o45Sy/4+zjEFQ2qlmZH7/QngYOWIYcH6FTB7QlieRBg3vxFhzbMrPzqSOHIS
	 YsdqzBVMdkStRvz8Y0KLpdG7Sl3VnaniiGaiFETPNUCa2UBinWN6R1FwMWHnhO+jsm
	 GzKYaW5ZARbLtYzdy/kkgrCkFuevY1N/h2Ocb/H4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MIcprj116881
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 13:38:51 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 13:38:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 13:38:51 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MIcnoF092240;
	Mon, 22 May 2023 13:38:51 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master][PATCH 3/3] all: remove all legacy arago-sdk build recipes
Date: Mon, 22 May 2023 13:38:47 -0500
Message-ID: <20230522183847.3663294-4-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522183847.3663294-1-rs@ti.com>
References: <20230522183847.3663294-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 34MIcpIP041731
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 18:38:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14433

From: Randolph Sapp <rs@ti.com>

Remove all the legacy arago-sdk build recipies, groups, targets, etc.
All of this can be replaced by using the Yocto Standard SDK build
target:

	bitbake tisdk-default-image -c populate_sdk

For more info about the SDK build targets see:
https://docs.yoctoproject.org/sdk-manual/appendix-obtain.html#building-an=
-sdk-installer

There's probably still more that can be cleaned up, but I'll leave that
to the more experienced.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../classes/tisdk-bundle.bbclass              | 928 ------------------
 .../recipes-core/images/arago-image.inc       |   1 -
 .../recipes-core/images/tisdk-core-bundle.bb  |  19 -
 .../recipes-core/images/tisdk-core-bundle.inc |  39 -
 .../packagegroup-arago-gst-sdk-target.bb      |  28 -
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  76 --
 ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |  18 -
 ...oup-arago-tisdk-connectivity-sdk-target.bb |  27 -
 ...kagegroup-arago-tisdk-crypto-sdk-target.bb |  14 -
 ...gegroup-arago-tisdk-graphics-sdk-target.bb |  15 -
 ...packagegroup-arago-tisdk-gtk-sdk-target.bb |  11 -
 ...group-arago-tisdk-multimedia-sdk-target.bb |  30 -
 ...kagegroup-arago-tisdk-opencl-sdk-target.bb |  22 -
 ...ckagegroup-arago-toolchain-tisdk-target.bb |  28 -
 .../opencl-examples-rtos_git.bbappend         |   6 -
 .../oe-layersetup/oe-layersetup.bb            |  13 -
 .../ti-tisdk-setup/ti-tisdk-setup.bb          |  59 --
 .../tisdk-install/sdk-install.sh              | 129 ---
 .../tisdk-install/tisdk-install_1.0.bb        |  15 -
 .../tisdk-readme/tisdk-readme.bb              |  22 -
 .../tisdk-readme/tisdk-readme/README          |  22 -
 .../tisdk-readme/tisdk-readme/k3/README       |  26 -
 .../unshallow-repositories.sh                 | 110 ---
 .../unshallow-repositories_1.0.bb             |  16 -
 ...nativesdk-packagegroup-arago-tisdk-host.bb |  39 -
 25 files changed, 1713 deletions(-)
 delete mode 100644 meta-arago-distro/classes/tisdk-bundle.bbclass
 delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-core-bund=
le.bb
 delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-core-bund=
le.inc
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-gst-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-addons-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-amsdk-sdk-host.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-connectivity-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-crypto-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-graphics-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-gtk-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-multimedia-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-opencl-sdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-toolchain-tisdk-target.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examp=
les-rtos_git.bbappend
 delete mode 100644 meta-arago-distro/recipes-tisdk/oe-layersetup/oe-laye=
rsetup.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tis=
dk-setup.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-i=
nstall/sdk-install.sh
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-i=
nstall_1.0.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-re=
adme.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-re=
adme/README
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-re=
adme/k3/README
 delete mode 100755 meta-arago-distro/recipes-tisdk/unshallow-repositorie=
s/unshallow-repositories/unshallow-repositories.sh
 delete mode 100644 meta-arago-distro/recipes-tisdk/unshallow-repositorie=
s/unshallow-repositories_1.0.bb
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/nativesd=
k-packagegroup-arago-tisdk-host.bb

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-=
distro/classes/tisdk-bundle.bbclass
deleted file mode 100644
index b92ca0c0..00000000
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ /dev/null
@@ -1,928 +0,0 @@
-inherit rootfs_ipk
-inherit image
-inherit image_types
-
-# This defines the list of features that we want to include in the SDK
-# image.  The list of packages this will be installed for each features
-# is controlled with the FEATURE_PACKAGES_<feature> settings below.
-IMAGE_FEATURES ?=3D ""
-IMAGE_FEATURES[type] =3D "list"
-
-# Always add the sdk_base feature
-IMAGE_FEATURES:prepend =3D "sdk_base package-management "
-SDKIMAGE_FEATURES:prepend =3D "package-management "
-
-# Define our always included sdk package group as the IMAGE_INSTALL sett=
ings
-# like you would expect.
-FEATURE_PACKAGES_sdk_base =3D "${IMAGE_INSTALL}"
-
-# Create the list of packages to be installed
-PACKAGE_INSTALL =3D "${@' '.join(oe.packagegroup.required_packages('${IM=
AGE_FEATURES}'.split(), d))}"
-
-RDEPENDS:${PN} +=3D "${@' '.join(oe.packagegroup.active_packages('${IMAG=
E_FEATURES}'.split(), d))}"
-
-# "export IMAGE_BASENAME" not supported at this time
-IMAGE_BASENAME[export] =3D "1"
-
-# SDK images are unique to a machine
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-# List of target side images to be built and packaged.  By default take
-# the base image but this can be modified if desired to package
-# additional images.
-TARGET_IMAGES ?=3D "tisdk-base-image"
-
-# path to install the meta-toolchain package in the SDK
-TISDK_TOOLCHAIN_PATH ?=3D "linux-devkit"
-
-# meta toolchain recipe to build and package as part of the tisdk image
-TISDK_TOOLCHAIN ?=3D "meta-toolchain-arago"
-TOOLCHAIN_SUFFIX ?=3D "-sdk"
-
-# List of the type of target file system images we want to include
-TARGET_IMAGE_TYPES ?=3D "tar.xz tar.gz ubi wic.gz wic.xz"
-
-# If EXTRA_TISDK_FILES points to a valid directory then all the contents
-# of that directory will be added to the SDK using the same directory
-# structure found inside of the EXTRA_TISDK_FILES directory.
-# This can be set in the recipe or from the command line as long as
-# the variable is in the BB_ENV_PASSTHROUGH_ADDITIONS list.
-EXTRA_TISDK_FILES ?=3D ""
-
-# Variable to specify the name of SPL
-DEPLOY_SPL_NAME ?=3D "MLO-${MACHINE}"
-
-# Add generic method of adding prebuilt-images
-DEPLOY_IMAGES_NAME ?=3D ""
-
-# Variable to specify the name of SPL/UART
-DEPLOY_SPL_UART_NAME ?=3D "u-boot-spl.bin-${MACHINE}"
-
-# Variable to specify the name of the TI SCI firmware
-DEPLOY_TISCI_FW_NAME ?=3D ""
-
-# Manifest file location which will be created as part of the image buil=
d
-# process.
-# This manifest follows the TI manifest format requirements which is why
-# it differs from some of the default manifest code in oe-core.
-SW_MANIFEST_FILE ?=3D "${IMAGE_ROOTFS}/docs/software_manifest.htm"
-SW_MANIFEST_TEXT ?=3D "${IMAGE_ROOTFS}/docs/software_manifest.txt"
-
-# helper function for generating a set of strings based on a list.  Take=
n
-# from the image.bbclass.
-def string_set(iterable):
-    return ' '.join(set(iterable))
-
-# Add a dependency for the do_rootfs function that will force us to buil=
d
-# the TARGET_IMAGES first so that they will be available for packaging.
-do_rootfs[depends] +=3D "${@string_set('%s:do_image_complete' % pn for p=
n in (d.getVar("TARGET_IMAGES") or "").split())}"
-
-# Add a dependency for the do_populate_sdk function of the TIDSK_TOOLCHA=
IN
-# variable which will force us to build the toolchain first so that it w=
ill be
-# available for packaging
-do_rootfs[depends] +=3D "${@string_set('%s:do_populate_sdk' % pn for pn =
in (d.getVar("TISDK_TOOLCHAIN") or "").split())}"
-
-do_rootfs[nostamp] =3D "1"
-do_rootfs[lockfiles] +=3D "${IMAGE_ROOTFS}.lock"
-do_rootfs[cleandirs] +=3D "${S}"
-
-# Call the cleanup_host_packages to remove packages that should be remov=
ed from
-# the host for various reasons.  This may include licensing issues as we=
ll.
-OPKG_POSTPROCESS_COMMANDS =3D "cleanup_host_packages; "
-
-# List of packages to remove from the SDK host package set
-HOST_CLEANUP_PACKAGES ?=3D ""
-
-# Remove any packages that may have been pulled in by other package inst=
alls
-# that are not desired.  This should be used with caution.
-cleanup_host_packages() {
-    if [ "${HOST_CLEANUP_PACKAGES}" !=3D "" ]
-    then
-        opkg ${IPKG_ARGS} --force-depends remove ${HOST_CLEANUP_PACKAGES=
}
-    fi
-}
-
-# Generate the header for a TI style software manifest
-sw_manifest_header() {
-echo "
-<HTML>
-<HEAD>
-<TITLE>
-${MACHINE} TISDK ${SDK_VERSION} Installation Summary=20
-</TITLE>
-</HEAD>
-<BODY>
-<h1><CENTER> ${MACHINE} TISDK ${SDK_VERSION} Software Manifest </CENTER>=
</h1>
-<h2><CENTER> `date +"%B %d, %Y"` </CENTER></h2>
-<h2><b><u>Legend (explanation of the fields in the Manifest Table below)=
</u></b></h2>
-<table border=3D1 width=3D45%>
-<tr>
-    <td>Software Name</td>
-    <td>The name of the application or files</td>
-</tr>
-<tr>
-    <td>Version</td>
-    <td>Version of the application or files</td>
-</tr>
-<tr>
-    <td>License Type</td>
-    <td>Type of license(s) under which TI will be providing software to =
the licensee (e.g. BSD, GPLv2, TI TSPA License, TI Commercial License).  =
See Open Source Reference License Disclaimer in the Disclaimers Section.<=
/td>
-</tr>
-<tr>
-    <td>Location</td>
-    <td>The directory name and path on the media (or in an archive) wher=
e the Package is located.</td>
-</tr>
-<tr>
-    <td>Delivered As</td>
-    <td>This field will either be &ldquo;Source&rdquo;, &ldquo;Binary&rd=
quo; or &ldquo;Source and Binary&ldquo; and is the form the content of th=
e Package is delivered in.  If the Package is delivered in an archive for=
mat, this field applies to the contents of the archive. If the word Limit=
ed is used with Source, as in &ldquo;Limited Source&rdquo; or &ldquo;Limi=
ted Source and Binary&rdquo; then only portions of the Source for the app=
lication are provided.</td>
-</tr>
-<tr>
-    <td>Modified by TI</td>
-    <td>This field will either be &ldquo;Yes&rdquo; or &ldquo;No&rdquo;.=
 A &ldquo;Yes&rdquo; means TI had made changes to the Software. A &ldquo;=
No&rdquo; means TI has not made any changes.  NOTE: This field is not app=
licable for Software &ldquo;Obtained from&rdquo; TI.</td>
-</tr>
-<tr>
-    <td>Obtained from</td>
-    <td>This field specifies from where or from whom TI obtained the Sof=
tware. It may be a URL to an Open Source site, a 3rd party companylicenso=
r, or TI (if TI developed the software). If this field contains a link to=
 an Open Source software, the date it was downloaded is also recorded.  S=
ee Links Disclaimer in the Disclaimers Section.</td>
-</tr>
-</table>
-
-
-<h2><b>DISCLAIMERS</b></h2>
-<h2><u>Export Control Classification Number (ECCN)</u></h2>
-<p>
-Any use of ECCNs listed in the Manifest is at the user's risk and withou=
t recourse to TI.  Your company, as the exporter of record, is responsibl=
e for determining the correct classification of any item at the time of e=
xport.  Any export classification by TI of Software is for TI's internal =
use only and shall not be construed as a representation or warranty regar=
ding the proper export classification for such Software or whether an exp=
ort license or other documentation is required for exporting such Softwar=
e.
-</p>
-
-<h2><u>Links in the Manifest</u></h2>
-<p>
-Any links appearing on this Manifest (for example in the &ldquo;Obtained=
 from&rdquo; field) were verified at the time the Manifest was created.  =
TI makes no guarantee that any listed links will remain active in the fut=
ure.
-</p>
-
-<h2><u>Open Source License References</u></h2>
-<p>
-Your company is responsible for confirming the applicable license terms =
for any open source Software listed in this Manifest that was not &ldquo;=
Obtained from&rdquo; TI.  Any open source license specified in this Manif=
est for Sotware that was not &ldquo;Obtained from&rdquo; TI is for TI's i=
nternal use only and shall not be construed as a representation of warran=
ty regarding the proper open source license terms for such Software.
-</p>
-
-<h2><b>Export Information</b></h2>
-<p>
-ECCN for Software included in this release: Publicly Available
-</p>
-
-<p>
-ECCN for Technology (e.g., user documentation, specifications) included =
in this release: Publicly Available
-</p>
-
-<h2><b>Manifest</b></h2>
-<p>
-See Legend above for a description of the columns and possible values.
-</p>
-" > ${SW_MANIFEST_FILE}
-
-cat > ${SW_MANIFEST_TEXT} << 'EOF'
-<--
-Manifest template 1.0
-
-This template is used to generate an unloadable manifest to the SRAS. To=
 do so, save the document as a plain text file (Save As .txt). Do not cha=
nge any options on the save which means leave the default as Windows Defa=
ult Encoding. The SRAS will generate a nice looking HTML manifest for you.
-
-Instructions:
-
- 1.   Text in blue should not be edited or removed. It will NOT appear o=
n your manifest.
- 2.   DO NOT color outside the lines in the manifest.  There are specifi=
c blocks where you enter information. Information
-       should only be entered in the sections below and not outside of t=
hem.
- 3.   DO NOT use the < or > symbols in your manifest table or in your fo=
otnotes.
- 4.   Please REFRAIN from using Word specific formatting when filling in=
 the table. Examples are things like superscripts,
-      subscripts, etc. We are unable to understand those.
- 5.   Auto correction is not your friend in word. Please turn it off. It=
 should be disabled already in this template.
-
-Table Instructions:
-
-Define what you are delivering by filling in the table below. Tables sta=
rt with the start keyword <table> end with the end keyword, </table> and =
may also contain footnotes specific to that table.
-
-You can have as many .Public. tables as you like in your manifest and ca=
n name them.  You can have one and only one .Private. table. To create ad=
ditional tables copy everything starting with <table> down to </table> an=
d then paste it after the table below.
-
-The field .attribute =3D. can be set to Public (the default) or Private =
to define the type of table it is. If the table is Public then everything=
 in the table will appear on your manifest. If the table is Private then =
none of the entries will appear on your manifest but they will be stored =
in the SRAS. Private tables are useful for documenting third party code, =
that requires Legal review, but does not need to be acknowledged on the m=
anifest you ship; e.g. it may be covered by our TI license.
-
-The field .name =3D . is used to put a heading over the table on the man=
ifest you ship.
-
-The field .description =3D. is used to put a description under the Table=
 name on the manifest you ship.
-
-To learn how to document software in the table read the instructions her=
e. A brief explanation of the table columns follows.
-License Type - If its an SPDX defined license use their short name ident=
ifier. You can see a list here: http://spdx.org/licenses/ . If it.s not o=
n the list and not a commercial or TSPA  license then use the application=
 name as the license.
-
-Delivered As - This field will either be .Source., .Binary. or .Source a=
nd Binary. and is the form the content of the Software is delivered in.  =
If the Software is delivered in an archive format, this field applies to =
the contents of the archive. If the word Limited is used with Source, as =
in .Limited Source. or .Limited Source and Binary. then only portions of =
the Source for the application are provided.
-
-Modified by TI - This field will either be .Yes. or .No.. A .Yes. means =
TI has made changes to the Software. A .No. means TI has not made any cha=
nges. Note: This field is not applicable for Software .Obtained from. TI.
-
-Location - The directory name and path on the media, e.g. drive, (or in =
an archive) where the Software is located after installing or extracting.
-
-Obtained From - This field specifies from where or from whom TI obtained=
 the Software. It may be a URL to an Open Source site, a 3rd party licens=
or, or TI (if TI developed the software). If this field contains a link t=
o Open Source software, the date TI downloaded the Software is also recor=
ded. See Links Disclaimer in the Disclaimers Section.
--->
-
-<directives>
-Version =3D .1.0.
-Sep =3D .|.
-Tool=3D.Word.
-</directives>
-
-<-- ** Do not edit or remove anything above this line **
--->
-
-<--
-Instructions: DO NOT Alter the column headings below. This is now a sing=
le row table as opposed to the older manifests which used merged rows. Th=
e order is extremely important; if you change the order or add or remove =
a column the upload will not work.
--->
-
-EOF
-
-}
-
-sw_manifest_footer() {
-echo "
-<h2>Credits</h2>
-
-<h2>Licenses</h2>
-<p>Licenses can be found in the \"docs/licenses\" directory of the SDK i=
nstall directory</p>
-
-<h2><u><b>GCC RUNTIME LIBRARY EXCEPTION</b></u></h2>
-<p>Version 3.1, 31 March 2009</p>
-
-<p>Copyright =C2=A9 2009 Free Software Foundation, Inc. <a href=3D\"http=
://fsf.org/\">http://fsf.org/</a></p>
-
-<p>Everyone is permitted to copy and distribute verbatim copies of this =
license document, but changing it is not allowed.</p>
-
-<p>This GCC Runtime Library Exception ("Exception") is an additional per=
mission under section 7 of the GNU General Public License, version 3 ("GP=
Lv3"). It applies to a given file (the "Runtime Library") that bears a no=
tice placed by the copyright holder of the file stating that the file is =
governed by GPLv3 along with this Exception.</p>
-
-<p>When you use GCC to compile a program, GCC may combine portions of ce=
rtain GCC header files and runtime libraries with the compiled program. T=
he purpose of this Exception is to allow compilation of non-GPL (includin=
g proprietary) programs to use, in this way, the header files and runtime=
 libraries covered by this Exception.</p>
-
-<h3><b>0. Definitions.</b></h3>
-<p>A file is an "Independent Module" if it either requires the Runtime L=
ibrary for execution after a Compilation Process, or makes use of an inte=
rface provided by the Runtime Library, but is not otherwise based on the =
Runtime Library.</p>
-
-<p>"GCC" means a version of the GNU Compiler Collection, with or without=
 modifications, governed by version 3 (or a specified later version) of t=
he GNU General Public License (GPL) with the option of using any subseque=
nt versions published by the FSF.</p>
-
-<p>"GPL-compatible Software" is software whose conditions of propagation=
, modification and use would permit combination with GCC in accord with t=
he license of GCC.</p>
-
-<p>"GPL-compatible Software" is software whose conditions of propagation=
, modification and use would permit combination with GCC in accord with t=
he license of GCC.</p>
-
-<p>The "Compilation Process" transforms code entirely represented in non=
-intermediate languages designed for human-written code, and/or in Java V=
irtual Machine byte code, into Target Code. Thus, for example, use of sou=
rce code generators and preprocessors need not be considered part of the =
Compilation Process, since the Compilation Process can be understood as s=
tarting with the output of the generators or preprocessors.</p>
-
-<p>A Compilation Process is "Eligible" if it is done using GCC, alone or=
 with other GPL-compatible software, or if it is done without using any w=
ork based on GCC. For example, using non-GPL-compatible Software to optim=
ize any GCC intermediate representations would not qualify as an Eligible=
 Compilation Process.</p>
-
-<h3><b>1. Grant of Additional Permission.</b></h3>
-<p>You have permission to propagate a work of Target Code formed by comb=
ining the Runtime Library with Independent Modules, even if such propagat=
ion would otherwise violate the terms of GPLv3, provided that all Target =
Code was generated by Eligible Compilation Processes. You may then convey=
 such a combination under terms of your choice, consistent with the licen=
sing of the Independent Modules.</p>
-
-<h3><b>2. No Weakening of GCC Copyleft.</b></h3>
-<p>The availability of this Exception does not imply any general presump=
tion that third-party software is unaffected by the copyleft requirements=
 of the license of GCC.</p>
-
-<hr>
-<right> <i><font color=3Dgrey>Auto generated by TISDK installer on `date=
`</i> </right></font>
-</body>
-</html>
-
-" >> ${SW_MANIFEST_FILE}
-
-
-cat >> ${SW_MANIFEST_TEXT} << 'EOF'
-<Credits>
-
-</credits>
-
-<Licenses>
-
-Licenses can be found in the "docs/licenses" directory of the SDK instal=
l directory
-GCC RUNTIME LIBRARY EXCEPTION
-
-Version 3.1, 31 March 2009
-
-Copyright =C2=A9 2009 Free Software Foundation, Inc. http://fsf.org/
-
-Everyone is permitted to copy and distribute verbatim copies of this lic=
ense document, but changing it is not allowed.
-
-This GCC Runtime Library Exception (Exception) is an additional permissi=
on under section 7 of the GNU General Public License, version 3 (GPLv3). =
It applies to a given file (the Runtime Library) that bears a notice plac=
ed by the copyright holder of the file stating that the file is governed =
by GPLv3 along with this Exception.
-
-When you use GCC to compile a program, GCC may combine portions of certa=
in GCC header files and runtime libraries with the compiled program. The =
purpose of this Exception is to allow compilation of non-GPL (including p=
roprietary) programs to use, in this way, the header files and runtime li=
braries covered by this Exception.
-0. Definitions.
-
-A file is an Independent Module if it either requires the Runtime Librar=
y for execution after a Compilation Process, or makes use of an interface=
 provided by the Runtime Library, but is not otherwise based on the Runti=
me Library.
-
-GCC means a version of the GNU Compiler Collection, with or without modi=
fications, governed by version 3 (or a specified later version) of the GN=
U General Public License (GPL) with the option of using any subsequent ve=
rsions published by the FSF.
-
-GPL-compatible Software is software whose conditions of propagation, mod=
ification and use would permit combination with GCC in accord with the li=
cense of GCC.
-
-GPL-compatible Software is software whose conditions of propagation, mod=
ification and use would permit combination with GCC in accord with the li=
cense of GCC.
-
-The Compilation Process transforms code entirely represented in non-inte=
rmediate languages designed for human-written code, and/or in Java Virtua=
l Machine byte code, into Target Code. Thus, for example, use of source c=
ode generators and preprocessors need not be considered part of the Compi=
lation Process, since the Compilation Process can be understood as starti=
ng with the output of the generators or preprocessors.
-
-A Compilation Process is Eligible if it is done using GCC, alone or with=
 other GPL-compatible software, or if it is done without using any work b=
ased on GCC. For example, using non-GPL-compatible Software to optimize a=
ny GCC intermediate representations would not qualify as an Eligible Comp=
ilation Process.
-1. Grant of Additional Permission.
-
-You have permission to propagate a work of Target Code formed by combini=
ng the Runtime Library with Independent Modules, even if such propagation=
 would otherwise violate the terms of GPLv3, provided that all Target Cod=
e was generated by Eligible Compilation Processes. You may then convey su=
ch a combination under terms of your choice, consistent with the licensin=
g of the Independent Modules.
-2. No Weakening of GCC Copyleft.
-
-The availability of this Exception does not imply any general presumptio=
n that third-party software is unaffected by the copyleft requirements of=
 the license of GCC.
-
-</licenses>
-EOF
-
-}
-
-sw_manifest_table_header() {
-    echo "
-<h2><u>$1</u></h2>
-<p>$2</p>
-" >> ${SW_MANIFEST_FILE}
-
-    cat >> ${SW_MANIFEST_TEXT} << EOF
-<table>
-<thead>
-attribute =3D "Public"
-name =3D "$1"
-description =3D "$2"
-</thead>
-
-EOF
-}
-
-sw_manifest_table_footer() {
-    if [ ! -z $1 ]; then
-        cat >> ${SW_MANIFEST_TEXT} << EOF
-<Footnotes>
-$1
-</footnotes>
-EOF
-    fi
-    cat >> ${SW_MANIFEST_TEXT} << EOF
-</table>
-
-EOF
-}
-
-# Create the host side toolchain components table
-sw_manifest_toolchain_host() {
-    opkg_dir=3D"${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/*86*-li=
nux/var/lib/opkg/info"
-
-    sw_manifest_table_header "GPLv3 Development Host Content" "This tabl=
e describes any GPLv3 software being delivered that is expected to run on=
 a Development Host, instead of the target device."
-
-    generate_sw_manifest_table $opkg_dir "true"
-
-    sw_manifest_table_footer
-
-    sw_manifest_table_header "Development Host Content" "This table desc=
ribes any software being delivered that is expected to run on a Developme=
nt Host, instead of the target device.  Some of this software may be lice=
nsed under GPLv3 but it is not expected to be shipped as a product."
-
-    generate_sw_manifest_table $opkg_dir
-
-    sw_manifest_table_footer
-}
-
-# Create the target side toolchain components table.  These are componen=
ts on
-# the host but intended for the target.
-sw_manifest_toolchain_target() {
-    opkg_dir=3D"${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/${ARMPK=
GARCH}*-linux*/var/lib/opkg/info"
-
-    sw_manifest_table_header "GPLv3 Development Libraries Installed on H=
ost" "This table describes GPLv3 software libraries and headers that are =
installed on the development host and used during the development of soft=
ware to run on the target. Customers should be careful when linking again=
st these libraries to make sure they are complying with the license(s) of=
 the library"
-
-    generate_sw_manifest_table $opkg_dir "true"
-
-    sw_manifest_table_footer
-
-    sw_manifest_table_header "Development Libraries Installed on Host" "=
This table describes software libraries and headers that are installed on=
 the development host and used during the development of software to run =
on the target.  Some of this software may be licensed under GPLv3.  Custo=
mers should be careful when linking against these libraries to make sure =
they are complying with the license(s) of the library"
-
-    generate_sw_manifest_table $opkg_dir
-
-    sw_manifest_table_footer
-}
-
-# Create the table of GPLv3 components found in the target file system
-sw_manifest_target_gplv3() {
-    opkg_dir=3D"$1"
-
-    sw_manifest_table_header "GPLv3 Target Device Content" "This table d=
escribes any GPLv3 software being delivered that is expected to run on th=
e target device."
-
-    generate_sw_manifest_table $opkg_dir "true"
-
-    sw_manifest_table_footer
-}
-
-# Generate the full target file system components table.
-sw_manifest_target() {
-    # Extract the combined set of .control files from the TARGET_IMAGES =
in
-    # the filesystem directory to generate the manifest.
-    for image in ${TARGET_IMAGES}
-    do
-        # Only extract tar.gz or tar.bz2 types
-        if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
-        then
-            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.x=
z -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
-        elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz =
]
-        then
-            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.g=
z -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
-        fi
-    done
-
-    # set the opkg_dir value to look at the extracted target file system
-    # image files
-    opkg_dir=3D"${IMAGE_ROOTFS}/filesystem/var/lib/opkg/info"
-
-    sw_manifest_target_gplv3 $opkg_dir
-
-    sw_manifest_table_header "All Target Device Content" "This table des=
cribes any software being delivered that is expected to run on the target=
 device."
-
-    generate_sw_manifest_table $opkg_dir
-
-    sw_manifest_table_footer
-
-    # Remove the temporary var directory that was extracted
-    rm -rf ${IMAGE_ROOTFS}/filesystem/var
-}
-
-# Create the table of host components installed.
-sw_manifest_host() {
-    sw_manifest_table_header "Additional Development Host Content" "This=
 table describes software that is installed on the development host but i=
s not part of the linux-devkit package.  This is usually software example=
 sources or tools such a flash utilities."
-
-    opkg_dir=3D"${IMAGE_ROOTFS}/var/lib/opkg/info"
-
-    generate_sw_manifest_table $opkg_dir
-
-    sw_manifest_table_footer
-}
-
-# Use the recipe-data class to collect SRC_URI for the manifest.
-#
-# While this will need to be globally INHERIT'd to work properly, inheri=
t
-# locally so that parsing does not fail.
-inherit recipe-data
-
-# Instead of re-adding the do_rootfs task, re-add the do_emit_recipe_dat=
a_all
-#  task to run before do_rootfs.
-deltask do_emit_recipe_data_all
-
-# There seems to be something special with the rootfs task and task depe=
ndencies
-# are not working as expected, so use the install task instead.
-addtask emit_recipe_data_all after do_emit_recipe_data before do_install
-
-get_sources_from_recipe(){
-    [ ! -z "$1" ] || return 0
-
-    # Check if a full URL is given (e.g. ipks from sourceipk class)
-    if [ $(echo "$1" | grep -c '://') -gt 0 ]
-    then
-        echo "$1"
-        return 0
-    fi
-
-    # Now assume that this was created by the package_ipk class
-
-    # Cannot assume that recipe filename is ${PN}_${PV}.bb
-    # This is easily seen with BBCLASSEXTEND recipes.
-    for pn in $(sed -ne 's|FILE_pn-\([^ \t=3D]*\)[ \t]*=3D[ \t]*".*/'$1'=
".*|\1|p' "${RECIPE_DATA_FILE}")
-    do
-        # Only need a single PN incase there are native, nativesdk, targ=
et variants.
-        break
-    done
-
-    recipe_data_get_var_sh "$pn" "SRC_URI"
-}
-
-# This function expects to be passed the following parameter
-#   - The location to the opkg info directory containing the control fil=
es
-#     of the installed packages
-# Optionally if the second parameter is set to true then only GPLv3 cont=
ents
-# will be listed.  This is for TI SW Manifests where GPLv3 content is
-# highlighted as a separate table.
-generate_sw_manifest_table() {
-    control_dir=3D"$1"
-    gplv3_only=3D"$2"
-
-    # Call this here so that the function gets added to the task script
-    get_sources_from_recipe
-
-    if [ ! -d "$control_dir" ]
-    then
-        echo "Could not find the control directory ($control_dir)"
-        return 1
-    fi
-
-    if [ "$gplv3_only" =3D "" ]
-    then
-        # The second parameter was not passed so set to false
-        gplv3_only=3D"false"
-    fi
-
-echo "
-<table border=3D1 cellspacing=3D1 cellpadding=3D1 width=3D80%>
-<tr bgcolor=3D#c0c0c0  color=3Dwhite>
-    <td><b>Software Name</b></td>
-    <td><b>Version</b></td>
-    <td><b>License</b></td>
-    <td><b>Location</b></td>
-    <td><b>Delivered As</b></td>
-    <td><b>Modified by TI</b></td>
-    <td><b>Obtained from</b></td>
-</tr>
-" >> ${SW_MANIFEST_FILE}
-
-cat >> ${SW_MANIFEST_TEXT} << EOF
-<tbody>
-<!-- Software Name
-| Version
-| License Type
-| Delivered As
-| Modified by TI
-| Location
-| Obtained from -->
-
-EOF
-
-    control_files_there=3D0
-    for possible_control_file in $control_dir/*.control
-    do
-        if [ -f $possible_control_file ]
-        then
-            control_files_there=3D1
-            break
-        fi
-    done
-
-    if [ $control_files_there -eq 0 ]
-    then
-        for pkg_idx in $control_dir/oe*; do
-            package_start=3D`grep -n "^Package" $pkg_idx || true`
-
-            IFS_OLD=3D${IFS}
-            IFS=3D"
-"
-
-            begin=3D""
-            end=3D""
-            for pkg in ${package_start}; do
-                end=3D`echo $pkg | cut -d: -f1`
-
-                if [ -z $begin ]; then
-                    pkg_name=3D`echo $pkg | cut -d: -f3`
-                    begin=3D`echo $pkg | cut -d: -f1`
-                    continue
-                fi
-                cnt=3D$[$cnt+1]
-                head -n $[$end - 1] $pkg_idx | tail -n $[$end - $begin] =
> ${control_dir}/${pkg_name// /}.control
-
-                pkg_name=3D`echo $pkg | cut -d: -f3`
-                begin=3D$end
-            done
-            if [ ! -z $end ]; then
-                end=3D`wc -l $pkg_idx | awk '{ print $1 }'`
-                end=3D$[$end + 1]
-                tail -n $[$end - $begin] $pkg_idx > ${control_dir}/${pkg=
_name// /}.control
-            fi
-
-            IFS=3D${IFS_OLD}
-        done
-    fi
-
-    for i in $control_dir/*.control
-    do
-        package=3D"`cat $i | grep Package: | awk {'print $2'}`"
-        version=3D"`cat $i | grep Version: | awk {'print $2'} | cut -f1-=
2 -d-`"
-        long_version=3D"`cat $i | grep Version: | awk {'print $2'}`"
-        license=3D"`cat $i | grep License: | cut -d: -f2 `"
-        architecture=3D"`cat $i | grep Architecture: | awk {'print $2'}`=
"
-        recipe=3D"`cat $i | grep Source: | cut -d ':' -f2-`"
-        sources=3D"`get_sources_from_recipe $recipe`"
-        location=3D"$package""_""$long_version""_""$architecture"".ipk"
-
-        # Set the highlight color if the license in GPLv3.  If this is
-        # a GPLv3 only table then skip this package.
-        case "$license" in
-            *GPLv3*)
-                highlight=3D"bgcolor=3Dyellow" ;;
-            *unknown*)
-                if [ "$gplv3_only" !=3D "true" ]
-                then
-                    highlight=3D"bgcolor=3Dyellow"
-                else
-                    continue
-                fi
-                ;;
-            *)
-                if [ "$gplv3_only" !=3D "true" ]
-                then
-                    highlight=3D""
-                else
-                    continue
-                fi
-                ;;
-        esac
-
-        # source variable contains the text to be used in the manifest
-        source=3D""
-        # Are there additional files in the package that come from the
-        # arago/OE metadata?
-        extra_files=3D"0"
-        modified=3D"No"
-        for s in $sources
-        do
-            case "$s" in
-                file://*)
-                    extra_files=3D"1"
-                    ;;
-                http://install.source.dir.local*)
-                    # If we are pulling something from a local file syst=
em then
-                    # it is not a public modification and this should be=
 marked
-                    # as modified.  This should not be the normal case.
-                    modified=3D"Yes"
-                    ;;
-                *)
-                    source=3D"$source""<a href=3D$s>$s</a>";;
-            esac
-        done
-
-        if [ "$extra_files" =3D "1" ]
-        then
-            source=3D"$source"" <br>Files from:<br><a href=3Dhttps://git=
.yoctoproject.org/meta-arago>https://git.yoctoproject.org/meta-arago</a><=
br><a href=3Dhttps://git.yoctoproject.org/meta-ti>https://git.yoctoprojec=
t.org/meta-ti</a>"
-        fi
-
-        case "$package" in
-            task-*)
-                continue ;;
-            *-source*)
-                delivered_as=3D"Source"
-                ;;
-            *)
-                delivered_as=3D"Binary"
-                ;;
-        esac
-
-echo "
-<tr>
-    <td>${package} </td>
-    <td>${version}</td>
-    <td $highlight>${license}</td>
-    <td>${location}</td>
-    <td>${delivered_as}</td>
-    <td>${modified}</td>
-    <td>${source}</td>
-</tr>
-" >> ${SW_MANIFEST_FILE}
-
-cat >> ${SW_MANIFEST_TEXT} << EOF
-| ${package} | ${version} | ${license} | ${delivered_as} | ${modified} |=
 ${location} | ${source}
-EOF
-    done
-
-    echo "</table><br><br>" >> ${SW_MANIFEST_FILE}
-
-cat >> ${SW_MANIFEST_TEXT} << EOF
-</tbody>
-
-EOF
-
-}
-# Generate the TI SW Manifest for the SDK image
-generate_sw_manifest() {
-    sw_manifest_header
-    if [ "${TISDK_TOOLCHAIN}" !=3D "" ]
-    then
-        sw_manifest_toolchain_host
-    fi
-    sw_manifest_target
-    sw_manifest_host
-    if [ "${TISDK_TOOLCHAIN}" !=3D "" ]
-    then
-        sw_manifest_toolchain_target
-    fi
-    sw_manifest_footer
-}
-
-ROOTFS_PREPROCESS_COMMAND +=3D "tisdk_image_setup; "
-ROOTFS_POSTPROCESS_COMMAND +=3D "tisdk_image_build; "
-IMAGE_PREPROCESS_COMMAND:append =3D "tisdk_image_cleanup; "
-
-# Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs functio=
nality
-# to install a given list of packages using opkg.
-fakeroot python do_rootfs () {
-    from oe.rootfs import create_rootfs
-    from oe.manifest import create_manifest
-
-    # generate the initial manifest
-    create_manifest(d)
-
-    # generate rootfs
-    create_rootfs(d)
-}
-
-fakeroot python do_image () {
-    from oe.utils import execute_pre_post_process
-
-    pre_process_cmds =3D d.getVar("IMAGE_PREPROCESS_COMMAND")
-
-    execute_pre_post_process(d, pre_process_cmds)
-}
-do_image[dirs] =3D "${TOPDIR}"
-do_image[umask] =3D "022"
-addtask do_image after do_rootfs before do_build
-
-fakeroot python do_image_complete () {
-    from oe.utils import execute_pre_post_process
-
-    post_process_cmds =3D d.getVar("IMAGE_POSTPROCESS_COMMAND")
-
-    execute_pre_post_process(d, post_process_cmds)
-}
-do_image_complete[dirs] =3D "${TOPDIR}"
-do_image_complete[umask] =3D "022"
-addtask do_image_complete after do_image before do_build
-
-tisdk_image_setup () {
-    set -x
-    rm -rf ${IMAGE_ROOTFS}
-    mkdir -p ${IMAGE_ROOTFS}
-    mkdir -p ${DEPLOY_DIR_IMAGE}
-
-    mkdir -p ${IMAGE_ROOTFS}/etc
-    mkdir -p ${IMAGE_ROOTFS}/var/lib/opkg
-    mkdir -p ${IMAGE_ROOTFS}/lib
-
-    if [ -e ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TO=
OLCHAIN_SUFFIX}.sh ]
-    then
-        chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_O=
S}${TOOLCHAIN_SUFFIX}*.sh
-
-        # Temporarily extract the toolchain sdk so we can read license i=
nformation from it.
-        echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${DEPLOY_DIR}/s=
dk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}*.sh
-    fi
-}
-
-tisdk_image_build () {
-    mkdir -p ${IMAGE_ROOTFS}/filesystem
-
-    # Copy the TARGET_IMAGES to the sdk image before packaging
-    for image in ${TARGET_IMAGES}
-    do
-        for type in ${TARGET_IMAGE_TYPES}
-        do
-            if [ -e ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.${type} ]
-            then
-                cp ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.${type} ${IMA=
GE_ROOTFS}/filesystem/
-            fi
-        done
-    done
-
-    # Copy the pre-built images for kernel and boot loaders
-    prebuilt_dir=3D"${IMAGE_ROOTFS}/board-support/prebuilt-images"
-    if [ ! -e "${prebuilt_dir}" ]
-    then
-        mkdir -p ${prebuilt_dir}
-    fi
-
-    # Copy the U-Boot image if it exists
-    if [ -e ${DEPLOY_DIR_IMAGE}/u-boot.img ]
-    then
-        cp ${DEPLOY_DIR_IMAGE}/u-boot.img ${prebuilt_dir}/
-    elif [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin ]
-    then
-        cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin ${prebuilt_dir}/
-    elif [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.ais ]
-    then
-        cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.ais ${prebuilt_dir}/
-    else
-        echo "Could not find the u-boot image"
-        return 1
-    fi
-
-    # Copy the Kernel image if it exists
-    if [ -e ${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin ]
-    then
-        cp ${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin ${prebuilt_dir}/
-    elif [ -e ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.bin ]
-    then
-        cp ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.bin ${prebuilt_dir}/
-    elif [ -e ${DEPLOY_DIR_IMAGE}/Image-${MACHINE}.bin ]
-    then
-        cp ${DEPLOY_DIR_IMAGE}/Image-${MACHINE}.bin ${prebuilt_dir}/
-    else
-        echo "Could not find the Kernel image"
-        return 1
-    fi
-
-    # Copy the DTB files if they exist.
-    # NOTE: For simplicity remove the uImage- prefix on the dtb files.  =
Get
-    # just the symlink files for a cleaner name.  Use the DTB_FILTER var=
iable
-    # to allow finding the dtb files for only that MACHINE type
-    # NOTE: The DTB_FILTER variable is interpreted as a regex which mean=
s
-    #       that for cases where the DTB files to be selected do not hav=
e
-    #       a common naming you can use something line filter1\|filter2 =
which
-    #       will be interpreted as an "or" and allow matching both expre=
ssions.
-    #       The \| is important for delimiting these values.
-    if [ "${DTB_FILTER}" !=3D "unknown" ]
-    then
-        for f in `find ${DEPLOY_DIR_IMAGE} -type l -regex ".*\(${DTB_FIL=
TER}\).*\.dtbo?"`
-        do
-            dtb_file=3D`basename $f | sed s/.Image-//`
-            cp $f ${prebuilt_dir}/${dtb_file}
-        done
-    fi
-
-    for spl_name in ${DEPLOY_SPL_NAME}
-    do
-        # Copy the SPL image if it exists
-        if [ -e ${DEPLOY_DIR_IMAGE}/$spl_name ]
-        then
-            cp ${DEPLOY_DIR_IMAGE}/$spl_name ${prebuilt_dir}/
-        else
-            echo "Could not find the SPL image \"$spl_name\""
-            return 1
-        fi
-    done
-
-    for image_name in ${DEPLOY_IMAGES_NAME}
-    do
-        if [ -e ${DEPLOY_DIR_IMAGE}/$image_name ]
-        then
-            cp ${DEPLOY_DIR_IMAGE}/$image_name ${prebuilt_dir}/
-        else
-            echo "Could not find image \"$image_name\""
-            return 1
-        fi
-    done
-
-    if [ "${DEPLOY_SPL_UART_NAME}" !=3D "" ]
-    then
-        # Copy the SPL/UART image if it exists
-        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_SPL_UART_NAME} ]
-        then
-            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_SPL_UART_NAME} ${prebuilt_di=
r}/
-        fi
-    fi
-
-    # Copy TI SCI firmware if it exists
-    if [ "${DEPLOY_TISCI_FW_NAME}" !=3D "" ]
-    then
-        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_TISCI_FW_NAME} ]
-        then
-            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_TISCI_FW_NAME} ${prebuilt_di=
r}/
-        fi
-    fi
-
-    # Add the EXTRA_TISDK_FILES contents if they exist
-    # Make sure EXTRA_TISDK_FILES is not empty so we don't accidentaly
-    # copy the root directory.
-    # Use -L to copy the actual contents of symlinks instead of just
-    # the links themselves
-    if [ "${EXTRA_TISDK_FILES}" !=3D "" ]
-    then
-        if [ -d "${EXTRA_TISDK_FILES}" ]
-        then
-            cp -rLf ${EXTRA_TISDK_FILES}/* ${IMAGE_ROOTFS}/
-        fi
-    fi
-
-    # Copy the licenses directory in the $DEPLOY_DIR to capture all
-    # the licenses that were used in the build.
-    if [ -d ${DEPLOY_DIR}/licenses ]
-    then
-        if [ ! -d ${IMAGE_ROOTFS}/docs ]
-        then
-            mkdir -p ${IMAGE_ROOTFS}/docs
-        fi
-        cp -rf ${DEPLOY_DIR}/licenses ${IMAGE_ROOTFS}/docs/
-    fi
-
-    # Create the TI software manifest
-    generate_sw_manifest
-
-    # Delete installed toolchain sdk since we need the toolchain sdk ins=
taller
-    # not the extracted version
-    rm -rf ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}
-
-    # Copy over the toolchain sdk installer an give it a simple name whi=
ch
-    # matches the traditional name within the SDK.
-    if [ -e ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TO=
OLCHAIN_SUFFIX}.sh ]
-    then
-        cp ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOO=
LCHAIN_SUFFIX}.sh ${IMAGE_ROOTFS}/linux-devkit.sh
-    fi
-
-    # Copy the opkg.conf used by the image to allow for future updates
-    cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
-}
-
-TISDK_IMAGE_CLEANUP_DIRS ?=3D "var etc lib boot dev home media mnt proc =
run sbin sys tmp usr"
-TISDK_IMAGE_CLEANUP_FILES ?=3D "bin/bash bin/bash.bash bin/sh"
-
-tisdk_image_cleanup () {
-    # Some extra files are now pulled in by the general image class, so =
remove
-    # them.
-    for file in ${TISDK_IMAGE_CLEANUP_FILES}
-    do
-        [ ! -f ${IMAGE_ROOTFS}/$file ] || rm -f ${IMAGE_ROOTFS}/$file
-    done
-
-    # Move the var/etc directories which contains the opkg data used for=
 the
-    # manifest (and maybe one day for online updates) to a hidden direct=
ory.
-    for dir in ${TISDK_IMAGE_CLEANUP_DIRS}
-    do
-        [ ! -d ${IMAGE_ROOTFS}/$dir ] || mv ${IMAGE_ROOTFS}/$dir ${IMAGE=
_ROOTFS}/.$dir
-    done
-}
-
-license_create_manifest() {
-    :
-}
-
-EXPORT_FUNCTIONS do_rootfs
-addtask rootfs before do_build after do_install
diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta=
-arago-distro/recipes-core/images/arago-image.inc
index d00c1f70..5bb3a8a9 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -19,7 +19,6 @@ export IMAGE_BASENAME =3D "arago-image"
=20
 IMAGE_LINGUAS =3D ""
=20
-TOOLCHAIN_HOST_TASK:append =3D " nativesdk-buildtools-perl-dummy"
 SDK_PACKAGE_ARCHS +=3D "buildtools-dummy-${SDKPKGSUFFIX}"
=20
 BAD_RECOMMENDATIONS +=3D " \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b=
/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
deleted file mode 100644
index bf7ed2d4..00000000
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY =3D "Installer package for TI SDK - NOT for direct use on target=
"
-
-DESCRIPTION =3D "This creates an installer including all the default ima=
ges\
- recommended including source, binaries, filesystems, etc.\
- for TI SDK. This is meant to be used on the host system.\
-"
-
-require tisdk-core-bundle.inc
-
-DEPLOY_SPL_NAME:omapl138 =3D ""
-DEPLOY_SPL_NAME:k3 =3D "tispl.bin tiboot3.bin"
-
-DEPLOY_IMAGES_NAME:k3 =3D "bl31.bin bl32.bin bl31.bin.unsigned bl32.bin.=
unsigned"
-DEPLOY_IMAGES_NAME:append:am65xx =3D " sysfw.itb"
-DEPLOY_IMAGES_NAME:append:j721e =3D " sysfw.itb"
-DEPLOY_IMAGES_NAME:append:am65xx-evm =3D " sysfw-am65x-gp-evm.itb sysfw-=
am65x_sr2-gp-evm.itb"
-
-ARAGO_TISDK_IMAGE ?=3D "tisdk-core-bundle"
-export IMAGE_BASENAME =3D "${ARAGO_TISDK_IMAGE}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc =
b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
deleted file mode 100644
index c7bd9629..00000000
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ /dev/null
@@ -1,39 +0,0 @@
-# This include is for the common setting used to build TISDK images.  Th=
ese images
-# include both host and target side content.=20
-LICENSE =3D "MIT"
-
-IMAGE_FSTYPES =3D "tar.xz"
-IMAGE_NAME_SUFFIX =3D ""
-
-inherit tisdk-bundle
-
-COMPATIBLE_MACHINE =3D "omapl138|ti33x|ti43x|omap-a15|k3"
-
-# List of packages to remove from the host package.  This is usually due=
 to
-# licensing issues and unneeded dependencies.
-HOST_CLEANUP_PACKAGES =3D ""
-TOOLCHAIN_CLEANUP_PACKAGES =3D "libgnutls-dev libgnutls-extra26 libgnutl=
s-openssl27 libtasn1-dev"
-
-# Set DTB filters for each machine.  Use "unknown" by default to avoid
-# picking up DTB files for devices with no DTB support.
-DTB_FILTER =3D "unknown"
-DTB_FILTER:ti33x =3D "am335x"
-DTB_FILTER:dra7xx-evm =3D "dra7"
-DTB_FILTER:am57xx-evm =3D "am57xx"
-DTB_FILTER:am57xx-hs-evm =3D "${DTB_FILTER:am57xx-evm}"
-DTB_FILTER:ti43x =3D "am43"
-DTB_FILTER:omapl138 =3D "da850"
-DTB_FILTER:am65xx =3D "am65"
-DTB_FILTER:j721e =3D "j721e"
-DTB_FILTER:j7200 =3D "j7200"
-DTB_FILTER:j721s2 =3D "j721s2"
-
-# List of target side images to build for the SDK
-TARGET_IMAGES =3D "tisdk-base-image tisdk-default-image tisdk-thinlinux-=
image tisdk-bootstrap-image"
-
-TISDK_TOOLCHAIN =3D "${@bb.utils.contains('DISTRO_FEATURES','opengl','me=
ta-toolchain-arago-tisdk','meta-toolchain-arago-tisdk-server',d)}"
-TOOLCHAIN_SUFFIX =3D "${@bb.utils.contains('DISTRO_FEATURES','opengl','-=
tisdk','-tisdk-server',d)}"
-
-IMAGE_INSTALL =3D "\
-    packagegroup-arago-tisdk-amsdk-sdk-host \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-gst-sdk-target.bb
deleted file mode 100644
index 845cc7ff..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
-sdk-target.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION =3D "Task to build and install header and libs in sdk"
-LICENSE =3D "MIT"
-PR =3D "r15"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-GSTREAMER_DEPS =3D " \
-    gstreamer1.0-dev \
-    gstreamer1.0-plugins-base-dev \
-    gstreamer1.0-plugins-good-dev \
-    gstreamer1.0-plugins-bad-dev \
-    gstreamer1.0-libav-dev \
-"
-
-GSTREAMER_DSP =3D " \
-    ${@['','gstreamer1.0-plugins-dsp66-dev'][oe.utils.all_distro_feature=
s(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'ds=
p', True, False, d)]} \
-"
-
-#    gstreamer1.0-plugins-hevc-dev=20
-GSTREAMER_DEPS:append:dra7xx =3D " \
-    ${GSTREAMER_DSP} \
-"
-
-RDEPENDS:${PN} =3D " \
-    ${GSTREAMER_DEPS} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-addons-sdk-target.bb
deleted file mode 100644
index 0cd1b540..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
+++ /dev/null
@@ -1,76 +0,0 @@
-DESCRIPTION =3D "Task to install headers and libraries related to addons=
 into the SDK"
-LICENSE =3D "MIT"
-PR =3D "r44"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-UTILS =3D " \
-	libdrm-dev \
-	open62541-dev \
-	open62541-staticdev \
-	python3-numpy \
-"
-
-UTILS:append:ti33x =3D " can-utils-dev"
-UTILS:append:ti43x =3D " can-utils-dev"
-UTILS:append:dra7xx =3D " can-utils-dev \
-                        elfutils-dev \
-                        elfutils-staticdev \
-"
-UTILS:append:k3 =3D "\
-	can-utils-dev \
-	ti-rpmsg-char-dev \
-	ti-rpmsg-char-staticdev \
-"
-
-EXTRA_LIBS =3D ""
-EXTRA_LIBS:append:dra7xx =3D " libulm-dev \
-                             libulm-staticdev \
-                             gdbserver-c6x-dev \
-"
-
-PDM_ANOMALY_PKG_DEV =3D "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detec=
tion-dev', '', d)} \
-"
-
-
-EXTRA_PACKAGES =3D ""
-#EXTRA_PACKAGES:append:ti33x =3D " \
-#                                arm-compute-library-dev \
-#                                tensorflow-lite-dev \
-#                                tensorflow-lite-staticdev \
-#                                ${PDM_ANOMALY_PKG_DEV} \
-#"
-#EXTRA_PACKAGES:append:ti43x =3D " \
-#                                arm-compute-library-dev \
-#                                tensorflow-lite-dev \
-#                                tensorflow-lite-staticdev \
-#                                ${PDM_ANOMALY_PKG_DEV} \
-#"
-#EXTRA_PACKAGES:append:omap-a15 =3D " \
-#                                arm-compute-library-dev \
-#                                tensorflow-lite-dev \
-#                                tensorflow-lite-staticdev \
-#                                ${PDM_ANOMALY_PKG_DEV} \
-#"
-#EXTRA_PACKAGES:append:am65xx =3D " arm-compute-library-dev \
-#                             tensorflow-lite-dev \
-#                             tensorflow-lite-staticdev \
-#                             ${PDM_ANOMALY_PKG_DEV} \
-#"
-
-IPCDEV =3D " \
-	ti-ipc-dev \
-	ti-ipc-staticdev \
-"
-
-EXTRA_PACKAGES:append:omap-a15 =3D " ${IPCDEV}"
-EXTRA_PACKAGES:append:omapl138 =3D " ${IPCDEV}"
-
-RDEPENDS:${PN} =3D "\
-    ${UTILS} \
-    ${EXTRA_LIBS} \
-    ${EXTRA_PACKAGES} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroup=
s/packagegroup-arago-tisdk-amsdk-sdk-host.bb
deleted file mode 100644
index 1a43d0ef..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION =3D "Task to install additional scripts and applications int=
o the SDK"
-LICENSE =3D "MIT"
-PR =3D "r30"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-EXTRA_FILES =3D ""
-EXTRA_FILES:ti43x =3D "tisdk-uenv"
-EXTRA_FILES:omap-a15 =3D "tisdk-readme tisdk-uenv"
-EXTRA_FILES:k3 =3D "tisdk-readme tisdk-uenv"
-
-RDEPENDS:${PN} =3D "\
-    ti-tisdk-setup \
-    ${EXTRA_FILES} \
-    tisdk-install \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/pac=
kagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
deleted file mode 100644
index 7f5e9c2e..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity-sdk-target.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION =3D "Task to install wireless headers and libraries into the=
 SDK"
-LICENSE =3D "MIT"
-PR =3D "r9"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-BLUETOOTH_STACK =3D "\
-    bluez5-dev \
-"
-
-CONNECTIVITY_RDEPENDS =3D ""
-
-CONNECTIVITY_RDEPENDS:ti33x  =3D "\
-    wpa-supplicant-dev \
-    ${BLUETOOTH_STACK} \
-"
-
-CONNECTIVITY_RDEPENDS:ti43x  =3D "\
-    wpa-supplicant-dev \
-    ${BLUETOOTH_STACK} \
-"
-
-RDEPENDS:${PN} =3D "\
-    ${CONNECTIVITY_RDEPENDS} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-crypto-sdk-target.bb
deleted file mode 100644
index ff72c007..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto-sdk-target.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "Task to install crypto dev packages in SDK"
-LICENSE =3D "MIT"
-PR =3D "r8"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-CRYPTO_API =3D "cryptodev-module-dev"
-
-RDEPENDS:${PN} =3D "\
-    openssl-dev \
-    ${CRYPTO_API} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/package=
groups/packagegroup-arago-tisdk-graphics-sdk-target.bb
deleted file mode 100644
index acb06558..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics-sdk-target.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY =3D "Task to install graphics packages on sdk target"
-LICENSE =3D "MIT"
-PR =3D "r10"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-RDEPENDS:${PN} =3D "\
-    libegl-dev \
-    libdrm-dev \
-    wayland-dev \
-    weston-dev \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev=
', '', d)} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroup=
s/packagegroup-arago-tisdk-gtk-sdk-target.bb
deleted file mode 100644
index 030583e3..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-gtk-sdk-target.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION =3D "Task to install Gtk dev packages in SDK"
-LICENSE =3D "MIT"
-PR =3D "r2"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-RDEPENDS:${PN} =3D "\
-    gtk+3-dev \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packa=
gegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
deleted file mode 100644
index 62bcc0ea..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-target.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "Task to build and install header and libs into sdk"
-LICENSE =3D "MIT"
-PR =3D "r12"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-BARCODE_PKG =3D ""
-#BARCODE_PKG =3D " \
-#    ${@['','barcode-roi-dev'][oe.utils.all_distro_features(d, 'opencv',=
 True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, Fals=
e, d)]} \
-#"
-
-MULTIMEDIA =3D ""
-
-#    ${@['','qt-opencv-opencl-opengl-multithreaded-dev'][oe.utils.all_di=
stro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contai=
ns('MACHINE_FEATURES', 'gpu dsp', True, False, d)]}
-MULTIMEDIA:append:dra7xx =3D " \
-    hevc-arm-decoder-dev \
-    hevc-arm-decoder-staticdev \
-"
-
-MULTIMEDIA:append:ti33x =3D " ${BARCODE_PKG}"
-MULTIMEDIA:append:ti43x =3D " ${BARCODE_PKG}"
-MULTIMEDIA:append:omap-a15 =3D " ${BARCODE_PKG}"
-MULTIMEDIA:append:am65xx =3D " ${BARCODE_PKG}"
-
-RDEPENDS:${PN} =3D "\
-    ${MULTIMEDIA} \
-    packagegroup-arago-gst-sdk-target \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-opencl-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-opencl-sdk-target.bb
deleted file mode 100644
index b660fcb4..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-target.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION =3D "Task to install headers and libraries of OpenCL/MP and =
related components"
-LICENSE =3D "MIT"
-PR =3D "r2"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup features_check
-
-REQUIRED_DISTRO_FEATURES =3D "opencl"
-
-UTILS =3D " \
-    opencl-staticdev \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'openmpacc-dev')} \
-"
-
-UTILS:append:dra7xx =3D " \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-dev')} \
-"
-
-RDEPENDS:${PN} =3D "\
-    ${UTILS} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegro=
ups/packagegroup-arago-toolchain-tisdk-target.bb
deleted file mode 100644
index cdf54ecc..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-too=
lchain-tisdk-target.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION =3D "Task to build and install header and libs into the sdk"
-LICENSE =3D "MIT"
-PR =3D "r14"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-TISDK_TOOLCHAIN_BASE_TARGET =3D "\
-    packagegroup-arago-standalone-sdk-target \
-    packagegroup-arago-tisdk-multimedia-sdk-target \
-"
-
-TISDK_TOOLCHAIN_EXTRA_TARGET =3D "\
-    packagegroup-arago-tisdk-connectivity-sdk-target \
-    packagegroup-arago-tisdk-crypto-sdk-target \
-"
-TISDK_TOOLCHAIN_EXTRA_TARGET:omapl138 =3D ""
-
-RDEPENDS:${PN} =3D "\
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
qte-toolchain-target','',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-gtk-sdk-target','',d)} \
-    ${TISDK_TOOLCHAIN_BASE_TARGET} \
-    ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-=
tisdk-graphics-sdk-target','',d)} \
-    ${@['','packagegroup-arago-tisdk-opencl-sdk-target'][oe.utils.all_di=
stro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FE=
ATURES', 'dsp', True, False, d)]} \
-    packagegroup-arago-tisdk-addons-sdk-target \
-"
diff --git a/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rto=
s_git.bbappend b/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples=
-rtos_git.bbappend
deleted file mode 100644
index f7acb63b..00000000
--- a/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.b=
bappend
+++ /dev/null
@@ -1,6 +0,0 @@
-PR:append =3D ".arago0"
-
-CM_NAME =3D "OpenCL"
-CM_VERSION =3D "${PV}"
-CM_ROOT_DIR =3D "opencl_rtos_${RELEASE_TARGET}_${@'${PV}'.replace('.', '=
_')}"
-CM_DESCRIPTION =3D "OpenCL is a framework for writing programs that exec=
ute across heterogeneous systems"
diff --git a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.=
bb b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
deleted file mode 100644
index 1600b679..00000000
--- a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION =3D "Package that contains a script to setup oe-core develop=
ment environment"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
-
-PR =3D "r1"
-
-inherit allarch
-
-BRANCH ?=3D "master"
-SRCREV =3D "e58f941784fb45fd826779a45b33973e6342700f"
-SRC_URI =3D "git://git.ti.com/git/git/arago-project/oe-layersetup.git;pr=
otocol=3Dhttps;branch=3D${BRANCH}"
-
-S =3D "${WORKDIR}/git"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
deleted file mode 100644
index e000e8c7..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ /dev/null
@@ -1,59 +0,0 @@
-DESCRIPTION =3D "Package containing scripts to setup the development hos=
t and target board"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://setup.sh;beginline=3D3;endline=3D31;md5=3Df=
c4b04a33df6d892c9f4d4a9d92b945e"
-
-PR =3D "r47"
-
-BRANCH ?=3D "master"
-SRCREV =3D "eae21af9be4e7a0028045cc3e4038fe2157a266d"
-SRC_URI =3D "git://git.ti.com/git/arago-project/tisdk-setup-scripts.git;=
protocol=3Dhttps;branch=3D${BRANCH}"
-
-S =3D "${WORKDIR}/git"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-SDCARD_SCRIPT =3D " create-sdcard.sh"
-
-SETUP_SCRIPTS =3D " common.sh \
-                  setup-host-check.sh \
-                  setup-minicom.sh \
-                  setup-package-install.sh \
-                  setup-targetfs-nfs.sh \
-                  setup-tftp.sh \
-                  add-to-group.sh \
-                  create-ubifs.sh \
-                  ${SDCARD_SCRIPT} \
-"
-
-UBOOT_ENV:omapl138 =3D "setup-uboot-env-am18x.sh"
-UBOOT_ENV:ti33x =3D "setup-uboot-env-am335x.sh"
-UBOOT_ENV:ti43x =3D "setup-uboot-env-am43x.sh"
-UBOOT_ENV:omap5-evm =3D "setup-uboot-env-omap5.sh"
-UBOOT_ENV:am57xx-evm =3D "setup-uboot-env-am57xx-evm.sh"
-UBOOT_ENV:k3 =3D "setup-uboot-env-am65x.sh"
-UBOOT_ENV =3D "setup-uboot-unknown.sh"
-
-do_install () {
-    install -m 0755 ${S}/setup.sh ${D}/
-
-    install -d ${D}/bin
-    for script in ${SETUP_SCRIPTS}
-    do
-        install -m 0755 ${S}/${script} ${D}/bin
-    done
-
-    install -m 0755 ${S}/${UBOOT_ENV} ${D}/bin/setup-uboot-env.sh
-
-    if [ -z "${MKUBIFS_ARGS}" -o -z "${UBINIZE_ARGS}" ]
-    then
-        # UBIFS not supported
-        rm "${D}/bin/create-ubifs.sh"
-    else
-        sed -i -e "s|__MKUBIFS_ARGS__|${MKUBIFS_ARGS}|" \
-               -e "s|__UBINIZE_ARGS__|${UBINIZE_ARGS}|" \
-                  "${D}/bin/create-ubifs.sh"
-    fi
-}
-
-FILES:${PN} +=3D "setup.sh"
-RDEPENDS:${PN} +=3D "bash"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/=
sdk-install.sh b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-inst=
all/sdk-install.sh
deleted file mode 100644
index d195d51e..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-ins=
tall.sh
+++ /dev/null
@@ -1,129 +0,0 @@
-#!/bin/sh
-
-# Permission is hereby granted, free of charge, to any person obtaining =
a copy
-# of this software and associated documentation files (the "Software"), =
to deal
-# in the Software without restriction, including without limitation the =
rights
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or s=
ell
-# copies of the Software, and to permit persons to whom the Software is
-# furnished to do so, subject to the following conditions:
-#
-# The above copyright notice and this permission notice shall be include=
d in
-# all copies or substantial portions of the Software.
-#
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHAL=
L THE
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G FROM,
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS=
 IN
-# THE SOFTWARE.
-
-# Process command line...
-while [ $# -gt 0 ]; do
-  case $1 in
-    --install_dir)
-      shift;
-      install_dir=3D$1;
-      ;;
-     *)
-      shift;
-      ;;
-  esac
-done
-
-if [ "x$install_dir" =3D "x" ]; then
-    # Verify that the script is being called within untar SDK directory
-    if [ ! -d "$PWD/board-support" -a ! -f "$PWD/Rules.make" ]; then
-        echo "Script must be called within untarred sdk directory"
-        exit 1
-    else
-        install_dir=3D"$PWD"
-    fi
-fi
-
-# Get full path to SDK directory
-cd "$install_dir"
-install_dir=3D"$PWD"
-cd -
-
-if [ ! -d $install_dir ]; then
-	echo "Installation directory does not exist"
-	exit 1
-fi
-
-# Remove any .svn directories that were packaged by the sourceipks
-rm -rf `find $install_dir -name ".svn"`
-
-
-# Update Rules.make variables
-sed -i -e s=3D__SDK__INSTALL_DIR__=3D$install_dir=3D $install_dir/Rules.=
make=20
-
-# Find the linux directory name
-linux=3D`find $install_dir/board-support -maxdepth 1 -name "linux*"`
-linux=3D`basename $linux`
-sed -i -e s=3D__KERNEL_NAME__=3D$linux=3D $install_dir/Rules.make
-
-threads=3D`cat /proc/cpuinfo | grep -c processor`
-
-# Create a newline
-echo >> $install_dir/Rules.make
-# Set optimal value for the make file's -j option
-echo "MAKE_JOBS=3D$threads" >> $install_dir/Rules.make
-
-cd -
-
-
-# Install toolchain sdk
-$install_dir/linux-devkit.sh -y -d $install_dir/linux-devkit
-
-# Remove toolchain sdk
-rm $install_dir/linux-devkit.sh
-
-
-# Update example applications CCS project files
-
-# Grab some essential variables from environment-setup
-REAL_MULTIMACH_TARGET_SYS=3D`sed -n 's/^export REAL_MULTIMACH_TARGET_SYS=
=3D//p' $install_dir/linux-devkit/environment-setup`
-TOOLCHAIN_SYS=3D`sed -n 's/^export TOOLCHAIN_SYS=3D//p' $install_dir/lin=
ux-devkit/environment-setup`
-SDK_SYS=3D`sed -n 's/^export SDK_SYS=3D//p' $install_dir/linux-devkit/en=
vironment-setup`
-
-# Grab toolchain's GCC version
-GCC_VERSION=3D`ls $install_dir/linux-devkit/sysroots/$SDK_SYS/usr/lib/gc=
c/$TOOLCHAIN_SYS/`
-
-TOOLCHAIN_TARGET_INCLUDE_DIR=3D"linux-devkit/sysroots/$REAL_MULTIMACH_TA=
RGET_SYS/usr/include"
-TOOLCHAIN_INCLUDE_DIR=3D"linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOO=
LCHAIN_SYS/$GCC_VERSION/include"
-
-SDK_PATH_TARGET=3D"linux-devkit/sysroots/$REAL_MULTIMACH_TARGET_SYS/"
-
-sed -i -e s=3D__SDK_PATH_TARGET__=3D$SDK_PATH_TARGET=3D $install_dir/Rul=
es.make
-
-if [ -f "$install_dir/bin/unshallow-repositories.sh" ]
-then
-    sed -i -e s=3D__SDK_INSTALL_DIR__=3D$install_dir=3D $install_dir/bin=
/unshallow-repositories.sh
-fi
-
-if [ -f "$install_dir/bin/create-ubifs.sh" ]
-then
-    sed -i -e s=3D__SDK_INSTALL_DIR__=3D$install_dir=3D $install_dir/bin=
/create-ubifs.sh
-fi
-
-# Modify create-sdcard.sh to have user-supplied installation directory
-if [ -f "${install_dir}/bin/create-sdcard.sh" ]
-then
-    sed -i -e "s|ti-sdk.*\[0-9\]|${install_dir##*/}|g" ${install_dir}/bi=
n/create-sdcard.sh
-fi
-
-# Update CCS project files using important paths to headers
-
-find $install_dir/example-applications -type f -exec sed -i "s|<TOOLCHAI=
N_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR|g" {} \;
-find $install_dir/example-applications -type f -exec sed -i "s|<TOOLCHAI=
N_INCLUDE_DIR>|$TOOLCHAIN_INCLUDE_DIR|g" {} \;
-
-
-if [ -f "$install_dir/sdk-install.sh" ]; then
-	# File is only able to run once so delete it from the SDK
-	rm "$install_dir/sdk-install.sh"
-fi
-
-echo "Installation completed!"
-exit 0
-
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_=
1.0.bb b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.=
bb
deleted file mode 100644
index da8ecce0..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION =3D "Contains script to properly extract and update various =
files"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://../sdk-install.sh;beginline=3D3;endline=3D1=
9;md5=3D4b89903784b8d154cd8b631388da4f0d"
-
-SRC_URI =3D "file://sdk-install.sh"
-
-PR =3D "r6"
-
-do_install () {
-    install -d ${D}/
-    install  ${WORKDIR}/sdk-install.sh ${D}/sdk-install.sh
-
-}
-
-FILES:${PN} =3D "/*"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb=
 b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
deleted file mode 100644
index 59df0c97..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION =3D "Package that will install a README file into the SDK pr=
ebuilt-binaries directory"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
-
-SRC_URI =3D "\
-    file://README \
-"
-
-PR =3D "r0"
-PV =3D "1.0"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}"
-
-do_install () {
-    install -d ${D}/board-support/prebuilt-images
-
-    install -m 0644 ${S}/README ${D}/board-support/prebuilt-images/
-}
-
-FILES:${PN} +=3D "board-support/*"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/RE=
ADME b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
deleted file mode 100644
index 873d1e86..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
+++ /dev/null
@@ -1,22 +0,0 @@
-The files contained in this directory represent the images that were bui=
lt
-as part of the original SDK build and packaging process.  They are meant
-to serve as a restore and starting point for your development.  In order
-to use these images with an SD card they should be placed in the appropr=
iate
-locations.
-
-By default these locations are:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
-|       FILE       |                  LOCATION                          =
       |
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
-|    MLO           | boot partition
-|    u-boot.img    | boot partition
-|    uEnv.txt      | boot partition
-|    uImage        | /boot directory of the rootfs partition
-|    *.dtb         | /boot directory of the rootfs partition
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
-
-By default the boot loaders are read from the first FAT partition, which=
 is
-usually called the "boot" partition.  Then the bootloader will look for =
the
-uImage and DTB files in the /boot directory of the EXT partition, which =
is
-usually called the "rootfs" partition.
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3=
/README b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/RE=
ADME
deleted file mode 100644
index 0eb6dd3c..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/README
+++ /dev/null
@@ -1,26 +0,0 @@
-The files contained in this directory represent the images that were bui=
lt
-as part of the original SDK build and packaging process.  They are meant
-to serve as a restore and starting point for your development.  In order
-to use these images with an SD card they should be placed in the appropr=
iate
-locations.
-
-By default these locations are:
-
-+-------------+-----------------------------------------+
-|    File     |                Location                 |
-+-------------+-----------------------------------------+
-| tiboot3.bin | boot partition                          |
-| tispl.bin   | boot partition                          |
-| u-boot.img  | boot partition                          |
-| sysfw.itb   | boot partition                          |
-| uEnv.txt    | boot partition                          |
-+-------------+-----------------------------------------+
-| Image       | /boot directory of the rootfs partition |
-| *.dtb       | /boot directory of the rootfs partition |
-| *.dtbo      | /boot directory of the rootfs partition |
-+-------------+-----------------------------------------+
-
-By default the boot loaders are read from the first FAT partition, which=
 is
-usually called the "boot" partition.  Then the bootloader will look for =
the
-Image and .dtb .dtbo files in the /boot directory of the ext4 partition,=
 which is
-usually called the "rootfs" partition.
diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unsha=
llow-repositories/unshallow-repositories.sh b/meta-arago-distro/recipes-t=
isdk/unshallow-repositories/unshallow-repositories/unshallow-repositories=
.sh
deleted file mode 100755
index 7e578be5..00000000
--- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-re=
positories/unshallow-repositories.sh
+++ /dev/null
@@ -1,110 +0,0 @@
-#!/bin/bash
-
-# Authors:
-#    Franklin Cooper Jr.
-# This distribution contains contributions or derivatives under copyrigh=
t
-# as follows:
-#
-# Copyright (c) 2015, Texas Instruments Incorporated
-# All rights reserved.
-#
-# Redistribution and use in source and binary forms, with or without
-# modification, are permitted provided that the following conditions
-# are met:
-# - Redistributions of source code must retain the above copyright notic=
e,
-#   this list of conditions and the following disclaimer.
-# - Redistributions in binary form must reproduce the above copyright
-#   notice, this list of conditions and the following disclaimer in the
-#   documentation and/or other materials provided with the distribution.
-# - Neither the name of Texas Instruments nor the names of its
-#   contributors may be used to endorse or promote products derived
-#   from this software without specific prior written permission.
-#
-# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMI=
TED
-# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTIC=
ULAR
-# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
-# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
-# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING N=
EGLIGENCE
-# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN=
 IF
-# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-
-install_dir=3D"__SDK_INSTALL_DIR__"
-
-# Find git binary within the host native bin directory
-sdk_git_bin=3D"$install_dir/linux-devkit/sysroots/*86*-linux/usr/bin/git=
"
-sdk_git_bin=3D`which $sdk_git_bin`
-
-if [ "$sdk_git_bin" =3D "" ]
-then
-    echo
-    echo "Couldn't find the git command within linux-devkit"
-    echo "Unable to automatically unshallow git repository"
-    echo "If you have git installed and a version higher than 1.8.0.3 ( =
git --version)"
-    echo "You can manually unshallow the Linux git repository by running=
 the below"
-    echo "command within the SDK's Linux git repository"
-    echo "git fetch --unshallow"
-    echo
-    exit 1
-fi
-
-linux_dir=3D`find $install_dir/board-support -maxdepth 1 -name "linux*"`
-linux=3D`basename $linux_dir`
-
-if [ -f $linux_dir/.git/shallow ]
-then
-    echo
-    echo "The kernel git repository has been trimmed to reduce the size =
of the SDK installer"
-    echo "in a process called \"shallowing\". This process causes the re=
pository to include"
-    echo "only a small fraction of the entire git history. To retrieve t=
he entire git history"
-    echo "you must unshallow the repository. This will require internet =
access and if applicable"
-    echo "proper git proxy settings to access the original remote reposi=
tory. This script will"
-    echo "automatically unshallow the Linux repository for you and retri=
eve its full history."
-    echo "Depending on your internet speed this process can take 5+ minu=
tes."
-    echo "Would you like to continue (y/n)?"
-    echo
-
-    read -p "[ y ] " continueunshallow
-    echo
-
-    if [ ! -n "$continueunshallow" ]; then
-       continueunshallow=3D"y"
-    fi
-
-    if [ "$continueunshallow" !=3D "y" ]; then
-        echo "You selected no. Please run script the again when your rea=
dy to unshallow the"
-        echo "repository."
-        exit 0
-    fi
-
-    echo "The unshallowing process has begun. For the first couple of mi=
nutes you may not see"
-    echo "any additional output. This is normal."
-
-    cd $linux_dir
-
-    $sdk_git_bin fetch --unshallow
-
-    if [ "$?" =3D "0" ]
-    then
-        echo
-        echo "The unshallowing process has been completed. The Linux git=
 repository has been"
-        echo "fully restored."
-    else
-        echo
-        echo "Error unshallowing git repository. Please check your inter=
net connection and"
-        echo "your git proxy settings."
-    fi
-
-    echo
-
-    cd -
-else
-    echo
-    echo "Kernel git repository is not shallow."
-    echo "The repository has the full commit history and can be treated =
as a normal"
-    echo "git repository."
-    echo
-fi
diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unsha=
llow-repositories_1.0.bb b/meta-arago-distro/recipes-tisdk/unshallow-repo=
sitories/unshallow-repositories_1.0.bb
deleted file mode 100644
index c6ed07ab..00000000
--- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-re=
positories_1.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION =3D "Contains script to unshallow git repositories"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://../unshallow-repositories.sh;beginline=3D3;=
endline=3D19;md5=3D234309914fd2cc17f3187bdb2d64553b"
-
-SRC_URI =3D "file://unshallow-repositories.sh"
-
-PR =3D "r1"
-
-do_install () {
-    install -d ${D}/
-    install -d ${D}/bin
-    install -m 0755 ${WORKDIR}/unshallow-repositories.sh ${D}/bin
-}
-
-FILES:${PN} =3D "/*"
-RDEPENDS:${PN} +=3D "bash"
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packa=
gegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroup=
s/nativesdk-packagegroup-arago-tisdk-host.bb
deleted file mode 100644
index 859d9eab..00000000
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-tisdk-host.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY =3D "Host packages for a standalone Arago SDK with TI tools"
-PR =3D "r2"
-LICENSE =3D "MIT"
-
-inherit packagegroup nativesdk
-
-PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
-
-TIDL_TOOLS =3D ""
-#TIDL_TOOLS =3D " \
-#    nativesdk-tidl-import \
-#    nativesdk-tidl-viewer \
-#    nativesdk-tidl-utils \
-#"
-
-EXTRA_TI_TOOLS =3D " \
-    nativesdk-ti-cgt6x \
-    nativesdk-ti-cgt-pru \
-    nativesdk-clocl \
-    ${@oe.utils.all_distro_features(d, "opencl openmp", "nativesdk-clacc=
")} \
-    nativesdk-open62541-examples \
-    nativesdk-open62541-tests \
-    nativesdk-gcc-arm-baremetal \
-    ${@oe.utils.all_distro_features(d, "opencl opencv", "${TIDL_TOOLS}")=
} \
-"
-
-RDEPENDS:${PN} =3D "\
-    nativesdk-packagegroup-sdk-host \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-waylan=
d-dev', '', d)} \
-    nativesdk-python3-distutils \
-    nativesdk-python3-numpy \
-    nativesdk-git \
-    nativesdk-mtd-utils-ubifs \
-    ${EXTRA_TI_TOOLS} \
-"
-
-RDEPENDS:${PN}:remove =3D "\
-    nativesdk-meson \
-"
--=20
2.40.1


