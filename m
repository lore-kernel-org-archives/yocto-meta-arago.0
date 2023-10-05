Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53718E92702
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 14:24:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.16687.1696515847513625435
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 07:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=lPoE/xTF;
 spf=none, err=SPF record not found (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 395EO5TA014202;
	Thu, 5 Oct 2023 09:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696515845;
	bh=vd5fxeApVDoCyWQdOaKFRapHQnjFR/yQ2JT3IK8YUkI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lPoE/xTFWfQupULmyoSqDSdVXahe45aYAjM2RLO7YdvL9TCI6YM53ngJCrQ5XW1a0
	 3aNWJc5zZP+SgbvJNmNXAcZg12/X2JYOHoJEqNIoa1V7CULVtSUl3JV/rvg+iiQUbE
	 cAL8Z9I2IoX6pduspYpsEi1JkdLHi8/JHXti/W/k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 395EO5nb075204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Oct 2023 09:24:05 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Oct 2023 09:24:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Oct 2023 09:24:05 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 395EO5wb000828;
	Thu, 5 Oct 2023 09:24:05 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qoPGn-0006kO-7E; Thu, 05 Oct 2023 09:24:05 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCH v3] tisdk-sw-manifest: Switch up the TI software manifest creation
Date: Thu, 5 Oct 2023 09:24:05 -0500
Message-ID: <20231005142405.25888-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231005142405.25888-1-reatmon@ti.com>
References: <20231005142405.25888-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 395EO5TA014202
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Oct 2023 14:24:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14922

We have been seeing an odd pseudo bug related to how the TI software
manifest was being created.  Prior to this change we needed to run the
SDK installer in order to get some of the packages that needed to be
included in the manifest.  But installing the toolchain would randomly
cause a pseudo abort error.

This change has the part of the manifest that is needed from the
toolchains to be created at the same time as the toolchain.  Then the
software manifest can just include those sections without needing to run
the installer.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Split kirkstone/master due to changes in master that got missed.
v2: Changed globbing in sw_manifest_toolchain_target to support the
    secondary toolchain correctly.

 .../classes/tisdk-bundle.bbclass              | 562 +---------------
 .../classes/tisdk-sw-manifest.bbclass         | 601 ++++++++++++++++++
 .../recipes-core/meta/meta-toolchain-arago.bb |   3 +
 3 files changed, 605 insertions(+), 561 deletions(-)
 create mode 100644 meta-arago-distro/classes/tisdk-sw-manifest.bbclass

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-=
distro/classes/tisdk-bundle.bbclass
index 1ebdb6fb..193181be 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -1,6 +1,7 @@
 inherit rootfs_ipk
 inherit image
 inherit image_types
+inherit tisdk-sw-manifest
=20
 # This defines the list of features that we want to include in the SDK
 # image.  The list of packages this will be installed for each features
@@ -72,13 +73,6 @@ DEPLOY_SPL_UART_NAME ?=3D "u-boot-spl.bin-${MACHINE}"
 # Variable to specify the name of the TI SCI firmware
 DEPLOY_TISCI_FW_NAME ?=3D ""
=20
-# Manifest file location which will be created as part of the image buil=
d
-# process.
-# This manifest follows the TI manifest format requirements which is why
-# it differs from some of the default manifest code in oe-core.
-SW_MANIFEST_FILE ?=3D "${IMAGE_ROOTFS}/manifest/software_manifest.htm"
-SW_MANIFEST_TEXT ?=3D "${IMAGE_ROOTFS}/manifest/software_manifest.txt"
-
 # helper function for generating a set of strings based on a list.  Take=
n
 # from the image.bbclass.
 def string_set(iterable):
@@ -114,553 +108,6 @@ cleanup_host_packages() {
     fi
 }
=20
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
-<p>Licenses can be found in the \"licenses\" directory of the SDK instal=
l directory</p>
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
L-3.0"). It applies to a given file (the "Runtime Library") that bears a =
notice placed by the copyright holder of the file stating that the file i=
s governed by GPL-3.0 along with this Exception.</p>
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
ion would otherwise violate the terms of GPL-3.0, provided that all Targe=
t Code was generated by Eligible Compilation Processes. You may then conv=
ey such a combination under terms of your choice, consistent with the lic=
ensing of the Independent Modules.</p>
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
-Licenses can be found in the "licenses/" directory of the SDK install di=
rectory
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
on under section 7 of the GNU General Public License, version 3 (GPL-3.0)=
. It applies to a given file (the Runtime Library) that bears a notice pl=
aced by the copyright holder of the file stating that the file is governe=
d by GPL-3.0 along with this Exception.
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
 would otherwise violate the terms of GPL-3.0, provided that all Target C=
ode was generated by Eligible Compilation Processes. You may then convey =
such a combination under terms of your choice, consistent with the licens=
ing of the Independent Modules.
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
-    sw_manifest_table_header "GPL-3.0 Development Host Content" "This ta=
ble describes any GPL-3.0 software being delivered that is expected to ru=
n on a Development Host, instead of the target device."
-
-    generate_sw_manifest_table $opkg_dir "true"
-
-    sw_manifest_table_footer
-
-    sw_manifest_table_header "Development Host Content" "This table desc=
ribes any software being delivered that is expected to run on a Developme=
nt Host, instead of the target device.  Some of this software may be lice=
nsed under GPL-3.0 but it is not expected to be shipped as a product."
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
-    sw_manifest_table_header "GPL-3.0 Development Libraries Installed on=
 Host" "This table describes GPL-3.0 software libraries and headers that =
are installed on the development host and used during the development of =
software to run on the target. Customers should be careful when linking a=
gainst these libraries to make sure they are complying with the license(s=
) of the library"
-
-    generate_sw_manifest_table $opkg_dir "true"
-
-    sw_manifest_table_footer
-
-    sw_manifest_table_header "Development Libraries Installed on Host" "=
This table describes software libraries and headers that are installed on=
 the development host and used during the development of software to run =
on the target.  Some of this software may be licensed under GPL-3.0.  Cus=
tomers should be careful when linking against these libraries to make sur=
e they are complying with the license(s) of the library"
-
-    generate_sw_manifest_table $opkg_dir
-
-    sw_manifest_table_footer
-}
-
-# Create the table of GPL-3.0 components found in the target file system
-sw_manifest_target_gplv3() {
-    opkg_dir=3D"$1"
-
-    sw_manifest_table_header "GPL-3.0 Target Device Content" "This table=
 describes any GPL-3.0 software being delivered that is expected to run o=
n the target device."
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
-# This function expects to be passed the following parameter
-#   - The location to the opkg info directory containing the control fil=
es
-#     of the installed packages
-# Optionally if the second parameter is set to true then only GPL-3.0 co=
ntents
-# will be listed.  This is for TI SW Manifests where GPL-3.0 content is
-# highlighted as a separate table.
-generate_sw_manifest_table() {
-    control_dir=3D"$1"
-    gplv3_only=3D"$2"
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
-        sources=3D"`cat $i | grep Source: | cut -d ':' -f2-`"
-        location=3D"$package""_""$long_version""_""$architecture"".ipk"
-
-        # Set the highlight color if the license in GPL-3.0.  If this is
-        # a GPL-3.0 only table then skip this package.
-        case "$license" in
-            *GPL-3.0*)
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
 ROOTFS_PREPROCESS_COMMAND +=3D "tisdk_image_setup; "
 ROOTFS_POSTPROCESS_COMMAND +=3D "tisdk_image_build; "
 IMAGE_PREPROCESS_COMMAND:append =3D "tisdk_image_cleanup; "
@@ -713,9 +160,6 @@ tisdk_image_setup () {
     if [ -e ${SDK_DEPLOY}/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCH=
AIN_SUFFIX}.sh ]
     then
         chmod 755 ${SDK_DEPLOY}/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${=
TOOLCHAIN_SUFFIX}.sh
-
-        # Temporarily extract the toolchain sdk so we can read license i=
nformation from it.
-        echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${SDK_DEPLOY}/$=
{SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}.sh
     fi
     if [ -e ${SDK_DEPLOY}/${SDK_NAME}-${ARMPKGARCH_K3R5}-${TARGET_OS_K3R=
5}${TOOLCHAIN_K3R5_SUFFIX}.sh ]
     then
@@ -861,10 +305,6 @@ tisdk_image_build () {
     fi
     generate_sw_manifest
=20
-    # Delete installed toolchain sdk since we need the toolchain sdk ins=
taller
-    # not the extracted version
-    rm -rf ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}
-
     # Copy over Linux glibc toolchain sdk installer and give it a simple=
 name which
     # matches the traditional name within the SDK.
     if [ -e ${SDK_DEPLOY}/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCH=
AIN_SUFFIX}.sh ]
diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass b/meta-a=
rago-distro/classes/tisdk-sw-manifest.bbclass
new file mode 100644
index 00000000..041d33b6
--- /dev/null
+++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
@@ -0,0 +1,601 @@
+# Manifest file location which will be created as part of the image buil=
d
+# process.
+# This manifest follows the TI manifest format requirements which is why
+# it differs from some of the default manifest code in oe-core.
+SW_MANIFEST_FILE ?=3D "${IMAGE_ROOTFS}/manifest/software_manifest.htm"
+SW_MANIFEST_TEXT ?=3D "${IMAGE_ROOTFS}/manifest/software_manifest.txt"
+
+SW_MANIFEST_TOOLCHAIN_DIR ?=3D "${SDKDEPLOYDIR}/${SDK_NAME}-${ARMPKGARCH=
}-${TARGET_OS}${TOOLCHAIN_SUFFIX}-sw_manifest"
+SW_MANIFEST_TOOLCHAIN_HOST_FILE ?=3D "${SW_MANIFEST_TOOLCHAIN_DIR}/host.=
htm"
+SW_MANIFEST_TOOLCHAIN_HOST_TEXT ?=3D "${SW_MANIFEST_TOOLCHAIN_DIR}/host.=
txt"
+SW_MANIFEST_TOOLCHAIN_TARGET_FILE ?=3D "${SW_MANIFEST_TOOLCHAIN_DIR}/tar=
get.htm"
+SW_MANIFEST_TOOLCHAIN_TARGET_TEXT ?=3D "${SW_MANIFEST_TOOLCHAIN_DIR}/tar=
get.txt"
+
+SW_MANIFEST_TOOLCHAIN_DEPLOY_DIR ?=3D "${SDK_DEPLOY}/${SDK_NAME}-${ARMPK=
GARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}-sw_manifest"
+SW_MANIFEST_TOOLCHAIN_DEPLOY_HOST_FILE ?=3D "${SW_MANIFEST_TOOLCHAIN_DEP=
LOY_DIR}/host.htm"
+SW_MANIFEST_TOOLCHAIN_DEPLOY_HOST_TEXT ?=3D "${SW_MANIFEST_TOOLCHAIN_DEP=
LOY_DIR}/host.txt"
+SW_MANIFEST_TOOLCHAIN_DEPLOY_TARGET_FILE ?=3D "${SW_MANIFEST_TOOLCHAIN_D=
EPLOY_DIR}/target.htm"
+SW_MANIFEST_TOOLCHAIN_DEPLOY_TARGET_TEXT ?=3D "${SW_MANIFEST_TOOLCHAIN_D=
EPLOY_DIR}/target.txt"
+
+# Generate the header for a TI style software manifest
+sw_manifest_header() {
+echo "
+<HTML>
+<HEAD>
+<TITLE>
+${MACHINE} TISDK ${SDK_VERSION} Installation Summary
+</TITLE>
+</HEAD>
+<BODY>
+<h1><CENTER> ${MACHINE} TISDK ${SDK_VERSION} Software Manifest </CENTER>=
</h1>
+<h2><CENTER> `date +"%B %d, %Y"` </CENTER></h2>
+<h2><b><u>Legend (explanation of the fields in the Manifest Table below)=
</u></b></h2>
+<table border=3D1 width=3D45%>
+<tr>
+    <td>Software Name</td>
+    <td>The name of the application or files</td>
+</tr>
+<tr>
+    <td>Version</td>
+    <td>Version of the application or files</td>
+</tr>
+<tr>
+    <td>License Type</td>
+    <td>Type of license(s) under which TI will be providing software to =
the licensee (e.g. BSD, GPLv2, TI TSPA License, TI Commercial License).  =
See Open Source Reference License Disclaimer in the Disclaimers Section.<=
/td>
+</tr>
+<tr>
+    <td>Location</td>
+    <td>The directory name and path on the media (or in an archive) wher=
e the Package is located.</td>
+</tr>
+<tr>
+    <td>Delivered As</td>
+    <td>This field will either be &ldquo;Source&rdquo;, &ldquo;Binary&rd=
quo; or &ldquo;Source and Binary&ldquo; and is the form the content of th=
e Package is delivered in.  If the Package is delivered in an archive for=
mat, this field applies to the contents of the archive. If the word Limit=
ed is used with Source, as in &ldquo;Limited Source&rdquo; or &ldquo;Limi=
ted Source and Binary&rdquo; then only portions of the Source for the app=
lication are provided.</td>
+</tr>
+<tr>
+    <td>Modified by TI</td>
+    <td>This field will either be &ldquo;Yes&rdquo; or &ldquo;No&rdquo;.=
 A &ldquo;Yes&rdquo; means TI had made changes to the Software. A &ldquo;=
No&rdquo; means TI has not made any changes.  NOTE: This field is not app=
licable for Software &ldquo;Obtained from&rdquo; TI.</td>
+</tr>
+<tr>
+    <td>Obtained from</td>
+    <td>This field specifies from where or from whom TI obtained the Sof=
tware. It may be a URL to an Open Source site, a 3rd party companylicenso=
r, or TI (if TI developed the software). If this field contains a link to=
 an Open Source software, the date it was downloaded is also recorded.  S=
ee Links Disclaimer in the Disclaimers Section.</td>
+</tr>
+</table>
+
+
+<h2><b>DISCLAIMERS</b></h2>
+<h2><u>Export Control Classification Number (ECCN)</u></h2>
+<p>
+Any use of ECCNs listed in the Manifest is at the user's risk and withou=
t recourse to TI.  Your company, as the exporter of record, is responsibl=
e for determining the correct classification of any item at the time of e=
xport.  Any export classification by TI of Software is for TI's internal =
use only and shall not be construed as a representation or warranty regar=
ding the proper export classification for such Software or whether an exp=
ort license or other documentation is required for exporting such Softwar=
e.
+</p>
+
+<h2><u>Links in the Manifest</u></h2>
+<p>
+Any links appearing on this Manifest (for example in the &ldquo;Obtained=
 from&rdquo; field) were verified at the time the Manifest was created.  =
TI makes no guarantee that any listed links will remain active in the fut=
ure.
+</p>
+
+<h2><u>Open Source License References</u></h2>
+<p>
+Your company is responsible for confirming the applicable license terms =
for any open source Software listed in this Manifest that was not &ldquo;=
Obtained from&rdquo; TI.  Any open source license specified in this Manif=
est for Sotware that was not &ldquo;Obtained from&rdquo; TI is for TI's i=
nternal use only and shall not be construed as a representation of warran=
ty regarding the proper open source license terms for such Software.
+</p>
+
+<h2><b>Export Information</b></h2>
+<p>
+ECCN for Software included in this release: Publicly Available
+</p>
+
+<p>
+ECCN for Technology (e.g., user documentation, specifications) included =
in this release: Publicly Available
+</p>
+
+<h2><b>Manifest</b></h2>
+<p>
+See Legend above for a description of the columns and possible values.
+</p>
+" > ${SW_MANIFEST_FILE}
+
+cat > ${SW_MANIFEST_TEXT} << 'EOF'
+<--
+Manifest template 1.0
+
+This template is used to generate an unloadable manifest to the SRAS. To=
 do so, save the document as a plain text file (Save As .txt). Do not cha=
nge any options on the save which means leave the default as Windows Defa=
ult Encoding. The SRAS will generate a nice looking HTML manifest for you.
+
+Instructions:
+
+ 1.   Text in blue should not be edited or removed. It will NOT appear o=
n your manifest.
+ 2.   DO NOT color outside the lines in the manifest.  There are specifi=
c blocks where you enter information. Information
+       should only be entered in the sections below and not outside of t=
hem.
+ 3.   DO NOT use the < or > symbols in your manifest table or in your fo=
otnotes.
+ 4.   Please REFRAIN from using Word specific formatting when filling in=
 the table. Examples are things like superscripts,
+      subscripts, etc. We are unable to understand those.
+ 5.   Auto correction is not your friend in word. Please turn it off. It=
 should be disabled already in this template.
+
+Table Instructions:
+
+Define what you are delivering by filling in the table below. Tables sta=
rt with the start keyword <table> end with the end keyword, </table> and =
may also contain footnotes specific to that table.
+
+You can have as many .Public. tables as you like in your manifest and ca=
n name them.  You can have one and only one .Private. table. To create ad=
ditional tables copy everything starting with <table> down to </table> an=
d then paste it after the table below.
+
+The field .attribute =3D. can be set to Public (the default) or Private =
to define the type of table it is. If the table is Public then everything=
 in the table will appear on your manifest. If the table is Private then =
none of the entries will appear on your manifest but they will be stored =
in the SRAS. Private tables are useful for documenting third party code, =
that requires Legal review, but does not need to be acknowledged on the m=
anifest you ship; e.g. it may be covered by our TI license.
+
+The field .name =3D . is used to put a heading over the table on the man=
ifest you ship.
+
+The field .description =3D. is used to put a description under the Table=
 name on the manifest you ship.
+
+To learn how to document software in the table read the instructions her=
e. A brief explanation of the table columns follows.
+License Type - If its an SPDX defined license use their short name ident=
ifier. You can see a list here: http://spdx.org/licenses/ . If it.s not o=
n the list and not a commercial or TSPA  license then use the application=
 name as the license.
+
+Delivered As - This field will either be .Source., .Binary. or .Source a=
nd Binary. and is the form the content of the Software is delivered in.  =
If the Software is delivered in an archive format, this field applies to =
the contents of the archive. If the word Limited is used with Source, as =
in .Limited Source. or .Limited Source and Binary. then only portions of =
the Source for the application are provided.
+
+Modified by TI - This field will either be .Yes. or .No.. A .Yes. means =
TI has made changes to the Software. A .No. means TI has not made any cha=
nges. Note: This field is not applicable for Software .Obtained from. TI.
+
+Location - The directory name and path on the media, e.g. drive, (or in =
an archive) where the Software is located after installing or extracting.
+
+Obtained From - This field specifies from where or from whom TI obtained=
 the Software. It may be a URL to an Open Source site, a 3rd party licens=
or, or TI (if TI developed the software). If this field contains a link t=
o Open Source software, the date TI downloaded the Software is also recor=
ded. See Links Disclaimer in the Disclaimers Section.
+-->
+
+<directives>
+Version =3D .1.0.
+Sep =3D .|.
+Tool=3D.Word.
+</directives>
+
+<-- ** Do not edit or remove anything above this line **
+-->
+
+<--
+Instructions: DO NOT Alter the column headings below. This is now a sing=
le row table as opposed to the older manifests which used merged rows. Th=
e order is extremely important; if you change the order or add or remove =
a column the upload will not work.
+-->
+
+EOF
+
+}
+
+sw_manifest_footer() {
+echo "
+<h2>Credits</h2>
+
+<h2>Licenses</h2>
+<p>Licenses can be found in the \"licenses\" directory of the SDK instal=
l directory</p>
+
+<h2><u><b>GCC RUNTIME LIBRARY EXCEPTION</b></u></h2>
+<p>Version 3.1, 31 March 2009</p>
+
+<p>Copyright =C2=A9 2009 Free Software Foundation, Inc. <a href=3D\"http=
://fsf.org/\">http://fsf.org/</a></p>
+
+<p>Everyone is permitted to copy and distribute verbatim copies of this =
license document, but changing it is not allowed.</p>
+
+<p>This GCC Runtime Library Exception ("Exception") is an additional per=
mission under section 7 of the GNU General Public License, version 3 ("GP=
L-3.0"). It applies to a given file (the "Runtime Library") that bears a =
notice placed by the copyright holder of the file stating that the file i=
s governed by GPL-3.0 along with this Exception.</p>
+
+<p>When you use GCC to compile a program, GCC may combine portions of ce=
rtain GCC header files and runtime libraries with the compiled program. T=
he purpose of this Exception is to allow compilation of non-GPL (includin=
g proprietary) programs to use, in this way, the header files and runtime=
 libraries covered by this Exception.</p>
+
+<h3><b>0. Definitions.</b></h3>
+<p>A file is an "Independent Module" if it either requires the Runtime L=
ibrary for execution after a Compilation Process, or makes use of an inte=
rface provided by the Runtime Library, but is not otherwise based on the =
Runtime Library.</p>
+
+<p>"GCC" means a version of the GNU Compiler Collection, with or without=
 modifications, governed by version 3 (or a specified later version) of t=
he GNU General Public License (GPL) with the option of using any subseque=
nt versions published by the FSF.</p>
+
+<p>"GPL-compatible Software" is software whose conditions of propagation=
, modification and use would permit combination with GCC in accord with t=
he license of GCC.</p>
+
+<p>"GPL-compatible Software" is software whose conditions of propagation=
, modification and use would permit combination with GCC in accord with t=
he license of GCC.</p>
+
+<p>The "Compilation Process" transforms code entirely represented in non=
-intermediate languages designed for human-written code, and/or in Java V=
irtual Machine byte code, into Target Code. Thus, for example, use of sou=
rce code generators and preprocessors need not be considered part of the =
Compilation Process, since the Compilation Process can be understood as s=
tarting with the output of the generators or preprocessors.</p>
+
+<p>A Compilation Process is "Eligible" if it is done using GCC, alone or=
 with other GPL-compatible software, or if it is done without using any w=
ork based on GCC. For example, using non-GPL-compatible Software to optim=
ize any GCC intermediate representations would not qualify as an Eligible=
 Compilation Process.</p>
+
+<h3><b>1. Grant of Additional Permission.</b></h3>
+<p>You have permission to propagate a work of Target Code formed by comb=
ining the Runtime Library with Independent Modules, even if such propagat=
ion would otherwise violate the terms of GPL-3.0, provided that all Targe=
t Code was generated by Eligible Compilation Processes. You may then conv=
ey such a combination under terms of your choice, consistent with the lic=
ensing of the Independent Modules.</p>
+
+<h3><b>2. No Weakening of GCC Copyleft.</b></h3>
+<p>The availability of this Exception does not imply any general presump=
tion that third-party software is unaffected by the copyleft requirements=
 of the license of GCC.</p>
+
+<hr>
+<right> <i><font color=3Dgrey>Auto generated by TISDK installer on `date=
`</i> </right></font>
+</body>
+</html>
+
+" >> ${SW_MANIFEST_FILE}
+
+
+cat >> ${SW_MANIFEST_TEXT} << 'EOF'
+<Credits>
+
+</credits>
+
+<Licenses>
+
+Licenses can be found in the "licenses/" directory of the SDK install di=
rectory
+GCC RUNTIME LIBRARY EXCEPTION
+
+Version 3.1, 31 March 2009
+
+Copyright =C2=A9 2009 Free Software Foundation, Inc. http://fsf.org/
+
+Everyone is permitted to copy and distribute verbatim copies of this lic=
ense document, but changing it is not allowed.
+
+This GCC Runtime Library Exception (Exception) is an additional permissi=
on under section 7 of the GNU General Public License, version 3 (GPL-3.0)=
. It applies to a given file (the Runtime Library) that bears a notice pl=
aced by the copyright holder of the file stating that the file is governe=
d by GPL-3.0 along with this Exception.
+
+When you use GCC to compile a program, GCC may combine portions of certa=
in GCC header files and runtime libraries with the compiled program. The =
purpose of this Exception is to allow compilation of non-GPL (including p=
roprietary) programs to use, in this way, the header files and runtime li=
braries covered by this Exception.
+0. Definitions.
+
+A file is an Independent Module if it either requires the Runtime Librar=
y for execution after a Compilation Process, or makes use of an interface=
 provided by the Runtime Library, but is not otherwise based on the Runti=
me Library.
+
+GCC means a version of the GNU Compiler Collection, with or without modi=
fications, governed by version 3 (or a specified later version) of the GN=
U General Public License (GPL) with the option of using any subsequent ve=
rsions published by the FSF.
+
+GPL-compatible Software is software whose conditions of propagation, mod=
ification and use would permit combination with GCC in accord with the li=
cense of GCC.
+
+GPL-compatible Software is software whose conditions of propagation, mod=
ification and use would permit combination with GCC in accord with the li=
cense of GCC.
+
+The Compilation Process transforms code entirely represented in non-inte=
rmediate languages designed for human-written code, and/or in Java Virtua=
l Machine byte code, into Target Code. Thus, for example, use of source c=
ode generators and preprocessors need not be considered part of the Compi=
lation Process, since the Compilation Process can be understood as starti=
ng with the output of the generators or preprocessors.
+
+A Compilation Process is Eligible if it is done using GCC, alone or with=
 other GPL-compatible software, or if it is done without using any work b=
ased on GCC. For example, using non-GPL-compatible Software to optimize a=
ny GCC intermediate representations would not qualify as an Eligible Comp=
ilation Process.
+1. Grant of Additional Permission.
+
+You have permission to propagate a work of Target Code formed by combini=
ng the Runtime Library with Independent Modules, even if such propagation=
 would otherwise violate the terms of GPL-3.0, provided that all Target C=
ode was generated by Eligible Compilation Processes. You may then convey =
such a combination under terms of your choice, consistent with the licens=
ing of the Independent Modules.
+2. No Weakening of GCC Copyleft.
+
+The availability of this Exception does not imply any general presumptio=
n that third-party software is unaffected by the copyleft requirements of=
 the license of GCC.
+
+</licenses>
+EOF
+
+}
+
+sw_manifest_table_header() {
+    html_out=3D"$1"
+    txt_out=3D"$2"
+
+    echo "
+<h2><u>$3</u></h2>
+<p>$4</p>
+" >> ${html_out}
+
+
+    cat >> ${txt_out} << EOF
+<table>
+<thead>
+attribute =3D "Public"
+name =3D "$3"
+description =3D "$4"
+</thead>
+
+EOF
+}
+
+sw_manifest_table_footer() {
+    html_out=3D"$1"
+    txt_out=3D"$2"
+
+    if [ ! -z $3 ]; then
+        cat >> ${txt_out} << EOF
+<Footnotes>
+$1
+</footnotes>
+EOF
+    fi
+    cat >> ${txt_out} << EOF
+</table>
+
+EOF
+}
+
+# Create the host side toolchain components table
+sw_manifest_toolchain_host() {
+    sdk_path=3D"$1"
+
+    opkg_dir=3D"${sdk_path}/sysroots/*86*-linux/var/lib/opkg/info"
+
+    sw_manifest_table_header ${SW_MANIFEST_TOOLCHAIN_HOST_FILE} ${SW_MAN=
IFEST_TOOLCHAIN_HOST_TEXT} "GPL-3.0 Development Host Content" "This table=
 describes any GPL-3.0 software being delivered that is expected to run o=
n a Development Host, instead of the target device."
+
+    generate_sw_manifest_table ${SW_MANIFEST_TOOLCHAIN_HOST_FILE} ${SW_M=
ANIFEST_TOOLCHAIN_HOST_TEXT} $opkg_dir "true"
+
+    sw_manifest_table_footer ${SW_MANIFEST_TOOLCHAIN_HOST_FILE} ${SW_MAN=
IFEST_TOOLCHAIN_HOST_TEXT}
+
+    sw_manifest_table_header ${SW_MANIFEST_TOOLCHAIN_HOST_FILE} ${SW_MAN=
IFEST_TOOLCHAIN_HOST_TEXT} "Development Host Content" "This table describ=
es any software being delivered that is expected to run on a Development =
Host, instead of the target device.  Some of this software may be license=
d under GPL-3.0 but it is not expected to be shipped as a product."
+
+    generate_sw_manifest_table ${SW_MANIFEST_TOOLCHAIN_HOST_FILE} ${SW_M=
ANIFEST_TOOLCHAIN_HOST_TEXT} $opkg_dir
+
+    sw_manifest_table_footer ${SW_MANIFEST_TOOLCHAIN_HOST_FILE} ${SW_MAN=
IFEST_TOOLCHAIN_HOST_TEXT}
+}
+
+# Create the target side toolchain components table.  These are componen=
ts on
+# the host but intended for the target.
+sw_manifest_toolchain_target() {
+    sdk_path=3D"$1"
+
+    opkg_dir=3D"${sdk_path}/sysroots/${ARMPKGARCH}*/var/lib/opkg/info"
+
+    sw_manifest_table_header ${SW_MANIFEST_TOOLCHAIN_TARGET_FILE} ${SW_M=
ANIFEST_TOOLCHAIN_TARGET_TEXT} "GPL-3.0 Development Libraries Installed o=
n Host" "This table describes GPL-3.0 software libraries and headers that=
 are installed on the development host and used during the development of=
 software to run on the target. Customers should be careful when linking =
against these libraries to make sure they are complying with the license(=
s) of the library"
+
+    generate_sw_manifest_table ${SW_MANIFEST_TOOLCHAIN_TARGET_FILE} ${SW=
_MANIFEST_TOOLCHAIN_TARGET_TEXT} $opkg_dir "true"
+
+    sw_manifest_table_footer ${SW_MANIFEST_TOOLCHAIN_TARGET_FILE} ${SW_M=
ANIFEST_TOOLCHAIN_TARGET_TEXT}
+
+    sw_manifest_table_header ${SW_MANIFEST_TOOLCHAIN_TARGET_FILE} ${SW_M=
ANIFEST_TOOLCHAIN_TARGET_TEXT} "Development Libraries Installed on Host" =
"This table describes software libraries and headers that are installed o=
n the development host and used during the development of software to run=
 on the target.  Some of this software may be licensed under GPL-3.0.  Cu=
stomers should be careful when linking against these libraries to make su=
re they are complying with the license(s) of the library"
+
+    generate_sw_manifest_table ${SW_MANIFEST_TOOLCHAIN_TARGET_FILE} ${SW=
_MANIFEST_TOOLCHAIN_TARGET_TEXT} $opkg_dir
+
+    sw_manifest_table_footer ${SW_MANIFEST_TOOLCHAIN_TARGET_FILE} ${SW_M=
ANIFEST_TOOLCHAIN_TARGET_TEXT}
+}
+
+# Create the table of GPL-3.0 components found in the target file system
+sw_manifest_target_gplv3() {
+    opkg_dir=3D"$1"
+
+    sw_manifest_table_header ${SW_MANIFEST_FILE} ${SW_MANIFEST_TEXT} "GP=
L-3.0 Target Device Content" "This table describes any GPL-3.0 software b=
eing delivered that is expected to run on the target device."
+
+    generate_sw_manifest_table ${SW_MANIFEST_FILE} ${SW_MANIFEST_TEXT} $=
opkg_dir "true"
+
+    sw_manifest_table_footer ${SW_MANIFEST_FILE} ${SW_MANIFEST_TEXT}
+}
+
+# Generate the full target file system components table.
+sw_manifest_target() {
+    # Extract the combined set of .control files from the TARGET_IMAGES =
in
+    # the filesystem directory to generate the manifest.
+    for image in ${TARGET_IMAGES}
+    do
+        # Only extract tar.gz or tar.bz2 types
+        if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
+        then
+            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.x=
z -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
+        elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz =
]
+        then
+            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.g=
z -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
+        fi
+    done
+
+    # set the opkg_dir value to look at the extracted target file system
+    # image files
+    opkg_dir=3D"${IMAGE_ROOTFS}/filesystem/var/lib/opkg/info"
+
+    sw_manifest_target_gplv3 $opkg_dir
+
+    sw_manifest_table_header ${SW_MANIFEST_FILE} ${SW_MANIFEST_TEXT} "Al=
l Target Device Content" "This table describes any software being deliver=
ed that is expected to run on the target device."
+
+    generate_sw_manifest_table ${SW_MANIFEST_FILE} ${SW_MANIFEST_TEXT} $=
opkg_dir
+
+    sw_manifest_table_footer ${SW_MANIFEST_FILE} ${SW_MANIFEST_TEXT}
+
+    # Remove the temporary var directory that was extracted
+    rm -rf ${IMAGE_ROOTFS}/filesystem/var
+}
+
+# Create the table of host components installed.
+sw_manifest_host() {
+    sw_manifest_table_header ${SW_MANIFEST_FILE} ${SW_MANIFEST_TEXT} "Ad=
ditional Development Host Content" "This table describes software that is=
 installed on the development host but is not part of the linux-devkit pa=
ckage.  This is usually software example sources or tools such a flash ut=
ilities."
+
+    opkg_dir=3D"${IMAGE_ROOTFS}/var/lib/opkg/info"
+
+    generate_sw_manifest_table ${SW_MANIFEST_FILE} ${SW_MANIFEST_TEXT} $=
opkg_dir
+
+    sw_manifest_table_footer ${SW_MANIFEST_FILE} ${SW_MANIFEST_TEXT}
+}
+
+# This function expects to be passed the following parameter
+#   - The location to the opkg info directory containing the control fil=
es
+#     of the installed packages
+# Optionally if the second parameter is set to true then only GPL-3.0 co=
ntents
+# will be listed.  This is for TI SW Manifests where GPL-3.0 content is
+# highlighted as a separate table.
+generate_sw_manifest_table() {
+    html_out=3D"$1"
+    txt_out=3D"$2"
+    control_dir=3D"$3"
+    gplv3_only=3D"$4"
+
+    if [ ! -d "$control_dir" ]
+    then
+        echo "Could not find the control directory ($control_dir)"
+        return 1
+    fi
+
+    if [ "$gplv3_only" =3D "" ]
+    then
+        # The second parameter was not passed so set to false
+        gplv3_only=3D"false"
+    fi
+
+echo "
+<table border=3D1 cellspacing=3D1 cellpadding=3D1 width=3D80%>
+<tr bgcolor=3D#c0c0c0  color=3Dwhite>
+    <td><b>Software Name</b></td>
+    <td><b>Version</b></td>
+    <td><b>License</b></td>
+    <td><b>Location</b></td>
+    <td><b>Delivered As</b></td>
+    <td><b>Modified by TI</b></td>
+    <td><b>Obtained from</b></td>
+</tr>
+" >> ${html_out}
+
+cat >> ${txt_out} << EOF
+<tbody>
+<!-- Software Name
+| Version
+| License Type
+| Delivered As
+| Modified by TI
+| Location
+| Obtained from -->
+
+EOF
+
+    control_files_there=3D0
+    for possible_control_file in $control_dir/*.control
+    do
+        if [ -f $possible_control_file ]
+        then
+            control_files_there=3D1
+            break
+        fi
+    done
+
+    if [ $control_files_there -eq 0 ]
+    then
+        for pkg_idx in $control_dir/oe*; do
+            package_start=3D`grep -n "^Package" $pkg_idx || true`
+
+            IFS_OLD=3D${IFS}
+            IFS=3D"
+"
+
+            begin=3D""
+            end=3D""
+            for pkg in ${package_start}; do
+                end=3D`echo $pkg | cut -d: -f1`
+
+                if [ -z $begin ]; then
+                    pkg_name=3D`echo $pkg | cut -d: -f3`
+                    begin=3D`echo $pkg | cut -d: -f1`
+                    continue
+                fi
+                cnt=3D$[$cnt+1]
+                head -n $[$end - 1] $pkg_idx | tail -n $[$end - $begin] =
> ${control_dir}/${pkg_name// /}.control
+
+                pkg_name=3D`echo $pkg | cut -d: -f3`
+                begin=3D$end
+            done
+            if [ ! -z $end ]; then
+                end=3D`wc -l $pkg_idx | awk '{ print $1 }'`
+                end=3D$[$end + 1]
+                tail -n $[$end - $begin] $pkg_idx > ${control_dir}/${pkg=
_name// /}.control
+            fi
+
+            IFS=3D${IFS_OLD}
+        done
+    fi
+
+    for i in $control_dir/*.control
+    do
+        package=3D"`cat $i | grep Package: | awk {'print $2'}`"
+        version=3D"`cat $i | grep Version: | awk {'print $2'} | cut -f1-=
2 -d-`"
+        long_version=3D"`cat $i | grep Version: | awk {'print $2'}`"
+        license=3D"`cat $i | grep License: | cut -d: -f2 `"
+        architecture=3D"`cat $i | grep Architecture: | awk {'print $2'}`=
"
+        sources=3D"`cat $i | grep Source: | cut -d ':' -f2-`"
+        location=3D"$package""_""$long_version""_""$architecture"".ipk"
+
+        # Set the highlight color if the license in GPL-3.0.  If this is
+        # a GPL-3.0 only table then skip this package.
+        case "$license" in
+            *GPL-3.0*)
+                highlight=3D"bgcolor=3Dyellow" ;;
+            *unknown*)
+                if [ "$gplv3_only" !=3D "true" ]
+                then
+                    highlight=3D"bgcolor=3Dyellow"
+                else
+                    continue
+                fi
+                ;;
+            *)
+                if [ "$gplv3_only" !=3D "true" ]
+                then
+                    highlight=3D""
+                else
+                    continue
+                fi
+                ;;
+        esac
+
+        # source variable contains the text to be used in the manifest
+        source=3D""
+        # Are there additional files in the package that come from the
+        # arago/OE metadata?
+        extra_files=3D"0"
+        modified=3D"No"
+        for s in $sources
+        do
+            case "$s" in
+                file://*)
+                    extra_files=3D"1"
+                    ;;
+                http://install.source.dir.local*)
+                    # If we are pulling something from a local file syst=
em then
+                    # it is not a public modification and this should be=
 marked
+                    # as modified.  This should not be the normal case.
+                    modified=3D"Yes"
+                    ;;
+                *)
+                    source=3D"$source""<a href=3D$s>$s</a>";;
+            esac
+        done
+
+        if [ "$extra_files" =3D "1" ]
+        then
+            source=3D"$source"" <br>Files from:<br><a href=3Dhttps://git=
.yoctoproject.org/meta-arago>https://git.yoctoproject.org/meta-arago</a><=
br><a href=3Dhttps://git.yoctoproject.org/meta-ti>https://git.yoctoprojec=
t.org/meta-ti</a>"
+        fi
+
+        case "$package" in
+            task-*)
+                continue ;;
+            *-source*)
+                delivered_as=3D"Source"
+                ;;
+            *)
+                delivered_as=3D"Binary"
+                ;;
+        esac
+
+echo "
+<tr>
+    <td>${package} </td>
+    <td>${version}</td>
+    <td $highlight>${license}</td>
+    <td>${location}</td>
+    <td>${delivered_as}</td>
+    <td>${modified}</td>
+    <td>${source}</td>
+</tr>
+" >> ${html_out}
+
+cat >> ${txt_out} << EOF
+| ${package} | ${version} | ${license} | ${delivered_as} | ${modified} |=
 ${location} | ${source}
+EOF
+    done
+
+    echo "</table><br><br>" >> ${html_out}
+
+cat >> ${txt_out} << EOF
+</tbody>
+
+EOF
+
+}
+
+# Generate the TI SW Manifest for the SDK image
+generate_sw_manifest() {
+    sw_manifest_header
+
+    if [ -f "${SW_MANIFEST_TOOLCHAIN_DEPLOY_HOST_FILE}" ]
+    then
+        cat ${SW_MANIFEST_TOOLCHAIN_DEPLOY_HOST_FILE} >> ${SW_MANIFEST_F=
ILE}
+    fi
+    if [ -f "${SW_MANIFEST_TOOLCHAIN_DEPLOY_HOST_TEXT}" ]
+    then
+        cat ${SW_MANIFEST_TOOLCHAIN_DEPLOY_HOST_TEXT} >> ${SW_MANIFEST_T=
EXT}
+    fi
+
+    sw_manifest_target
+    sw_manifest_host
+
+    if [ -f "${SW_MANIFEST_TOOLCHAIN_DEPLOY_TARGET_FILE}" ]
+    then
+        cat ${SW_MANIFEST_TOOLCHAIN_DEPLOY_TARGET_FILE} >> ${SW_MANIFEST=
_FILE}
+    fi
+    if [ -f "${SW_MANIFEST_TOOLCHAIN_DEPLOY_TARGET_TEXT}" ]
+    then
+        cat ${SW_MANIFEST_TOOLCHAIN_DEPLOY_TARGET_TEXT} >> ${SW_MANIFEST=
_TEXT}
+    fi
+
+    sw_manifest_footer
+}
+
+# Generate the TI SW Manifest for the tolchains
+generate_sw_manifest_toolchain() {
+    sdk_path=3D"$1"
+
+    mkdir -p ${SW_MANIFEST_TOOLCHAIN_DIR}
+
+    sw_manifest_toolchain_host "${sdk_path}"
+    sw_manifest_toolchain_target "${sdk_path}"
+}
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb =
b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 8bff9abb..be18be00 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -9,6 +9,7 @@ SDKIMAGE_FEATURES =3D "package-management"
 SDK_PACKAGE_ARCHS +=3D "buildtools-dummy-${SDKPKGSUFFIX}"
=20
 inherit toolchain-scripts
+inherit tisdk-sw-manifest
=20
 require recipes-core/meta/meta-toolchain.bb
=20
@@ -135,6 +136,8 @@ fakeroot archive_sdk() {
 	mkdir -p ${SDKDEPLOYDIR}
 	cd ${SDK_OUTPUT}/${SDKPATH}
 	tar --owner=3Droot --group=3Droot -c . | xz ${SDK_XZ_OPTIONS} > ${SDKDE=
PLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}
+
+    generate_sw_manifest_toolchain "${SDK_OUTPUT}/${SDKPATH}"
 }
=20
 fakeroot create_shar() {
--=20
2.17.1


