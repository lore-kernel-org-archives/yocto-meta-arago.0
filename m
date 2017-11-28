Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id D55EC52961
	for <meta-arago@arago-project.org>;
	Tue, 28 Nov 2017 21:11:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vASLBwHg025759
	for <meta-arago@arago-project.org>; Tue, 28 Nov 2017 15:11:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511903518;
	bh=Cfm5IIqT1MaSqBXnZI1be1RDPBZij2nf/MonaC51Zag=;
	h=From:To:CC:Subject:Date;
	b=GvK9bJX56YoN7dGKT61h4vXo7tjaM1GOHtW8U9ldRH7STQM+YD0t99rFnqwb1rJrP
	tgvh8pl0W763F2CF+0LZQqYJWenIGITU0h4kWAxV6vwESgUsQdC4AKAA6tFwwtqRos
	4Zjo7gaxsUGiLuC3Ap75HJdfh3zshjhB7kdSDdzA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vASLBwFF000757
	for <meta-arago@arago-project.org>; Tue, 28 Nov 2017 15:11:58 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 28 Nov 2017 15:11:58 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 28 Nov 2017 15:11:58 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vASLBwqM025482;
	Tue, 28 Nov 2017 15:11:58 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Nov 2017 16:11:52 -0500
Message-ID: <1511903512-31813-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] linux: cmem: add support for am574x
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
X-List-Received-Date: Tue, 28 Nov 2017 21:11:59 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-kernel/linux/cmem.inc | 83 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 recipes-kernel/linux/cmem.inc

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
new file mode 100644
index 0000000..64d3264
--- /dev/null
+++ b/recipes-kernel/linux/cmem.inc
@@ -0,0 +1,83 @@
+# Add concept of machine variants to split DTBs into subsets
+#
+# Use these for temporary overrides
+CMEM_MACHINE = "${MACHINE}"
+CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
+CMEM_MACHINE_am57xx-hs-evm = "am571x am572x"
+CMEM_MACHINE_dra7xx-evm = "dra71x dra72x dra74x"
+CMEM_MACHINE_dra7xx-hs-evm = "dra71x dra72x dra74x"
+
+# Set cmem.dtsi per machine or machine variant
+CMEM_DTSI = "cmem.dtsi"
+CMEM_DTSI_am571x = "cmem-am571x.dtsi"
+CMEM_DTSI_dra71x = "cmem-dra71x.dtsi"
+CMEM_DTSI_dra72x = "cmem-dra72x.dtsi"
+
+# Split device trees between variants
+CMEM_DEVICETREE = "${KERNEL_DEVICETREE}"
+CMEM_DEVICETREE_am571x = "am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb"
+CMEM_DEVICETREE_am572x = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb \
+                          am57xx-evm.dtb am57xx-evm-cam-mt9t111.dtb am57xx-evm-cam-ov10635.dtb \
+                          am57xx-evm-reva3.dtb am57xx-evm-reva3-cam-mt9t111.dtb am57xx-evm-reva3-cam-ov10635.dtb \
+                          am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb"
+CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
+CMEM_DEVICETREE_dra71x = "dra71-evm.dtb dra71-evm-lcd-auo-g101evn01.0.dtb"
+CMEM_DEVICETREE_dra72x = "dra72-evm.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
+                          dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb"
+CMEM_DEVICETREE_dra74x = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb"
+
+# Flag to enable CMEM injection
+RESERVE_CMEM ?= "0"
+
+# Add correct cmem.dtsi to SRC_URI for each variant for a given machine
+python do_unpack() {
+    old_overrides = d.getVar('OVERRIDES', False)
+
+    # Initialize with empty string to simplify logic to append to SRC_URI
+    cmem_dtsi = set([''])
+
+    for cmem_machine in (d.getVar('CMEM_MACHINE', True) or '').split():
+        # Create copy of data for additional override
+        localdata = bb.data.createCopy(d)
+        localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
+        bb.data.update_data(localdata)
+
+        cmem_dtsi.add(localdata.getVar('CMEM_DTSI', True))
+
+    d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
+    bb.build.exec_func('base_do_unpack', d)
+}
+
+python do_setup_cmem() {
+    import shutil
+
+    old_overrides = d.getVar('OVERRIDES', False)
+
+    if d.getVar('RESERVE_CMEM', True) is '1':
+        for cmem_machine in (d.getVar('CMEM_MACHINE', True) or '').split():
+            # Create copy of data for additional override
+            localdata = bb.data.createCopy(d)
+            localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine, old_overrides))
+            bb.data.update_data(localdata)
+
+            # Get source directory and dtsi filename
+            src_dir  = localdata.getVar('WORKDIR', True)
+            src_dtsi = localdata.getVar('CMEM_DTSI', True)
+
+            # Get destination directory and destination dtsi filename which adds
+            #   the MACHINE prefix.
+            dst_dir  = os.path.join(localdata.getVar('S', True), 'arch/arm/boot/dts')
+            dst_dtsi = localdata.expand('${MACHINE}-${CMEM_DTSI}')
+
+            # Copy cmem.dtsi into source tree
+            shutil.copy(os.path.join(src_dir,src_dtsi), os.path.join(dst_dir,dst_dtsi))
+
+            # Inject dtsi into each dts in list
+            for dtb in (localdata.getVar('CMEM_DEVICETREE', True) or '').split():
+                dts = dtb[:-4] + '.dts'
+
+                with open(os.path.join(dst_dir,dts), 'a') as dts_file:
+                    dts_file.write('\n#include "%s"\n' % dst_dtsi)
+}
+
+do_patch[postfuncs] += "do_setup_cmem"
-- 
1.9.1


