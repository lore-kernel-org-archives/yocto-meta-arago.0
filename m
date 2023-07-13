Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85950EB64DD
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 09:57:32 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.4858.1689242251461739085
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Jul 2023 02:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=rjNSSv55;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36D9vUxa110916
	for <meta-arago@lists.yoctoproject.org>; Thu, 13 Jul 2023 04:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689242250;
	bh=8QAInXIVqfPzBmH29pLgqw+GopA+UH/A+Tj+f4N1r14=;
	h=From:To:CC:Subject:Date;
	b=rjNSSv55Hlf+AYmcx7M/wennrS77ceAnk9fgEmWo/Vj2DAdWFQV55KwpOU9zP41+m
	 46VjVE0K/IDtuCExis6HErUQVSGzErKubB6epeY/URc5KF6FxzKQxZynI0XLxCm/Zh
	 x2efgj53W9kZ05bs/Ps9/qJUvMdM0HduRC12drzw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36D9vUl1060580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 13 Jul 2023 04:57:30 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jul 2023 04:57:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jul 2023 04:57:29 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36D9vRk1001510;
	Thu, 13 Jul 2023 04:57:28 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <reatmon@ti.com>, <s-adivi@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] classes: tisdk-bundle: Update logic to handle SPDX license identifiers
Date: Thu, 13 Jul 2023 15:27:16 +0530
Message-ID: <20230713095716.1439616-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 36D9vUxa110916
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Jul 2023 09:57:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14799

Referring to this:
https://docs.yoctoproject.org/migration-guides/migration-4.0.html#license=
-changes

And this:
https://git.openembedded.org/openembedded-core/tree/scripts/contrib/conve=
rt-spdx-licenses.py#n21

The older logic to populate the GPLv3 Table was out of date and was
giving an empty table.
Have it look for the new SPDX pattern *GPL-3.0*

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../classes/tisdk-bundle.bbclass              | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-=
distro/classes/tisdk-bundle.bbclass
index dbdc9a5a..1d14227f 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -249,7 +249,7 @@ echo "
=20
 <p>Everyone is permitted to copy and distribute verbatim copies of this =
license document, but changing it is not allowed.</p>
=20
-<p>This GCC Runtime Library Exception ("Exception") is an additional per=
mission under section 7 of the GNU General Public License, version 3 ("GP=
Lv3"). It applies to a given file (the "Runtime Library") that bears a no=
tice placed by the copyright holder of the file stating that the file is =
governed by GPLv3 along with this Exception.</p>
+<p>This GCC Runtime Library Exception ("Exception") is an additional per=
mission under section 7 of the GNU General Public License, version 3 ("GP=
L-3.0"). It applies to a given file (the "Runtime Library") that bears a =
notice placed by the copyright holder of the file stating that the file i=
s governed by GPL-3.0 along with this Exception.</p>
=20
 <p>When you use GCC to compile a program, GCC may combine portions of ce=
rtain GCC header files and runtime libraries with the compiled program. T=
he purpose of this Exception is to allow compilation of non-GPL (includin=
g proprietary) programs to use, in this way, the header files and runtime=
 libraries covered by this Exception.</p>
=20
@@ -267,7 +267,7 @@ echo "
 <p>A Compilation Process is "Eligible" if it is done using GCC, alone or=
 with other GPL-compatible software, or if it is done without using any w=
ork based on GCC. For example, using non-GPL-compatible Software to optim=
ize any GCC intermediate representations would not qualify as an Eligible=
 Compilation Process.</p>
=20
 <h3><b>1. Grant of Additional Permission.</b></h3>
-<p>You have permission to propagate a work of Target Code formed by comb=
ining the Runtime Library with Independent Modules, even if such propagat=
ion would otherwise violate the terms of GPLv3, provided that all Target =
Code was generated by Eligible Compilation Processes. You may then convey=
 such a combination under terms of your choice, consistent with the licen=
sing of the Independent Modules.</p>
+<p>You have permission to propagate a work of Target Code formed by comb=
ining the Runtime Library with Independent Modules, even if such propagat=
ion would otherwise violate the terms of GPL-3.0, provided that all Targe=
t Code was generated by Eligible Compilation Processes. You may then conv=
ey such a combination under terms of your choice, consistent with the lic=
ensing of the Independent Modules.</p>
=20
 <h3><b>2. No Weakening of GCC Copyleft.</b></h3>
 <p>The availability of this Exception does not imply any general presump=
tion that third-party software is unaffected by the copyleft requirements=
 of the license of GCC.</p>
@@ -296,7 +296,7 @@ Copyright =C2=A9 2009 Free Software Foundation, Inc. =
http://fsf.org/
=20
 Everyone is permitted to copy and distribute verbatim copies of this lic=
ense document, but changing it is not allowed.
=20
-This GCC Runtime Library Exception (Exception) is an additional permissi=
on under section 7 of the GNU General Public License, version 3 (GPLv3). =
It applies to a given file (the Runtime Library) that bears a notice plac=
ed by the copyright holder of the file stating that the file is governed =
by GPLv3 along with this Exception.
+This GCC Runtime Library Exception (Exception) is an additional permissi=
on under section 7 of the GNU General Public License, version 3 (GPL-3.0)=
. It applies to a given file (the Runtime Library) that bears a notice pl=
aced by the copyright holder of the file stating that the file is governe=
d by GPL-3.0 along with this Exception.
=20
 When you use GCC to compile a program, GCC may combine portions of certa=
in GCC header files and runtime libraries with the compiled program. The =
purpose of this Exception is to allow compilation of non-GPL (including p=
roprietary) programs to use, in this way, the header files and runtime li=
braries covered by this Exception.
 0. Definitions.
@@ -314,7 +314,7 @@ The Compilation Process transforms code entirely repr=
esented in non-intermediate
 A Compilation Process is Eligible if it is done using GCC, alone or with=
 other GPL-compatible software, or if it is done without using any work b=
ased on GCC. For example, using non-GPL-compatible Software to optimize a=
ny GCC intermediate representations would not qualify as an Eligible Comp=
ilation Process.
 1. Grant of Additional Permission.
=20
-You have permission to propagate a work of Target Code formed by combini=
ng the Runtime Library with Independent Modules, even if such propagation=
 would otherwise violate the terms of GPLv3, provided that all Target Cod=
e was generated by Eligible Compilation Processes. You may then convey su=
ch a combination under terms of your choice, consistent with the licensin=
g of the Independent Modules.
+You have permission to propagate a work of Target Code formed by combini=
ng the Runtime Library with Independent Modules, even if such propagation=
 would otherwise violate the terms of GPL-3.0, provided that all Target C=
ode was generated by Eligible Compilation Processes. You may then convey =
such a combination under terms of your choice, consistent with the licens=
ing of the Independent Modules.
 2. No Weakening of GCC Copyleft.
=20
 The availability of this Exception does not imply any general presumptio=
n that third-party software is unaffected by the copyleft requirements of=
 the license of GCC.
@@ -359,13 +359,13 @@ EOF
 sw_manifest_toolchain_host() {
     opkg_dir=3D"${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/*86*-li=
nux/var/lib/opkg/info"
=20
-    sw_manifest_table_header "GPLv3 Development Host Content" "This tabl=
e describes any GPLv3 software being delivered that is expected to run on=
 a Development Host, instead of the target device."
+    sw_manifest_table_header "GPL-3.0 Development Host Content" "This ta=
ble describes any GPL-3.0 software being delivered that is expected to ru=
n on a Development Host, instead of the target device."
=20
     generate_sw_manifest_table $opkg_dir "true"
=20
     sw_manifest_table_footer
=20
-    sw_manifest_table_header "Development Host Content" "This table desc=
ribes any software being delivered that is expected to run on a Developme=
nt Host, instead of the target device.  Some of this software may be lice=
nsed under GPLv3 but it is not expected to be shipped as a product."
+    sw_manifest_table_header "Development Host Content" "This table desc=
ribes any software being delivered that is expected to run on a Developme=
nt Host, instead of the target device.  Some of this software may be lice=
nsed under GPL-3.0 but it is not expected to be shipped as a product."
=20
     generate_sw_manifest_table $opkg_dir
=20
@@ -377,24 +377,24 @@ sw_manifest_toolchain_host() {
 sw_manifest_toolchain_target() {
     opkg_dir=3D"${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/${ARMPK=
GARCH}*-linux*/var/lib/opkg/info"
=20
-    sw_manifest_table_header "GPLv3 Development Libraries Installed on H=
ost" "This table describes GPLv3 software libraries and headers that are =
installed on the development host and used during the development of soft=
ware to run on the target. Customers should be careful when linking again=
st these libraries to make sure they are complying with the license(s) of=
 the library"
+    sw_manifest_table_header "GPL-3.0 Development Libraries Installed on=
 Host" "This table describes GPL-3.0 software libraries and headers that =
are installed on the development host and used during the development of =
software to run on the target. Customers should be careful when linking a=
gainst these libraries to make sure they are complying with the license(s=
) of the library"
=20
     generate_sw_manifest_table $opkg_dir "true"
=20
     sw_manifest_table_footer
=20
-    sw_manifest_table_header "Development Libraries Installed on Host" "=
This table describes software libraries and headers that are installed on=
 the development host and used during the development of software to run =
on the target.  Some of this software may be licensed under GPLv3.  Custo=
mers should be careful when linking against these libraries to make sure =
they are complying with the license(s) of the library"
+    sw_manifest_table_header "Development Libraries Installed on Host" "=
This table describes software libraries and headers that are installed on=
 the development host and used during the development of software to run =
on the target.  Some of this software may be licensed under GPL-3.0.  Cus=
tomers should be careful when linking against these libraries to make sur=
e they are complying with the license(s) of the library"
=20
     generate_sw_manifest_table $opkg_dir
=20
     sw_manifest_table_footer
 }
=20
-# Create the table of GPLv3 components found in the target file system
+# Create the table of GPL-3.0 components found in the target file system
 sw_manifest_target_gplv3() {
     opkg_dir=3D"$1"
=20
-    sw_manifest_table_header "GPLv3 Target Device Content" "This table d=
escribes any GPLv3 software being delivered that is expected to run on th=
e target device."
+    sw_manifest_table_header "GPL-3.0 Target Device Content" "This table=
 describes any GPL-3.0 software being delivered that is expected to run o=
n the target device."
=20
     generate_sw_manifest_table $opkg_dir "true"
=20
@@ -484,8 +484,8 @@ get_sources_from_recipe(){
 # This function expects to be passed the following parameter
 #   - The location to the opkg info directory containing the control fil=
es
 #     of the installed packages
-# Optionally if the second parameter is set to true then only GPLv3 cont=
ents
-# will be listed.  This is for TI SW Manifests where GPLv3 content is
+# Optionally if the second parameter is set to true then only GPL-3.0 co=
ntents
+# will be listed.  This is for TI SW Manifests where GPL-3.0 content is
 # highlighted as a separate table.
 generate_sw_manifest_table() {
     control_dir=3D"$1"
@@ -587,10 +587,10 @@ EOF
         sources=3D"`get_sources_from_recipe $recipe`"
         location=3D"$package""_""$long_version""_""$architecture"".ipk"
=20
-        # Set the highlight color if the license in GPLv3.  If this is
-        # a GPLv3 only table then skip this package.
+        # Set the highlight color if the license in GPL-3.0.  If this is
+        # a GPL-3.0 only table then skip this package.
         case "$license" in
-            *GPLv3*)
+            *GPL-3.0*)
                 highlight=3D"bgcolor=3Dyellow" ;;
             *unknown*)
                 if [ "$gplv3_only" !=3D "true" ]
--=20
2.34.1


