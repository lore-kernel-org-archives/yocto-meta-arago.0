Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id ADBE75298A
	for <meta-arago@arago-project.org>;
	Wed, 27 Jul 2016 20:38:38 +0000 (UTC)
Received: from vz-proxy-m002.mx.aol.com ([64.236.83.3])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OAZ005S4QNZ4Z10@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 27 Jul 2016 15:38:23 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=yQ9kT6OsLgv7WE5tBE7I5g==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=VbkP-eGZ0Y9kDyMbD8EA:9
Received: by 100.15.86.14 with SMTP id 299561b3; Wed, 27 Jul 2016 20:38:22 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 011271620AF;	Wed, 27 Jul 2016 16:38:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 27 Jul 2016 16:38:22 -0400
Message-id: <1469651902-30092-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] sourceipk.bbclass: add support for sstate
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
X-List-Received-Date: Wed, 27 Jul 2016 20:38:39 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 6e71196..d8da195 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -225,6 +225,21 @@ sourceipk_create_readme() {
     echo "      the \"patches\" directory" >> $readme
 }
 
+SRCIPK_DEPLOYSRC_DIR = "${WORKDIR}/deploy-src"
+
+SSTATETASKS += "do_create_srcipk"
+do_create_srcipk[sstate-inputdirs] = "${SRCIPK_DEPLOYSRC_DIR}"
+do_create_srcipk[sstate-outputdirs] = "${DEPLOY_DIR_IPK}"
+
+python do_create_srcipk_setscene () {
+    sstate_setscene(d)
+}
+addtask do_create_srcipk_setscene
+
+do_create_srcipk[dirs] = "${SRCIPK_DEPLOYSRC_DIR}"
+do_create_srcipk[cleandirs] = "${SRCIPK_DEPLOYSRC_DIR}"
+do_create_srcipk[umask] = "022"
+
 # Create the source ipk file.  The ipk is manually created here instead
 # of using the normal ipk system because some recipes will over write
 # the PACKAGES variable.  Thus if this class added a -src package
@@ -295,8 +310,8 @@ sourceipk_do_create_srcipk() {
         echo "2.0" > $srcipk_dir/debian-binary
 
         #Write the ipk file
-        mkdir -p ${DEPLOY_DIR_IPK}/${SRCIPK_PACKAGE_ARCH}
-        pkg_file=${DEPLOY_DIR_IPK}/${SRCIPK_PACKAGE_ARCH}/${PN}-src_${PV}-${PR}_${SRCIPK_PACKAGE_ARCH}.ipk
+        mkdir -p ${SRCIPK_DEPLOYSRC_DIR}/${SRCIPK_PACKAGE_ARCH}
+        pkg_file=${SRCIPK_DEPLOYSRC_DIR}/${SRCIPK_PACKAGE_ARCH}/${PN}-src_${PV}-${PR}_${SRCIPK_PACKAGE_ARCH}.ipk
         rm -f $pkg_file
         ( cd $srcipk_dir && ar -crf $pkg_file ./debian-binary ./control.tar.gz ./data.tar.gz )
 
-- 
2.7.4


