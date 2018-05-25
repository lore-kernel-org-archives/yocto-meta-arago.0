Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 01BD052975
	for <meta-arago@arago-project.org>;
	Fri, 25 May 2018 22:23:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4PMNja4025612
	for <meta-arago@arago-project.org>; Fri, 25 May 2018 17:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1527287026;
	bh=+XmRW+gFas6ls93VNV8QCFP3rc+ocwdKToc5+DJDQ08=;
	h=From:To:CC:Subject:Date;
	b=K1VvUV+yX+/C4GW0XNhqDEaY0xfozLqS2Fca3eJEox//8wZK2kPGtEH0vADJms1Ta
	Dz+AHjW16RLuB9yjLt4g351uyriNFGg5iyZxytTuhxUyiQErai537fiVGURC/2LNo/
	xhSM9fjbRLR2sXzmzuFxsrHLi2Xv717mjc/9iVbk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4PMNj4o009444
	for <meta-arago@arago-project.org>; Fri, 25 May 2018 17:23:45 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 25 May 2018 17:23:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 25 May 2018 17:23:45 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4PMNjjd029143;
	Fri, 25 May 2018 17:23:45 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 25 May 2018 18:23:40 -0400
Message-ID: <1527287020-9405-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [patch] linux-ti-staging*: update the baseline dts for am3 pru-uio
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
X-List-Received-Date: Fri, 25 May 2018 22:23:57 -0000
Content-Type: text/plain

* am335x-icev2-prueth.dts is newly added in kernel 4.14, and shall be
  used as the baseline to create am335x-icev2-pru-excl-uio.dts

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../linux/files/ti33x/am335x-pru-uio.dtsi          | 192 +++++++++++++++++++++
 .../linux/linux-ti-staging-rt_4.14.bbappend        |  14 +-
 .../linux/linux-ti-staging_4.14.bbappend           |  14 +-
 3 files changed, 218 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi

diff --git a/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi b/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
new file mode 100644
index 0000000..714b1d7
--- /dev/null
+++ b/recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi
@@ -0,0 +1,192 @@
+&pruss_soc_bus {
+		uio_pruss_mdio: uio_pruss_mdio@32400 {
+			compatible = "ti,davinci_mdio";
+			reg = <0x32400 0x90>;
+			clocks = <&dpll_core_m4_ck>;
+			clock-names = "fck";
+			bus_freq = <1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		uio_pruss_mem: uio_pruss_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4a300000 0x2000>,
+			      <0x4a302000 0x2000>,
+			      <0x4a310000 0x3000>,
+			      <0x4a320000 0x2000>,
+			      <0x4a326000 0x2000>,
+			      <0x4a32e000 0x31c>,
+			      <0x4a332000 0x58>;
+			mem-names = "dram0", "dram1", "shrdram2", "intc", "cfg",
+				    "iep", "mii_rt";
+
+			status = "okay";
+		};
+		uio_pruss_mem2: uio_pruss_mem2 {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4a328000 0xd4>,
+			      <0x4a330000 0x174>,
+			      <0x4a332400 0x90>,
+			      <0x40302000 0x0e000>;
+			mem-names = "uart", "ecap", "mdio", "ocmc";
+			status = "okay";
+		};
+
+		uio_pruss_evt0: uio_pruss_evt0 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <20>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt1: uio_pruss_evt1 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <21>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt2: uio_pruss_evt2 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <22>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt3: uio_pruss_evt3 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <23>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt4: uio_pruss_evt4 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <24>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt5: uio_pruss_evt5 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <25>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt6: uio_pruss_evt6 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <26>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+		uio_pruss_evt7: uio_pruss_evt7 {
+			compatible = "ti,uio-module-drv";
+                        interrupts = <27>;
+			interrupt-mode = <1>;
+			status = "okay";
+		};
+
+		uio_pruss_0_mem: uio_pruss_0_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4a334000 0x2000>,
+			      <0x4a322000 0x400>,
+			      <0x4a322400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+
+		uio_pruss_1_mem: uio_pruss_1_mem {
+			compatible = "ti,uio-module-drv";
+			mem = <0x4a338000 0x2000>,
+			      <0x4a324000 0x400>,
+			      <0x4a324400 0x100>;
+			mem-names = "iram", "control", "debug";
+			status = "okay";
+		};
+};
+
+&am33xx_pinmux {
+	uio_pruss_mdio_eth_default: uio_pruss_mdio_eht_default {
+		pinctrl-single,pins = <
+			AM33XX_IOPAD(0x88c, (PIN_OUTPUT | MUX_MODE5))           /* gpmc_clk.pr1_mdio_mdclk */
+			AM33XX_IOPAD(0x888, (PIN_INPUT  | MUX_MODE5))           /* gpmc_csn3.pr1_mdio_data */
+			AM33XX_IOPAD(0x89c, (PIN_INPUT_PULLUP | MUX_MODE7))     /* gpmc_ben0_cle.gpio2_5 */
+			/* disable CPSW MDIO */
+			AM33XX_IOPAD(0x948, (PIN_INPUT_PULLUP | MUX_MODE7))     /* mdio_data.gpio0_0 */
+			AM33XX_IOPAD(0x94c, (PIN_INPUT_PULLUP | MUX_MODE7))     /* mdio_clk.gpio0_1 */
+			AM33XX_IOPAD(0x8a0, (PIN_INPUT  | MUX_MODE2))   /* dss_data0.pr1_mii_mt0_clk */
+			AM33XX_IOPAD(0x8b4, (PIN_OUTPUT | MUX_MODE2))   /* dss_data5.pr1_mii0_txd0 */
+			AM33XX_IOPAD(0x8b0, (PIN_OUTPUT | MUX_MODE2))   /* dss_data4.pr1_mii0_txd1 */
+			AM33XX_IOPAD(0x8ac, (PIN_OUTPUT | MUX_MODE2))   /* dss_data3.pr1_mii0_txd2 */
+			AM33XX_IOPAD(0x8a8, (PIN_OUTPUT | MUX_MODE2))   /* dss_data2.pr1_mii0_txd3 */
+			AM33XX_IOPAD(0x8cc, (PIN_INPUT  | MUX_MODE5))   /* dss_data11.pr1_mii0_rxd0 */
+			AM33XX_IOPAD(0x8c8, (PIN_INPUT  | MUX_MODE5))   /* dss_data10.pr1_mii0_rxd1 */
+			AM33XX_IOPAD(0x8c4, (PIN_INPUT  | MUX_MODE5))   /* dss_data9.pr1_mii0_rxd2 */
+			AM33XX_IOPAD(0x8c0, (PIN_INPUT  | MUX_MODE5))   /* dss_data8.pr1_mii0_rxd3 */
+			AM33XX_IOPAD(0x8a4, (PIN_OUTPUT | MUX_MODE2))   /* dss_data1.pr1_mii0_txen */
+			AM33XX_IOPAD(0x8d8, (PIN_INPUT  | MUX_MODE5))   /* dss_data14.pr1_mii_mr0_clk */
+			AM33XX_IOPAD(0x8dc, (PIN_INPUT  | MUX_MODE5))   /* dss_data15.pr1_mii0_rxdv */
+			AM33XX_IOPAD(0x8d4, (PIN_INPUT  | MUX_MODE5))   /* dss_data13.pr1_mii0_rxer */
+			AM33XX_IOPAD(0x8d0, (PIN_INPUT  | MUX_MODE5))   /* dss_data12.pr1_mii0_rxlink */
+			AM33XX_IOPAD(0x8e8, (PIN_INPUT  | MUX_MODE2))   /* dss_pclk.pr1_mii0_crs */
+
+			AM33XX_IOPAD(0x840, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a0.pr1_mii_mt1_clk */
+			AM33XX_IOPAD(0x850, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a4.pr1_mii1_txd0 */
+			AM33XX_IOPAD(0x84c, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a3.pr1_mii1_txd1 */
+			AM33XX_IOPAD(0x848, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a2.pr1_mii1_txd2 */
+			AM33XX_IOPAD(0x844, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_a1.pr1_mii1_txd3 */
+			AM33XX_IOPAD(0x860, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a8.pr1_mii1_rxd0 */
+			AM33XX_IOPAD(0x85c, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a7.pr1_mii1_rxd1 */
+			AM33XX_IOPAD(0x858, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a6.pr1_mii1_rxd2 */
+			AM33XX_IOPAD(0x854, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a5.pr1_mii1_rxd3 */
+			AM33XX_IOPAD(0x874, (PIN_OUTPUT | MUX_MODE5))   /* gpmc_wpn.pr1_mii1_txen */
+			AM33XX_IOPAD(0x864, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a9.pr1_mii_mr1_clk */
+			AM33XX_IOPAD(0x868, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a10.pr1_mii1_rxdv */
+			AM33XX_IOPAD(0x86c, (PIN_INPUT  | MUX_MODE5))   /* gpmc_a11.pr1_mii1_rxer */
+			AM33XX_IOPAD(0x878, (PIN_INPUT  | MUX_MODE5))   /* gpmc_ben1.pr1_mii1_rxlink */
+			AM33XX_IOPAD(0x8ec, (PIN_INPUT  | MUX_MODE2))   /* lcd_ac_bias_en.pr1_mii1_crs */
+			AM33XX_IOPAD(0x870, (PIN_INPUT  | MUX_MODE5))   /* gpmc_wait0.pr1_mii1_col */
+		>;
+	};
+};
+
+&uio_pruss_mdio {
+	pinctrl-0 = <&uio_pruss_mdio_eth_default>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+	reset-delay-us = <2>; /* PHY datasheet states 1uS min */
+	status = "okay";
+
+	uio_pruss_eth0_phy: ethernet-phy@1 {
+		reg = <1>;
+	};
+
+	uio_pruss_eth1_phy: ethernet-phy@3 {
+		reg = <3>;
+	};
+};
+
+&pruss {
+	status = "disabled";
+};
+
+&pru0 {
+	status = "disabled";
+};
+
+&pru1 {
+	status = "disabled";
+};
+
+&pruss_intc {
+	status = "disabled";
+};
+
+&pruss_mdio {
+	status = "disabled";
+};
+
+&pruss_emac0 {
+        status = "disabled";
+};
+
+&pruss_emac1 {
+        status = "disabled";
+};
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend
index bb7597d..8862a77 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend
@@ -1,7 +1,19 @@
 require linux-processor-sdk-4.14.inc
 
-PR_append = ".0"
+PR_append = ".1"
 
 #KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
 #BRANCH = "processor-sdk-linux-rt-04.03.00"
 #SRCREV = "70e3f5f4ba347d0e929b004cb006e320fa01cdf1"
+
+do_setup_uio_append_ti33x() {
+
+    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
+    then
+        dts="am335x-icev2-pru-excl-uio.dts"
+        dtsi="am335x-pru-uio.dtsi"
+        cp ${S}/arch/arm/boot/dts/am335x-icev2-prueth.dts ${S}/arch/arm/boot/dts/$dts
+        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
+    fi
+}
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bbappend b/recipes-kernel/linux/linux-ti-staging_4.14.bbappend
index c90c594..b303201 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bbappend
@@ -1,7 +1,19 @@
 require linux-processor-sdk-4.14.inc
 
-PR_append = ".0"
+PR_append = ".1"
 
 #KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
 #BRANCH = "processor-sdk-linux-04.03.00"
 #SRCREV = "6d34f3ade55e815fffad92765d3a3ae775cc2bf0"
+
+do_setup_uio_append_ti33x() {
+
+    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
+    then
+        dts="am335x-icev2-pru-excl-uio.dts"
+        dtsi="am335x-pru-uio.dtsi"
+        cp ${S}/arch/arm/boot/dts/am335x-icev2-prueth.dts ${S}/arch/arm/boot/dts/$dts
+        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
+        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
+    fi
+}
-- 
1.9.1


