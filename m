Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 60B7A52A7A
	for <meta-arago@arago-project.org>;
	Mon, 19 Dec 2016 21:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0B07A20A43;
	Mon, 19 Dec 2016 21:53:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QRlubRbKvvhT; Mon, 19 Dec 2016 21:53:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DE36E208B1;
	Mon, 19 Dec 2016 21:53:18 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 2CFA91621A4;
	Mon, 19 Dec 2016 16:53:18 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 19 Dec 2016 16:53:15 -0500
Message-Id: <1482184395-25112-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel-fitimage: fix missing TEE extension, as not provided by OPTEEFLAVOR
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
X-List-Received-Date: Mon, 19 Dec 2016 21:53:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

In the past, FITIMAGE_TEE listed TEE files with extension, but currently used
OPTEEFLAVOR variable only provides the name w/o extension.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index 16cb2bf..1cfa8d1 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -451,11 +451,11 @@ fitimage_assemble() {
 	#
 	if test -n "${OPTEEFLAVOR}"; then
 		mkdir -p ${B}/usr
-		rm -f ${B}/usr/${OPTEEFLAVOR}
-		if [ -e "${DEPLOY_DIR_IMAGE}/${OPTEEFLAVOR}" ]; then
-			cp ${DEPLOY_DIR_IMAGE}/${OPTEEFLAVOR} ${B}/usr/.
+		rm -f ${B}/usr/${OPTEEFLAVOR}.optee
+		if [ -e "${DEPLOY_DIR_IMAGE}/${OPTEEFLAVOR}.optee" ]; then
+			cp ${DEPLOY_DIR_IMAGE}/${OPTEEFLAVOR}.optee ${B}/usr/.
 		fi
-		TEE_PATH="usr/${OPTEEFLAVOR}"
+		TEE_PATH="usr/${OPTEEFLAVOR}.optee"
 		fitimage_ti_secure ${TEE_PATH} ${TEE_PATH}.sec
 		if [ "x${FITIMAGE_TEE_BY_NAME}" = "x1" ] ; then
 			fitimage_emit_section_tee ${1} ${OPTEEFLAVOR}.optee ${TEE_PATH}.sec
-- 
2.7.4


