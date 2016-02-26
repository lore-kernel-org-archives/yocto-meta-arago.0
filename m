Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 63D6E52004
	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 19:10:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1QJAidH013716
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 13:10:44 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1QJAiTe024306
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 13:10:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 26 Feb 2016 13:10:44 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1QJAiWY010012;
	Fri, 26 Feb 2016 13:10:44 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1aZNml-0006pE-Pd; Fri, 26 Feb 2016 14:10:43 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 26 Feb 2016 14:10:42 -0500
Message-ID: <1456513842-26202-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH] create-ubifs: Add script to create the ubi filesystem image
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
X-List-Received-Date: Fri, 26 Feb 2016 19:10:45 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 create-ubifs.sh | 156 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100755 create-ubifs.sh

diff --git a/create-ubifs.sh b/create-ubifs.sh
new file mode 100755
index 0000000..30c78bd
--- /dev/null
+++ b/create-ubifs.sh
@@ -0,0 +1,156 @@
+#!/bin/bash
+
+# This distribution contains contributions or derivatives under copyright
+# as follows:
+#
+# Copyright (c) 2016, Texas Instruments Incorporated
+# All rights reserved.
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+# - Redistributions of source code must retain the above copyright notice,
+#   this list of conditions and the following disclaimer.
+# - Redistributions in binary form must reproduce the above copyright
+#   notice, this list of conditions and the following disclaimer in the
+#   documentation and/or other materials provided with the distribution.
+# - Neither the name of Texas Instruments nor the names of its
+#   contributors may be used to endorse or promote products derived
+#   from this software without specific prior written permission.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
+# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
+# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
+# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+# This variable will be populated during installation
+TI_SDK_PATH="__SDK_INSTALL_DIR__"
+
+# The following variables are populated during the SDK build
+MKUBIFS_ARGS="__MKUBIFS_ARGS__"
+UBINIZE_ARGS="__UBINIZE_ARGS__"
+
+machine=""
+image_rootfs=""
+image_name=""
+vol_name=""
+
+
+usage() {
+    cat << __EOF__
+
+Usage: sudo $0 <image_rootfs_dir> [-o <image_name_prefix>] [-v <vol_name>]
+
+Example:
+    sudo $0 ../targetNFS -o ../filesystem/custom-${machine}-rootfs
+
+This command will create the UBI image at "../filesytem/custom-${machine}-rootfs.ubi"
+
+__EOF__
+}
+
+default_args() {
+    machine=`grep "^PLATFORM" "${TI_SDK_PATH}/Rules.make" | sed -e 's|^.*=[ \t]*||'`
+
+    image_rootfs="${TI_SDK_PATH}/targetNFS"
+    image_name="${TI_SDK_PATH}/filesystem/custom-${machine}-rootfs"
+    vol_name="${machine}-rootfs"
+}
+
+parse_args() {
+    while [ $# -gt 0 ]
+    do
+        opt="$1"
+        shift
+        case $opt in
+            "-h"|"--help") usage; exit 0;;
+            "-o") image_name="$1"; shift;;
+            "-v") vol_name="$1"; shift;;
+            -*) echo "Error: Invalid option: \"${opt}\""; usage; exit 1;;
+            *)    image_rootfs="$opt";;
+        esac
+    done
+}
+
+check_config() {
+    if [ ! -d "${TI_SDK_PATH}" ]
+    then
+        echo "Error: Cannot find original installation directory!"
+        exit 1
+    fi
+
+    if [ ! -d "${image_rootfs}" ]
+    then
+        echo "Error: \"${image_rootfs}\" is not a valid directory for the image_rootfs!"
+        usage
+        exit 1
+    fi
+
+    AMIROOT=`whoami | awk {'print $1'}`
+    if [ "$AMIROOT" != "root" ] ; then
+        echo "Error: Must run script with sudo!"
+        echo ""
+        exit 1
+    fi
+
+    cat << __EOF__
+
+Parameters:
+    image_rootfs_dir ..... "${image_rootfs}"
+    image_name_prefix .... "${image_name}"
+    vol_name ............. "${vol_name}"
+
+__EOF__
+}
+
+create_ubinize_cfg() {
+    cat >> "${image_name}.ubinize.cfg" << __EOF__
+[ubifs]
+mode=ubi
+image=${image_name}.ubifs
+vol_id=0
+vol_type=dynamic
+vol_name=${vol_name}
+vol_flags=autoresize
+__EOF__
+}
+
+default_args
+parse_args "$@"
+check_config
+
+
+source ${TI_SDK_PATH}/linux-devkit/environment-setup
+
+PATH=${SDK_PATH_NATIVE}/usr/sbin:$PATH
+
+mkfs.ubifs -v -r "${image_rootfs}" -o "${image_name}.ubifs" ${MKUBIFS_ARGS}
+if [ $? -ne 0 ]
+then
+    echo ""
+    echo "Error: mkfs.ubifs failed!"
+    exit 1
+fi
+
+create_ubinize_cfg
+
+ubinize -v -o "${image_name}.ubi" ${UBINIZE_ARGS} "${image_name}.ubinize.cfg"
+if [ $? -ne 0 ]
+then
+    echo ""
+    echo "Error: ubinize failed!"
+    exit 1
+fi
+
+echo ""
+echo "Success! The UBI image is available at \"${image_name}.ubi\""
+echo ""
+
+exit 0
-- 
1.9.1


