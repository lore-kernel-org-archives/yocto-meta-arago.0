Return-Path: <jjhiblot@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 787865209B
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 15:55:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEFtY81016963
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 09:55:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513266934;
	bh=lwKl3tgGwMVbzDa/NVavn8bRD19ENol2H40PUiPwNNs=;
	h=From:To:CC:Subject:Date;
	b=fKwXwhI1854J2vwBV1YlIZcH7rLK3X2e2CHKKC7ygKX8dHC/NkhApcM+0Rs3CzmH4
	BDL+OYyqatM3z9R9yyzimaSyBMqdK5uWeHj72xGyjtc61agVV/F6UWduZJ0WTdSeLh
	A/X/6YsMZ+CQJyT3+dTLc7cfnyIkeKLRu7ZfsZdo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEFtTMx018484
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 09:55:29 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 09:55:29 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 14 Dec 2017 09:55:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEFtS1U014016;
	Thu, 14 Dec 2017 09:55:28 -0600
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Thu, 14 Dec 2017 16:55:23 +0100
Message-ID: <1513266923-18300-1-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-argao][PATCH] netboot-initramfs: Make it possible to use NFS as the rootfs with non-builtin drivers
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
X-List-Received-Date: Thu, 14 Dec 2017 15:55:46 -0000
Content-Type: text/plain

USB drivers are usually built as modules. This prevents using NFS as the
rootfs over a USB because the in-kernel support is not yet available at
the end of the kernel init.

To circumvent the problem, a minimal initramfs can be used to probe the
missing modules and finally setup the NFS mount.

The initramfs contains the required modules, udev and a
init script.
The script's actions are (in execution order):
* starts udev and trigger udev's enumeration
* parses the kernel command line to extract the NFS kernel options
* configure the ethernet device
* mount the NFS
* execute switch_root

The list of kernel module is defined by the variable NETBOOT_KERNEL_MODULES.
It contains the list of modules separated by space without the ".ko"
extension.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 .../netboot-initrd/files/init-netboot.sh           | 132 +++++++++++++++++++++
 .../netboot-initrd/netboot-initrd-scripts_0.0.1.bb |  13 ++
 .../netboot-initrd/netboot-initrd_0.0.1.bb         |  46 +++++++
 3 files changed, 191 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh
 create mode 100644 meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd-scripts_0.0.1.bb
 create mode 100644 meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb

diff --git a/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh b/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh
new file mode 100644
index 0000000..ebfb7db
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh
@@ -0,0 +1,132 @@
+#!/bin/sh
+
+export PATH=$PATH:/sbin:/usr/sbin
+
+early_setup() {
+    mkdir -p /proc /sys /tmp /run
+    mount -t proc proc /proc
+    mount -t sysfs sysfs /sys
+    mount -t devtmpfs none /dev
+}
+
+beginswith() { case $2 in "$1"*) true;; *) false;; esac; }
+
+read_args() {
+    for arg in $2; do
+        optarg=`expr "x$arg" : 'x[^=]*=\(.*\)'`
+        if beginswith $1 $arg ; then
+		echo  $optarg
+		break
+	fi
+    done
+}
+
+parse_server_info() {
+    info=$1
+    ip=$(echo $info | cut -s -d':' -f1 )
+    info=${info#$ip:}
+    path=$(echo $info | cut -d',' -f1 )
+    info=${info#$path}
+    options=${info#,}
+
+    eval "$2=$ip"
+    eval "$3=$path"
+    eval "$4=$options"
+}
+
+do_dhcp() {
+	if [ "$1" != "" ] ; then
+		udhcpc -i $1
+	else
+		udhcpc
+	fi
+}
+
+configure_eth_dev() {
+	conf=$1
+
+	client_ip=$(echo $conf | cut -s -d':' -f 1)
+	server_ip=$(echo $conf | cut -s -d':' -f 2)
+	gw_ip=$(echo $conf | cut -s -d':' -f 3)
+	netmask=$(echo $conf | cut -s -d':' -f 4)
+	hostname=$(echo $conf | cut -s -d':' -f 5)
+	device=$(echo $conf | cut -s -d':' -f 6)
+	autoconf=$(echo $conf | cut -s -d':' -f 7)
+	dns0_ip=$(echo $conf | cut -s -d':' -f 8)
+	dns1_ip=$(echo $conf | cut -s -d':' -f 9)
+
+	if [ "$device" == "" ]; then
+		device="eth0";
+	fi
+
+	echo waiting for device $device to come up
+	while [ -z "$(ip link show $device 2> /dev/null)" ] ; do
+		echo .;
+		sleep 1
+	done
+	echo done
+
+
+	ip link set $device up
+	echo waiting establishment of link on $device
+	while [ -z "$(ip link show $device | grep '<*LOWER_UP*>')" ] ; do
+		echo .;
+		sleep 1
+	done
+	echo done
+
+	#handle the case 'ip=dhcp'
+	if [ "$conf" == "dhcp" ] ; then
+		do_dhcp
+		return $?
+	fi
+
+	#handle the 'autoconf' case
+	if [ "$autoconf" == "dhcp" ] ; then
+		do_dhcp $device
+		return $?
+	fi
+
+	if [ "$netmask" != "" ]; then
+		ip addr add $client_ip/$netmask dev $device
+	else
+		ip addr add $client_ip dev $device
+	fi
+
+	if [ "$gw_ip" != "" ] ; then
+		ip route add default via $gw_ip
+	fi
+	if [ "$dns0_ip" != "" ] ; then
+		echo $dns0_ip >> /etc/resolv.conf
+	fi
+	if [ "$dns1_ip" != "" ] ; then
+		echo $dns1_ip >> /etc/resolv.conf
+	fi
+}
+
+early_setup
+udevd --daemon
+udevadm trigger
+udevadm settle
+
+cmdline=$(cat /proc/cmdline)
+
+root_dev=$(read_args  root "$cmdline")
+server_info=$(read_args nfsroot "$cmdline")
+ip_info=$(read_args ip "$cmdline")
+
+if [ "$root_dev" != "/dev/nfs" ]; then
+	echo "invalid root device. It must be /dev/nfs"
+	exit 1
+fi
+
+#
+configure_eth_dev $ip_info
+parse_server_info $server_info ip path options
+
+# mount NFS drive
+mkdir /newroot
+mount -t nfs -o nolock,rw,$options $ip:$path /newroot
+
+# switch root. new root is the NFS mount
+exec switch_root /newroot /sbin/init
diff --git a/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd-scripts_0.0.1.bb b/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd-scripts_0.0.1.bb
new file mode 100644
index 0000000..f1ab0d5
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd-scripts_0.0.1.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Simple init script that triggers udev and mount a NFS root filesystem described in kernel command line"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://init-netboot.sh"
+
+do_install() {
+        install -m 0755 ${WORKDIR}/init-netboot.sh ${D}/init
+}
+
+inherit allarch
+
+FILES_${PN} += " /init "
diff --git a/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb b/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb
new file mode 100644
index 0000000..0665e02
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Initramfs image for NFS boot"
+DESCRIPTION = "Small image capable of mounting a newtwork root filesystem (NFS)"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit core-image image_types_uboot
+
+#by default include the kernel modules necessary to use a ASIX USB/Ethernet adapter
+NETBOOT_KERNEL_MODULES ?= "dwc3 dwc3-omap asix xhci-plat-hcd extcon-usb-gpio"
+
+export IMAGE_BASENAME = "netboot-initramfs"
+
+#generate an image that can be loaded by u-boot
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES} ${INITRAMFS_FSTYPES}.u-boot"
+
+# include udev (used to load the kernel modules)
+VIRTUAL-RUNTIME_dev_manager = "udev"
+
+# List of packages to install
+IMAGE_INSTALL = "\
+  bash \
+  busybox \
+  udev \
+  netboot-initrd-scripts\
+  "
+
+# add the required kernel modules
+IMAGE_INSTALL += "${@' '.join(['kernel-module-'+x for x in bb.data.getVar('NETBOOT_KERNEL_MODULES',d,1).split()])}"
+
+
+# Reduce the size of the rootfs by removing features
+
+# Do not include buysbox's syslog
+BAD_RECOMMENDATIONS += "busybox-syslog"
+# Do not pollute the initrd image with rootfs features
+IMAGE_FEATURES = ""
+# Keep extra language files from being installed
+IMAGE_LINGUAS = ""
+
+# To further reduce the size of the rootfs, remove the /boot directory from the final image
+# this is usually done by adding RDEPENDS_kernel-base = "" in the configuration file. In our case we can't use
+# this method. Instead we just wipe out the content of "/boot" before creating the image.
+ROOTFS_POSTPROCESS_COMMAND += 'empty_boot_dir'
+empty_boot_dir () {
+	rm -rf ${IMAGE_ROOTFS}/boot/*
+}
-- 
1.9.1


