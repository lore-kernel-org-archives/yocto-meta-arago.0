Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by arago-project.org (Postfix) with ESMTPS id 7EA3152A2E
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:47:00 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id j6so6822189oag.8
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=gywcNGX3mU8CyXI52T/YuWZwo4YHNfL3Hn4inTrOHnk=;
	b=MyG4s3SrOTIi5hu9UFm2BI0uRWToiYdSXGP33NOU5f+kKwORBJbB+sZso+q2nZbRLl
	5+8kwVDWV0gAyvKY52mFT/IAL1RaZRi2LLuOT5cn9P9ShVpLKFdayzIo5yCRAH/xFi1u
	SGeX6/9OqcKzcADZ7LsJahMFAF6JSiuEWhkLtsSEsaiZJxecUlIwR+QtRpOq26rsMqtH
	e/1obqjaSLBRX2UozRQudAqBNo/0h/I4dLs0tZmNrLT8aUVvl7l5DX/vScmWj4lI414Z
	07BaMY3wAXfIp0BRH0M3mY1hp39ggK+8NFV89O6rL1G94eYMuRu/JRM5I1m3p88UbFuH
	5NCw==
X-Received: by 10.60.172.80 with SMTP id ba16mr12364276oec.116.1360630019506; 
	Mon, 11 Feb 2013 16:46:59 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.57
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:58 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:19 -0600
Message-Id: <1360629979-24789-18-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 18/18] sdk_rootfs_ipk: Pull in rootfs_ipk.bbclass from oe-core denzil.
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
X-List-Received-Date: Tue, 12 Feb 2013 00:47:01 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Tisdk-image inherits rootfs_ipk.bbclass to generate SDK image.
* Changes have been made to rootfs_ipk.bbclass that breaks SDK images.
* For now pull in this class and rename it to sdk_rootfs_ipk.
* Need to rework tisdk-image to play nice with possible future changes of
  rootfs_ipk.bbclass or remove the dependency and make tisdk-image self
  contained.
---
 meta-arago-distro/classes/sdk_rootfs_ipk.bbclass |  203 ++++++++++++++++++++++
 meta-arago-distro/classes/tisdk-image.bbclass    |    2 +-
 2 files changed, 204 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/classes/sdk_rootfs_ipk.bbclass

diff --git a/meta-arago-distro/classes/sdk_rootfs_ipk.bbclass b/meta-arago-distro/classes/sdk_rootfs_ipk.bbclass
new file mode 100644
index 0000000..1580086
--- /dev/null
+++ b/meta-arago-distro/classes/sdk_rootfs_ipk.bbclass
@@ -0,0 +1,203 @@
+#
+# Creates a root filesystem out of IPKs
+#
+# This rootfs can be mounted via root-nfs or it can be put into an cramfs/jffs etc.
+# See image.bbclass for a usage of this.
+#
+
+EXTRAOPKGCONFIG ?= ""
+ROOTFS_PKGMANAGE = "opkg opkg-collateral ${EXTRAOPKGCONFIG}"
+ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
+
+do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
+do_rootfs[recrdeptask] += "do_package_write_ipk"
+
+IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force-overwrite"
+
+OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf"
+
+OPKG_POSTPROCESS_COMMANDS = "ipk_insert_feed_uris; rootfs_install_all_locales; "
+
+opkglibdir = "${localstatedir}/lib/opkg"
+
+# Which packages to not install on the basis of a recommendation
+BAD_RECOMMENDATIONS ?= ""
+MULTILIBRE_ALLOW_REP = "${opkglibdir}"
+
+fakeroot rootfs_ipk_do_rootfs () {
+	set -x
+
+	rm -f ${IPKGCONF_TARGET}
+	touch ${IPKGCONF_TARGET}
+
+	${OPKG_PREPROCESS_COMMANDS}
+
+	mkdir -p ${T}/
+ 
+	STATUS=${IMAGE_ROOTFS}${opkglibdir}/status
+	mkdir -p ${IMAGE_ROOTFS}${opkglibdir}
+
+	opkg-cl ${IPKG_ARGS} update
+
+	# prime the status file with bits that we don't want
+	for i in ${BAD_RECOMMENDATIONS}; do
+		pkginfo="`opkg-cl ${IPKG_ARGS} info $i`"
+		if [ ! -z "$pkginfo" ]; then
+			echo "$pkginfo" | grep -e '^Package:' -e '^Architecture:' -e '^Version:' >> $STATUS
+			echo "Status: deinstall hold not-installed" >> $STATUS
+			echo >> $STATUS
+		else
+			echo "Requested ignored recommendation $i is not a package"
+		fi
+	done
+
+	#install
+	export INSTALL_PACKAGES_ATTEMPTONLY_IPK="${PACKAGE_INSTALL_ATTEMPTONLY}"
+	export INSTALL_PACKAGES_LINGUAS_IPK="${LINGUAS_INSTALL}"
+	export INSTALL_TASK_IPK="rootfs"
+
+	export INSTALL_ROOTFS_IPK="${IMAGE_ROOTFS}"
+	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
+	export INSTALL_PACKAGES_IPK="${PACKAGE_INSTALL}"
+
+	#post install
+	export D=${IMAGE_ROOTFS}
+	export OFFLINE_ROOT=${IMAGE_ROOTFS}
+	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
+	export OPKG_OFFLINE_ROOT=${IPKG_OFFLINE_ROOT}
+
+	package_install_internal_ipk
+
+	# Distro specific packages should create this
+	#mkdir -p ${IMAGE_ROOTFS}/etc/opkg/
+	#grep "^arch" ${IPKGCONF_TARGET} >${IMAGE_ROOTFS}/etc/opkg/arch.conf
+
+	${OPKG_POSTPROCESS_COMMANDS}
+	${ROOTFS_POSTINSTALL_COMMAND}
+	
+	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
+		if grep Status:.install.ok.unpacked ${STATUS}; then
+			echo "Some packages could not be configured offline and rootfs is read-only."
+			exit 1
+		fi
+	fi
+
+	install -d ${IMAGE_ROOTFS}/${sysconfdir}
+	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
+
+	${ROOTFS_POSTPROCESS_COMMAND}
+	
+	rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
+	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
+		if ! grep Status:.install.ok.unpacked ${STATUS}; then
+			# All packages were successfully configured.
+			# update-rc.d, base-passwd are no further use, remove them now
+			opkg-cl ${IPKG_ARGS} --force-depends remove update-rc.d base-passwd || true
+
+			# Also delete the status files
+			rm -rf ${IMAGE_ROOTFS}${opkglibdir}
+		fi
+	fi
+	set +x
+	log_check rootfs 	
+}
+
+rootfs_ipk_write_manifest() {
+	manifest=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest
+	cp ${IMAGE_ROOTFS}${opkglibdir}/status $manifest
+
+	sed '/Depends/d' -i $manifest
+	sed '/Status/d' -i $manifest
+	sed '/Architecture/d' -i $manifest
+	sed '/Installed-Time/d' -i $manifest
+	sed '/Auto-Installed/d' -i $manifest
+	sed '/Recommends/d' -i $manifest
+	sed '/Provides/d' -i $manifest
+	sed '/Conflicts/d' -i $manifest
+}
+
+remove_packaging_data_files() {
+	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
+        # We need the directory for the package manager lock
+        mkdir ${IMAGE_ROOTFS}${opkglibdir}
+}
+
+list_installed_packages() {
+	grep ^Package: ${IMAGE_ROOTFS}${opkglibdir}/status | sed "s/^Package: //"
+}
+
+get_package_filename() {
+	set +x
+	info=`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" || true`
+	name=`echo "${info}" | awk '/^Package/ {printf $2"_"}'`
+	name=$name`echo "${info}" | awk -F: '/^Version/ {printf $NF"_"}' | sed 's/^\s*//g'`
+	name=$name`echo "${info}" | awk '/^Archi/ {print $2".ipk"}'`
+	set -x
+
+	fullname=`find ${DEPLOY_DIR_IPK} -name "$name" || true`
+	if [ "$fullname" = "" ] ; then
+		echo $name
+	else
+		echo $fullname
+	fi
+}
+
+list_package_depends() {
+	opkg-cl ${IPKG_ARGS} info $1 | grep ^Depends | sed -e 's/^Depends: //' -e 's/,//g' -e 's:([=<>]* [^ )]*)::g'
+}
+
+list_package_recommends() {
+	opkg-cl ${IPKG_ARGS} info $1 | grep ^Recommends | sed -e 's/^Recommends: //' -e 's/,//g' -e 's:([=<>]* [^ )]*)::g'
+}
+
+rootfs_check_package_exists() {
+	if [ `opkg-cl ${IPKG_ARGS} info $1 | wc -l` -gt 2 ]; then
+		echo $1
+	fi
+}
+
+rootfs_install_packages() {
+	opkg-cl ${IPKG_ARGS} install $PACKAGES_TO_INSTALL
+}
+
+ipk_insert_feed_uris () {
+
+	echo "Building from feeds activated!"
+
+	for line in ${IPK_FEED_URIS}
+	do
+		# strip leading and trailing spaces/tabs, then split into name and uri
+		line_clean="`echo "$line"|sed 's/^[ \t]*//;s/[ \t]*$//'`"
+		feed_name="`echo "$line_clean" | sed -n 's/\(.*\)##\(.*\)/\1/p'`"
+		feed_uri="`echo "$line_clean" | sed -n 's/\(.*\)##\(.*\)/\2/p'`"
+
+		echo "Added $feed_name feed with URL $feed_uri"
+
+		# insert new feed-sources
+		echo "src/gz $feed_name $feed_uri" >> ${IPKGCONF_TARGET}
+	done
+
+	# Allow to use package deploy directory contents as quick devel-testing
+	# feed. This creates individual feed configs for each arch subdir of those
+	# specified as compatible for the current machine.
+	# NOTE: Development-helper feature, NOT a full-fledged feed.
+	if [ -n "${FEED_DEPLOYDIR_BASE_URI}" ]; then
+		for arch in ${PACKAGE_ARCHS}
+		do
+			echo "src/gz local-$arch ${FEED_DEPLOYDIR_BASE_URI}/$arch" >> ${IMAGE_ROOTFS}/etc/opkg/local-$arch-feed.conf
+	    done
+	fi
+}
+
+python () {
+
+    if d.getVar('BUILD_IMAGES_FROM_FEEDS', True):
+        flags = d.getVarFlag('do_rootfs', 'recrdeptask')
+        flags = flags.replace("do_package_write_ipk", "")
+        flags = flags.replace("do_deploy", "")
+        flags = flags.replace("do_populate_sysroot", "")
+        d.setVarFlag('do_rootfs', 'recrdeptask', flags)
+        d.setVar('OPKG_PREPROCESS_COMMANDS', "package_generate_archlist\nipk_insert_feed_uris")
+        d.setVar('OPKG_POSTPROCESS_COMMANDS', '')
+}
+
diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index b08f93b..5d83287 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -1,4 +1,4 @@
-inherit rootfs_ipk
+inherit sdk_rootfs_ipk
 inherit image_types
 
 # This defines the list of features that we want to include in the SDK
-- 
1.7.0.4


