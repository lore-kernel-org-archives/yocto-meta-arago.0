Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8696F52974
	for <meta-arago@arago-project.org>;
	Thu, 11 Apr 2019 18:44:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3BIiUlS041465
	for <meta-arago@arago-project.org>; Thu, 11 Apr 2019 13:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1555008270;
	bh=mc5VVsUZUldPw6JBh5+EOhgeOb+9cm8OIIzxfsZcaRk=;
	h=From:To:CC:Subject:Date;
	b=yCx0zhKTLJYRku0UsjKssW48IQmD3IQddUwYgueJbP2kvEwr5PE6UgXZZcrRphB5N
	L8zcAH6ry+zkwLcSVCblI0S2JKlLdQn6UEk5MU40gbbWBvbyRTsPRLbxn5jdIOCs2I
	hyYoWL6u5R+UMQLs+QB3Uf55tzCfGvjPrKgsT/kY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3BIiUA5086688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 11 Apr 2019 13:44:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 11 Apr 2019 13:44:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 11 Apr 2019 13:44:30 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3BIiTSV124135;
	Thu, 11 Apr 2019 13:44:30 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 11 Apr 2019 14:32:20 -0400
Message-ID: <1555007541-19889-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][RFC 1/2] sourceipk: remove custom package creation
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
X-List-Received-Date: Thu, 11 Apr 2019 18:44:52 -0000
Content-Type: text/plain

Instead of manually creating the source "ipk", use the built in
pacakge_write_* tasks. This is done by constructing the sourceipk
package contents in a staging area. Then, sometime betwee do_install
and do_package, copy the contents of the staging area into the ${D}
directory so that it can get used during packaging. Prevent the
sourceipk contents from contaminating the sysroot by adding it to the
blacklist, and disable all QA checks on this package.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass | 106 +++++++++-------------------
 1 file changed, 35 insertions(+), 71 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 1e49489..8111992 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -47,6 +47,9 @@ CREATE_SRCIPK ?= "0"
 # Default installation prefix
 SRCIPK_INSTALL_DIR ?= "/usr/src/${PN}-src"
 
+# Directory to preserve sources until they can be installed for packaging
+SRCIPK_STAGING_DIR = "${WORKDIR}/srcipk-staging"
+
 # Specify the directory of the sources
 SRCIPK_SRC_DIR ?= "${S}"
 
@@ -121,7 +124,7 @@ limit_git_history() {
     gitshallowclone="${WORKDIR}/temp-git-shallow-clone"
 
     # Change directory to the git repository to be safe
-    cd $tmp_dir/${SRCIPK_INSTALL_DIR}
+    cd ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}
 
     # Create a temporary directory to hold the shallow git clone
     mkdir -p $gitshallowclone
@@ -134,10 +137,10 @@ limit_git_history() {
 
     # remove original kernel clone since we will replace it with the shallow
     # clone
-    rm -rf $tmp_dir/${SRCIPK_INSTALL_DIR}/.git
+    rm -rf ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/.git
 
     # replace the original kernel git data with the shallow clone git data
-    mv $gitshallowclone/.git $tmp_dir/${SRCIPK_INSTALL_DIR}/
+    mv $gitshallowclone/.git ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/
     rm -rf $gitshallowclone
 
     # Remove the local remote
@@ -156,7 +159,7 @@ limit_git_history() {
 adjust_git() {
     orig_dir="$PWD"
 
-    cd $tmp_dir/${SRCIPK_INSTALL_DIR}
+    cd ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}
 
     if [ -d ".git" ]
     then
@@ -225,21 +228,6 @@ sourceipk_create_readme() {
     echo "      the \"patches\" directory" >> $readme
 }
 
-SRCIPK_DEPLOYSRC_DIR = "${WORKDIR}/deploy-src"
-
-SSTATETASKS += "do_create_srcipk"
-do_create_srcipk[sstate-inputdirs] = "${SRCIPK_DEPLOYSRC_DIR}"
-do_create_srcipk[sstate-outputdirs] = "${DEPLOY_DIR_IPK}"
-
-python do_create_srcipk_setscene () {
-    sstate_setscene(d)
-}
-addtask do_create_srcipk_setscene
-
-do_create_srcipk[dirs] = "${SRCIPK_DEPLOYSRC_DIR}"
-do_create_srcipk[cleandirs] = "${SRCIPK_DEPLOYSRC_DIR}"
-do_create_srcipk[umask] = "022"
-
 # Create the source ipk file.  The ipk is manually created here instead
 # of using the normal ipk system because some recipes will over write
 # the PACKAGES variable.  Thus if this class added a -src package
@@ -248,75 +236,32 @@ do_create_srcipk[umask] = "022"
 sourceipk_do_create_srcipk() {
     if [ ${CREATE_SRCIPK} != "0" ]
     then
-
-        tmp_dir="${WORKDIR}/sourceipk-tmp"
-        srcipk_dir="${WORKDIR}/sourceipk-data"
-        mkdir -p $tmp_dir/CONTROL
-        mkdir -p $srcipk_dir
-        control_file="$tmp_dir/CONTROL/control"
-
-        # Write the control file
-        echo "Package: ${PN}-src" > $control_file
-        echo "Version: ${PV}-${PR}" >> $control_file
-        echo "Description: Patched sources for ${PN}" >> $control_file
-        echo "Section: ${SRCIPK_SECTION}" >> $control_file
-        echo "Priority: Optional" >> $control_file
-        echo "Maintainer: ${MAINTAINER}" >> $control_file
-        echo "License: ${LICENSE}" >> $control_file
-        echo "Architecture: ${SRCIPK_PACKAGE_ARCH}" >> $control_file
-        srcuri="${SRC_URI}"
-        if [ "$srcuri" = "" ]
-        then
-            srcuri="OpenEmbedded"
-        fi
-        echo "Source: $srcuri" >> $control_file
-        #Write the control tarball
-        tar -C $tmp_dir/CONTROL --owner=0 --group=0 -czf $srcipk_dir/control.tar.gz .
-
-        # Get rid of temporary control file
-        rm -rf $tmp_dir/CONTROL
-
         # Copy sources for packaging
-        mkdir -p $tmp_dir/${SRCIPK_INSTALL_DIR}
+        mkdir -p ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}
         if [ -e ${SRCIPK_SRC_DIR} ]; then
             if [ "${SRCIPK_SRC_DIR}" = "${WORKDIR}" ]; then
-                excludes='--exclude ./temp --exclude ./sourceipk-tmp --exclude ./sourceipk-data'
+                excludes='--exclude ./temp --exclude ${SRCIPK_STAGING_DIR}'
             fi
-            tar -C ${SRCIPK_SRC_DIR} -cO $excludes . | tar -C $tmp_dir/${SRCIPK_INSTALL_DIR} -xpf -
+            tar -C ${SRCIPK_SRC_DIR} -cO $excludes . | tar -C ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR} -xpf -
         fi
 
         # Fix up patches/ directory to contain actual patches instead of symlinks
-        if [ -e $tmp_dir/${SRCIPK_INSTALL_DIR}/patches ]
+        if [ -e ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/patches ]
         then
-            mv $tmp_dir/${SRCIPK_INSTALL_DIR}/patches $tmp_dir/${SRCIPK_INSTALL_DIR}/patches-links
-            cp -rL $tmp_dir/${SRCIPK_INSTALL_DIR}/patches-links $tmp_dir/${SRCIPK_INSTALL_DIR}/patches
-            rm -rf $tmp_dir/${SRCIPK_INSTALL_DIR}/patches-links
+            mv ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/patches ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/patches-links
+            cp -rL ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/patches-links ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/patches
+            rm -rf ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/patches-links
         fi
 
         if [ ${SRCIPK_INCLUDE_EXTRAFILES} != "0" ]
         then
-            sourceipk_create_readme $tmp_dir/${SRCIPK_INSTALL_DIR}/
-            cp ${FILE} $tmp_dir/${SRCIPK_INSTALL_DIR}/
+            sourceipk_create_readme ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/
+            cp ${FILE} ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/
         fi
 
         # Adjust the git repository if there is one.  Do this adjustment
         # here so we don't have to modify the original sources.
         adjust_git
-
-        #Write the data tarball
-        tar -C $tmp_dir --owner=0 --group=0 -czf $srcipk_dir/data.tar.gz .
-
-        # Create the debian-binary file
-        echo "2.0" > $srcipk_dir/debian-binary
-
-        #Write the ipk file
-        mkdir -p ${SRCIPK_DEPLOYSRC_DIR}/${SRCIPK_PACKAGE_ARCH}
-        pkg_file=${SRCIPK_DEPLOYSRC_DIR}/${SRCIPK_PACKAGE_ARCH}/${PN}-src_${PV}-${PR}_${SRCIPK_PACKAGE_ARCH}.ipk
-        rm -f $pkg_file
-        ( cd $srcipk_dir && ar -crf $pkg_file ./debian-binary ./control.tar.gz ./data.tar.gz )
-
-        # Remove the temporary directory
-        rm -rf $tmp_dir
     fi
 }
 
@@ -326,6 +271,19 @@ do_create_srcipk[deptask] = "do_patch"
 
 addtask create_srcipk after do_patch before do_configure
 
+fakeroot sourceipk_do_install_srcipk() {
+    if [ ${CREATE_SRCIPK} != "0" ]
+    then
+        install -d ${D}/${SRCIPK_INSTALL_DIR}
+        cp -Prf --preserve=mode,timestamps --no-preserve=ownership ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/. ${D}/${SRCIPK_INSTALL_DIR}
+    fi
+}
+
+EXPORT_FUNCTIONS do_install_srcipk
+
+do_install_srcipk[deptask] = "do_create_srcipk"
+addtask install_srcipk after do_install do_create_srcipk before do_package
+
 python () {
     if d.getVar('do_compileconfigs', False):
         deps = d.getVarFlag('do_compileconfigs', 'deps') or []
@@ -335,3 +293,9 @@ python () {
 
 #Add source packages to list of packages OE knows about
 PACKAGES_DYNAMIC += "${PN}-src"
+
+FILES_${PN}-src = "${SRCIPK_INSTALL_DIR}"
+SYSROOT_DIRS_BLACKLIST += "${@oe.utils.conditional("${CREATE_SRCIPK}", "0", "", "${SRCIPK_INSTALL_DIR}", d)}"
+
+# Do not perform any QA checks on sourceipk packages
+INSANE_SKIP_${PN}-src += "${@oe.utils.conditional("${CREATE_SRCIPK}", "0", "", "${ALL_QA}", d)}"
-- 
2.7.4


