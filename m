Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 41D1852AD0
	for <meta-arago@arago-project.org>;
	Tue, 16 Aug 2016 02:05:52 +0000 (UTC)
Received: from vz-proxy-m005.mx.aol.com ([64.236.83.15])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBZ00982CH9WG10@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 15 Aug 2016 21:05:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=NimJJ1rWho3RDXpqkQh0Zg==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=2J2kfqVCjfOU4WyuTckA:9
	a=u6F-oNi0z6WHZf_I:21 a=cG8VJH04XYsXByxH:21
Received: by 100.15.86.14 with SMTP id 22dd0071; Tue, 16 Aug 2016 02:05:33 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 114C11620DB;	Mon, 15 Aug 2016 22:05:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 15 Aug 2016 22:05:32 -0400
Message-id: <1471313132-4820-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] classes: add fitimage and TI secure boot packaging support
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
X-List-Received-Date: Tue, 16 Aug 2016 02:05:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Base fitimage support comes from OE-Core/master with initramfs support added
from WIP patches on the mailing list. Fixes, customizations and TI secure boot
support were added on top. Requires additional cleanup and careful upstreaming.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 499 ++++++++++++++++++++++
 meta-arago-distro/classes/uboot-sign.bbclass      |  95 ++++
 meta-arago-distro/conf/distro/arago.conf          |  17 +
 3 files changed, 611 insertions(+)
 create mode 100644 meta-arago-distro/classes/kernel-fitimage.bbclass
 create mode 100644 meta-arago-distro/classes/uboot-sign.bbclass

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
new file mode 100644
index 0000000..32c8cb0
--- /dev/null
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -0,0 +1,499 @@
+inherit kernel-uboot uboot-sign
+
+FITIMAGE_HASH_ALGO ?= "sha1"
+FITIMAGE_DTB_BY_NAME ?= "0"
+
+XZ_COMPRESSION_LEVEL ?= "-e -6"
+XZ_INTEGRITY_CHECK ?= "crc32"
+XZ_THREADS ?= "-T 0"
+
+python __anonymous () {
+    kerneltypes = d.getVar('KERNEL_IMAGETYPES', True) or ""
+    if 'fitImage' in kerneltypes.split():
+        depends = d.getVar("DEPENDS", True)
+        depends = "%s u-boot-mkimage-native dtc-native" % depends
+        d.setVar("DEPENDS", depends)
+
+        if d.getVar("UBOOT_ARCH", True) == "x86":
+            replacementtype = "bzImage"
+        else:
+            replacementtype = "zImage"
+
+	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
+	# to kernel.bbclass . We have to override it, since we pack zImage
+	# (at least for now) into the fitImage .
+        typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
+        if 'fitImage' in typeformake.split():
+            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', replacementtype))
+
+        image = d.getVar('INITRAMFS_IMAGE', True)
+        if image:
+            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+
+        # Verified boot will sign the fitImage and append the public key to
+        # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
+        # the fitImage:
+        if d.getVar('UBOOT_SIGN_ENABLE', True):
+            uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
+            d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
+}
+
+# Options for the device tree compiler passed to mkimage '-D' feature:
+UBOOT_MKIMAGE_DTCOPTS ??= ""
+
+fitimage_ti_secure() {
+	if test -n "${TI_SECURE_DEV_PKG}"; then
+		export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh $1 $2
+	else
+		cp $1 $2
+	fi
+}
+
+#
+# Emit the fitImage ITS header
+#
+# $1 ... .its filename
+fitimage_emit_fit_header() {
+	cat << EOF >> ${1}
+/dts-v1/;
+
+/ {
+        description = "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}";
+        #address-cells = <1>;
+EOF
+}
+
+#
+# Emit the fitImage section bits
+#
+# $1 ... .its filename
+# $2 ... Section bit type: imagestart - image section start
+#                          confstart  - configuration section start
+#                          sectend    - section end
+#                          fitend     - fitimage end
+#
+fitimage_emit_section_maint() {
+	case $2 in
+	imagestart)
+		cat << EOF >> ${1}
+
+        images {
+EOF
+	;;
+	confstart)
+		cat << EOF >> ${1}
+
+        configurations {
+EOF
+	;;
+	sectend)
+		cat << EOF >> ${1}
+	};
+EOF
+	;;
+	fitend)
+		cat << EOF >> ${1}
+};
+EOF
+	;;
+	esac
+}
+
+#
+# Emit the fitImage ITS kernel section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to kernel image
+# $4 ... Compression type
+fitimage_emit_section_kernel() {
+
+	kernel_csum=${FITIMAGE_HASH_ALGO}
+
+	ENTRYPOINT=${UBOOT_ENTRYPOINT}
+	if test -n "${UBOOT_ENTRYSYMBOL}"; then
+		ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+			awk '$4=="${UBOOT_ENTRYSYMBOL}" {print $2}'`
+	fi
+
+	cat << EOF >> ${1}
+                kernel@${2} {
+                        description = "Linux kernel";
+                        data = /incbin/("${3}");
+                        type = "kernel";
+                        arch = "${UBOOT_ARCH}";
+                        os = "linux";
+                        compression = "${4}";
+                        load = <${UBOOT_LOADADDRESS}>;
+                        entry = <${ENTRYPOINT}>;
+EOF
+	if test -n "${FITIMAGE_HASH_ALGO}"; then
+		cat << EOF >> ${1}
+                        hash@1 {
+                                algo = "${kernel_csum}";
+                        };
+EOF
+	fi
+	cat << EOF >> ${1}
+                };
+EOF
+}
+
+#
+# Emit the fitImage ITS DTB section
+#
+# $1 ... .its filename
+# $2 ... Image counter/name
+# $3 ... Path to DTB image
+fitimage_emit_section_dtb() {
+
+	dtb_csum=${FITIMAGE_HASH_ALGO}
+
+	cat << EOF >> ${1}
+                ${2} {
+                        description = "Flattened Device Tree blob";
+                        data = /incbin/("${3}");
+                        type = "flat_dt";
+                        arch = "${UBOOT_ARCH}";
+                        compression = "none";
+EOF
+	if test -n "${FITIMAGE_HASH_ALGO}"; then
+		cat << EOF >> ${1}
+                        hash@1 {
+                                algo = "${dtb_csum}";
+                        };
+EOF
+	fi
+	cat << EOF >> ${1}
+                };
+EOF
+}
+
+#
+# Emit the fitImage ITS setup section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to setup image
+fitimage_emit_section_setup() {
+
+	setup_csum=${FITIMAGE_HASH_ALGO}
+
+	cat << EOF >> ${1}
+                setup@${2} {
+                        description = "Linux setup.bin";
+                        data = /incbin/("${3}");
+                        type = "x86_setup";
+                        arch = "${UBOOT_ARCH}";
+                        os = "linux";
+                        compression = "none";
+                        load = <0x00090000>;
+                        entry = <0x00090000>;
+EOF
+	if test -n "${FITIMAGE_HASH_ALGO}"; then
+		cat << EOF >> ${1}
+                        hash@1 {
+                                algo = "${setup_csum}";
+                        };
+EOF
+	fi
+	cat << EOF >> ${1}
+                };
+EOF
+}
+
+#
+# Emit the fitImage ITS ramdisk section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to ramdisk image
+fitimage_emit_section_ramdisk() {
+
+	ramdisk_csum=${FITIMAGE_HASH_ALGO}
+
+	cat << EOF >> ${1}
+                ramdisk@${2} {
+                        description = "ramdisk image";
+                        data = /incbin/("${3}");
+                        type = "ramdisk";
+                        arch = "${UBOOT_ARCH}";
+                        os = "linux";
+                        compression = "none";
+EOF
+	if test -n "${UBOOT_RD_LOADADDRESS}"; then
+		cat << EOF >> ${1}
+                        load = <${UBOOT_RD_LOADADDRESS}>;
+EOF
+	fi
+
+	if test -n "${UBOOT_RD_ENTRYPOINT}"; then
+		cat << EOF >> ${1}
+                        entry = <${UBOOT_RD_ENTRYPOINT}>;
+EOF
+	fi
+
+	if test -n "${FITIMAGE_HASH_ALGO}"; then
+		cat << EOF >> ${1}
+                        hash@1 {
+                                algo = "${ramdisk_csum}";
+                        };
+EOF
+	fi
+	cat << EOF >> ${1}
+                };
+EOF
+}
+
+#
+# Emit the fitImage ITS configuration section
+#
+# $1 ... .its filename
+# $2 ... Linux kernel ID
+# $3 ... DTB image ID/name
+# $4 ... ramdisk ID
+# $5 ... config ID
+fitimage_emit_section_config() {
+
+	conf_csum=${FITIMAGE_HASH_ALGO}
+	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
+		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
+	fi
+
+	# Test if we have any DTBs at all
+	conf_desc="Linux kernel"
+	kernel_line="kernel = \"kernel@${2}\";"
+	fdt_line=""
+	ramdisk_line=""
+
+	if [ -n "${3}" ]; then
+		conf_desc="${conf_desc}, FDT blob"
+		fdt_line="fdt = \"${3}\";"
+	fi
+
+	if [ -n "${4}" ]; then
+		conf_desc="${conf_desc}, ramdisk"
+		ramdisk_line="ramdisk = \"ramdisk@${4}\";"
+	fi
+
+	if [ -n "${5}" ]; then
+		conf_desc="${conf_desc}, setup"
+		setup_line="setup = \"setup@${5}\";"
+	fi
+
+	cat << EOF >> ${1}
+                default = "conf@1";
+                conf@1 {
+                        description = "${conf_desc}";
+			${kernel_line}
+			${fdt_line}
+			${ramdisk_line}
+			${setup_line}
+EOF
+
+	if test -n "${FITIMAGE_HASH_ALGO}"; then
+		cat << EOF >> ${1}
+                        hash@1 {
+                                algo = "${conf_csum}";
+                        };
+EOF
+	fi
+
+	if [ ! -z "${conf_sign_keyname}" ] ; then
+
+		sign_line="sign-images = \"kernel\""
+
+		if [ -n "${3}" ]; then
+			sign_line="${sign_line}, \"fdt\""
+		fi
+
+		if [ -n "${4}" ]; then
+			sign_line="${sign_line}, \"ramdisk\""
+		fi
+
+		if [ -n "${5}" ]; then
+			sign_line="${sign_line}, \"setup\""
+		fi
+
+		sign_line="${sign_line};"
+
+		cat << EOF >> ${1}
+                        signature@1 {
+                                algo = "${conf_csum},rsa2048";
+                                key-name-hint = "${conf_sign_keyname}";
+				${sign_line}
+                        };
+EOF
+	fi
+
+	cat << EOF >> ${1}
+                };
+EOF
+}
+
+#
+# Assemble fitImage
+#
+# $1 ... .its filename
+# $2 ... fitImage name
+# $3 ... include ramdisk
+fitimage_assemble() {
+	kernelcount=1
+	dtbcount=""
+	ramdiskcount=${3}
+	setupcount=""
+	rm -f ${1} arch/${ARCH}/boot/${2}
+
+	fitimage_emit_fit_header ${1}
+
+	#
+	# Step 1: Prepare a kernel image section.
+	#
+	fitimage_emit_section_maint ${1} imagestart
+
+	uboot_prep_kimage
+	fitimage_ti_secure linux.bin linux.bin.sec
+	fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin.sec "${linux_comp}"
+
+	#
+	# Step 2: Prepare a DTB image section
+	#
+	if test -n "${KERNEL_DEVICETREE}"; then
+		dtbcount=1
+		for DTB in ${KERNEL_DEVICETREE}; do
+			if echo ${DTB} | grep -q '/dts/'; then
+				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+			fi
+			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
+			if [ ! -e "${DTB_PATH}" ]; then
+				DTB_PATH="arch/${ARCH}/boot/${DTB}"
+			fi
+			fitimage_ti_secure ${DTB_PATH} ${DTB_PATH}.sec
+			if [ "x${FITIMAGE_DTB_BY_NAME}" = "x1" ] ; then
+				fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}.sec
+			else
+				fitimage_emit_section_dtb ${1} "fdt@${dtbcount}" ${DTB_PATH}.sec
+			fi
+			if [ "x${dtbcount}" = "x1" ]; then
+				dtbref=${DTB}
+			fi
+			dtbcount=`expr ${dtbcount} + 1`
+		done
+	fi
+
+	#
+	# Step 3: Prepare a setup section. (For x86)
+	#
+	if test -e arch/${ARCH}/boot/setup.bin ; then
+		setupcount=1
+		fitimage_emit_section_setup ${1} "${setupcount}" arch/${ARCH}/boot/setup.bin
+	fi
+
+	#
+	# Step 4: Prepare a ramdisk section.
+	#
+	if [ "x${ramdiskcount}" = "x1" ] ; then
+		copy_initramfs
+		RAMDISK_FILE="usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio"
+		xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${RAMDISK_FILE} > ${RAMDISK_FILE}.xz
+		fitimage_ti_secure ${RAMDISK_FILE}.xz ${RAMDISK_FILE}.xz.sec
+		fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" ${RAMDISK_FILE}.xz.sec
+	fi
+
+	fitimage_emit_section_maint ${1} sectend
+
+	# Force the first Kernel and DTB in the default config
+	kernelcount=1
+	if test -n "${dtbcount}"; then
+		dtbcount=1
+	fi
+
+	#
+	# Step 5: Prepare a configurations section
+	#
+	fitimage_emit_section_maint ${1} confstart
+
+	if [ "x${FITIMAGE_DTB_BY_NAME}" = "x1" ] ; then
+		fitimage_emit_section_config ${1} "${kernelcount}" "${dtbref}" "${ramdiskcount}" "${setupcount}"
+	else
+		fitimage_emit_section_config ${1} "${kernelcount}" "fdt@${dtbcount}" "${ramdiskcount}" "${setupcount}"
+	fi
+
+	fitimage_emit_section_maint ${1} sectend
+
+	fitimage_emit_section_maint ${1} fitend
+
+	#
+	# Step 6: Assemble the image
+	#
+	uboot-mkimage \
+		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+		-f ${1} \
+		arch/${ARCH}/boot/${2}
+
+	#
+	# Step 7: Sign the image and add public key to U-Boot dtb
+	#
+	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
+		uboot-mkimage \
+			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+			-F -k "${UBOOT_SIGN_KEYDIR}" \
+			-K "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}" \
+			-r arch/${ARCH}/boot/${2}
+	fi
+}
+
+do_assemble_fitimage() {
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
+		cd ${B}
+		fitimage_assemble fit-image.its fitImage
+	fi
+}
+
+addtask assemble_fitimage before do_install after do_compile
+
+do_assemble_fitimage_initramfs() {
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
+		test -n "${INITRAMFS_IMAGE}" ; then
+		cd ${B}
+		fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
+	fi
+}
+
+addtask assemble_fitimage_initramfs before do_deploy after do_install
+
+kernel_do_deploy[vardepsexclude] = "DATETIME"
+kernel_do_deploy_append() {
+	# Update deploy directory
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
+		cd ${B}
+		echo "Copying fit-image.its source file..."
+		its_base_name="fitImage-its-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+		its_symlink_name=fitImage-its-${MACHINE}
+		install -m 0644 fit-image.its ${DEPLOYDIR}/${its_base_name}.its
+		linux_bin_base_name="fitImage-linux.bin-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+		linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
+		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
+
+		if [ -n "${INITRAMFS_IMAGE}" ]; then
+			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
+			its_initramfs_base_name="fitImage-its-${INITRAMFS_IMAGE}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+			its_initramfs_symlink_name=fitImage-its-${INITRAMFS_IMAGE}-${MACHINE}
+			install -m 0644 fit-image-${INITRAMFS_IMAGE}.its ${DEPLOYDIR}/${its_initramfs_base_name}.its
+			fit_initramfs_base_name="fitImage-${INITRAMFS_IMAGE}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+			fit_initramfs_symlink_name=fitImage-${INITRAMFS_IMAGE}-${MACHINE}
+			install -m 0644 arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/${fit_initramfs_base_name}.bin
+		fi
+
+		cd ${DEPLOYDIR}
+		ln -sf ${its_base_name}.its ${its_symlink_name}.its
+		ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}.bin
+
+		if [ -n "${INITRAMFS_IMAGE}" ]; then
+			ln -sf ${its_initramfs_base_name}.its ${its_initramfs_symlink_name}.its
+			ln -sf ${fit_initramfs_base_name}.bin ${fit_initramfs_symlink_name}.bin
+		fi
+	fi
+}
diff --git a/meta-arago-distro/classes/uboot-sign.bbclass b/meta-arago-distro/classes/uboot-sign.bbclass
new file mode 100644
index 0000000..3c56db8
--- /dev/null
+++ b/meta-arago-distro/classes/uboot-sign.bbclass
@@ -0,0 +1,95 @@
+# This file is part of U-Boot verified boot support and is intended to be
+# inherited from u-boot recipe and from kernel-fitimage.bbclass.
+#
+# The signature procedure requires the user to generate an RSA key and
+# certificate in a directory and to define the following variable:
+#
+#   UBOOT_SIGN_KEYDIR = "/keys/directory"
+#   UBOOT_SIGN_KEYNAME = "dev" # keys name in keydir (eg. "dev.crt", "dev.key")
+#   UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+#   UBOOT_SIGN_ENABLE = "1"
+#
+# As verified boot depends on fitImage generation, following is also required:
+#
+#   KERNEL_CLASSES ?= " kernel-fitimage "
+#   KERNEL_IMAGETYPE ?= "fitImage"
+#
+# The signature support is limited to the use of CONFIG_OF_SEPARATE in U-Boot.
+#
+# The tasks sequence is set as below, using DEPLOY_IMAGE_DIR as common place to
+# treat the device tree blob:
+#
+#   u-boot:do_deploy_dtb
+#   u-boot:do_deploy
+#   virtual/kernel:do_assemble_fitimage
+#   u-boot:do_concat_dtb
+#   u-boot:do_install
+#
+# For more details on signature process, please refer to U-boot documentation.
+
+# Signature activation.
+UBOOT_SIGN_ENABLE ?= "0"
+
+# Default value for deployment filenames.
+UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
+UBOOT_DTB_BINARY ?= "u-boot.dtb"
+UBOOT_DTB_SYMLINK ?= "u-boot-${MACHINE}.dtb"
+UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
+UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
+
+#
+# Following is relevant only for u-boot recipes:
+#
+
+do_deploy_dtb () {
+	mkdir -p ${DEPLOYDIR}
+	cd ${DEPLOYDIR}
+
+	if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then
+		install ${B}/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
+		rm -f ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SYMLINK}
+		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_SYMLINK}
+		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_BINARY}
+	fi
+	if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then
+		install ${B}/${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
+		rm -f ${UBOOT_NODTB_BINARY} ${UBOOT_NODTB_SYMLINK}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
+	fi
+}
+
+do_concat_dtb () {
+	# Concatenate U-Boot w/o DTB & DTB with public key
+	# (cf. kernel-fitimage.bbclass for more details)
+	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
+		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
+			[ -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
+			cd ${B}
+			oe_runmake EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
+			install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+			install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
+		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
+			cd ${DEPLOYDIR}
+			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
+		else
+			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
+		fi
+	fi
+}
+
+python () {
+	uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
+	if d.getVar('UBOOT_SIGN_ENABLE', True) == '1' and d.getVar('PN', True) == uboot_pn:
+		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel', True)
+
+		# u-boot.dtb and u-boot-nodtb.bin are deployed _before_ do_deploy
+		# Thus, do_deploy_setscene will also populate them in DEPLOY_IMAGE_DIR
+		bb.build.addtask('do_deploy_dtb', 'do_deploy', 'do_compile', d)
+
+		# do_concat_dtb is scheduled _before_ do_install as it overwrite the
+		# u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
+		bb.build.addtask('do_concat_dtb', 'do_install', None, d)
+		d.appendVarFlag('do_concat_dtb', 'depends', ' %s:do_assemble_fitimage' % kernel_pn)
+}
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 36a8a39..03a107c 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -22,6 +22,23 @@ SDKPATH = "${@"/tmp/"+"x"*96+"/"+"y"*96}"
 IMAGE_CLASSES += "image_types_md5"
 IMAGE_FSTYPES += "tar.xz.md5"
 
+# FIT image for secure devices
+KERNEL_CLASSES = "kernel-fitimage"
+FITIMAGE_HASH_ALGO = ""
+FITIMAGE_DTB_BY_NAME = "1"
+
+KERNEL_IMAGETYPES_dra7xx-hs-evm = "zImage fitImage"
+INITRAMFS_IMAGE_dra7xx-hs-evm = "arago-base-tisdk-image"
+INITRAMFS_FSTYPES_dra7xx-hs-evm = "cpio.xz"
+
+KERNEL_IMAGETYPES_am57xx-hs-evm = "zImage fitImage"
+INITRAMFS_IMAGE_am57xx-hs-evm = "arago-base-tisdk-image"
+INITRAMFS_FSTYPES_am57xx-hs-evm = "cpio.xz"
+
+KERNEL_IMAGETYPES_am437x-hs-evm = "zImage fitImage"
+INITRAMFS_IMAGE_am437x-hs-evm = "arago-base-tisdk-image"
+INITRAMFS_FSTYPES_am437x-hs-evm = "cpio.xz"
+
 # Mask any broken recipes (currently none)
 #BBMASK = ""
 
-- 
2.7.4


