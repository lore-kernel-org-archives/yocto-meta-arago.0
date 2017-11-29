Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 8A7D152961
	for <meta-arago@arago-project.org>;
	Wed, 29 Nov 2017 19:22:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vATJMeoX009281
	for <meta-arago@arago-project.org>; Wed, 29 Nov 2017 13:22:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511983360;
	bh=Zv0lopNYPUzo2U53xRSzYs+x/Ep9E/u7aFpUoAWs7qw=;
	h=From:To:CC:Subject:Date;
	b=kBjO8g2e8YHfIm9DD9KRX9AgHK2vn3edK5Em9WPjcXyQkdy2TerPTbAOtJYx6PmsR
	EBuwPLlXaBvHFj1KNBB4fo9nTs9mAs3oWo7S1X+eifedZ3wnnwblHIYvrR7IfoALko
	EcxjJ38mGCPzYoyHrYcWNY70nsfU/95SM7snAWKw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vATJMZ2b023600
	for <meta-arago@arago-project.org>; Wed, 29 Nov 2017 13:22:35 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 29 Nov 2017 13:22:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 29 Nov 2017 13:22:35 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vATJMZOD007168;
	Wed, 29 Nov 2017 13:22:35 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Nov 2017 14:22:29 -0500
Message-ID: <1511983349-27384-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] linux-ti-staging*: add pru-uio device tree file for am574x
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
X-List-Received-Date: Wed, 29 Nov 2017 19:22:58 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../linux/files/dra7xx/am57xx-pru-uio.dtsi         | 252 +++++++++++++++++++++
 .../linux/linux-ti-staging-rt_4.9.bbappend         |  15 +-
 recipes-kernel/linux/linux-ti-staging_4.9.bbappend |  15 +-
 3 files changed, 280 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi

diff --git a/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi b/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
new file mode 100644
index 0000000..f149cf1
--- /dev/null
+++ b/recipes-kernel/linux/files/dra7xx/am57xx-pru-uio.dtsi
@@ -0,0 +1,252 @@
+&pruss_soc_bus1 {
+                uio_pruss1_mem: uio_pruss1_mem {
+                        compatible = "ti,uio-module-drv";
+                        mem = <0x4b200000 0x2000>,
+                              <0x4b202000 0x2000>,
+                              <0x4b210000 0x8000>,
+                              <0x4b220000 0x2000>,
+                              <0x4b226000 0x2000>,
+                              <0x4b22e000 0x31c>,
+                              <0x4b232000 0x58>;
+                        mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+                                    "iep", "mii_rt";
+                        status = "okay";
+                };
+                uio_pruss1_mem2: uio_pruss1_mem2 {
+                        compatible = "ti,uio-module-drv";
+                        mem = <0x4b228000 0x38>,
+                              <0x4b230000 0x60>,
+                              <0x4b232400 0x90>,
+                              <0x40340000 0x40000>;
+                        mem-names = "uart", "ecap", "mdio", "ocmc";
+                        status = "okay";
+                };
+                uio_pruss1_evt0: uio_pruss1_evt0 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt1: uio_pruss1_evt1 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt2: uio_pruss1_evt2 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt3: uio_pruss1_evt3 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt4: uio_pruss1_evt4 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt5: uio_pruss1_evt5 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt6: uio_pruss1_evt6 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+                uio_pruss1_evt7: uio_pruss1_evt7 {
+                        compatible = "ti,uio-module-drv";
+                        interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-mode = <1>;
+                        status = "okay";
+                };
+
+                uio_pruss1_0_mem: uio_pruss1_0_mem {
+                        compatible = "ti,uio-module-drv";
+                        mem = <0x4b234000 0x3000>,
+                              <0x4b222000 0x400>,
+                              <0x4b222400 0x100>;
+                        mem-names = "iram", "control", "debug";
+                        status = "okay";
+                };
+
+                uio_pruss1_1_mem: uio_pruss1_1_mem {
+                        compatible = "ti,uio-module-drv";
+                        mem = <0x4b238000 0x3000>,
+                              <0x4b224000 0x400>,
+                              <0x4b224400 0x100>;
+                        mem-names = "iram", "control", "debug";
+                        status = "okay";
+                };
+};
+
+&pruss1 {
+        status = "disabled";
+};
+
+&pru1_0 {
+        status = "disabled";
+};
+
+&pru1_1 {
+        status = "disabled";
+};
+
+&pruss1_intc {
+        status = "disabled";
+};
+
+&pruss_soc_bus2 {
+                uio_pruss2_mdio: uio_pruss2_mdio {
+                    compatible = "ti,davinci_mdio";
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    clocks = <&dpll_gmac_h13x2_ck>;
+                    clock-names = "fck";
+                    bus_freq = <1000000>;
+                    reg = <0x4b2b2400 0x90>;
+                    status = "disabled";
+                };
+
+		uio_pruss2_mem: uio_pruss2_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b280000 0x2000>,
+			      <0x4b282000 0x2000>,
+			      <0x4b290000 0x8000>,
+			      <0x4b2a0000 0x2000>,
+			      <0x4b2a6000 0x2000>,
+			      <0x4b2ae000 0x31c>,
+			      <0x4b2b2000 0x58>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss2_mem2: uio_pruss2_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b2a8000 0x38>,
+			      <0x4b2b0000 0x60>,
+			      <0x4b2b2400 0x90>,
+			      <0x40300000 0x40000>;
+			mem-names = "uart", "ecap", "mdio", "ocmc";
+			status = "okay";
+		};
+		uio_pruss2_evt0: uio_pruss2_evt0 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt1: uio_pruss2_evt1 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt2: uio_pruss2_evt2 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt3: uio_pruss2_evt3 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt4: uio_pruss2_evt4 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt5: uio_pruss2_evt5 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt6: uio_pruss2_evt6 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss2_evt7: uio_pruss2_evt7 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+
+		uio_pruss2_0_mem: uio_pruss2_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b2b4000 0x3000>,
+			      <0x4b2a2000 0x400>,
+			      <0x4b2a2400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+		uio_pruss2_1_mem: uio_pruss2_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4b2b8000 0x3000>,
+			      <0x4b2a4000 0x400>,
+			      <0x4b2a4400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+};
+
+&uio_pruss2_mdio {
+        reset-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>,
+                      <&gpio5 9 GPIO_ACTIVE_LOW>;
+        reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
+};
+
+&uio_pruss2_mdio {
+         status = "okay";
+         uio_pruss2_eth0_phy: uio_pruss2_eth0_phy@0 {
+             reg = <0>;
+         };
+
+         uio_pruss2_eth1_phy: uio_pruss2_eth1_phy@1 {
+              reg = <1>;
+          };
+};
+
+&pruss2_emac0 {
+        status = "disabled";
+};
+
+&pruss2_emac1 {
+        status = "disabled";
+};
+
+&pruss2 {
+        status = "disabled";
+};
+
+&pru2_0 {
+	status = "disabled";
+};
+
+&pru2_1 {
+	status = "disabled";
+};
+
+&pruss2_intc {
+        status = "disabled";
+};
+
+&pruss2_mdio {
+        status = "disabled";
+};
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
index 9e92aae..ad14478 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk11"
+PR_append = ".tisdk12"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"
 
@@ -22,5 +22,18 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
 CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
 CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
 
+SRC_URI_append_dra7xx = " file://am57xx-pru-uio.dtsi"
+do_setup_uio_append_dra7xx() {
+
+    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
+    then
+        dts="am574x-idk-pru-excl-uio.dts"
+        dtsi="am57xx-pru-uio.dtsi"
+        cp ${S}/arch/arm/boot/dts/am574x-idk.dts ${S}/arch/arm/boot/dts/$dts
+        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
+    fi
+}
+
 RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
 RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bbappend b/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
index 38c7a8d..978b639 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk11"
+PR_append = ".tisdk12"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"
 
@@ -22,5 +22,18 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
 CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
 CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
 
+SRC_URI_append_dra7xx = " file://am57xx-pru-uio.dtsi"
+do_setup_uio_append_dra7xx() {
+
+    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
+    then
+        dts="am574x-idk-pru-excl-uio.dts"
+        dtsi="am57xx-pru-uio.dtsi"
+        cp ${S}/arch/arm/boot/dts/am574x-idk.dts ${S}/arch/arm/boot/dts/$dts
+        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
+    fi
+}
+
 RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
 RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw"
-- 
1.9.1


