Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 0269F52978
	for <meta-arago@arago-project.org>;
	Mon, 24 Jul 2017 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1333420A4A;
	Mon, 24 Jul 2017 21:10:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qr1lprCGfT5K; Mon, 24 Jul 2017 21:10:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DC698206EB;
	Mon, 24 Jul 2017 21:10:39 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5B5DD162522;
	Mon, 24 Jul 2017 17:10:39 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 24 Jul 2017 17:10:39 -0400
Message-Id: <1500930639-51139-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] kernel-fitimage: add support for packaging OPTEE pager images
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
X-List-Received-Date: Mon, 24 Jul 2017 21:10:41 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 93 ++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index 3a4da6d..3b38196 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -319,10 +319,18 @@ fitimage_emit_section_config() {
 	fi
 
 	if [ -n "${6}" -a -n "${OPTEEFLAVOR}" ]; then
-		loadables_line="loadables = \"${6}\";"
+		if [ "x${FITIMAGE_TEE_BY_NAME}" = "x1" ]; then
+			loadables_line="loadables = \"${6}.optee\";"
+			loadables_pager_line="loadables = \"${6}-pager.optee\";"
+		else
+			loadables_line="loadables = \"tee@${6}\";"
+			nextnum=`expr ${6} + 1`
+			loadables_pager_line="loadables = \"tee@${nextnum}\";"
+		fi
 		final_conf_desc="${conf_desc}, OPTEE OS Image"
 	else
 		loadables_line=""
+		loadables_pager_line=""
 		final_conf_desc="${conf_desc}"
 	fi
 
@@ -341,6 +349,7 @@ fitimage_emit_section_config() {
 EOF
 		fi
 
+# Generate a single configuration section
 			cat << EOF >> ${1}
                 ${conf_name} {
                         description = "${final_conf_desc}";
@@ -389,9 +398,69 @@ EOF
 			cat << EOF >> ${1}
                 };
 EOF
+# End single config section
+
+# Generate a single "pager" configuration section
+		if [ "${OPTEEPAGER}" = "y" ]; then
+			if [ "x${FITIMAGE_CONF_BY_NAME}" = "x1" ] ; then
+				conf_name="${DTB}-pager"
+			else
+				conf_name="conf@${dtbcount}"
+			fi
+
+			cat << EOF >> ${1}
+                ${conf_name} {
+                        description = "${final_conf_desc}";
+                        ${kernel_line}
+                        fdt = "${DTB}";
+                        ${ramdisk_line}
+                        ${setup_line}
+                        ${loadables_pager_line}
+EOF
+
+			if test -n "${FITIMAGE_HASH_ALGO}"; then
+				cat << EOF >> ${1}
+                        hash@1 {
+                                algo = "${conf_csum}";
+                        };
+EOF
+			fi
+
+			if [ ! -z "${conf_sign_keyname}" ] ; then
+
+				sign_line="sign-images = \"kernel\""
+
+				if [ -n "${3}" ]; then
+					sign_line="${sign_line}, \"fdt\""
+				fi
+
+				if [ -n "${4}" ]; then
+					sign_line="${sign_line}, \"ramdisk\""
+				fi
+
+				if [ -n "${5}" ]; then
+					sign_line="${sign_line}, \"setup\""
+				fi
+
+				sign_line="${sign_line};"
+
+				cat << EOF >> ${1}
+                        signature@1 {
+                                algo = "${conf_csum},rsa2048";
+                                key-name-hint = "${conf_sign_keyname}";
+                                ${sign_line}
+                        };
+EOF
+			fi
+
+			cat << EOF >> ${1}
+                };
+EOF
+		fi
+# End single config section
 
 		dtbcount=`expr ${dtbcount} + 1`
-		done
+	done
 }
 
 #
@@ -462,6 +531,21 @@ fitimage_assemble() {
 		else
 			fitimage_emit_section_tee ${1} "tee@${teecount}" ${TEE_PATH}.sec
 		fi
+
+		if [ "${OPTEEPAGER}" = "y" ]; then
+			teecount=`expr ${teecount} + 1`
+			rm -f ${B}/usr/${OPTEEFLAVOR}-pager.optee
+			if [ -e "${DEPLOY_DIR_IMAGE}/${OPTEEFLAVOR}-pager.optee" ]; then
+				cp ${DEPLOY_DIR_IMAGE}/${OPTEEFLAVOR}-pager.optee ${B}/usr/.
+			fi
+			TEE_PATH="usr/${OPTEEFLAVOR}-pager.optee"
+			fitimage_ti_secure ${TEE_PATH} ${TEE_PATH}.sec
+			if [ "x${FITIMAGE_TEE_BY_NAME}" = "x1" ] ; then
+				fitimage_emit_section_tee ${1} ${OPTEEFLAVOR}-pager.optee ${TEE_PATH}.sec
+			else
+				fitimage_emit_section_tee ${1} "tee@${teecount}" ${TEE_PATH}.sec
+			fi
+		fi
 	fi
 
 	#
@@ -490,6 +574,7 @@ fitimage_assemble() {
 	if test -n "${dtbcount}"; then
 		dtbcount=1
 	fi
+	teecount=1
 
 	#
 	# Step 5: Prepare a configurations section
@@ -500,9 +585,9 @@ fitimage_assemble() {
 		dtbref="fdt@${dtbcount}"
 	fi
 	if [ "x${FITIMAGE_TEE_BY_NAME}" = "x1" ] ; then
-		teeref="${OPTEEFLAVOR}.optee"
+		teeref="${OPTEEFLAVOR}"
 	else
-		teeref="tee@${teecount}"
+		teeref="${teecount}"
 	fi
 	fitimage_emit_section_config ${1} "${kernelcount}" "${dtbref}" "${ramdiskcount}" "${setupcount}" "${teeref}"
 
-- 
2.7.4


