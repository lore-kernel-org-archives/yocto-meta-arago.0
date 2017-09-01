Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id B039452A40
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 16:02:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81G2obv021648
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 11:02:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504281770;
	bh=ze1Bo1DWEcQYFZzVqmOSNLscR1U9NExXKEcsMAQDt0Q=;
	h=From:To:CC:Subject:Date;
	b=CIYZmSS+1OxeC8ELTFCouKld6tdh/cvmC/gWzwPv1U+dpXk942B6bktX66Ran1l2l
	73UG+0ZxGblUKddSZkWST5PkFvD7qc8no2Y0/aPjX51UstQmpjwixjHohev9H9q1Ne
	Xs1M/B73cM62xJs5mCa1Z3Ps3Pig3pHL+jfCUkIQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81G2omB011705
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 11:02:50 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 11:02:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 11:02:50 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81G2nst012198;
	Fri, 1 Sep 2017 11:02:50 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 12:02:45 -0400
Message-ID: <1504281765-15266-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] linux: ti-uio: add pru-uio device tree file for k2g
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
X-List-Received-Date: Fri, 01 Sep 2017 16:02:51 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../linux/files/k2g/keystone-k2g-pru-uio.dtsi      | 391 +++++++++++++++++++++
 recipes-kernel/linux/ti-uio.inc                    |  14 +
 2 files changed, 405 insertions(+)
 create mode 100644 recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi

diff --git a/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi b/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
new file mode 100644
index 0000000..69955a4
--- /dev/null
+++ b/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
@@ -0,0 +1,391 @@
+&pruss_soc_bus0 {
+		uio_pruss1_mdio: uio_mdio@20ab2400 {
+			compatible = "ti,davinci_mdio";
+			reg = <0x20ab2400 0x90>;
+			clocks = <&k2g_clks K2G_DEV_ICSS0 K2G_DEV_ICSS_CORE_CLK>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			bus_freq = <2500000>;
+			status = "disabled";
+		};
+
+		uio_pruss1_mem: uio_pruss1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20a80000 0x2000>,
+			      <0x20a82000 0x2000>,
+			      <0x20a90000 0x10000>,
+			      <0x20aa0000 0x2000>,
+			      <0x20aa6000 0x2000>,
+			      <0x20aae000 0x31c>,
+			      <0x20ab2000 0x70>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss1_mem2: uio_pruss1_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20aa8000 0x38>,
+			      <0x20ab0000 0x60>,
+			      <0x20ab2400 0x90>,
+			      <0x0c080000 0xe000>;
+			mem-names = "uart", "ecap", "mdio", "ocmc";
+			status = "okay";
+		};
+		uio_pruss1_evt0: uio_pruss1_evt0 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 224 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss1_evt1: uio_pruss1_evt1 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 225 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss1_evt2: uio_pruss1_evt2 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 226 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss1_evt3: uio_pruss1_evt3 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 227 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss1_evt4: uio_pruss1_evt4 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 228 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss1_evt6: uio_pruss1_evt6 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 230 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss1_evt7: uio_pruss1_evt7 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 231 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+
+		uio_pruss1_0_mem: uio_pruss1_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20ab4000 0x3000>,
+			      <0x20aa2000 0x400>,
+			      <0x20aa2400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+
+		uio_pruss1_1_mem: uio_pruss1_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20ab8000 0x3000>,
+			      <0x20aa4000 0x400>,
+			      <0x20aa4400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+};
+
+&pruss_soc_bus1 {
+		uio_pruss2_mdio: uio_mdio@20af2400 {
+			compatible = "ti,davinci_mdio";
+			reg = <0x20af2400 0x90>;
+			clocks = <&k2g_clks K2G_DEV_ICSS1 K2G_DEV_ICSS_CORE_CLK>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			bus_freq = <2500000>;
+			status = "disabled";
+		};
+
+		uio_pruss2_mem: uio_pruss2_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20ac0000 0x2000>,
+			      <0x20ac2000 0x2000>,
+			      <0x20ad0000 0x10000>,
+			      <0x20ae0000 0x2000>,
+			      <0x20ae6000 0x2000>,
+			      <0x20aee000 0x31c>,
+			      <0x20af2000 0x70>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+			status = "okay";
+		};
+		uio_pruss2_mem2: uio_pruss2_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20ae8000 0x38>,
+			      <0x20af0000 0x60>,
+			      <0x20af2400 0x90>,
+			      <0x0c08e000 0xe000>;
+			mem-names = "uart", "ecap", "mdio", "ocmc";
+			status = "okay";
+		};
+		uio_pruss2_evt0: uio_pruss2_evt0 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 232 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss2_evt1: uio_pruss2_evt1 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 233 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss2_evt2: uio_pruss2_evt2 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 234 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss2_evt3: uio_pruss2_evt3 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 235 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss2_evt4: uio_pruss2_evt4 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 236 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss2_evt6: uio_pruss2_evt6 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 238 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+		uio_pruss2_evt7: uio_pruss2_evt7 {
+			compatible = "ti,uio-module-drv";
+			interrupts = <GIC_SPI 239 0xf01>;
+			interrupt-mode = <0>;
+			status = "okay";
+		};
+
+		uio_pruss2_0_mem: uio_pruss2_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20af4000 0x3000>,
+			      <0x20ae2000 0x400>,
+			      <0x20ae2400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+		uio_pruss2_1_mem: uio_pruss2_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x20af8000 0x3000>,
+			      <0x20ae4000 0x400>,
+			      <0x20ae4400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+};
+
+&k2g_pinctrl {
+	uio_pruss1_mdio_eth_default: uio_pruss1_mdio_eth_default {
+		pinctrl-single,pins = <
+                        K2G_CORE_IOPAD(0x12cc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)      /* pr0_mdio_data.pr0_mdio_data */
+                        K2G_CORE_IOPAD(0x12d0) (BUFFER_CLASS_B | PIN_PULLDOWN | MUX_MODE0)      /* pr0_mdio_mdclk.pr0_mdio_mdclk */
+                        K2G_CORE_IOPAD(0x105c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE3)      /* gpmc_wait1.gpio0_23 (pr0_mii0_resetn) */
+                        K2G_CORE_IOPAD(0x1070) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE3)        /* gpmc_csn2.gpio0_28 (pr0_mii0_intn) */
+                        K2G_CORE_IOPAD(0x1054) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE3)      /* gpmc_be1n.gpio0_21 (pr0_mii1_resetn) */
+                        K2G_CORE_IOPAD(0x1074) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE3)        /* gpmc_csn3.gpio0_29 (pr0_mii1_intn) */
+
+                        /* PRUSS0 External Mux routing */
+                        K2G_CORE_IOPAD(0x11d4) (BUFFER_CLASS_B | MUX_MODE3)                     /* uart0_ctsn.gpio0_106 */
+                        K2G_CORE_IOPAD(0x11d8) (BUFFER_CLASS_B | MUX_MODE3)                     /* uart0_rtsn.gpio0_107 */
+                        K2G_CORE_IOPAD(0x11fc) (BUFFER_CLASS_B | MUX_MODE3)                     /* dcan0_rx.gpio1_57 */
+                        K2G_CORE_IOPAD(0x1200) (BUFFER_CLASS_B | MUX_MODE3)                     /* dcan0_tx.gpio1_56 */
+                        K2G_CORE_IOPAD(0x1224) (BUFFER_CLASS_B | MUX_MODE3)                     /* qspi_csn2.gpio1_66 */
+                        K2G_CORE_IOPAD(0x1228) (BUFFER_CLASS_B | MUX_MODE3)                     /* qspi_csn3.gpio1_67 */
+
+                        /* PRUSS0 PRU0 Ethernet */
+                        K2G_CORE_IOPAD(0x122c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo0.pr0_pru0_gpi0 (pr0_mii0_rxd0) */
+                        K2G_CORE_IOPAD(0x1230) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo1.pr0_pru0_gpi1 (pr0_mii0_rxd1) */
+                        K2G_CORE_IOPAD(0x1234) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo2.pr0_pru0_gpi2 (pr0_mii0_rxd2) */
+                        K2G_CORE_IOPAD(0x1238) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo3.pr0_pru0_gpi3 (pr0_mii0_rxd3) */
+                        K2G_CORE_IOPAD(0x123c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo4.pr0_pru0_gpi4 (pr0_mii0_rxdv) */
+                        K2G_CORE_IOPAD(0x1240) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo5.pr0_pru0_gpi5 (pr0_mii0_rxer) */
+                        K2G_CORE_IOPAD(0x1244) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr0_pru0_gpo6.pr0_pru0_gpi6 (pr0_mii_mr0_clk) */
+
+                        K2G_CORE_IOPAD(0x124c) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr0_pru0_gpo8.pr0_pru0_gpi8 (pr0_mii0_rxlink) */
+                        K2G_CORE_IOPAD(0x1250) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo9.pr0_pru0_gpi9 (pr0_mii0_col) */
+                        K2G_CORE_IOPAD(0x1254) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru0_gpo10.pr0_pru0_gpi10 (pr0_mii0_crs) */
+
+                        K2G_CORE_IOPAD(0x12a8) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru1_gpo11.pr0_pru1_gpo11 (pr0_mii0_txd0) */
+                        K2G_CORE_IOPAD(0x12ac) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru1_gpo12.pr0_pru1_gpo12 (pr0_mii0_txd1) */
+                        K2G_CORE_IOPAD(0x12b0) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru1_gpo13.pr0_pru1_gpo13 (pr0_mii0_txd2) */
+                        K2G_CORE_IOPAD(0x12b4) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru1_gpo14.pr0_pru1_gpo14 (pr0_mii0_txd3) */
+                        K2G_CORE_IOPAD(0x12b8) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru1_gpo15.pr0_pru1_gpo15 (pr0_mii0_txen) */
+                        K2G_CORE_IOPAD(0x12bc) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr0_pru1_gpo16.pr0_pru1_gpo16 (pr0_mii_mt0_clk) */
+
+                        /* PRUSS0 PRU1 Ethernet */
+                        K2G_CORE_IOPAD(0x127c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo0.pr0_pru1_gpi0 (pr0_mii1_rxd0) */
+                        K2G_CORE_IOPAD(0x1280) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo1.pr0_pru1_gpi1 (pr0_mii1_rxd1) */
+                        K2G_CORE_IOPAD(0x1284) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo2.pr0_pru1_gpi2 (pr0_mii1_rxd2) */
+                        K2G_CORE_IOPAD(0x1288) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo3.pr0_pru1_gpi3 (pr0_mii1_rxd3) */
+                        K2G_CORE_IOPAD(0x128c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo4.pr0_pru1_gpi4 (pr0_mii1_rxdv) */
+                        K2G_CORE_IOPAD(0x1290) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo5.pr0_pru1_gpi5 (pr0_mii1_rxer) */
+                        K2G_CORE_IOPAD(0x1294) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr0_pru1_gpo6.pr0_pru1_gpi6 (pr0_mii_mr1_clk) */
+
+                        K2G_CORE_IOPAD(0x129c) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr0_pru1_gpo8.pr0_pru1_gpi8 (pr0_mii1_rxlink) */
+                        K2G_CORE_IOPAD(0x12a0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo9.pr0_pru1_gpi9 (pr0_mii1_col) */
+                        K2G_CORE_IOPAD(0x12a4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr0_pru1_gpo10.pr0_pru1_gpi10 (pr0_mii1_crs) */
+
+                        K2G_CORE_IOPAD(0x1258) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru0_gpo11.pr0_pru0_gpo11 (pr0_mii1_txd0) */
+                        K2G_CORE_IOPAD(0x125c) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru0_gpo12.pr0_pru0_gpo12 (pr0_mii1_txd1) */
+                        K2G_CORE_IOPAD(0x1260) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru0_gpo13.pr0_pru0_gpo13 (pr0_mii1_txd2) */
+                        K2G_CORE_IOPAD(0x1264) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru0_gpo14.pr0_pru0_gpo14 (pr0_mii1_txd3) */
+                        K2G_CORE_IOPAD(0x1268) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr0_pru0_gpo15.pr0_pru0_gpo15 (pr0_mii1_txen) */
+                        K2G_CORE_IOPAD(0x126c) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr0_pru0_gpo16.pr0_pru0_gpo16 (pr0_mii_mt1_clk) */
+		>;
+	};
+
+	uio_pruss2_mdio_eth_default: uio_pruss2_mdio_eth_default {
+		pinctrl-single,pins = <
+                        K2G_CORE_IOPAD(0x1374) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)      /* pr1_mdio_data.pr1_mdio_data */
+                        K2G_CORE_IOPAD(0x1378) (BUFFER_CLASS_B | PIN_PULLDOWN | MUX_MODE0)      /* pr1_mdio_mdclk.pr1_mdio_mdclk */
+                        K2G_CORE_IOPAD(0x1050) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE3)      /* gpmc_be0ncle.gpio0_20 (pr1_mii0_resetn) */
+                        K2G_CORE_IOPAD(0x1044) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE3)        /* gpmc_advnale.gpio0_17 (pr1_mii0_intn) */
+                        K2G_CORE_IOPAD(0x1060) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE3)      /* gpmc_wpn.gpio0_24 (pr1_mii1_resetn) */
+                        K2G_CORE_IOPAD(0x1088) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE3)        /* gpmc_wait0.gpio0_22 (pr1_mii1_intn) */
+
+                        /* PRUSS1 PRU0 Ethernet */
+                        K2G_CORE_IOPAD(0x12d4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo0.pr1_pru0_gpi0 (pr1_mii0_rxd0) */
+                        K2G_CORE_IOPAD(0x12d8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo1.pr1_pru0_gpi1 (pr1_mii0_rxd1) */
+                        K2G_CORE_IOPAD(0x12dc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo2.pr1_pru0_gpi2 (pr1_mii0_rxd2) */
+                        K2G_CORE_IOPAD(0x12e0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo3.pr1_pru0_gpi3 (pr1_mii0_rxd3) */
+                        K2G_CORE_IOPAD(0x12e4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo4.pr1_pru0_gpi4 (pr1_mii0_rxdv) */
+                        K2G_CORE_IOPAD(0x12e8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo5.pr1_pru0_gpi5 (pr1_mii0_rxer) */
+                        K2G_CORE_IOPAD(0x12ec) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr1_pru0_gpo6.pr1_pru0_gpi6 (pr1_mii_mr0_clk) */
+
+                        K2G_CORE_IOPAD(0x12f4) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr1_pru0_gpo8.pr1_pru0_gpi8 (pr1_mii0_rxlink) */
+                        K2G_CORE_IOPAD(0x12f8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo9.pr1_pru0_gpi9 (pr1_mii0_col) */
+                        K2G_CORE_IOPAD(0x12fc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru0_gpo10.pr1_pru0_gpi10 (pr1_mii0_crs) */
+
+                        K2G_CORE_IOPAD(0x1350) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru1_gpo11.pr1_pru1_gpo11 (pr1_mii0_txd0) */
+                        K2G_CORE_IOPAD(0x1354) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru1_gpo12.pr1_pru1_gpo12 (pr1_mii0_txd1) */
+                        K2G_CORE_IOPAD(0x1358) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru1_gpo13.pr1_pru1_gpo13 (pr1_mii0_txd2) */
+                        K2G_CORE_IOPAD(0x135c) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru1_gpo14.pr1_pru1_gpo14 (pr1_mii0_txd3) */
+                        K2G_CORE_IOPAD(0x1360) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru1_gpo15.pr1_pru1_gpo15 (pr1_mii0_txen) */
+                        K2G_CORE_IOPAD(0x1364) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr1_pru1_gpo16.pr1_pru1_gpo16 (pr1_mii_mt0_clk) */
+
+                        /* PRUSS1 PRU1 Ethernet */
+                        K2G_CORE_IOPAD(0x1324) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo0.pr1_pru1_gpi0 (pr1_mii1_rxd0) */
+                        K2G_CORE_IOPAD(0x132c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo2.pr1_pru1_gpi2 (pr1_mii1_rxd2) */
+                        K2G_CORE_IOPAD(0x1330) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo3.pr1_pru1_gpi3 (pr1_mii1_rxd3) */
+                        K2G_CORE_IOPAD(0x1334) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo4.pr1_pru1_gpi4 (pr1_mii1_rxdv) */
+                        K2G_CORE_IOPAD(0x1338) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo5.pr1_pru1_gpi5 (pr1_mii1_rxer) */
+                        K2G_CORE_IOPAD(0x133c) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr1_pru1_gpo6.pr1_pru1_gpi6 (pr1_mii_mr1_clk) */
+
+                        K2G_CORE_IOPAD(0x1344) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr1_pru1_gpo8.pr1_pru1_gpi8 (pr1_mii1_rxlink) */
+                        K2G_CORE_IOPAD(0x1348) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo9.pr1_pru1_gpi9 (pr1_mii1_col) */
+                        K2G_CORE_IOPAD(0x134c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE1)      /* pr1_pru1_gpo10.pr1_pru1_gpi10 (pr1_mii1_crs) */
+
+                        K2G_CORE_IOPAD(0x1300) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru0_gpo11.pr1_pru0_gpo11 (pr1_mii1_txd0) */
+                        K2G_CORE_IOPAD(0x1304) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru0_gpo12.pr1_pru0_gpo12 (pr1_mii1_txd1) */
+                        K2G_CORE_IOPAD(0x1308) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru0_gpo13.pr1_pru0_gpo13 (pr1_mii1_txd2) */
+                        K2G_CORE_IOPAD(0x130c) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru0_gpo14.pr1_pru0_gpo14 (pr1_mii1_txd3) */
+                        K2G_CORE_IOPAD(0x1310) (BUFFER_CLASS_B | MUX_MODE0)                     /* pr1_pru0_gpo15.pr1_pru0_gpo15 (pr1_mii1_txen) */
+                        K2G_CORE_IOPAD(0x1314) (BUFFER_CLASS_B | MUX_MODE1)                     /* pr1_pru0_gpo16.pr1_pru0_gpo16 (pr1_mii_mt1_clk) */
+		>;
+	};
+};
+
+&uio_pruss1_mdio {
+        status = "okay";
+        pinctrl-0 = <&uio_pruss1_mdio_eth_default>;
+        pinctrl-names = "default";
+        reset-gpios = <&gpio0 23 GPIO_ACTIVE_LOW>,
+                      <&gpio0 21 GPIO_ACTIVE_LOW>;
+        reset-delay-us = <20>;
+
+        uio_pruss1_eth0_phy: uio-ethernet-phy@0 {
+                reg = <0>;
+        };
+
+        uio_pruss1_eth1_phy: uio-ethernet-phy@1 {
+                reg = <1>;
+        };
+};
+
+&uio_pruss2_mdio {
+        status = "okay";
+        pinctrl-0 = <&uio_pruss2_mdio_eth_default>;
+        pinctrl-names = "default";
+        reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>,
+                      <&gpio0 24 GPIO_ACTIVE_LOW>;
+        reset-delay-us = <20>;
+
+        uio_pruss2_eth0_phy: uio-ethernet-phy@2 {
+                reg = <2>;
+        };
+
+        uio_pruss2_eth1_phy: uio-ethernet-phy@3 {
+                reg = <3>;
+        };
+};
+
+&pruss0 {
+	status = "disabled";
+};
+
+&pru0_0 {
+	status = "disabled";
+};
+
+&pru0_1 {
+	status = "disabled";
+};
+
+&pruss0_intc {
+	status = "disabled";
+};
+
+&pruss0_mdio {
+	status = "disabled";
+};
+
+&pruss1 {
+	status = "disabled";
+};
+
+&pru1_0 {
+	status = "disabled";
+};
+
+&pru1_1 {
+	status = "disabled";
+};
+
+&pruss1_intc {
+	status = "disabled";
+};
+
+&pruss1_mdio {
+	status = "disabled";
+};
+
+&pruss0_emac0 {
+	status = "disabled";
+};
+
+&pruss0_emac1 {
+	status = "disabled";
+};
+
+&pruss1_emac0 {
+	status = "disabled";
+};
+
+&pruss1_emac1 {
+	status = "disabled";
+};
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
index 57a4aca..7a15b31 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -4,6 +4,7 @@ SRC_URI_append_keystone = " file://keystone-uio.dtsi"
 SRC_URI_append_k2hk-evm = " file://k2hk-uio.dtsi"
 SRC_URI_append_k2l-evm = " file://k2l-uio.dtsi"
 SRC_URI_append_k2e = " file://k2e-uio.dtsi"
+SRC_URI_append_k2g = " file://keystone-k2g-pru-uio.dtsi"
 SRC_URI_append_am57xx-evm = " file://am572x-pru-uio.dtsi \
                               file://am571x-pru-uio.dtsi \
 "
@@ -19,6 +20,7 @@ DTSI_LIST_append_k2e = " k2e-uio.dtsi"
 KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb", "", d)}"
 KERNEL_DEVICETREE_append_ti33x = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am335x-icev2-pru-excl-uio.dtb", "", d)}"
 KERNEL_DEVICETREE_append_ti43x = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am437x-idk-pru-excl-uio.dtb", "", d)}"
+KERNEL_DEVICETREE_append_k2g = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " keystone-k2g-ice-pru-excl-uio.dtb", "", d)}"
 
 do_setup_uio() {
     if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
@@ -77,4 +79,16 @@ do_setup_uio_append_ti43x() {
     fi
 }
 
+do_setup_uio_append_k2g() {
+
+    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
+    then
+        dts="keystone-k2g-ice-pru-excl-uio.dts"
+        dtsi="keystone-k2g-pru-uio.dtsi"
+        cp ${S}/arch/arm/boot/dts/keystone-k2g-ice.dts ${S}/arch/arm/boot/dts/$dts
+        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
+    fi
+}
+
 do_patch[postfuncs] += "do_setup_uio"
-- 
1.9.1


