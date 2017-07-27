Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 86EB952A79
	for <meta-arago@arago-project.org>;
	Thu, 27 Jul 2017 19:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 46D18207BD;
	Thu, 27 Jul 2017 19:16:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cj-wQQRFgdQh; Thu, 27 Jul 2017 19:16:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 167C3207BC;
	Thu, 27 Jul 2017 19:16:57 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 96D72162536;
	Thu, 27 Jul 2017 15:16:56 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 27 Jul 2017 15:16:56 -0400
Message-Id: <1501183016-107527-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Subject: [morty/master][PATCH] kernel-fitimage: fix build issue w/out dtb by name
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
X-List-Received-Date: Thu, 27 Jul 2017 19:16:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Gaël PORTAY <gael.portay@savoirfairelinux.com>

When FITIMAGE_DTB_BY_NAME = "0", the following build issue happens.

	Log data follows:
	| DEBUG: Executing shell function do_assemble_fitimage
	| none
	| FIT description: U-Boot fitImage for xxx
	| Created:         Wed Jul 26 01:22:34 2017
	|  Image 0 (kernel@1)
	|   Description:  Linux kernel
	|   Created:      Wed Jul 26 01:22:34 2017
	|   Type:         Kernel Image
	|   Compression:  uncompressed
	|   Data Size:    3190040 Bytes = 3115.27 kB = 3.04 MB
	|   Architecture: ARM
	|   OS:           Linux
	|   Load Address: 0x80008000
	|   Entry Point:  0x80008000
	|   Hash algo:    sha1
	|   Hash value:   ff0b619672c456d03ba0b75b4abcf3298ce14864
	|  Image 1 (fdt@1)
	|   Description:  Flattened Device Tree blob
	|   Created:      Wed Jul 26 01:22:34 2017
	|   Type:         Flat Device Tree
	|   Compression:  uncompressed
	|   Data Size:    38327 Bytes = 37.43 kB = 0.04 MB
	|   Architecture: ARM
	|   Hash algo:    sha1
	|   Hash value:   e396711bfbe8ef33f49358f763bebf6345e6a8be
	|  Image 2 (fdt@2)
	|   Description:  Flattened Device Tree blob
	|   Created:      Wed Jul 26 01:22:34 2017
	|   Type:         Flat Device Tree
	|   Compression:  uncompressed
	|   Data Size:    38088 Bytes = 37.20 kB = 0.04 MB
	|   Architecture: ARM
	|   Hash algo:    sha1
	|   Hash value:   f5b9f17f06e46542165a0940ada33d4cfca2e02e
	|  Image 3 (fdt@3)
	|   Description:  Flattened Device Tree blob
	|   Created:      Wed Jul 26 01:22:34 2017
	|   Type:         Flat Device Tree
	|   Compression:  uncompressed
	|   Data Size:    39726 Bytes = 38.79 kB = 0.04 MB
	|   Architecture: ARM
	|   Hash algo:    sha1
	|   Hash value:   755d990706bfa9f203eeacbce0b9b732dfded621
	|  Default Configuration: 'conf@1'
	|  Configuration 0 (conf@1)
	|   Description:  Linux kernel, FDT blob
	|   Kernel:       kernel@1
	|   FDT:          am335x-xxx.dtb
	|  Configuration 1 (conf@2)
	|   Description:  Linux kernel, FDT blob
	|   Kernel:       kernel@1
	|   FDT:          am335x-xxx.dtb
	|  Configuration 2 (conf@3)
	|   Description:  Linux kernel, FDT blob
	|   Kernel:       kernel@1
	|   FDT:          am335x-xxx.dtb
	| uboot-mkimage Can't add hashes to FIT blob
	| Failed to find image 'fdt' in  configuration 'conf@1/signature@1'
	| WARNING: /.../temp/run.do_assemble_fitimage.26832:1 exit 255 from 'uboot-mkimage -D "-I dts -O dtb -p 2000" -F -k "keys" -K "u-boot.dtb" -r arch/arm/boot/${2}'
	| ERROR: Function failed: do_assemble_fitimage (log file is located at .../temp/log.do_assemble_fitimage.26832)
	ERROR: Task (.../meta-ti/recipes-kernel/linux/linux-ti-staging_4.9.bb:do_assemble_fitimage) failed with exit code '1'
	NOTE: Tasks Summary: Attempted 635 tasks of which 634 didn't need to be rerun and 1 failed.

The configuration node is using the dtb file name (i.e. am335x-xxx.dtb)
while the fdt node is named by its id (i.e. fdt@1).

	fdt@1 {
		description = "Flattened Device Tree blob";
		data = /incbin/("arch/arm/boot/dts/am335x-xxx.dtb.sec");
		type = "flat_dt";
		arch = "arm";
		compression = "none";
		...
	};

	...

	conf@1 {
		description = "Linux kernel, FDT blob";
		kernel = "kernel@1";
		fdt = "am335x-xxx.dtb";
		...
	};

This build issue has been introduced by the following commit.

	f23f2876a0 kernel-fitimage, arago.conf: package OPTEE OS image files into FIT

The re-indentation has mis-replaced the fdt line in configuration node.

This patch re-uses the variable ${fdt_line}.

It also applies the fix to the commit following commit.

	5edefbc694 (origin/master, origin/HEAD) kernel-fitimage: add support for packaging OPTEE pager images

Furthermore, the ${fdt_line} variable must to be set inside the for
loop. Otherwise, the fdt property will be the same for each
configurations.

Signed-off-by: Gaël PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index bca6f08..52399fe 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -299,13 +299,11 @@ fitimage_emit_section_config() {
 
 	conf_desc="Linux kernel"
 	kernel_line="kernel = \"kernel@${2}\";"
-	fdt_line=""
 	ramdisk_line=""
 
 	# Test if we have any DTBs at all
 	if [ -n "${3}" ]; then
 		conf_desc="${conf_desc}, FDT blob"
-		fdt_line="fdt = \"${3}\";"
 	fi
 
 	if [ -n "${4}" ]; then
@@ -343,6 +341,12 @@ fitimage_emit_section_config() {
 			conf_name="conf@${dtbcount}"
 		fi
 
+		if [ "x${FITIMAGE_DTB_BY_NAME}" = "x1" ] ; then
+			fdt_line="fdt = \"${DTB}\";"
+		else
+			fdt_line="fdt = \"fdt@${dtbcount}\";"
+		fi
+
 		if [ "x${dtbcount}" = "x1" ]; then
 			cat << EOF >> ${1}
                 default = "${conf_name}";
@@ -354,7 +358,7 @@ EOF
                 ${conf_name} {
                         description = "${final_conf_desc}";
                         ${kernel_line}
-                        fdt = "${DTB}";
+                        ${fdt_line}
                         ${ramdisk_line}
                         ${setup_line}
                         ${loadables_line}
@@ -412,7 +416,7 @@ EOF
                 ${conf_name} {
                         description = "${final_conf_desc}";
                         ${kernel_line}
-                        fdt = "${DTB}";
+                        ${fdt_line}
                         ${ramdisk_line}
                         ${setup_line}
                         ${loadables_pager_line}
-- 
2.7.4


