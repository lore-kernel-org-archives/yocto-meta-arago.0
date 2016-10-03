Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B5161529A6
	for <meta-arago@arago-project.org>;
	Mon,  3 Oct 2016 19:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9438320058;
	Mon,  3 Oct 2016 19:48:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ds4tvXFagLN5; Mon,  3 Oct 2016 19:48:40 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-110-130.washdc.fios.verizon.net
	[100.15.110.130])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 653BE208EA;
	Mon,  3 Oct 2016 19:48:39 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id EED42162157;
	Mon,  3 Oct 2016 15:48:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  3 Oct 2016 15:48:37 -0400
Message-Id: <1475524117-18960-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475524117-18960-1-git-send-email-denis@denix.org>
References: <1475524117-18960-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] kernel-fitimage: expand FDT-to-TEE mapping, simplify code
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
X-List-Received-Date: Mon, 03 Oct 2016 19:48:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 111 +++++++---------------
 1 file changed, 33 insertions(+), 78 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index 23b162b..773c254 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -296,16 +296,12 @@ fitimage_emit_section_config() {
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
 
-	# Test if we have any DTBs at all
-	if test -n "${FITIMAGE_TEE}"; then
-		conf_desc="Linux kernel, OPTEE OS Image"
-	else
-		conf_desc="Linux kernel"
-	fi
+	conf_desc="Linux kernel"
 	kernel_line="kernel = \"kernel@${2}\";"
 	fdt_line=""
 	ramdisk_line=""
 
+	# Test if we have any DTBs at all
 	if [ -n "${3}" ]; then
 		conf_desc="${conf_desc}, FDT blob"
 		fdt_line="fdt = \"${3}\";"
@@ -321,31 +317,47 @@ fitimage_emit_section_config() {
 		setup_line="setup = \"setup@${5}\";"
 	fi
 
-	if test -n "${FITIMAGE_TEE}"; then
-		teecount=1
-		for TEE in ${FITIMAGE_TEE}; do
-			DTB=`basename ${TEE} | sed 's,\.optee$,.dtb,g'`
+	dtbcount=1
+	for DTB in ${KERNEL_DEVICETREE}; do
 
-			if [ "x${FITIMAGE_CONF_BY_NAME}" = "x1" ] ; then
-				conf_name="${DTB}"
-			else
-				conf_name="conf@${teecount}"
-			fi
+		if [ "x${FITIMAGE_CONF_BY_NAME}" = "x1" ] ; then
+			conf_name="${DTB}"
+		else
+			conf_name="conf@${dtbcount}"
+		fi
 
-			if [ "x${teecount}" = "x1" ]; then
-				cat << EOF >> ${1}
+		if [ "x${dtbcount}" = "x1" ]; then
+			cat << EOF >> ${1}
                 default = "${conf_name}";
 EOF
-			fi
+		fi
+
+		if test -n "${FITIMAGE_TEE}"; then
+			teecount=1
+			for TEE in ${FITIMAGE_TEE}; do
+				teename=`basename ${TEE} ".optee"`
+				loadables_line=""
+				final_conf_desc="${conf_desc}"
+				if [ "${DTB#$teename}" != "${DTB}" ]; then
+					loadables_line="loadables = \"${TEE}\";"
+					final_conf_desc="${conf_desc}, OPTEE OS Image"
+					break
+				fi
+				teecount=`expr ${teecount} + 1`
+			done
+		else
+			loadables_line=""
+			final_conf_desc="${conf_desc}"
+		fi
 
 			cat << EOF >> ${1}
                 ${conf_name} {
-                        description = "${conf_desc}";
+                        description = "${final_conf_desc}";
                         ${kernel_line}
                         fdt = "${DTB}";
                         ${ramdisk_line}
                         ${setup_line}
-                        loadables = "${TEE}";
+                        ${loadables_line}
 EOF
 
 			if test -n "${FITIMAGE_HASH_ALGO}"; then
@@ -387,65 +399,8 @@ EOF
                 };
 EOF
 
-			teecount=`expr ${teecount} + 1`
+		dtbcount=`expr ${dtbcount} + 1`
 		done
-	else
-
-		if [ "x${FITIMAGE_CONF_BY_NAME}" = "x1" ] ; then
-			conf_name="${3}"
-		else
-			conf_name="conf@$1"
-		fi
-
-		cat << EOF >> ${1}
-                default = "${conf_name}";
-                ${conf_name} {
-                        description = "${conf_desc}";
-                        ${kernel_line}
-                        ${fdt_line}
-                        ${ramdisk_line}
-                        ${setup_line}
-EOF
-
-		if test -n "${FITIMAGE_HASH_ALGO}"; then
-			cat << EOF >> ${1}
-                        hash@1 {
-                                algo = "${conf_csum}";
-                        };
-EOF
-		fi
-
-		if [ ! -z "${conf_sign_keyname}" ] ; then
-
-			sign_line="sign-images = \"kernel\""
-
-			if [ -n "${3}" ]; then
-				sign_line="${sign_line}, \"fdt\""
-			fi
-
-			if [ -n "${4}" ]; then
-				sign_line="${sign_line}, \"ramdisk\""
-			fi
-
-			if [ -n "${5}" ]; then
-				sign_line="${sign_line}, \"setup\""
-			fi
-
-			sign_line="${sign_line};"
-
-			cat << EOF >> ${1}
-                        signature@1 {
-                                algo = "${conf_csum},rsa2048";
-                                key-name-hint = "${conf_sign_keyname}";
-                                ${sign_line}
-                        };
-EOF
-		fi
-
-		cat << EOF >> ${1}
-                };
-EOF
-	fi
 }
 
 #
-- 
2.7.4


