Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 46106529EF
	for <meta-arago@arago-project.org>;
	Tue, 30 Apr 2019 17:24:52 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UHOQOd047139
	for <meta-arago@arago-project.org>; Tue, 30 Apr 2019 12:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556645066;
	bh=PPQ3R3Q2z25mq8/mpoRZGGM1By3mBQRIh6xkszpuhLo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OUYZ+7PyK8ySGJdeL/2WdcVaUXeRjpeocR7X2QFNlm3lvmkWYEQTNq4KcgcQq34Y5
	EbXuvI7MUQ/5hYbn4tvoCyCYgOAELS0KsZ4AlkgWIANK5R2lMm4+04qf8iR6zuIff6
	YTwKXbkyrr1S+GfxM10VTCiZoT/Xkfe3iyzqUmpA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UHOQIq067513
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 30 Apr 2019 12:24:26 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 30 Apr 2019 12:24:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 30 Apr 2019 12:24:25 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UHOOGv037680;
	Tue, 30 Apr 2019 12:24:25 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 30 Apr 2019 13:12:14 -0400
Message-ID: <1556644334-32700-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556644334-32700-1-git-send-email-j-stiffler@ti.com>
References: <1556644334-32700-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v3 2/2] sourceipk: remove custom package creation
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
X-List-Received-Date: Tue, 30 Apr 2019 17:24:53 -0000
Content-Type: text/plain

Instead of manually creating the source "ipk", use the built in
pacakge_write_* tasks. This is done by constructing the sourceipk
package contents in a staging area. Then, as a PACKAGESPLITFUNCS,
copy the contents of the staging area into the appropriate
packages-split directory so that it can get used during the package
write task. Disable all QA checks on this package.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v3 changes:
* Instead of defining a new task to install the sourceipk contents,
  use a PACKAGESSPLITFUNC to directly copy the package contents into
  the directory consumed by the pacakge_write tasks.
* This will bypass populate_sysroot and package split and debug strip,
  so there is no need to implement those workarounds.
* Update the commit log to reflect the new implementation.

v2 changes:
* Disable strip and debug split of sourceipk package contents by
   adding  a PACKAGE_PREPROCESS_FUNCS, srcipk_inhibit_strip().
* srcipk_inhibit_strip() selectively bypasses strip and debug split by
   adding all files under the SRCIPK_INSTALL_DIR to the
   INHIBIT_PACKAGE_STRIP_FILES.
* Drop patch to inhibit strip and debug split of U-Boot as it is no
   longer necessary.

Change from RFC:
* Add src package to list of packages in anonymous python to
   workaround other classes/recipes resetting PACKAGES.
* PACKAGES_append does not work because some recipes, such as images,
   expect PACKAGES to be completely undefined. 

 meta-arago-distro/classes/sourceipk.bbclass | 106 ++++++++++------------------
 1 file changed, 37 insertions(+), 69 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 1e49489..14b46f9 100644
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
@@ -225,19 +228,8 @@ sourceipk_create_readme() {
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
+do_create_srcipk[dirs] = "${SRCIPK_SRC_DIR} ${SRCIPK_STAGING_DIR}"
+do_create_srcipk[cleandirs] = "${SRCIPK_STAGING_DIR}"
 do_create_srcipk[umask] = "022"
 
 # Create the source ipk file.  The ipk is manually created here instead
@@ -248,75 +240,32 @@ do_create_srcipk[umask] = "022"
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
 
@@ -335,3 +284,22 @@ python () {
 
 #Add source packages to list of packages OE knows about
 PACKAGES_DYNAMIC += "${PN}-src"
+
+# Do not perform any QA checks on sourceipk packages
+INSANE_SKIP_${PN}-src += "${@oe.utils.conditional("${CREATE_SRCIPK}", "0", "", "${ALL_QA}", d)}"
+
+python __anonymous () {
+    if d.getVar("CREATE_SRCIPK") != "0":
+        pn = d.getVar("PN")
+
+        d.appendVar('PACKAGES', ' %s-src' % (pn))
+        d.setVar('FILES_%s-src' % (pn), '${SRCIPK_INSTALL_DIR}')
+}
+
+PACKAGESPLITFUNCS_append = " ${@oe.utils.conditional('CREATE_SRCIPK','0','','populate_srcipk_package',d)}"
+populate_srcipk_package() {
+    install -d ${PKGDEST}/${PN}-src/${SRCIPK_INSTALL_DIR}
+    cp -Prf --preserve=mode,timestamps --no-preserve=ownership \
+        ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/. \
+        ${PKGDEST}/${PN}-src/${SRCIPK_INSTALL_DIR}
+}
-- 
2.7.4


