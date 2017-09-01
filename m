Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id CF21C52978
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:09:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81K9rmr010806
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504296593;
	bh=svxq0BzW2IFxnGcLNQTzGv7tsvcjjRMg4L/+7ceHM1o=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=pgEATBIDrp1ta3tVlgOfiIbVMtx+/LhVNYCsO0EmRVa1UBHGDw5oa459nh8u6wBsX
	JkRUvomWeJHenMSTow4+kc43632JNzh8HAIT5uggc7cjYT376WG66WmhwUIXU6bLOA
	mxxgpVBAvkTTvteeZPRstHMHxX2H9QkSiDX+aejo=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81K9r64021039
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:09:53 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Fri, 1 Sep 2017 15:09:53 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk] linux: ti-uio:
	add   pru-uio device tree file for k2g
Thread-Index: AQHTIzvNa0sAK+erCE+bWTq8Lp+YC6KgdfZQ
Date: Fri, 1 Sep 2017 20:09:53 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95825436DEE@DFLE09.ent.ti.com>
References: <1504281765-15266-1-git-send-email-a0271529@ti.com>
In-Reply-To: <1504281765-15266-1-git-send-email-a0271529@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk] linux: ti-uio: add pru-uio device tree file for k2g
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
X-List-Received-Date: Fri, 01 Sep 2017 20:09:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed both patches.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Gou, Hongmei
> Sent: Friday, September 01, 2017 12:03 PM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk] linux: ti-uio: add
> pru-uio device tree file for k2g
>=20
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  .../linux/files/k2g/keystone-k2g-pru-uio.dtsi      | 391
> +++++++++++++++++++++
>  recipes-kernel/linux/ti-uio.inc                    |  14 +
>  2 files changed, 405 insertions(+)
>  create mode 100644 recipes-kernel/linux/files/k2g/keystone-k2g-pru-
> uio.dtsi
>=20
> diff --git a/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
> b/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
> new file mode 100644
> index 0000000..69955a4
> --- /dev/null
> +++ b/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
> @@ -0,0 +1,391 @@
> +&pruss_soc_bus0 {
> +		uio_pruss1_mdio: uio_mdio@20ab2400 {
> +			compatible =3D "ti,davinci_mdio";
> +			reg =3D <0x20ab2400 0x90>;
> +			clocks =3D <&k2g_clks K2G_DEV_ICSS0
> K2G_DEV_ICSS_CORE_CLK>;
> +			clock-names =3D "fck";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			bus_freq =3D <2500000>;
> +			status =3D "disabled";
> +		};
> +
> +		uio_pruss1_mem: uio_pruss1_mem {
> +			compatible =3D "ti,uio-module-drv";
> +			mem =3D <0x20a80000 0x2000>,
> +			      <0x20a82000 0x2000>,
> +			      <0x20a90000 0x10000>,
> +			      <0x20aa0000 0x2000>,
> +			      <0x20aa6000 0x2000>,
> +			      <0x20aae000 0x31c>,
> +			      <0x20ab2000 0x70>;
> +			mem-names =3D "dram0", "dram1", "shrdram2", "intc",
> "cfg",
> +				    "iep", "mii_rt";
> +			status =3D "okay";
> +		};
> +		uio_pruss1_mem2: uio_pruss1_mem2 {
> +			compatible =3D "ti,uio-module-drv";
> +			mem =3D <0x20aa8000 0x38>,
> +			      <0x20ab0000 0x60>,
> +			      <0x20ab2400 0x90>,
> +			      <0x0c080000 0xe000>;
> +			mem-names =3D "uart", "ecap", "mdio", "ocmc";
> +			status =3D "okay";
> +		};
> +		uio_pruss1_evt0: uio_pruss1_evt0 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 224 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +		uio_pruss1_evt1: uio_pruss1_evt1 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 225 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +		uio_pruss1_evt2: uio_pruss1_evt2 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 226 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +		uio_pruss1_evt3: uio_pruss1_evt3 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 227 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +		uio_pruss1_evt4: uio_pruss1_evt4 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 228 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +		uio_pruss1_evt6: uio_pruss1_evt6 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 230 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +		uio_pruss1_evt7: uio_pruss1_evt7 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 231 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +
> +		uio_pruss1_0_mem: uio_pruss1_0_mem {
> +			compatible =3D "ti,uio-module-drv";
> +			mem =3D <0x20ab4000 0x3000>,
> +			      <0x20aa2000 0x400>,
> +			      <0x20aa2400 0x100>;
> +			mem-names =3D "iram", "control", "debug";
> +			status =3D "okay";
> +		};
> +
> +		uio_pruss1_1_mem: uio_pruss1_1_mem {
> +			compatible =3D "ti,uio-module-drv";
> +			mem =3D <0x20ab8000 0x3000>,
> +			      <0x20aa4000 0x400>,
> +			      <0x20aa4400 0x100>;
> +			mem-names =3D "iram", "control", "debug";
> +			status =3D "okay";
> +		};
> +};
> +
> +&pruss_soc_bus1 {
> +		uio_pruss2_mdio: uio_mdio@20af2400 {
> +			compatible =3D "ti,davinci_mdio";
> +			reg =3D <0x20af2400 0x90>;
> +			clocks =3D <&k2g_clks K2G_DEV_ICSS1
> K2G_DEV_ICSS_CORE_CLK>;
> +			clock-names =3D "fck";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			bus_freq =3D <2500000>;
> +			status =3D "disabled";
> +		};
> +
> +		uio_pruss2_mem: uio_pruss2_mem {
> +			compatible =3D "ti,uio-module-drv";
> +			mem =3D <0x20ac0000 0x2000>,
> +			      <0x20ac2000 0x2000>,
> +			      <0x20ad0000 0x10000>,
> +			      <0x20ae0000 0x2000>,
> +			      <0x20ae6000 0x2000>,
> +			      <0x20aee000 0x31c>,
> +			      <0x20af2000 0x70>;
> +			mem-names =3D "dram0", "dram1", "shrdram2", "intc",
> "cfg",
> +				    "iep", "mii_rt";
> +			status =3D "okay";
> +		};
> +		uio_pruss2_mem2: uio_pruss2_mem2 {
> +			compatible =3D "ti,uio-module-drv";
> +			mem =3D <0x20ae8000 0x38>,
> +			      <0x20af0000 0x60>,
> +			      <0x20af2400 0x90>,
> +			      <0x0c08e000 0xe000>;
> +			mem-names =3D "uart", "ecap", "mdio", "ocmc";
> +			status =3D "okay";
> +		};
> +		uio_pruss2_evt0: uio_pruss2_evt0 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 232 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +		uio_pruss2_evt1: uio_pruss2_evt1 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 233 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +		uio_pruss2_evt2: uio_pruss2_evt2 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 234 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +		uio_pruss2_evt3: uio_pruss2_evt3 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 235 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +		uio_pruss2_evt4: uio_pruss2_evt4 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 236 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +		uio_pruss2_evt6: uio_pruss2_evt6 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 238 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +		uio_pruss2_evt7: uio_pruss2_evt7 {
> +			compatible =3D "ti,uio-module-drv";
> +			interrupts =3D <GIC_SPI 239 0xf01>;
> +			interrupt-mode =3D <0>;
> +			status =3D "okay";
> +		};
> +
> +		uio_pruss2_0_mem: uio_pruss2_0_mem {
> +			compatible =3D "ti,uio-module-drv";
> +			mem =3D <0x20af4000 0x3000>,
> +			      <0x20ae2000 0x400>,
> +			      <0x20ae2400 0x100>;
> +			mem-names =3D "iram", "control", "debug";
> +			status =3D "okay";
> +		};
> +		uio_pruss2_1_mem: uio_pruss2_1_mem {
> +			compatible =3D "ti,uio-module-drv";
> +			mem =3D <0x20af8000 0x3000>,
> +			      <0x20ae4000 0x400>,
> +			      <0x20ae4400 0x100>;
> +			mem-names =3D "iram", "control", "debug";
> +			status =3D "okay";
> +		};
> +};
> +
> +&k2g_pinctrl {
> +	uio_pruss1_mdio_eth_default: uio_pruss1_mdio_eth_default {
> +		pinctrl-single,pins =3D <
> +                        K2G_CORE_IOPAD(0x12cc) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE0)      /* pr0_mdio_data.pr0_mdio_data */
> +                        K2G_CORE_IOPAD(0x12d0) (BUFFER_CLASS_B | PIN_PUL=
LDOWN
> | MUX_MODE0)      /* pr0_mdio_mdclk.pr0_mdio_mdclk */
> +                        K2G_CORE_IOPAD(0x105c) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE3)      /* gpmc_wait1.gpio0_23 (pr0_mii0_resetn) */
> +                        K2G_CORE_IOPAD(0x1070) (BUFFER_CLASS_B | PIN_PUL=
LUP |
> MUX_MODE3)        /* gpmc_csn2.gpio0_28 (pr0_mii0_intn) */
> +                        K2G_CORE_IOPAD(0x1054) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE3)      /* gpmc_be1n.gpio0_21 (pr0_mii1_resetn) */
> +                        K2G_CORE_IOPAD(0x1074) (BUFFER_CLASS_B | PIN_PUL=
LUP |
> MUX_MODE3)        /* gpmc_csn3.gpio0_29 (pr0_mii1_intn) */
> +
> +                        /* PRUSS0 External Mux routing */
> +                        K2G_CORE_IOPAD(0x11d4) (BUFFER_CLASS_B | MUX_MOD=
E3)
> /* uart0_ctsn.gpio0_106 */
> +                        K2G_CORE_IOPAD(0x11d8) (BUFFER_CLASS_B | MUX_MOD=
E3)
> /* uart0_rtsn.gpio0_107 */
> +                        K2G_CORE_IOPAD(0x11fc) (BUFFER_CLASS_B | MUX_MOD=
E3)
> /* dcan0_rx.gpio1_57 */
> +                        K2G_CORE_IOPAD(0x1200) (BUFFER_CLASS_B | MUX_MOD=
E3)
> /* dcan0_tx.gpio1_56 */
> +                        K2G_CORE_IOPAD(0x1224) (BUFFER_CLASS_B | MUX_MOD=
E3)
> /* qspi_csn2.gpio1_66 */
> +                        K2G_CORE_IOPAD(0x1228) (BUFFER_CLASS_B | MUX_MOD=
E3)
> /* qspi_csn3.gpio1_67 */
> +
> +                        /* PRUSS0 PRU0 Ethernet */
> +                        K2G_CORE_IOPAD(0x122c) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru0_gpo0.pr0_pru0_gpi0 (pr0_mii0_rxd0) */
> +                        K2G_CORE_IOPAD(0x1230) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru0_gpo1.pr0_pru0_gpi1 (pr0_mii0_rxd1) */
> +                        K2G_CORE_IOPAD(0x1234) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru0_gpo2.pr0_pru0_gpi2 (pr0_mii0_rxd2) */
> +                        K2G_CORE_IOPAD(0x1238) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru0_gpo3.pr0_pru0_gpi3 (pr0_mii0_rxd3) */
> +                        K2G_CORE_IOPAD(0x123c) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru0_gpo4.pr0_pru0_gpi4 (pr0_mii0_rxdv) */
> +                        K2G_CORE_IOPAD(0x1240) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru0_gpo5.pr0_pru0_gpi5 (pr0_mii0_rxer) */
> +                        K2G_CORE_IOPAD(0x1244) (BUFFER_CLASS_B | MUX_MOD=
E1)
> /* pr0_pru0_gpo6.pr0_pru0_gpi6 (pr0_mii_mr0_clk) */
> +
> +                        K2G_CORE_IOPAD(0x124c) (BUFFER_CLASS_B | MUX_MOD=
E1)
> /* pr0_pru0_gpo8.pr0_pru0_gpi8 (pr0_mii0_rxlink) */
> +                        K2G_CORE_IOPAD(0x1250) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru0_gpo9.pr0_pru0_gpi9 (pr0_mii0_col) */
> +                        K2G_CORE_IOPAD(0x1254) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru0_gpo10.pr0_pru0_gpi10 (pr0_mii0_crs) */
> +
> +                        K2G_CORE_IOPAD(0x12a8) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr0_pru1_gpo11.pr0_pru1_gpo11 (pr0_mii0_txd0) */
> +                        K2G_CORE_IOPAD(0x12ac) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr0_pru1_gpo12.pr0_pru1_gpo12 (pr0_mii0_txd1) */
> +                        K2G_CORE_IOPAD(0x12b0) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr0_pru1_gpo13.pr0_pru1_gpo13 (pr0_mii0_txd2) */
> +                        K2G_CORE_IOPAD(0x12b4) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr0_pru1_gpo14.pr0_pru1_gpo14 (pr0_mii0_txd3) */
> +                        K2G_CORE_IOPAD(0x12b8) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr0_pru1_gpo15.pr0_pru1_gpo15 (pr0_mii0_txen) */
> +                        K2G_CORE_IOPAD(0x12bc) (BUFFER_CLASS_B | MUX_MOD=
E1)
> /* pr0_pru1_gpo16.pr0_pru1_gpo16 (pr0_mii_mt0_clk) */
> +
> +                        /* PRUSS0 PRU1 Ethernet */
> +                        K2G_CORE_IOPAD(0x127c) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru1_gpo0.pr0_pru1_gpi0 (pr0_mii1_rxd0) */
> +                        K2G_CORE_IOPAD(0x1280) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru1_gpo1.pr0_pru1_gpi1 (pr0_mii1_rxd1) */
> +                        K2G_CORE_IOPAD(0x1284) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru1_gpo2.pr0_pru1_gpi2 (pr0_mii1_rxd2) */
> +                        K2G_CORE_IOPAD(0x1288) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru1_gpo3.pr0_pru1_gpi3 (pr0_mii1_rxd3) */
> +                        K2G_CORE_IOPAD(0x128c) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru1_gpo4.pr0_pru1_gpi4 (pr0_mii1_rxdv) */
> +                        K2G_CORE_IOPAD(0x1290) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru1_gpo5.pr0_pru1_gpi5 (pr0_mii1_rxer) */
> +                        K2G_CORE_IOPAD(0x1294) (BUFFER_CLASS_B | MUX_MOD=
E1)
> /* pr0_pru1_gpo6.pr0_pru1_gpi6 (pr0_mii_mr1_clk) */
> +
> +                        K2G_CORE_IOPAD(0x129c) (BUFFER_CLASS_B | MUX_MOD=
E1)
> /* pr0_pru1_gpo8.pr0_pru1_gpi8 (pr0_mii1_rxlink) */
> +                        K2G_CORE_IOPAD(0x12a0) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru1_gpo9.pr0_pru1_gpi9 (pr0_mii1_col) */
> +                        K2G_CORE_IOPAD(0x12a4) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr0_pru1_gpo10.pr0_pru1_gpi10 (pr0_mii1_crs) */
> +
> +                        K2G_CORE_IOPAD(0x1258) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr0_pru0_gpo11.pr0_pru0_gpo11 (pr0_mii1_txd0) */
> +                        K2G_CORE_IOPAD(0x125c) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr0_pru0_gpo12.pr0_pru0_gpo12 (pr0_mii1_txd1) */
> +                        K2G_CORE_IOPAD(0x1260) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr0_pru0_gpo13.pr0_pru0_gpo13 (pr0_mii1_txd2) */
> +                        K2G_CORE_IOPAD(0x1264) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr0_pru0_gpo14.pr0_pru0_gpo14 (pr0_mii1_txd3) */
> +                        K2G_CORE_IOPAD(0x1268) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr0_pru0_gpo15.pr0_pru0_gpo15 (pr0_mii1_txen) */
> +                        K2G_CORE_IOPAD(0x126c) (BUFFER_CLASS_B | MUX_MOD=
E1)
> /* pr0_pru0_gpo16.pr0_pru0_gpo16 (pr0_mii_mt1_clk) */
> +		>;
> +	};
> +
> +	uio_pruss2_mdio_eth_default: uio_pruss2_mdio_eth_default {
> +		pinctrl-single,pins =3D <
> +                        K2G_CORE_IOPAD(0x1374) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE0)      /* pr1_mdio_data.pr1_mdio_data */
> +                        K2G_CORE_IOPAD(0x1378) (BUFFER_CLASS_B | PIN_PUL=
LDOWN
> | MUX_MODE0)      /* pr1_mdio_mdclk.pr1_mdio_mdclk */
> +                        K2G_CORE_IOPAD(0x1050) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE3)      /* gpmc_be0ncle.gpio0_20 (pr1_mii0_resetn) */
> +                        K2G_CORE_IOPAD(0x1044) (BUFFER_CLASS_B | PIN_PUL=
LUP |
> MUX_MODE3)        /* gpmc_advnale.gpio0_17 (pr1_mii0_intn) */
> +                        K2G_CORE_IOPAD(0x1060) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE3)      /* gpmc_wpn.gpio0_24 (pr1_mii1_resetn) */
> +                        K2G_CORE_IOPAD(0x1088) (BUFFER_CLASS_B | PIN_PUL=
LUP |
> MUX_MODE3)        /* gpmc_wait0.gpio0_22 (pr1_mii1_intn) */
> +
> +                        /* PRUSS1 PRU0 Ethernet */
> +                        K2G_CORE_IOPAD(0x12d4) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru0_gpo0.pr1_pru0_gpi0 (pr1_mii0_rxd0) */
> +                        K2G_CORE_IOPAD(0x12d8) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru0_gpo1.pr1_pru0_gpi1 (pr1_mii0_rxd1) */
> +                        K2G_CORE_IOPAD(0x12dc) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru0_gpo2.pr1_pru0_gpi2 (pr1_mii0_rxd2) */
> +                        K2G_CORE_IOPAD(0x12e0) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru0_gpo3.pr1_pru0_gpi3 (pr1_mii0_rxd3) */
> +                        K2G_CORE_IOPAD(0x12e4) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru0_gpo4.pr1_pru0_gpi4 (pr1_mii0_rxdv) */
> +                        K2G_CORE_IOPAD(0x12e8) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru0_gpo5.pr1_pru0_gpi5 (pr1_mii0_rxer) */
> +                        K2G_CORE_IOPAD(0x12ec) (BUFFER_CLASS_B | MUX_MOD=
E1)
> /* pr1_pru0_gpo6.pr1_pru0_gpi6 (pr1_mii_mr0_clk) */
> +
> +                        K2G_CORE_IOPAD(0x12f4) (BUFFER_CLASS_B | MUX_MOD=
E1)
> /* pr1_pru0_gpo8.pr1_pru0_gpi8 (pr1_mii0_rxlink) */
> +                        K2G_CORE_IOPAD(0x12f8) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru0_gpo9.pr1_pru0_gpi9 (pr1_mii0_col) */
> +                        K2G_CORE_IOPAD(0x12fc) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru0_gpo10.pr1_pru0_gpi10 (pr1_mii0_crs) */
> +
> +                        K2G_CORE_IOPAD(0x1350) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr1_pru1_gpo11.pr1_pru1_gpo11 (pr1_mii0_txd0) */
> +                        K2G_CORE_IOPAD(0x1354) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr1_pru1_gpo12.pr1_pru1_gpo12 (pr1_mii0_txd1) */
> +                        K2G_CORE_IOPAD(0x1358) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr1_pru1_gpo13.pr1_pru1_gpo13 (pr1_mii0_txd2) */
> +                        K2G_CORE_IOPAD(0x135c) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr1_pru1_gpo14.pr1_pru1_gpo14 (pr1_mii0_txd3) */
> +                        K2G_CORE_IOPAD(0x1360) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr1_pru1_gpo15.pr1_pru1_gpo15 (pr1_mii0_txen) */
> +                        K2G_CORE_IOPAD(0x1364) (BUFFER_CLASS_B | MUX_MOD=
E1)
> /* pr1_pru1_gpo16.pr1_pru1_gpo16 (pr1_mii_mt0_clk) */
> +
> +                        /* PRUSS1 PRU1 Ethernet */
> +                        K2G_CORE_IOPAD(0x1324) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru1_gpo0.pr1_pru1_gpi0 (pr1_mii1_rxd0) */
> +                        K2G_CORE_IOPAD(0x132c) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru1_gpo2.pr1_pru1_gpi2 (pr1_mii1_rxd2) */
> +                        K2G_CORE_IOPAD(0x1330) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru1_gpo3.pr1_pru1_gpi3 (pr1_mii1_rxd3) */
> +                        K2G_CORE_IOPAD(0x1334) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru1_gpo4.pr1_pru1_gpi4 (pr1_mii1_rxdv) */
> +                        K2G_CORE_IOPAD(0x1338) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru1_gpo5.pr1_pru1_gpi5 (pr1_mii1_rxer) */
> +                        K2G_CORE_IOPAD(0x133c) (BUFFER_CLASS_B | MUX_MOD=
E1)
> /* pr1_pru1_gpo6.pr1_pru1_gpi6 (pr1_mii_mr1_clk) */
> +
> +                        K2G_CORE_IOPAD(0x1344) (BUFFER_CLASS_B | MUX_MOD=
E1)
> /* pr1_pru1_gpo8.pr1_pru1_gpi8 (pr1_mii1_rxlink) */
> +                        K2G_CORE_IOPAD(0x1348) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru1_gpo9.pr1_pru1_gpi9 (pr1_mii1_col) */
> +                        K2G_CORE_IOPAD(0x134c) (BUFFER_CLASS_B | PULL_DI=
SABLE |
> MUX_MODE1)      /* pr1_pru1_gpo10.pr1_pru1_gpi10 (pr1_mii1_crs) */
> +
> +                        K2G_CORE_IOPAD(0x1300) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr1_pru0_gpo11.pr1_pru0_gpo11 (pr1_mii1_txd0) */
> +                        K2G_CORE_IOPAD(0x1304) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr1_pru0_gpo12.pr1_pru0_gpo12 (pr1_mii1_txd1) */
> +                        K2G_CORE_IOPAD(0x1308) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr1_pru0_gpo13.pr1_pru0_gpo13 (pr1_mii1_txd2) */
> +                        K2G_CORE_IOPAD(0x130c) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr1_pru0_gpo14.pr1_pru0_gpo14 (pr1_mii1_txd3) */
> +                        K2G_CORE_IOPAD(0x1310) (BUFFER_CLASS_B | MUX_MOD=
E0)
> /* pr1_pru0_gpo15.pr1_pru0_gpo15 (pr1_mii1_txen) */
> +                        K2G_CORE_IOPAD(0x1314) (BUFFER_CLASS_B | MUX_MOD=
E1)
> /* pr1_pru0_gpo16.pr1_pru0_gpo16 (pr1_mii_mt1_clk) */
> +		>;
> +	};
> +};
> +
> +&uio_pruss1_mdio {
> +        status =3D "okay";
> +        pinctrl-0 =3D <&uio_pruss1_mdio_eth_default>;
> +        pinctrl-names =3D "default";
> +        reset-gpios =3D <&gpio0 23 GPIO_ACTIVE_LOW>,
> +                      <&gpio0 21 GPIO_ACTIVE_LOW>;
> +        reset-delay-us =3D <20>;
> +
> +        uio_pruss1_eth0_phy: uio-ethernet-phy@0 {
> +                reg =3D <0>;
> +        };
> +
> +        uio_pruss1_eth1_phy: uio-ethernet-phy@1 {
> +                reg =3D <1>;
> +        };
> +};
> +
> +&uio_pruss2_mdio {
> +        status =3D "okay";
> +        pinctrl-0 =3D <&uio_pruss2_mdio_eth_default>;
> +        pinctrl-names =3D "default";
> +        reset-gpios =3D <&gpio0 20 GPIO_ACTIVE_LOW>,
> +                      <&gpio0 24 GPIO_ACTIVE_LOW>;
> +        reset-delay-us =3D <20>;
> +
> +        uio_pruss2_eth0_phy: uio-ethernet-phy@2 {
> +                reg =3D <2>;
> +        };
> +
> +        uio_pruss2_eth1_phy: uio-ethernet-phy@3 {
> +                reg =3D <3>;
> +        };
> +};
> +
> +&pruss0 {
> +	status =3D "disabled";
> +};
> +
> +&pru0_0 {
> +	status =3D "disabled";
> +};
> +
> +&pru0_1 {
> +	status =3D "disabled";
> +};
> +
> +&pruss0_intc {
> +	status =3D "disabled";
> +};
> +
> +&pruss0_mdio {
> +	status =3D "disabled";
> +};
> +
> +&pruss1 {
> +	status =3D "disabled";
> +};
> +
> +&pru1_0 {
> +	status =3D "disabled";
> +};
> +
> +&pru1_1 {
> +	status =3D "disabled";
> +};
> +
> +&pruss1_intc {
> +	status =3D "disabled";
> +};
> +
> +&pruss1_mdio {
> +	status =3D "disabled";
> +};
> +
> +&pruss0_emac0 {
> +	status =3D "disabled";
> +};
> +
> +&pruss0_emac1 {
> +	status =3D "disabled";
> +};
> +
> +&pruss1_emac0 {
> +	status =3D "disabled";
> +};
> +
> +&pruss1_emac1 {
> +	status =3D "disabled";
> +};
> diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-ui=
o.inc
> index 57a4aca..7a15b31 100644
> --- a/recipes-kernel/linux/ti-uio.inc
> +++ b/recipes-kernel/linux/ti-uio.inc
> @@ -4,6 +4,7 @@ SRC_URI_append_keystone =3D " file://keystone-uio.dtsi"
>  SRC_URI_append_k2hk-evm =3D " file://k2hk-uio.dtsi"
>  SRC_URI_append_k2l-evm =3D " file://k2l-uio.dtsi"
>  SRC_URI_append_k2e =3D " file://k2e-uio.dtsi"
> +SRC_URI_append_k2g =3D " file://keystone-k2g-pru-uio.dtsi"
>  SRC_URI_append_am57xx-evm =3D " file://am572x-pru-uio.dtsi \
>                                file://am571x-pru-uio.dtsi \  "
> @@ -19,6 +20,7 @@ DTSI_LIST_append_k2e =3D " k2e-uio.dtsi"
>  KERNEL_DEVICETREE_append_am57xx-evm =3D
> "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am572x-idk-pru-
> excl-uio.dtb am571x-idk-pru-excl-uio.dtb", "", d)}"
>  KERNEL_DEVICETREE_append_ti33x =3D
> "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am335x-icev2-pru-
> excl-uio.dtb", "", d)}"
>  KERNEL_DEVICETREE_append_ti43x =3D
> "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am437x-idk-pru-
> excl-uio.dtb", "", d)}"
> +KERNEL_DEVICETREE_append_k2g =3D
> "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " keystone-k2g-ice-
> pru-excl-uio.dtb", "", d)}"
>=20
>  do_setup_uio() {
>      if [ "${ENABLE_TI_UIO_DEVICES}" =3D=3D "1" ] @@ -77,4 +79,16 @@
> do_setup_uio_append_ti43x() {
>      fi
>  }
>=20
> +do_setup_uio_append_k2g() {
> +
> +    if [ "${ENABLE_TI_UIO_DEVICES}" =3D=3D "1" ]
> +    then
> +        dts=3D"keystone-k2g-ice-pru-excl-uio.dts"
> +        dtsi=3D"keystone-k2g-pru-uio.dtsi"
> +        cp ${S}/arch/arm/boot/dts/keystone-k2g-ice.dts
> ${S}/arch/arm/boot/dts/$dts
> +        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
> +        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
> +    fi
> +}
> +
>  do_patch[postfuncs] +=3D "do_setup_uio"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

