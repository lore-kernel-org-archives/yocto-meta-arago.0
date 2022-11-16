Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B743EC4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 04:44:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3188.1668573869823795849
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Nov 2022 20:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F400340D53;
	Wed, 16 Nov 2022 04:44:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Jp9QuT4upsd; Wed, 16 Nov 2022 04:44:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D8D7640D43;
	Wed, 16 Nov 2022 04:44:27 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E88A8163674;
	Tue, 15 Nov 2022 23:44:22 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] kernel-fitimage-legacyhs: don't use unit addresses in FIT
Date: Wed, 16 Nov 2022 04:44:26 +0000
Message-Id: <20221116044426.2893659-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Nov 2022 04:44:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14112

From: Denys Dmytriyenko <denys@konsulko.com>

Das U-Boot 2021.4-rc1 has the following commit:

    commit 3f04db891a353f4b127ed57279279f851c6b4917
    Author: Simon Glass <sjg@chromium.org>
    Date:   Mon Feb 15 17:08:12 2021 -0700

        image: Check for unit addresses in FITs

        Using unit addresses in a FIT is a security risk. Add a check for
        this and disallow it.

        CVE-2021-27138

Adjust the kernel-fitimage-legacyhs.bbclass accordingly to not use unit
addresses. This corresponds to a similar change in kernel-fitimage.bbclas=
s
upstream in OE-Core [1], as we still need to carry heavily modified class
for legacy HS devices. And uboot-mkimage comes from u-boot-tools-native
version 2022.01 in OE-Core and not u-boot-ti-staging 2021.01 in meta-ti.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D6047be9f8=
f0f5d616fda11d83b682c1b8aeaa0ae

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../classes/kernel-fitimage-legacyhs.bbclass  | 48 +++++++++----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage-legacyhs.bbclass b=
/meta-arago-distro/classes/kernel-fitimage-legacyhs.bbclass
index 4a006eb6..69fa0ed2 100644
--- a/meta-arago-distro/classes/kernel-fitimage-legacyhs.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage-legacyhs.bbclass
@@ -127,7 +127,7 @@ fitimage_emit_section_kernel() {
 	fi
=20
 	cat << EOF >> ${1}
-                kernel@${2} {
+                kernel-${2} {
                         description =3D "Linux kernel";
                         data =3D /incbin/("${3}");
                         type =3D "kernel";
@@ -139,7 +139,7 @@ fitimage_emit_section_kernel() {
 EOF
 	if test -n "${FITIMAGE_HASH_ALGO}"; then
 		cat << EOF >> ${1}
-                        hash@1 {
+                        hash-1 {
                                 algo =3D "${kernel_csum}";
                         };
 EOF
@@ -172,7 +172,7 @@ fitimage_emit_section_dtb() {
 EOF
 	if test -n "${FITIMAGE_HASH_ALGO}"; then
 		cat << EOF >> ${1}
-                        hash@1 {
+                        hash-1 {
                                 algo =3D "${dtb_csum}";
                         };
 EOF
@@ -202,7 +202,7 @@ fitimage_emit_section_tee() {
 EOF
 	if test -n "${FITIMAGE_HASH_ALGO}"; then
 		cat << EOF >> ${1}
-                        hash@1 {
+                        hash-1 {
                                 algo =3D "${tee_csum}";
                         };
 EOF
@@ -223,7 +223,7 @@ fitimage_emit_section_setup() {
 	setup_csum=3D${FITIMAGE_HASH_ALGO}
=20
 	cat << EOF >> ${1}
-                setup@${2} {
+                setup-${2} {
                         description =3D "Linux setup.bin";
                         data =3D /incbin/("${3}");
                         type =3D "x86_setup";
@@ -235,7 +235,7 @@ fitimage_emit_section_setup() {
 EOF
 	if test -n "${FITIMAGE_HASH_ALGO}"; then
 		cat << EOF >> ${1}
-                        hash@1 {
+                        hash-1 {
                                 algo =3D "${setup_csum}";
                         };
 EOF
@@ -275,7 +275,7 @@ fitimage_emit_section_ramdisk() {
 	esac
=20
 	cat << EOF >> ${1}
-                ramdisk@${2} {
+                ramdisk-${2} {
                         description =3D "ramdisk image";
                         data =3D /incbin/("${3}");
                         type =3D "ramdisk";
@@ -297,7 +297,7 @@ EOF
=20
 	if test -n "${FITIMAGE_HASH_ALGO}"; then
 		cat << EOF >> ${1}
-                        hash@1 {
+                        hash-1 {
                                 algo =3D "${ramdisk_csum}";
                         };
 EOF
@@ -334,7 +334,7 @@ fitimage_emit_section_config() {
 	if [ -n "${2}" ]; then
 		conf_desc=3D"Linux kernel"
 		sep=3D", "
-		kernel_line=3D"kernel =3D \"kernel@${2}\";"
+		kernel_line=3D"kernel =3D \"kernel-${2}\";"
 	fi
=20
 	if [ -n "${3}" ]; then
@@ -345,13 +345,13 @@ fitimage_emit_section_config() {
 	if [ -n "${4}" ]; then
 		conf_desc=3D"${conf_desc}${sep}ramdisk"
 		sep=3D", "
-		ramdisk_line=3D"ramdisk =3D \"ramdisk@${4}\";"
+		ramdisk_line=3D"ramdisk =3D \"ramdisk-${4}\";"
 	fi
=20
 	if [ -n "${5}" ]; then
 		conf_desc=3D"${conf_desc}${sep}setup"
 		sep=3D", "
-		setup_line=3D"setup =3D \"setup@${5}\";"
+		setup_line=3D"setup =3D \"setup-${5}\";"
 	fi
=20
 	if [ -n "${6}" -a "x${FITIMAGE_PACK_TEE}" =3D "x1" ]; then
@@ -359,9 +359,9 @@ fitimage_emit_section_config() {
 			loadables_line=3D"loadables =3D \"${6}.optee\";"
 			loadables_pager_line=3D"loadables =3D \"${6}-pager.optee\";"
 		else
-			loadables_line=3D"loadables =3D \"tee@${6}\";"
+			loadables_line=3D"loadables =3D \"tee-${6}\";"
 			nextnum=3D`expr ${6} + 1`
-			loadables_pager_line=3D"loadables =3D \"tee@${nextnum}\";"
+			loadables_pager_line=3D"loadables =3D \"tee-${nextnum}\";"
 		fi
 		final_conf_desc=3D"${conf_desc}${sep}OPTEE OS Image"
 	else
@@ -377,13 +377,13 @@ fitimage_emit_section_config() {
 		if [ "x${FITIMAGE_CONF_BY_NAME}" =3D "x1" ] ; then
 			conf_name=3D"${DTB}"
 		else
-			conf_name=3D"conf@${dtbcount}"
+			conf_name=3D"conf-${dtbcount}"
 		fi
=20
 		if [ "x${FITIMAGE_DTB_BY_NAME}" =3D "x1" ] ; then
 			fdt_line=3D"fdt =3D \"${DTB}\";"
 		else
-			fdt_line=3D"fdt =3D \"fdt@${dtbcount}\";"
+			fdt_line=3D"fdt =3D \"fdt-${dtbcount}\";"
 		fi
=20
 		if [ "x${dtbcount}" =3D "x1" ]; then
@@ -408,7 +408,7 @@ EOF
 			fi
 			if test -n "${FITIMAGE_HASH_ALGO}"; then
 				cat << EOF >> ${1}
-                        hash@1 {
+                        hash-1 {
                                 algo =3D "${conf_csum}";
                         };
 EOF
@@ -433,7 +433,7 @@ EOF
 				sign_line=3D"${sign_line};"
=20
 				cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo =3D "${conf_csum},rsa2048";
                                 key-name-hint =3D "${conf_sign_keyname}"=
;
                                 ${sign_line}
@@ -451,7 +451,7 @@ EOF
 			if [ "x${FITIMAGE_CONF_BY_NAME}" =3D "x1" ] ; then
 				conf_name=3D"${DTB}-pager"
 			else
-				conf_name=3D"conf@${dtbcount}"
+				conf_name=3D"conf-${dtbcount}"
 			fi
=20
 			cat << EOF >> ${1}
@@ -469,7 +469,7 @@ EOF
 			fi
 			if test -n "${FITIMAGE_HASH_ALGO}"; then
 				cat << EOF >> ${1}
-                        hash@1 {
+                        hash-1 {
                                 algo =3D "${conf_csum}";
                         };
 EOF
@@ -494,7 +494,7 @@ EOF
 				sign_line=3D"${sign_line};"
=20
 				cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo =3D "${conf_csum},rsa2048";
                                 key-name-hint =3D "${conf_sign_keyname}"=
;
                                 ${sign_line}
@@ -571,7 +571,7 @@ fitimage_assemble() {
 			if [ "x${FITIMAGE_DTB_BY_NAME}" =3D "x1" ] ; then
 				fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}.sec "${dtb_loadlin=
e}"
 			else
-				fitimage_emit_section_dtb ${1} "fdt@${dtbcount}" ${DTB_PATH}.sec "${=
dtb_loadline}"
+				fitimage_emit_section_dtb ${1} "fdt-${dtbcount}" ${DTB_PATH}.sec "${=
dtb_loadline}"
 			fi
 			if [ "x${dtbcount}" =3D "x1" ]; then
 				dtbref=3D${DTB}
@@ -594,7 +594,7 @@ fitimage_assemble() {
 		if [ "x${FITIMAGE_TEE_BY_NAME}" =3D "x1" ] ; then
 			fitimage_emit_section_tee ${1} ${OPTEEFLAVOR}.optee ${TEE_PATH}.sec
 		else
-			fitimage_emit_section_tee ${1} "tee@${teecount}" ${TEE_PATH}.sec
+			fitimage_emit_section_tee ${1} "tee-${teecount}" ${TEE_PATH}.sec
 		fi
=20
 		if [ "${OPTEEPAGER}" =3D "y" ]; then
@@ -608,7 +608,7 @@ fitimage_assemble() {
 			if [ "x${FITIMAGE_TEE_BY_NAME}" =3D "x1" ] ; then
 				fitimage_emit_section_tee ${1} ${OPTEEFLAVOR}-pager.optee ${TEE_PATH=
}.sec
 			else
-				fitimage_emit_section_tee ${1} "tee@${teecount}" ${TEE_PATH}.sec
+				fitimage_emit_section_tee ${1} "tee-${teecount}" ${TEE_PATH}.sec
 			fi
 		fi
 	fi
@@ -653,7 +653,7 @@ fitimage_assemble() {
 	fitimage_emit_section_maint ${1} confstart
=20
 	if [ "x${FITIMAGE_DTB_BY_NAME}" !=3D "x1" ] ; then
-		dtbref=3D"fdt@${dtbcount}"
+		dtbref=3D"fdt-${dtbcount}"
 	fi
 	if [ "x${FITIMAGE_TEE_BY_NAME}" =3D "x1" ] ; then
 		teeref=3D"${OPTEEFLAVOR}"
--=20
2.25.1


